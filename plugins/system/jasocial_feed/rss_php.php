<?php
/**
 * ------------------------------------------------------------------------
 * RSS_PHP - the PHP DOM based RSS Parser
 * ------------------------------------------------------------------------
 * @license - GNU/GPL, http://www.gnu.org/licenses/gpl.html
 * Author: <rssphp.net>
 * Websites: rssphp.net
 * ------------------------------------------------------------------------
 */
defined('_JEXEC') or die('Restricted access');
class rss_php {
	
	public $document;
	public $channel;
	public $items;

/****************************
	public load methods
***/
	# load RSS by URL
		public function load($url=false, $unblock=true) {
			if($url) {
				$this->loadParser($this->getContent($url));
			}
		}
	# load raw RSS data
		public function loadRSS($rawxml=false) {
			if($rawxml) {
				$this->loadParser($rawxml);
			}
		}
		
		public function getContent(&$url) {
		if (function_exists('curl_init')) {
			$ch = curl_init();
			curl_setopt($ch, CURLOPT_URL, $url);
			curl_setopt($ch, CURLOPT_HEADER, 0);
			curl_setopt($ch, CURLOPT_TIMEOUT, 600);
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
			curl_setopt($ch, CURLOPT_BINARYTRANSFER, 1);
			curl_setopt($ch, CURLOPT_ENCODING, '');
			curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.7.5) Gecko/20041107 Firefox/1.0');
			if(strpos($url, 'https:') === 0) {
				curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
				curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
			}
			$content = curl_exec($ch);
			$response = curl_getinfo( $ch );
			curl_close($ch);

			if ($response['http_code'] == 301 || $response['http_code'] == 302) {
				//follow redirect url
				if(isset($response['url']) && !empty($response['url']) && $response['url'] != $url) {
					$url = $response['url'];
					return $this->getContent($url);
				} elseif (isset($response['redirect_url']) && !empty($response['redirect_url']) && $response['redirect_url'] != $url) {
					$url = $response['redirect_url'];
					return $this->getContent($url);
				}
			}
		} else {
			// curl library is not installed so we better use something else
			$content = @file_get_contents($url);
		}
		return $content;
	}
		
/****************************
	public load methods
		@param $includeAttributes BOOLEAN
		return array;
***/
	# return full rss array
		public function getRSS($includeAttributes=false) {
			if($includeAttributes) {
				return $this->document;
			}
			return $this->valueReturner();
		}
	# return channel data
		public function getChannel($includeAttributes=false) {
			if($includeAttributes) {
				return $this->channel;
			}
			return $this->valueReturner($this->channel);
		}
	# return rss items
		public function getItems($includeAttributes=false) {
			if($includeAttributes) {
				return $this->items;
			}
			return $this->valueReturner($this->items);
		}

/****************************
	internal methods
***/
	private function loadParser($rss=false) {
		if($rss) {
			$this->document = array();
			$this->channel = array();
			$this->items = array();
			$DOMDocument = new DOMDocument;
			$DOMDocument->strictErrorChecking = false;
			$DOMDocument->loadXML($rss);
			$this->document = $this->extractDOM($DOMDocument->childNodes);
		}
	}
	
	private function valueReturner($valueBlock=false) {
		if(!$valueBlock) {
			$valueBlock = $this->document;
		}

		foreach($valueBlock as $valueName => $values) {
				if(isset($values['value'])) {
					$values = $values['value'];
				}
				if(is_array($values)) {
					$valueBlock[$valueName] = $this->valueReturner($values);
				} else {
					$valueBlock[$valueName] = $values;
				}
		}
		return $valueBlock;
	}
	
	private function extractDOM($nodeList,$parentNodeName=false) {
		$itemCounter = 0;
		$tempNode=array();
		foreach($nodeList as $values) {
			if(substr($values->nodeName,0,1) != '#') {
				if($values->nodeName == 'item') {
					$nodeName = $values->nodeName.':'.$itemCounter;
					$itemCounter++;
				} else {
					$nodeName = $values->nodeName;
				}
				$tempNode[$nodeName] = array();				
				if($values->attributes) {
					for($i=0;$values->attributes->item($i);$i++) {
						$tempNode[$nodeName]['properties'][$values->attributes->item($i)->nodeName] = $values->attributes->item($i)->nodeValue;
					}
				}
				if(!$values->firstChild) {
					$tempNode[$nodeName]['value'] = $values->textContent;
				} else {
					$tempNode[$nodeName]['value']  = $this->extractDOM($values->childNodes, $values->nodeName);
				}
				if(in_array($parentNodeName, array('channel','rdf:RDF'))) {
					if($values->nodeName == 'item') {
						$this->items[] = $tempNode[$nodeName]['value'];
					} elseif(!in_array($values->nodeName, array('rss','channel'))) {
						$this->channel[$values->nodeName] = $tempNode[$nodeName];
					}
				}
			} elseif(substr($values->nodeName,1) == 'text') {
				$tempValue = trim(preg_replace('/\s\s+/',' ',str_replace("\n",' ', $values->textContent)));
				if($tempValue) {
					$tempNode = $tempValue;
				}
			} elseif(substr($values->nodeName,1) == 'cdata-section'){
				$tempNode = $values->textContent;
			}
		}
		return $tempNode;
	}
	
	private function randomContext() {
		$headerstrings = array();
		$headerstrings['User-Agent'] = 'Mozilla/5.0 (Windows; U; Windows NT 5.'.rand(0,2).'; en-US; rv:1.'.rand(2,9).'.'.rand(0,4).'.'.rand(1,9).') Gecko/2007'.rand(10,12).rand(10,30).' Firefox/2.0.'.rand(0,1).'.'.rand(1,9);
		$headerstrings['Accept-Charset'] = rand(0,1) ? 'en-gb,en;q=0.'.rand(3,8) : 'en-us,en;q=0.'.rand(3,8);
		$headerstrings['Accept-Language'] = 'en-us,en;q=0.'.rand(4,6);
		$setHeaders = 	'Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5'."\r\n".
						'Accept-Charset: '.$headerstrings['Accept-Charset']."\r\n".
						'Accept-Language: '.$headerstrings['Accept-Language']."\r\n".
						'User-Agent: '.$headerstrings['User-Agent']."\r\n";
		$contextOptions = array(
			'http'=>array(
				'method'=>"GET",
				'header'=>$setHeaders
			)
		);
		return stream_context_create($contextOptions);
	}
	
}