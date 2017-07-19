<?php
/**
 * ------------------------------------------------------------------------
 * JA System Social Feed plugin for Joomla 2.5 & J3.5
 * ------------------------------------------------------------------------
 * Copyright (C) 2004-2011 J.O.O.M Solutions Co., Ltd. All Rights Reserved.
 * @license - GNU/GPL, http://www.gnu.org/licenses/gpl.html
 * Author: J.O.O.M Solutions Co., Ltd
 * Websites: http://www.joomlart.com - http://www.joomlancers.com
 * ------------------------------------------------------------------------
 */

// no direct access
defined('_JEXEC') or die('Restricted access');
if(!defined('DS')){
	define('DS', DIRECTORY_SEPARATOR);
}
set_time_limit(0);

jimport('joomla.plugin.plugin');
jimport('joomla.html.parameter');
jimport('joomla.filesystem.folder');
jimport('joomla.filesystem.file');
// require_once(dirname(__FILE__).'/Instagramapi/Instagram.php');
// require_once(dirname(__FILE__).'/Instagramapi/InstagramException.php');

// use MetzWeb\Instagram\Instagram;
/**
 *
 * JA social plugin system
 * @author JoomlArt
 *
 */
class plgSystemjasocial_feed extends JPlugin
{

	protected $plugin;
	protected $plgParams;

	protected $aInfo = array();
	protected $maxRedirect = 1;

	protected $update_article;
	protected $table_com;
	protected $target_com;
	protected $created_by;
	protected $save_image;
	protected $valid_img_width;
	protected $valid_img_height;
	protected $get_url_service;

	protected $intro_text;
	protected $intro_text_limit;
	protected $imglink;
	protected $profile;
	/**
	 * Object Constructor.
	 *
	 * @access	public
	 * @param	object	The object to observe -- event dispatcher.
	 * @param	object	The configuration object for the plugin.
	 * @return	void
	 * @since	1.7
	 */
	public function __construct(&$subject, $config)
	{
		parent::__construct($subject, $config);

		$mainframe = JFactory::getApplication();
		$this->plugin = JPluginHelper::getPlugin('system', 'jasocial_feed');
		$this->plgParams = new JRegistry($this->plugin->params);
		$this->loadLanguage('plg_' . $this->plugin->type . '_' . $this->plugin->name, JPATH_ADMINISTRATOR);

		//init
		$this->update_article = $this->plgParams->get('update_article', 0);
		$this->target_com = $this->plgParams->get('target', 'joomla');
		$this->created_by = $this->plgParams->get('created_by', 42);
		$this->save_image = $this->plgParams->get('save_image', 0);
		$this->valid_img_width = $this->plgParams->get('valid_img_width', 360);
		$this->valid_img_height = $this->plgParams->get('valid_img_height', 180);
		$this->get_url_service = $this->plgParams->get('get_url_service', 'untiny.com');


		$this->intro_text 			= $this->plgParams->get('intro_text', 0);
		$this->intro_text_limit 	= $this->plgParams->get('intro_text_limit', 100);

		if($mainframe->isAdmin()){
			//$table = $this->getTable($this->target_com);
			return;
		}

		//fix imported data in early versions
		$db = JFactory::getDbo();
		$tables = $db->getTableList();
		$k2installed = in_array($db->getPrefix().'k2_items', $tables);

		$versions = array('1.1.1');
		foreach($versions as $ver) {
			$file = dirname(__FILE__).'/'.$ver.'.log';
			if(!JFile::exists($file)) {
				switch($ver) {
					case '1.1.1':
						JFile::write($file, date('Y-m-d H:i:s'));

						$query = "UPDATE #__content
									SET
										`introtext` = REPLACE(`introtext`, ".$db->quote('"/profile.php').", ".$db->quote('"https://www.facebook.com/profile.php')."),
										`fulltext` = REPLACE(`fulltext`, ".$db->quote('"/profile.php').", ".$db->quote('"https://www.facebook.com/profile.php').")
									WHERE `alias` LIKE 'facebook-id-%'";
						$db->setQuery($query);
						$db->execute();

						if($k2installed) {
							$query = "UPDATE #__k2_items
									SET
										`introtext` = REPLACE(`introtext`, ".$db->quote('"/profile.php').", ".$db->quote('"https://www.facebook.com/profile.php')."),
										`fulltext` = REPLACE(`fulltext`, ".$db->quote('"/profile.php').", ".$db->quote('"https://www.facebook.com/profile.php').")
									WHERE `alias` LIKE 'facebook-id-%'";
							$db->setQuery($query);
							$db->execute();
						}
						break;
				}
			}
		}

		$this->aInfo = $this->getCacheInfo();
	}

	function addResizeIframeScript() {
		$script = "
					document.addEventListener('DOMContentLoaded',function(){
						var iframe = document.getElementsByClassName('ja-socialfeed-video-iframe');
						for(var i = 0; i < iframe.length; i++) {
							iframe[i].style.maxWidth = '100%';
							var w = iframe[i].getAttribute('width');
							var h = iframe[i].getAttribute('height');	
							var width = iframe[i].clientWidth;
							var height = (width * h) / w;
							iframe[i].setAttribute('height', height);
						}
					});
							";
		JFactory::getDocument()->addScriptDeclaration($script);
	}
	
	function onAfterDispatch() {
		$mainframe = JFactory::getApplication();
		if($mainframe->isAdmin()){
			return;
		}
		$this->addResizeIframeScript();
		$jinput = JFactory::getApplication()->input;
		$cron = $jinput->get('jasocial_feed_cron', 0, 'INT');
		$code = $jinput->get('code', '');
		
		if ($cron && $code) {
			$fields = array(
			   'client_id'     => $this->plgParams->get('insta_app_client_id', ''),
			   'client_secret' => $this->plgParams->get('insta_app_secret', ''),
			   'grant_type'    => 'authorization_code',
			   'redirect_uri'  => trim($this->plgParams->get('insta_app_redirect_url', '')).'?jasocial_feed_cron=1',
			   'code'          => $code
			);
			$url = 'https://api.instagram.com/oauth/access_token';
			$ch = curl_init();
			curl_setopt($ch, CURLOPT_URL, $url);
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
			curl_setopt($ch, CURLOPT_TIMEOUT, 20);
			curl_setopt($ch,CURLOPT_POST,true); 
			curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);
			$result = curl_exec($ch);
			curl_close($ch); 
			$result = json_decode($result);
			if (!empty($result->access_token)) {
				echo '<h3>'.JText::_('JA_UR_TOKEN').'</h3>';
				echo '<p>'.$result->access_token.'</p>';
			} else {
				echo '<h3>'.JText::_('JA_UR_TOKEN_ERROR').'</h3>';
				echo '<p>'.$result->error_message.'</p>';
			}
			jexit('');
		}
		
		$next_run = $this->getNextRun();

		$jatoken = $jinput->get('jatoken', 0, 'INT');
		$last_run = (isset($this->aInfo['last_run'])) ? $this->aInfo['last_run'] : 0;
		$cron_interval = $this->plgParams->get('cache_time', 3600);

		$diff = $last_run - $jatoken;
		$isRunbyadmin = ($diff >= 0 && $diff <= $cron_interval) ? 1 : 0;

		if(($next_run > time()) && (!$isRunbyadmin)) {
			return;
		}

		if(!$cron) {
			$document = JFactory::getDocument();
			JHtml::_('behavior.framework');
			$script = "
			function jaGetSocialFeed() {
				var jaSocialFeedReq = new Request({method: 'get', url: '".JURI::root()."/?jasocial_feed_cron=1'}).send();
			}
			window.addEvent('load', function() {
				setTimeout('jaGetSocialFeed()', 1000);
			});
			";
			$document->addScriptDeclaration($script);
		} else {
			ignore_user_abort(true);

			require_once(dirname(__FILE__).'/helpers.php');

			//update last run info to limit other people call request to get feed
			$this->updateCacheInfo(1);

			//order descreasing by processing speed
			$sources = array( 'vimeo', 'youtube','flickr','pinterest', 'instagram' , 'facebook', 'twitter', 'rss');
			$message = '';
			foreach ($sources as $source) {
				if(!$this->plgParams->get('enable_'.$source, 1)) continue;

				$method = 'fetch'.ucfirst($source).'Post';
				$profiles = jaSocialFeedGetProfiles($source);
				if(count($profiles)) {
					$message .= '<h3>Source : '.$source.'</h3>';
					foreach ($profiles as $profile => $pName) {
						$data = jaSocialFeedGetProfile($source, $profile);
						if(is_object($data)) {
							$status = $this->getProperty($data, $source.'_status', 1);
							if($status) {
								$this->profile = $profile;
								$message .= '<p> &nbsp;&nbsp; Profile '.$pName.'</p>';
								$message .= call_user_func_array(array($this, $method), array($data));
							}
						}
					}
				}
			}
			$message .= '<p>DONE</p>';
			jexit($message);
		}
		return ;
	}
	
	private function getProperty($obj, $property, $default = '') {
		return isset($obj->$property) ? $obj->$property : $default;
	}

	private function getTable($source, $raiseMessage = 1) {
		static $tables = array();

		$source = strtolower($source);
		if(!isset($tables[$source])) {
			$table = false;
			if($source != 'base') {
				$path = dirname(__FILE__).'/tables/'.$source.'.php';
				if(JFile::exists($path)) {
					require_once($path);
					$className = 'jaSocialFeedTable'.ucfirst($source);
					if(class_exists($className)) {
						$table = new $className($this->plgParams);

						if(!$table->isAvailable()) {
							$table = false;
							if($raiseMessage) {
								JFactory::getApplication()->enqueueMessage(JText::sprintf('PJASF_COM_NOT_INSTALLED', $source), 'warning');
							}
						}
					} else {
						if($raiseMessage) {
							JFactory::getApplication()->enqueueMessage(JText::sprintf('PJASF_COM_NOT_INSTALLED_SELED_ONE', $source), 'warning');
						}
					}
				} else {
					if($raiseMessage) {
						JFactory::getApplication()->enqueueMessage(JText::sprintf('PJASF_COM_NOT_INSTALLED_SELED_ONE', $source), 'warning');
					}
				}
			} else {
				if($raiseMessage) {
					JFactory::getApplication()->enqueueMessage(JText::_('PJASF_SOURCE_NOT_AVAILABLE'), 'warning');
				}
			}
			$tables[$source] = $table;
		}
		return $tables[$source];
	}

	private function fetchFacebookPost($profile) {
		$params = $this->plgParams;
		$fb_app_id = $params->get('fb_app_id','');
		$fb_app_secret = $params->get('fb_app_secret','');

		$fbid = $this->getProperty($profile, 'facebook_account');
		$target_com = $this->getProperty($profile, 'facebook_target', 'joomla');
		$tableContent = $this->getTable($target_com, 0);
		$catid = $this->getProperty($profile, 'facebook_'.$target_com.'_catid', 0);
		if(!$tableContent || !$fbid || !$catid) {
			return false;
		}

		$created_by = $this->getProperty($profile, 'facebook_created_by', 42);
		$getImg = $this->getProperty($profile, 'facebook_getimg', 1);
		$srcTxt = $this->getProperty($profile, 'facebook_sourcetxt', '(Source Facebook)');
		$limit = $this->getProperty($profile, 'facebook_limit_post', 20);
		$update_article = $this->getProperty($profile, 'facebook_update_article', 0);

		$titleType = $this->getProperty($profile, 'facebook_title_type', 'content');
		$titleCustom = $this->getProperty($profile, 'facebook_title_txt', 'Facebook');
		$titleMaxLen = (int) $this->getProperty($profile, 'facebook_title_length', 50);
		$aliasType = (int) $this->getProperty($profile, 'facebook_alias_type', 0);
		
		//override global settings
		$this->save_image = $this->getProperty($profile, 'facebook_save_image', 0);
		$this->target_com = $target_com;
		$this->valid_img_width = $this->getProperty($profile, 'facebook_valid_img_width', 360);
		$this->valid_img_height = $this->getProperty($profile, 'facebook_valid_img_height', 180);


		//IMPORT PROCESS
		$fbKey = $fbid.'_';

		$last_insert_id = isset($this->aInfo[$fbKey.'fb_last_id']) ? $this->aInfo[$fbKey.'fb_last_id'] : '';

		$fetchUrl = "https://graph.facebook.com/v2.8/".$fbid."/posts?fields=attachments,permalink_url,object_id,name,story,id,from{id,name},message,created_time,updated_time,type,link,description,picture,full_picture&access_token=".$fb_app_id."|".$fb_app_secret."&limit=".$limit;

		$content = $this->getContent($fetchUrl);
		$data = json_decode($content)->data;

		foreach ( $data as $item) {
			if (!is_object($item)) {
				break;
			}
			
			$dt = new stdClass();
			if (!empty($item->message)) {
				$dt->title = $this->cutTitleFromContent($item->message, $titleMaxLen);
			} else if ( !empty($item->story)) {
				$dt->title = $item->story;
			} else {
				$dt->title = $item->type;
			}

			$dt->id		 = str_replace($fbid.'_','',$item->id);
			$dt->object_id = !empty($item->object_id) ? $item->object_id : '';
			$dt->name = !empty($item->name) ? $item->name : '';
			$dt->link		= isset($item->link) ? $item->link : '';
			$dt->desc	   = '';
			$dt->type = $item->type;
			$dt->permalink_url = $item->permalink_url;
			$dt->full_picture = !empty($item->full_picture) ? $item->full_picture : '';
			$dt->attachments = !empty($item->attachments) ? $item->attachments : '';
			if(isset($item->message)){
				$dt->desc .= $item->message;
			}else if(!isset($item->message)){
				if(isset($item->description)){
					$dt->desc .= $item->description;
				}
			}
			$pattern1 = '/http:\/\/.*/';
			preg_match_all($pattern1,$dt->desc,$matches);
			if(count($matches[0]) > 0){
				foreach($matches[0] as $matche){
					$dt->desc = str_replace($matche, '<a href="'.$matche.'">'.$matche.'</a>', $dt->desc);
				}
			}
//			 if(isset($item->picture)){
//				 $dt->desc .= "\n <img src=\"".$item->picture."\" />";
//			 }

			$dt->pubDate	= $item->created_time;
			$dt->author		= $item->from->name;
			$dt->img	  = isset($item->picture) ? $item->picture : '';

			$items[] = $dt;
		}
		
		$numResult = 0;
		$message='';
		$error=0;
		//$aResult = array();
		
		if(count($items)) {
			for ($i=0; $i<count($items); $i++) {
				if($numResult >= $limit) {
					break;
				}
				$dt = $items[$i];

				/*if($dt->id == $last_insert_id) {
					//remain posts are imported => skipable
					break;
				}*/

				
				if($i == 0) {
					$this->aInfo[$fbKey.'fb_last_id'] = $dt->id;
				}

				//$tcontent = !(trim($dt->title) == '') ? $dt->title . '<br />' . $dt->content : $dt->content;
				$tcontent = (trim($dt->desc) != '') ? $dt->desc : $dt->title;
				$testContent = preg_replace('/[\r\n\s\t]+/', '', strip_tags($tcontent));
				if(empty($testContent)) {
					continue;
				}

				$tcontent = $this->updateFacebookImage($tcontent);

				//update url
				$pattern = '#href="(?:http\://l.facebook.com)?/l.php\?u=(http[^\'"&]+)[^\'"]*"#i';
				$tcontent = preg_replace_callback($pattern,
					create_function(
						'$matches',
						'return "href=\"".rawurldecode($matches[1])."\"";'
					),
					$tcontent
				);
				//$tcontent = str_replace(array('"/profile.php', '"profile.php'), '"https://www.facebook.com/profile.php', $tcontent);
				$tcontent = str_replace('href="/', 'href="https://www.facebook.com/', $tcontent);

				$post = array();
				
				$domain = parse_url($dt->link);
				if($titleType == 'author' && isset($dt->author)) {
					$artical_title = $dt->author;
				} elseif ($titleType == 'custom') {
					$artical_title = $titleCustom;
				} elseif (!empty($dt->name) && $dt->type === 'link' && $dt->name != $domain['host']) {
					$artical_title = $dt->name;
				} else {
					//cut from content
					$artical_title = $this->cutTitleFromContent($tcontent, $titleMaxLen);
				}
				$post['source_title'] = $artical_title;
				if ($aliasType) {
					$alias = JApplication::stringURLSafe($artical_title.'-'.$dt->id);
				} else {
					$alias = JApplication::stringURLSafe('facebook-id-'.$dt->id);
				}
				$identity = JApplication::stringURLSafe($dt->id);
				$oldId = $tableContent->existsPost($identity);
				if($oldId && !$update_article) {
					continue;
				}
				
				$post['source_alias'] = $alias;
				$post['created_by'] = $created_by;
				$post['source_author'] = isset($dt->author) ? $dt->author : '';
				$post['catid'] = $catid;
				$post['source_published_date'] = $dt->pubDate;
				$post['source_url'] = '';
				$post['source_url_txt'] = '';
				//images
				if($getImg) {
					$img_caption = $this->getImageCaption($tcontent);
					if (preg_match('/i.ytimg.com/', $dt->img)) { // img from youtube
						preg_match('/url=(.*?)$/', $dt->img, $mat);
						if (!empty($mat[1])) {
							$dt->img = preg_replace('/\&cfs\=1(.*?)$/','',urldecode($mat[1]));
						}
					}
					
					switch ($dt->type) {
						case 'video':
						case 'link':
							$post['source_images'] = $this->saveImage($dt->full_picture, 'facebook', $img_caption, $img_caption, true);
							break;

						default:
							$post['source_images'] = $this->getFacebookImage('<img src="'.$dt->img.'" />',$img_caption, $img_caption);
							break;
					}

//					 if (empty($post['source_images']) && !empty($dt->img)) {
// 						$post['source_images'] = $this->saveImage($dt->img, 'facebook', $img_caption, $img_caption);
//					 }
					// remove direct image in facebook content
//					 $tcontent = preg_replace ('/<img [^>]+>/', '', $tcontent);
				} else {
					$post['source_images'] = false;
				}

				// add new intro text progress.
				$post['source_content'] = $tcontent;
				$post['intro_text'] 	= $this->getIntroText('facebook', $post['source_content']);
				if ($dt->type === 'video') {
					if ($this->target_com === 'k2') {
						$post['source_video'] = $this->getFacebookVideoEmbed($dt->object_id, $fb_app_id, $fb_app_secret);
					} else {
						$post['source_content'] .= $this->getFacebookVideoEmbed($dt->object_id, $fb_app_id, $fb_app_secret);
					}
				} 
				
				if ($dt->type === 'photo' && !empty($dt->attachments->data[0]->subattachments->data)) {
					$photos = $dt->attachments->data[0]->subattachments->data;
					foreach ($photos as $photo) {
						$post['source_content'] .= '<p><img src="https://graph.facebook.com/' . $photo->target->id . '/picture"/></p>';
					}
				}

				$post['source_content'] .= '
				<div class="content-links">
					<ol class="nav">
						<li class="content-links-a">
							<a href="https://www.facebook.com/'.$fbid.'/posts/'.preg_replace('/[0-9]+_/','',$dt->id).'" target="_blank" rel="nofollow">'.$srcTxt.'</a>
						</li>
						<li class="content-links-b">
						';
				$post['source_content'] .= 	$dt->link ?	'<a href="'.$dt->link.'" target="_blank" rel="nofollow">'.$domain['host'].'</a>' : '';
				$post['source_content']	.= '	</li></ol></div>';
				
				$result = $tableContent->store('facebook', $post, $oldId);
								if ($result==false) {
									$message .= '<p>&nbsp;&nbsp;&nbsp;&nbsp;Item (guid:'.$dt->id.') : ERROR</p>';
									$error++;
								}
				//
				$numResult++;
			}
		}
		//return $aResult;
		$message .= '&nbsp;&nbsp;&nbsp; Done : '.$numResult.' Success And '.$error.' Error';
		$this->updateCacheInfo(0);
		return $message;
	}

	/**
	 * fetchTwitterPost
	 * get tweet from Twitter by given query string
	 * @see https://dev.twitter.com/docs/api/1/get/search
	 *
	 */
	private function fetchTwitterPost ($profile) {
		require_once (dirname(__FILE__)  . '/TwitterAPIExchange.php');

		$queryString = $this->getProperty($profile, 'twitter_account');
		$target_com = $this->getProperty($profile, 'twitter_target', 'joomla');
		$tableContent = $this->getTable($target_com, 0);
		$catid = $this->getProperty($profile, 'twitter_'.$target_com.'_catid', 0);
		if(!$tableContent || !$queryString || !$catid) {
			return false;
		}

		$created_by = $this->getProperty($profile, 'twitter_created_by', 42);
		$getImg = $this->getProperty($profile, 'twitter_getimg', 1);
		$srcTxt = $this->getProperty($profile, 'twitter_sourcetxt', '(Source Twitter)');
		$limit = $this->getProperty($profile, 'twitter_limit_post', 20);
		$update_article = $this->getProperty($profile, 'twitter_update_article', 0);

		$titleType = $this->getProperty($profile, 'twitter_title_type', 'content');
		$titleCustom = $this->getProperty($profile, 'twitter_title_txt', 'Twitter');
		$titleMaxLen = (int) $this->getProperty($profile, 'twitter_title_length', 50);
		$getRetweet = (int) $this->getProperty($profile, 'twitter_fetch_retweet', 0);

		//override global settings
		$this->save_image = $this->getProperty($profile, 'twitter_save_image', 0);
		$this->target_com = $target_com;
		$this->valid_img_width = $this->getProperty($profile, 'twitter_valid_img_width', 360);
		$this->valid_img_height = $this->getProperty($profile, 'twitter_valid_img_height', 180);

		/**
		 * - rpp: The number of tweets to return per page, up to a max of 100.
		 * - page: The page number (starting at 1) to return, up to a max of roughly 1500 results (based on rpp * page).
		 * - since_id: Returns results with an ID greater than (that is, more recent than) the specified ID. There are limits to the number of Tweets which can be accessed through the API. If the limit of Tweets has occured since the since_id, the since_id will be forced to the oldest ID available.
		 */
		$rpp = ($limit < 100) ? $limit : 100;
		$page = 1;

		$twKey = md5(trim($queryString)) . '_';

		$since_id = isset($this->aInfo[$twKey.'tw_since_id']) ? $this->aInfo[$twKey.'tw_since_id'] : '';
		//$url = 'http://search.twitter.com/search.json?';
		$url = 'https://api.twitter.com/1.1/search/tweets.json';

		$total = 0;
		//$aResult = array();

		$settings = array(
			'consumer_key' => $this->params->get('consumer_key', ''),
			'consumer_secret' => $this->params->get('consumer_secret', ''),
			'oauth_access_token' => $this->params->get('oauth_access_token', ''),
			'oauth_access_token_secret' => $this->params->get('oauth_access_token_secret', '')
		);

		$requestMethod = 'GET';

		$next_results = '';
		$message='test';
		do {

			if(empty($next_results) || !$next_results) {
				$params = '?q='.rawurlencode($queryString).'&count='.$rpp;
			} else {
				$params = $next_results;
			}

			$twitter = new TwitterAPIExchange($settings);
			$result = $twitter->setGetfield($params)
				->buildOauth($url, $requestMethod)
				->performRequest();

			$data = json_decode($result);
			if(isset($data->errors) && count($data->errors)) {
				return 'Twitter: '.$data->errors[0]->message . '<br />';
			}

			if(is_object($data) && isset($data->search_metadata)) {
				$next_results = @$data->search_metadata->next_results;
			} else {
				$next_results = '';
			}

			$numResult = 0;
			$numRe = 0;
				$error=0;
			if(is_object($data) && isset($data->statuses) && is_array($data->statuses)) {
				for ($i=0; $i<count($data->statuses); $i++) {
					$numResult++;
					$dt = $data->statuses[$i];
					$alias = JApplication::stringURLSafe('twitter-id-'.$dt->id_str);

					$oldId = $tableContent->existsPost($alias);
					if($oldId && !$update_article) {
						continue;
					}

					if(!$getRetweet) {
						if($this->isRetweet($dt->text)) {
							continue;
						}
					}

					$user = $dt->user;
					$post = array();
					$post['source_alias'] = $alias;

					if($titleType == 'author' && isset($user->name)) {
						$artical_title = $user->name;
					} elseif ($titleType == 'custom') {
						$artical_title = $titleCustom;
					} else {
						//cut from content
						$artical_title = $this->cutTitleFromContent($dt->text, $titleMaxLen);
					}

					$post['source_title'] = $artical_title;
					$post['created_by'] = $created_by;
					$post['source_author'] = isset($user->name) ? $user->name : '';
					$post['catid'] = $catid;
					$post['source_published_date'] = $dt->created_at;
					$post['source_url'] = 'https://twitter.com/'.$user->id_str. '/statuses/'.$dt->id_str;
					$post['source_url_txt'] = $srcTxt;

					$mediaObject = $dt->entities;
					
					//images
					if ($getImg) {
						$img_caption = $this->getImageCaption($dt->text);

						$post['source_images'] = $this->getTweetImage($mediaObject, $img_caption, $img_caption);


					} else {
						$post['source_images'] = false;
					}

					$post['source_content'] = $this->updateTweetUrls($dt->text);
					$post['intro_text'] 	= $this->getIntroText('twitter', $post['source_content']);

					$result = $tableContent->store('twitter', $post, $oldId);
										if ($result==false) {
											$message .= '<p>&nbsp;&nbsp;&nbsp;&nbsp;Item (guid:'.$dt->id_str.') : ERROR</p>';
											$error++;
										} else
											$numRe++;
				}
			}

			//get next page
			$page++;
			$total += $numResult;
		} while (($total < $limit) && ($page <= 15) && ($numResult == $rpp) && (!(empty($next_results) || !$next_results)));

		//update log
		$this->aInfo[$twKey.'tw_since_id'] = $since_id;

		//return $aResult;
		$message .= '&nbsp;&nbsp;&nbsp; Done : '.$numRe.' Success And '.$error.' Error';
		$this->updateCacheInfo(0);
		return $message;
	}


	/**
	 * fetchYoutubeVideo
	 * get tweet from Youtube by given username
	 * @see http://gdata.youtube.com/feeds/base/users/joomlart/uploads?orderby=updated&alt=json
	 *
	 */
	private function fetchYoutubePost ($profile) {
		$ytName = $this->getProperty($profile, 'youtube_account');
		$ytOption = $this->getProperty($profile, 'youtube_account_option_select');

		$target_com = $this->getProperty($profile, 'youtube_target', 'joomla');
		$tableContent = $this->getTable($target_com, 0);
		$catid = $this->getProperty($profile, 'youtube_'.$target_com.'_catid', 0);
		$state = $this->getProperty($profile,'youtube_article_state','0');
		if(!$tableContent || !$ytName || !$catid) {
			return false;
		}

		$youtube_favorite = $this->getProperty($profile, 'youtube_account_favorite', 0);

		$created_by = $this->getProperty($profile, 'youtube_created_by', 42);
		$getImg = $this->getProperty($profile, 'youtube_getimg', 1);
		$srcTxt = $this->getProperty($profile, 'youtube_sourcetxt', '(Source YouTube)');
		$limit = $this->getProperty($profile, 'youtube_limit_post', 20);
		$update_article = $this->getProperty($profile, 'youtube_update_article', 0);

		//override global settings
		$this->save_image = $this->getProperty($profile, 'youtube_save_image', 0);
		$this->target_com = $target_com;
		$this->valid_img_width = $this->getProperty($profile, 'youtube_valid_img_width', 360);
		$this->valid_img_height = $this->getProperty($profile, 'youtube_valid_img_height', 180);

		//video settings
		$youtube_video_width 				= (int) $this->getProperty($profile, 'youtube_video_width', 480);
		$youtube_video_height	 			= (int) $this->getProperty($profile, 'youtube_video_height', 360);
		$youtube_show_suggested 			= (int) $this->getProperty($profile, 'youtube_show_suggested', 1);
		$youtube_use_https 					= (int) $this->getProperty($profile, 'youtube_use_https', 0);
		$youtube_privacy_enhanced_mode 		= (int) $this->getProperty($profile, 'youtube_privacy_enhanced_mode', 0);
		$youtube_use_old_code 				= (int) $this->getProperty($profile, 'youtube_use_old_code', 0);
		$youtube_content_embed				= (int) $this->getProperty($profile, 'youtube_content_embed', 0);

		$embedCode = '';
				$message='';
		$error=0;

		$url_method = $youtube_use_https ? 'https' : 'http';
		if($youtube_privacy_enhanced_mode) {
			$youtube_url = $url_method.'://www.youtube-nocookie.com/';
		} else {
			$youtube_url = $url_method.'://www.youtube.com/';
		}

		if($youtube_use_old_code) {
			$youtube_url .= 'v/{youtube_id}?version=3&amp;hl=en_US';
			if(!$youtube_show_suggested) {
				$youtube_url .= '&amp;rel=0';
			}
			$embedCode = '
							<object width="'.$youtube_video_width.'" height="'.$youtube_video_height.'" id="yt-player-{youtube_id}">
							<param name="movie" value="'.$youtube_url.'"></param>
							<param name="allowFullScreen" value="true"></param>
							<param name="allowscriptaccess" value="always"></param>
							<param name="wmode" value="transparent"></param>
							<embed src="'.$youtube_url.'" type="application/x-shockwave-flash" width="'.$youtube_video_width.'" height="'.$youtube_video_height.'" allowscriptaccess="always" allowfullscreen="true" wmode="transparent"></embed>
							</object>';
						} else {
			$youtube_url .= 'embed/{youtube_id}?wmode=transparent';
			if(!$youtube_show_suggested) {
				$youtube_url .= '&amp;rel=0';
			}
			$embedCode = '<iframe class="youtube-player" width="'.$youtube_video_width.'" height="'.$youtube_video_height.'" src="'.$youtube_url.'" wmode="Opaque" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>';
		}

		//IMPORT PROCESS
		$ytKey = $ytName.'_';

		//Get Youtube Data API
		$params = $this->plgParams;
		$ytApiKey = $params->get('api_key');

		$last_insert_id = isset($this->aInfo[$ytKey.'fb_last_id']) ? $this->aInfo[$ytKey.'fb_last_id'] : '';

		// favorite processing.
		if ($ytOption == 'username' && $youtube_favorite!=0) {
			$numResult = 0;
			$userDetailUrl ="https://www.googleapis.com/youtube/v3/channels?part=contentDetails&forUsername=".$ytName."&key=".$ytApiKey;
			$userDetail = json_decode($this->getContent($userDetailUrl));
			if(isset($userDetail->items[0]->contentDetails->relatedPlaylists->favorites)){
				$favorites = $userDetail->items[0]->contentDetails->relatedPlaylists->favorites;
				$fetch = $fetchUrl = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=".$favorites."&key=".$ytApiKey."&maxResults=".(int) $limit;
				$content = $this->getContent($fetch);
				$data = json_decode($content);
				if(is_object($data) && isset($data->items) && is_array($data->items)) {

					//$author = isset($data->feed->author) ? @$data->feed->author[0] : false;
					//$authorName = $author ? @$author->name->{'$t'} : '';

					for ($i=0; $i<count($data->items); $i++) {
						if($numResult >= $limit) {
							break;
						}

						$dt = $data->items[$i];
						$authorName = $dt->snippet->channelTitle;
						$etid = $dt->snippet->resourceId->videoId;
						$alias = JApplication::stringURLSafe('youtube-id-'.$etid);
						$oldId = $tableContent->existsPost($alias);
						if($oldId && !$update_article) {
							continue;
						}

						if($i == 0) {
							$this->aInfo[$ytKey.'yt_last_id'] = $etid;
						}

						$title = $dt->snippet->title;

						$tcontent='';
						if ($target_com == 'joomla' || $youtube_content_embed == 0){
							$tcontent .= '<div class="player">'.str_replace('{youtube_id}', $etid, $embedCode).'</div>';
						}
						$tcontent .= $this->getYoutubeContent($tcontent);

						if(trim($title) == '') {
							continue;
						}

						$post = array();
						$post['source_alias'] = $alias;
						$post['source_title'] = $title;
						$post['created_by'] = $created_by;
						$post['source_author'] = $authorName;
						$post['catid'] = $catid;
						$post['source_published_date'] = $dt->snippet->publishedAt;
						$post['source_url'] = 'http://www.youtube.com/watch?v='.$etid;
						$post['source_id'] = $etid;
						$post['source_url_txt'] = $srcTxt;
												$post['state'] = (int) $state;
						//images
						if($getImg) {
							$img_caption = $title;
							//no need check size for image getting from youtube, since they was cropped to the same size by youtube
							//$post['source_images'] = $this->getArticleImageObj("http://img.youtube.com/vi/".$etid."/0.jpg", $img_caption, $img_caption, 'youtube');
							$post['source_images'] = $this->saveImage("http://i.ytimg.com/vi/".$etid."/hqdefault.jpg", 'youtube', $img_caption, $img_caption);
						} else {
							$post['source_images'] = false;
						}
						$post['source_content'] = $tcontent;
						$post['intro_text'] 	= $this->getIntroText('youtube', $post['source_content']);

						// add to k2 embed video.
						$post['source_video']='';
						if ($target_com == 'k2' && $youtube_content_embed == 1)
							$post['source_video'] = str_replace('{youtube_id}', $etid, $embedCode);

						$result = $tableContent->store('youtube', $post, $oldId);
						if ($result==false) {
													$message .= '<p>&nbsp;&nbsp;&nbsp;&nbsp;Item (guid:'.$etid.') : ERROR</p>';
													$error++;
												}
						//
						$numResult++;
					}
				}
			}
		}

		switch($ytOption){
			case 'username':
				$userDetailUrl ="https://www.googleapis.com/youtube/v3/channels?part=contentDetails&forUsername=".$ytName."&key=".$ytApiKey;
				$userDetail = json_decode($this->getContent($userDetailUrl));
				$uploads = $userDetail->items[0]->contentDetails->relatedPlaylists->uploads;
				$fetchUrl = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=".$uploads."&key=".$ytApiKey;
				break;
			case 'playlistID':
				$fetchUrl = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=".$ytName."&key=".$ytApiKey;
				break;
			case 'channel':
				$channelDetailUrl ="https://www.googleapis.com/youtube/v3/channels?part=contentDetails&id=".$ytName."&key=".$ytApiKey;
				$channelDetail = json_decode($this->getContent($channelDetailUrl));
				$uploads = $channelDetail->items[0]->contentDetails->relatedPlaylists->uploads;
				$fetchUrl = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=".$uploads."&key=".$ytApiKey;
				break;
		}

		//Get more than 50 videos from youtube
		if($limit <= 50){
			$fetchUrl .= "&maxResults=". $limit;
		}else{
			$fetchUrl .= "&maxResults=50";
		}

		$content = $this->getContent($fetchUrl);

		$data = json_decode($content);

		//Get more than 50 videos from youtube
		if($limit > 50){
			$maxResult = $limit - 50;
			do{
				if($maxResult < 50){
					if(!isset($data1->nextPageToken)){
						$fetchUrl_new = str_replace('50', $maxResult, $fetchUrl).'&pageToken='.$data->nextPageToken;
					}else{
						$fetchUrl_new = str_replace('50', $maxResult, $fetchUrl).'&pageToken='.$data1->nextPageToken;
					}

					$content1 = $this->getContent($fetchUrl_new);
					$data1 = json_decode($content1);
					$data->items = array_merge($data1->items, $data->items);
				}else{
					if(!isset($data1->nextPageToken)){
						$fetchUrl_new = $fetchUrl.'&pageToken='.$data->nextPageToken;
					}else{
						$fetchUrl_new = $fetchUrl.'&pageToken='.$data1->nextPageToken;
					}

					$content1 = $this->getContent($fetchUrl_new);
					$data1 = json_decode($content1);
					$data->items = array_merge($data1->items, $data->items);
				}
				$maxResult = $maxResult - 50;
			} while ($maxResult > 0);
		}
		
		$numResult = 0;
		if($youtube_favorite != 2 && is_object($data) && isset($data->items) && is_array($data->items)) {

			//$author = isset($data->feed->author) ? @$data->feed->author[0] : false;
			//$authorName = $author ? @$author->name->{'$t'} : '';

			for ($i=0; $i<count($data->items); $i++) {
				if($numResult >= $limit) {
					break;
				}

				$dt = $data->items[$i];
				$authorName = $dt->snippet->channelTitle;
				$etid = $dt->snippet->resourceId->videoId;
				$alias = JApplication::stringURLSafe('youtube-id-'.$etid);
				$oldId = $tableContent->existsPost($alias);
				if($oldId && !$update_article) {
					continue;
				}

				if($i == 0) {
					$this->aInfo[$ytKey.'yt_last_id'] = $etid;
				}

				$title = $dt->snippet->title;

				$tcontent='';
				if ($target_com == 'joomla' || $youtube_content_embed == 0){
					$tcontent = '<div class="player">'.str_replace('{youtube_id}', $etid, $embedCode).'</div>';
				}
				$tcontent .= $this->getYoutubeContent($dt->snippet->description);

				if(trim($title) == '') {
					continue;
				}

				$post = array();
				$post['source_alias'] = $alias;
				$post['source_title'] = $title;
				$post['created_by'] = $created_by;
				$post['source_author'] = $authorName;
				$post['catid'] = $catid;
				$post['source_published_date'] = $dt->snippet->publishedAt;
				$post['source_url'] = 'http://www.youtube.com/watch?v='.$etid;
				$post['source_id'] = $etid;
				$post['source_url_txt'] = $srcTxt;
				$post['state'] = (int) $state;
				//images
				if($getImg) {
					$img_caption = $title;
					//no need check size for image getting from youtube, since they was cropped to the same size by youtube
					//$post['source_images'] = $this->getArticleImageObj("http://img.youtube.com/vi/".$etid."/0.jpg", $img_caption, $img_caption, 'youtube');
					$post['source_images'] = $this->saveImage("http://i.ytimg.com/vi/".$etid."/hqdefault.jpg", 'youtube', $img_caption, $img_caption);
				} else {
					$post['source_images'] = false;
				}
				$post['source_content'] = $tcontent;
				$post['intro_text'] 	= $this->getIntroText('youtube', $post['source_content']);

				// add to k2 embed video.
				$post['source_video']='';
				if ($target_com == 'k2' && $youtube_content_embed == 1)
					$post['source_video'] = str_replace('{youtube_id}', $etid, $embedCode);

				$result = $tableContent->store('youtube', $post, $oldId);
				if ($result==false) {
					$message .= '<p>&nbsp;&nbsp;&nbsp;&nbsp;Item (guid:'.$etid.') : ERROR</p>';
					$error++;
				}
				//
				$numResult++;
			}
		}
		//return $aResult;
		$message .= '&nbsp;&nbsp;&nbsp; Done : '.$numResult.' Success And '.$error.' Error';
		$this->updateCacheInfo(0);
		return $message;
	}

	private function fetchVimeoPost ($profile) {
		$vmAccType = $this->getProperty($profile, 'vimeo_account_type');
		$vmName = $this->getProperty($profile, 'vimeo_account');
		$target_com = $this->getProperty($profile, 'vimeo_target', 'joomla');
		$tableContent = $this->getTable($target_com, 0);
		$catid = $this->getProperty($profile, 'vimeo_'.$target_com.'_catid', 0);
		if(!$tableContent || !$vmName || !$catid) {
			return false;
		}

		$created_by = $this->getProperty($profile, 'vimeo_created_by', 42);
		$getImg = $this->getProperty($profile, 'vimeo_getimg', 1);
		$srcTxt = $this->getProperty($profile, 'vimeo_sourcetxt', '(Source Vimeo)');
		$limit = $this->getProperty($profile, 'vimeo_limit_post', 20);
		$update_article = $this->getProperty($profile, 'vimeo_update_article', 0);
		$state = $this->getProperty($profile, 'vimeo_article_state','0');

		//override global settings
		$this->save_image = $this->getProperty($profile, 'vimeo_save_image', 0);
		$this->target_com = $target_com;
		$this->valid_img_width = $this->getProperty($profile, 'vimeo_valid_img_width', 360);
		$this->valid_img_height = $this->getProperty($profile, 'vimeo_valid_img_height', 180);

		//video settings
		$vimeo_video_width		= (int) $this->getProperty($profile, 'vimeo_video_width', 500);
		$vimeo_video_height		= (int) $this->getProperty($profile, 'vimeo_video_height', 281);
		$vimeo_autoplay			= (int) $this->getProperty($profile, 'vimeo_autoplay', 0);
		$vimeo_loop				= (int) $this->getProperty($profile, 'vimeo_loop', 0);
		$vimeo_use_old_code		= (int) $this->getProperty($profile, 'vimeo_use_old_code', 0);
		$vimeo_content_embed	= (int) $this->getProperty($profile, 'vimeo_content_embed', 0);

		$embedCode = '';

		if($vimeo_use_old_code) {
			$vimeo_url = 'http://vimeo.com/moogaloop.swf?clip_id={vimeo_id}&amp;force_embed=1&amp;server=vimeo.com&amp;show_title=0&amp;show_byline=0&amp;show_portrait=0&amp;color=90d5ec&amp;fullscreen=1';
			if($vimeo_autoplay) $vimeo_url .= '&amp;autoplay=1';
			if($vimeo_loop) $vimeo_url .= '&amp;loop=1';
			$embedCode = '
				<object width="'.$vimeo_video_width.'" height="'.$vimeo_video_height.'" id="vm-player-{vimeo_id}">
				<param name="allowfullscreen" value="true" />
				<param name="allowscriptaccess" value="always" />
				<param name="wmode" value="transparent" />
				<param name="movie" value="'.$vimeo_url.'" />
				<embed src="'.$vimeo_url.'" type="application/x-shockwave-flash" allowfullscreen="true" allowscriptaccess="always" wmode="transparent" width="'.$vimeo_video_width.'" height="'.$vimeo_video_height.'"></embed>
				</object>';
		} else {
			$vimeo_url = 'http://player.vimeo.com/video/{vimeo_id}?title=0&amp;byline=0&amp;portrait=0&amp;color=90d5ec';
			if($vimeo_autoplay) $vimeo_url .= '&amp;autoplay=1';
			if($vimeo_loop) $vimeo_url .= '&amp;loop=1';
			$embedCode = '<iframe src="'.$vimeo_url.'" width="'.$vimeo_video_width.'" height="'.$vimeo_video_height.'" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>';
		}

		//IMPORT PROCESS
		$vmKey = $vmName.'_';

		$last_insert_id = isset($this->aInfo[$vmKey.'fb_last_id']) ? $this->aInfo[$vmKey.'fb_last_id'] : '';

		$fetchUrl = '';
		switch ($vmAccType) {
			case 'user': $fetchUrl = 'http://vimeo.com/api/v2/'.$vmName.'/all_videos.json'; break;
			case 'album': $fetchUrl = 'http://vimeo.com/api/v2/album/'.$vmName.'/videos.json'; break;
			case 'group': $fetchUrl = 'http://vimeo.com/api/v2/group/'.$vmName.'/videos.json'; break;
			case 'channel': $fetchUrl = 'http://vimeo.com/api/v2/channel/'.$vmName.'/videos.json'; break;
		}
		$content = $this->getContent($fetchUrl);

		$data = json_decode($content);

		$numResult = 0;
		$message='';
		$error=0;
		//$aResult = array();

		if(is_array($data) && count($data)) {
			for ($i=0; $i<count($data); $i++) {
				if($numResult >= $limit) {
					break;
				}

				$dt = $data[$i];
				$etid = $dt->id;

				$alias = JApplication::stringURLSafe('vimeo-id-'.$etid);
				$oldId = $tableContent->existsPost($alias);
				if($oldId && !$update_article) {
					continue;
				}

				if($i == 0) {
					$this->aInfo[$vmKey.'vm_last_id'] = $etid;
				}

				$title = $dt->title;

				$tcontent='';
				if ($target_com == 'joomla' || $vimeo_content_embed == 0)
					$tcontent .= '<div class="player">'.str_replace('{vimeo_id}', $etid, $embedCode).'</div>';
				$tcontent .= '<p>'.$dt->description.'</p>';

				$post = array();
				$post['source_alias'] = $alias;
				$post['source_title'] = $title;
				$post['created_by'] = $created_by;
				$post['source_author'] = $dt->user_name;
				$post['catid'] = $catid;
				$post['source_published_date'] = $dt->upload_date;
				$post['source_url'] = $dt->url;
				$post['source_id'] = $etid;
				$post['source_url_txt'] = $srcTxt;
				$post['state'] = (int) $state;
				//images
				if($getImg) {
					$img_caption = $title;
					//no need check size for image getting from vimeo, since they was cropped to the same size by vimeo
					$post['source_images'] = $this->saveImage($dt->thumbnail_large, 'vimeo', $img_caption, $img_caption);
				} else {
					$post['source_images'] = false;
				}
				$post['source_content'] = $tcontent;
				$post['intro_text'] 	= $this->getIntroText('vimeo', $post['source_content']);

				// add to k2 embed video.
				$post['source_video']='';
				$autoplay='';$loop='';
				if($vimeo_autoplay) $autoplay = 'autoplay=1';
				if($vimeo_loop) $loop = '&loop=1';
				if ($target_com == 'k2' && $vimeo_content_embed == 1)
					$post['source_video'] = str_replace('{vimeo_id}', $etid, $embedCode);

				$result = $tableContent->store('vimeo', $post, $oldId);
				if ($result==false) {
					$message .= '<p>&nbsp;&nbsp;&nbsp;&nbsp;Item (guid:'.$etid.') : ERROR</p>';
					$error++;
				}
				//
				$numResult++;
			}
		}
		$message .= '&nbsp;&nbsp;&nbsp; Done : '.$numResult.' Success And '.$error.' Error';
		//return $aResult;
		$this->updateCacheInfo(0);
		return $message;
	}

	private function fetchInstagramPost ($profile) {
		$igid = $this->getProperty($profile, 'instagram_account');
		$target_com = $this->getProperty($profile, 'instagram_target', 'joomla');
		$tableContent = $this->getTable($target_com, 0);
		$catid = $this->getProperty($profile, 'instagram_'.$target_com.'_catid', 0);
		if(!$tableContent || !$igid || !$catid) {
			return false;
		}

		$created_by = $this->getProperty($profile, 'instagram_created_by', 42);
		$getImg = $this->getProperty($profile, 'instagram_getimg', 1);
		$srcTxt = $this->getProperty($profile, 'instagram_sourcetxt', '(Source Instagram)');
		$limit = $this->getProperty($profile, 'instagram_limit_post', 20);
		$update_article = $this->getProperty($profile, 'instagram_update_article', 0);

		$client_id = $this->getProperty($profile, 'insta_app_client_id', '');
		$secret = $this->getProperty($profile, 'insta_app_secret', '');
		$redirect_url = $this->getProperty($profile, 'insta_app_redirect_url','');
		$accesstoken = $this->getProperty($profile, 'insta_accesstoken', '');

		//override global settings
		$this->save_image = $this->getProperty($profile, 'instagram_save_image', 0);
		$this->target_com = $target_com;
		$this->valid_img_width = $this->getProperty($profile, 'instagram_valid_img_width', 360);
		$this->valid_img_height = $this->getProperty($profile, 'instagram_valid_img_height', 180);
		
		//IMPORT PROCESS
		$igKey = $igid.'_';
		$last_insert_id = isset($this->aInfo[$igKey.'ig_last_id']) ? $this->aInfo[$igKey.'ig_last_id'] : '';
		$v2 = false;

		$query = array(
			'access_token' => $accesstoken
		);
		if (preg_match('/^@/', $igid)) {
			// user id
			$url = 'https://api.instagram.com/v1/users/'.ltrim($igid, '@').'/media/recent/?'.http_build_query($query);
		} elseif (preg_match('/^#/', $igid)) {
			// tag id
			$url = 'https://api.instagram.com/v1/tags/'.ltrim($igid, '#').'/media/recent?'.http_build_query($query);
		} elseif (preg_match('/^[POPULAR]/', $igid)) {
			// no infomation.
		} else {
			// default url
			$url = 'https://www.instagram.com/'.$igid.'/media/';
			$v2 = true;
		}
		
		if ($v2 == true) { // detect if using get feed no need client api.
			$instagram = json_decode(file_get_contents($url));
			$items = $instagram->items;
		} else {
			try {
				$curl_connection = curl_init($url);
				curl_setopt($curl_connection, CURLOPT_CONNECTTIMEOUT, 30);
				curl_setopt($curl_connection, CURLOPT_RETURNTRANSFER, true);
				curl_setopt($curl_connection, CURLOPT_SSL_VERIFYPEER, false);

				$data = json_decode(curl_exec($curl_connection), true);
				curl_close($curl_connection);
			} catch(Exception $e) {
				return $e->getMessage();
			}
			if (!empty($data['error_message'])) {
				return '&nbsp;&nbsp;&nbsp;Error: '.$data['error_message'];
			}
			$items = $data['data'];
		}

		$numResult = 0;
		$message='';
		$error=0;
		//$aResult = array();

		if(count($items)) {
			for ($i = 0; $i < $limit; $i++) {
				if (empty($items[$i])) continue;
				$dt = (object)$items[$i];
				// these 2 info in tag is array. but in default url is object so we need to transfer to object.
				if (empty($dt->caption->text)) $dt->caption = (object)$dt->caption;
				if (empty($dt->images->standard_resolution->url)) {
					$dt->images = (object)$dt->images;
					$dt->images->standard_resolution = (object)$dt->images->standard_resolution;
				}
				if ($dt->type != 'image') continue; // we only get image type.

				/*if($dt->id == $last_insert_id && !$update_article) {
					//remain posts are imported => skipable
					break;
				}*/

				$alias = JApplication::stringURLSafe('instagram-id-'.$dt->id);

				$oldId = $tableContent->existsPost($alias);
				if($oldId && !$update_article) {
					continue;
				}

				if($i == 0) {
					$this->aInfo[$igKey.'ig_last_id'] = $dt->id;
				}
				$text = !empty($dt->caption->text) ? $dt->caption->text : $dt->link;
				$title = $this->cutTitleFromContent($text);
				$tcontent = $text;

				$post = array();
				$post['source_alias'] = $alias;
				$post['source_title'] = $title;
				$post['created_by'] = $created_by;
				$post['source_author'] = $dt->user->username;
				$post['catid'] = $catid;
				$post['source_published_date'] = $dt->created_time;
				$post['source_url'] = $dt->link;
				$post['source_url_txt'] = $srcTxt;
				//images
				if ($getImg)
					$post['source_images'] = $this->saveImage($dt->images->standard_resolution->url, 'instagram', $title, $title);
				else $post['source_images'] = false;

				$post['source_content'] = $tcontent;
				$post['intro_text'] 	= $this->getIntroText('instagram', $post['source_content']);

				$result = $tableContent->store('instagram', $post, $oldId);
				if ($result==false) {
					$message .= '<p>&nbsp;&nbsp;&nbsp;&nbsp;Item (guid:'.$dt->id.') : ERROR</p>';
					$error++;
				} else
					$numResult++;
			}
		}
		$message .= '&nbsp;&nbsp;&nbsp; Done : '.$numResult.' Success And '.$error.' Error';
		//return $aResult;
		$this->updateCacheInfo(0);
		return $message;
	}


	private function fetchFlickrPost ($profile) {
		$frid = $this->getProperty($profile, 'flickr_account');
		$target_com = $this->getProperty($profile, 'flickr_target', 'joomla');
		$tableContent = $this->getTable($target_com, 0);
		$catid = $this->getProperty($profile, 'flickr_'.$target_com.'_catid', 0);
		if(!$tableContent || !$frid || !$catid) {
			return false;
		}

		$account_type = $this->getProperty($profile, 'flickr_account_type');
		$id_album = $this->getProperty($profile, 'flickr_account_id_album', '');
		if ($account_type == 'album' && $id_album == '') return false;

		$created_by = $this->getProperty($profile, 'flickr_created_by', 42);
		$getImg = $this->getProperty($profile, 'flickr_getimg', 1);
		$srcTxt = $this->getProperty($profile, 'flickr_sourcetxt', '(Source Flickr)');
		$limit = $this->getProperty($profile, 'flickr_limit_post', 20);
		$update_article = $this->getProperty($profile, 'flickr_update_article', 0);

		//override global settings
		$this->save_image = $this->getProperty($profile, 'flickr_save_image', 0);
		$this->target_com = $target_com;
		$this->valid_img_width = $this->getProperty($profile, 'flickr_valid_img_width', 360);
		$this->valid_img_height = $this->getProperty($profile, 'flickr_valid_img_height', 180);


		$flickr_get_favorite_photos = $this->getProperty($profile, 'flickr_get_favorite_photos', 1);
		//IMPORT PROCESS
		$frKey = $frid.'_';

		$last_insert_id = isset($this->aInfo[$frKey.'fr_last_id']) ? $this->aInfo[$frKey.'fr_last_id'] : '';

		//$items = $this->getFlickrItems($frid, $limit);
		$regex = '/\d+\@[^\@]+/';
		//$searchById = 0;
		$fetchUrl = 'http://api.flickr.com/services/feeds/photos_public.gne?format=php_serial';

		if(preg_match($regex, $frid)) {
			//$searchById = 1;
			$fetchUrl .= '&id='.$frid;
		} else {
			$fetchUrl .= '&tags='.$frid;
		}

		// rewrite url for favorite and album type.
		switch ($account_type) {
			case 'favorite': $fetchUrl = 'http://api.flickr.com/services/feeds/photos_faves.gne?format=php_serial&id='.$frid; break;
			case 'album': $fetchUrl = 'http://api.flickr.com/services/feeds/photoset.gne?format=php_serial&set='.$id_album.'&nsid='.$frid; break;
		}

		// fetch data.
		$content = $this->getContent($fetchUrl);
		$data = unserialize($content);

		$numResult = 0;
		$message='';
		$error=0;
		//$aResult = array();

		$items = array();
		if(isset($data['items']) && is_array($data['items']) && count($data['items'])) {
			$items = $data['items'];
		}

		if(count($items)) {
			$i = 0;
			foreach ($items as $dt) {
				$i++;
				if($numResult >= $limit) {
					break;
				}

				//$dt['id'] = preg_replace('/.*?([0-9]+)\/*$/', '$1', $dt->link);
				$dt['id'] = str_replace('/', '', $dt['guid']);

				$alias = JApplication::stringURLSafe('flickr-id-'.$dt['id']);

				$oldId = $tableContent->existsPost($alias);
				if($oldId && !$update_article) {
					continue;
				}

				if($i == 1) {
					$this->aInfo[$frKey.'fr_last_id'] = $dt['id'];
				}

				$title = $dt['title'];
				$tcontent = $dt['description'];

				$post = array();
				$post['source_alias'] = $alias;
				$post['source_title'] = $title;
				$post['created_by'] = $created_by;
				$post['source_author'] = $dt['author_name'];
				$post['catid'] = $catid;
				$post['source_published_date'] = date('Y-m-d', $dt['date']);
				$post['source_url'] = $dt['url'];
				$post['source_url_txt'] = $srcTxt;
				//images
				//$largeImage = preg_replace('/_[a-z]{1}(\.(?:jpg|jpeg|png|gif|bmp))$/i', '_z$1', $dt->media->m);
				if ($getImg)
					$post['source_images'] = $this->saveImage($dt['l_url'], 'flickr', $title, $title);
				else $post['source_images'] = false;

				$post['source_content'] = $tcontent;
				$post['intro_text'] 	= $this->getIntroText('flickr', $post['source_content']);
				$result = $tableContent->store('flickr', $post, $oldId);
				if ($result==false) {
					$message .= '<p>&nbsp;&nbsp;&nbsp;&nbsp;Item (guid:'.$dt['id'].') : ERROR</p>';
					$error++;
				}
				//
				$numResult++;
			}
		}

		//return $aResult;
		$message .= '&nbsp;&nbsp;&nbsp; Done : '.$numResult.' Success And '.$error.' Error';
		$this->updateCacheInfo(0);
		return $message;
	}

	private function fetchPinterestPost ($profile) {
		$ptid = $this->getProperty($profile, 'pinterest_account');
		$board = $this->getProperty($profile, 'pinterest_board', 'feed');
		if($board === ''){
			$board = 'feed';
		}
		$target_com = $this->getProperty($profile, 'pinterest_target', 'joomla');
		$tableContent = $this->getTable($target_com, 0);
		$catid = $this->getProperty($profile, 'pinterest_'.$target_com.'_catid', 0);
		if(!$tableContent || !$ptid || !$catid) {
			return false;
		}

		$created_by = $this->getProperty($profile, 'pinterest_created_by', 42);
		$getImg = $this->getProperty($profile, 'pinterest_getimg', 1);
		$srcTxt = $this->getProperty($profile, 'pinterest_sourcetxt', '(Source Flickr)');
		$limit = $this->getProperty($profile, 'pinterest_limit_post', 20);
		$update_article = $this->getProperty($profile, 'pinterest_update_article', 0);

		//override global settings
		$this->save_image = $this->getProperty($profile, 'pinterest_save_image', 0);
		$this->target_com = $target_com;
		$this->valid_img_width = $this->getProperty($profile, 'pinterest_valid_img_width', 360);
		$this->valid_img_height = $this->getProperty($profile, 'pinterest_valid_img_height', 180);


		//IMPORT PROCESS
		$ptKey = $ptid.'_';

		$fetchUrl = 'http://www.pinterest.com/'.$ptid.'/'.$board.'.rss';
		$xmlDoc = new DOMDocument();
		//$xmlDoc->load($xml);
		$xml = $this->getContent($fetchUrl);
		$xmlDoc->loadXML($xml);


		$items = array();
		$x= $xmlDoc->getElementsByTagName('item');
		if(is_object($x)) {
			for ($i=0; $i<$limit; $i++) {
				$item = @$x->item($i);
				if(!is_object($item)) {
					break;
				}

				$it = new stdClass();
				$it->title		= html_entity_decode($item->getElementsByTagName('title')->item(0)->childNodes->item(0)->nodeValue);
				$it->guid		= $item->getElementsByTagName('guid')->item(0)->childNodes->item(0)->nodeValue;
				$it->link		= $item->getElementsByTagName('link')->item(0)->childNodes->item(0)->nodeValue;
				$it->desc		= html_entity_decode($item->getElementsByTagName('description')->item(0)->childNodes->item(0)->nodeValue);
				$it->pubDate	= $item->getElementsByTagName('pubDate')->item(0)->childNodes->item(0)->nodeValue;
				$it->author		= '';

				// replace all pin link
				$it->desc = str_replace('href="/pin/', 'target="_blank" href="http://www.pinterest.com/pin/', $it->desc);
				//get large image
				$it->desc = preg_replace('#/192x/#i', '/736x/', $it->desc);
				$images = $this->parseImageFromContent($it->desc);
				$it->image = $images[0];
				$it->id = preg_replace('/.*?([0-9_]+)\/*$/', '$1', $it->guid);
				$items[] = $it;
			}
		}

		$numResult = 0;
		$message='';
		$error=0;
		if(count($items)) {
			foreach ($items as $dt) {
				if($numResult >= $limit) {
					break;
				}

				$alias = JApplication::stringURLSafe('pinterest-id-'.$dt->id);
				$oldId = $tableContent->existsPost($alias);
				if($oldId && !$update_article) {
					continue;
				}
				$title = $dt->title;

				$post = array();
				$post['source_alias'] = $alias;
				$post['source_title'] = $dt->title;
				$post['created_by'] = $created_by;
				$post['source_author'] = $dt->author;
				$post['catid'] = $catid;
				$post['source_published_date'] = $dt->pubDate;
				$post['source_url'] = $dt->link;
				$post['source_url_txt'] = $srcTxt;
				//images
				if ($getImg)
					$post['source_images'] = $this->saveImage($dt->image, 'pinterest', $title, $title);
				else $post['source_images'] = false;

				$post['source_content'] = $dt->desc;
				$post['intro_text'] 	= $this->getIntroText('pinterest', $post['source_content']);

				$result = $tableContent->store('pinterest', $post, $oldId);
				if ($result==false) {
					$message .= '<p>&nbsp;&nbsp;&nbsp;&nbsp;Item (guid:'.$dt->id.') : ERROR</p>';
					$error++;
				}
				//
				$numResult++;
			}
		}
				$message .= '&nbsp;&nbsp;&nbsp; Done : '.$numResult.' Success And '.$error.' Error';
		//return $aResult;
		$this->updateCacheInfo(0);
		return $message;
	}
  
  
	private function loopfindImg($arr) {
		if (is_array($arr)) {
			foreach ($arr AS $ar) {
				$this->loopfindImg($ar);
			}
		} else {
			$v = strip_tags($arr);
			if ($this->urlIsImage($v)) {
				$url = $this->urlIsImage($v);
				$this->imglink=$url;
				return;
			}
			preg_match('/<img(.*?)src="(.*?)"(.*?)\/>/s', $arr, $match);
			if (!empty($match[2])) {
				$this->imglink=$match[2];
				return;
			}
		}
	}
	
	/*
	 * To clone image, because k2 store function will delete original image
	 */

	private function cloneDefaultImage($target_com, $url, $src, $alt, $imgCaption) {
		$file = preg_replace('/(.*?)\//', '', $url);
		$img = JPATH_ROOT . '/' . $url;
		$dest = JPATH_ROOT . '/images/jasocial_feed/rss-' . $target_com . '-' . $this->profile . '-' . $file;
		if (JFile::exists($img)) {
			JFile::copy($img, $dest);
			return $this->saveImage('images/jasocial_feed/rss-' . $target_com . '-' . $this->profile . '-' . $file, $src, $alt, $imgCaption);
		} else {
			return false;
		}
	}

	private function fetchRssPost ($profile) {
		$rssid = $this->getProperty($profile, 'rss_account');
		$target_com = $this->getProperty($profile, 'rss_target', 'joomla');
		$tableContent = $this->getTable($target_com, 0);
		$catid = $this->getProperty($profile, 'rss_'.$target_com.'_catid', 0);
		if(!$tableContent || !$rssid || !$catid) {
				return false;
		}

		$created_by = $this->getProperty($profile, 'rss_created_by', 42);
		$getImg = $this->getProperty($profile, 'rss_getimg', 1);
		$srcTxt = $this->getProperty($profile, 'rss_sourcetxt', '(Source RSS)');
		$limit = $this->getProperty($profile, 'rss_limit_post', 20);
		$update_article = $this->getProperty($profile, 'rss_update_article', 0);
		$default_intro_image = $this->getProperty($profile, 'rss_default_intro_image', false);

		//override global settings
		$this->save_image = $this->getProperty($profile, 'rss_save_image', 0);
		$this->target_com = $target_com;
		require_once(dirname(__FILE__).'/rss_php.php');
		$rss = new rss_php;
		$rss->load($rssid);
		$items = $rss->getItems(true); #returns all rss items
		$message='';
		$numResult=0;
		$error=0;
		if(count($items))
			foreach ($items AS $item) {
				if($numResult >= $limit) {
					break;
				}

				if (empty($item['guid']['value'])) continue; // if don't have guid to make alias we pass.
				if (preg_match('/^http/', $item['guid']['value'])) {
					$guid = preg_replace('/(.*?)\//','',$item['guid']['value']);
				} else {
					$guid = preg_replace('/[a-zA-Z_\-]+/','',$item['guid']['value']);
				}
				
				// quick fix for cnn url
				//$guid = preg_replace('~(^http|https):\/\/~','',$item['guid']['value']);
				
				$alias = JApplication::stringURLSafe('rss-'.$guid);
				$oldId = $tableContent->existsPost($alias);
				if($oldId && !$update_article) {
						continue;
				}
				$author_alias = (!empty($item['author']['value']) ? $item['author']['value'] : '');
				$title = $item['title']['value'];
				$post = array();
				$post['source_alias'] = $alias;
				$post['source_title'] = $title;
				$post['created_by'] = $created_by;
				$post['source_author'] = $author_alias;
				$post['catid'] = $catid;
				$post['source_published_date'] = isset($item['pubDate']['value']) ? strtotime($item['pubDate']['value']) : strtotime(date('Y-m-d H:i:s'));
				$post['source_url'] = $item['link']['value'];
				$post['source_url_txt'] = $srcTxt;
				//images
				if ($getImg) {
					$imgCaption = $this->cutTitleFromContent($title, 50);
					$this->imglink=false;
					$this->loopfindImg($item);
					$imglink=$this->imglink;
					if (empty($post['source_images']) && !empty($imglink)) {
						$realurl = $imglink;
						if (!preg_match('/^http/', $realurl) && preg_match('/amazon/', $realurl)) // specifix for only amazon image. without http.
							$realurl = 'https:'.$realurl;
						$post['source_images'] = $this->saveImage($realurl, 'rss', $imgCaption, $imgCaption);
					} else $post['source_images'] = $this->cloneDefaultImage($target_com, $default_intro_image, 'rss', $imgCaption, $imgCaption);
				} else {
					$post['source_images'] = false;
				}
				
				$post['source_content']= isset($item['description']['value']) ? $item['description']['value'] : '';
				if (!empty($imglink)) {
					$post['source_content'] = preg_replace('/<img(.*?)src="'.str_replace('/','\/',$imglink).'"(.*?)\/>/', '', $post['source_content']);
				}
				$post['source_content'] = preg_replace('/<img(.*?)src=""(.*?)\/>/', '', $post['source_content']);
				$post['intro_text'] 	= $this->getIntroText('rss', $post['source_content']);

				$result = $tableContent->store('rss', $post, $oldId);
				if ($result==false) {
					$message .= '<p>&nbsp;&nbsp;&nbsp;&nbsp;Item (guid:'.$item['guid']['value'].') : ERROR</p>';
					$error++;
				}
				//
				$numResult++;
			}
		else {$message = 'Failed To Load Resource.';$error++;}
		$message .= '&nbsp;&nbsp;&nbsp; Done : '.$numResult.' Success And '.$error.' Error';
		return $message;
	}
	
	private function checkImgSize($url) {
		if(strpos($url, 'graph.facebook.com') !== false) {
			return true;
		}
		$result = @getimagesize($url);
		if($result) {
			list($width, $height, $type, $attr) = $result;
			//get only image with width is lager than 360px
			if($width < $this->valid_img_width || $height < $this->valid_img_height) {
				return false;
			}
		} else {
			/**
			 * .todo update function to get image size, for temporary it will get image if could not check its size
			 */
			return true;
			/*$patternBigImg = '/_b\.(jpg|jpeg|png|gif|bmp)$/i';
			if(strpos($url, 'fbcdn') !== false && preg_match($patternBigImg, $url)) {
				//In case of can not get size image, then return true if check it facebook big image
				return true;
			}
			return false;*/
		}
		return true;
	}

	private function saveImage($url, $src, $caption = '', $alt = '', $force_download = false) {
		if($this->target_com == 'k2') {
			$this->save_image = 1;
		}
		if($this->save_image || $force_download) {
			$folder = JPATH_ROOT.'/images/jasocial_feed/';
			$result = JFolder::create($folder);
			if($result) {

				/*if($src == 'facebook') {
					$validImg = $this->checkImgSize($url);
					if(!$validImg) {
						return false;
					}
				}*/

				//$content = @file_get_contents($url);
				$content = $this->getContent($url);
				if($content) {
					$filename = basename($url);
					$filename = preg_replace('/\?.*?$/', '', $filename);
					$ext = JFile::getExt($filename);
					$ext = strtolower($ext);
					if($ext == 'php') $ext = 'jpg';
					$filename = md5($url).'.'.$ext;
					if($this->target_com == 'k2') {
						$filename = 'k2_'.$filename;
					}
					$file = $folder.$filename;

					$result = JFile::write($file, $content);
					if($result) {						//update with local link
						$url = 'images/jasocial_feed/'.$filename;
					}
				}
				return $this->getArticleImageObj($url, $caption, $alt, $src);
			}
		}

		/*if($src == 'facebook') {
			$validImg = $this->checkImgSize($url);
		} else {
			//image that get from twitter is checked before
			$validImg = true;
		}*/
		$validImg = true;
		if($validImg) {
			return $this->getArticleImageObj($url, $caption, $alt, $src);
		} else {
			return false;
		}

	}

	private function getArticleImageObj($url, $caption = '', $alt = '', $src = '') {
		$image = new stdClass();

		$image->float_fulltext = '';
		$image->float_intro = '';
		$image->image_intro = $url;
		$image->image_intro_alt = $alt;
		$image->image_intro_caption = $caption;
		$image->image_fulltext = $url;
		$image->image_fulltext_alt = $alt;
		$image->image_fulltext_caption = $caption;

		if($src == 'youtube' || $src == 'vimeo'){
			$image->image_fulltext = '';
			$image->image_fulltext_alt = '';
			$image->image_fulltext_caption = '';
		}

		return $image;
	}

	private function getYoutubeContent($content){
		$pattern = '/<div style=\"font-size: 12px; margin: 3px 0px;\">(.*)<\/div>/';
		preg_match($pattern, $content, $matches);
		if(isset($matches[1])){
			return strip_tags($matches[1]);
		}else{
			return $content;
		}
		return false;

	}

	private function getFacebookVideoEmbed($id, $fb_app_id, $fb_app_secret) {
		$url = "https://graph.facebook.com/v2.8/".$id."?fields=embed_html,embeddable&access_token=".$fb_app_id."|".$fb_app_secret;
		$content = $this->getContent($url);
		$data = json_decode($content);
		if (empty($data->embeddable)) {
			return '';
		}
		$embed = $data->embed_html;
		$embed = str_replace('<iframe', '<iframe class="ja-socialfeed-video-iframe"', $embed);
		return $embed;
	}
	
	private function getFacebookImage($post, $caption, $alt) {

		$images = false;
		$aImages = $this->parseImageFromContent($post, '', 'facebook');
		$aImages2 = $this->getValidImages($aImages);

		if(count($aImages2)) {
			$url = $aImages2[0];
			$images = $this->saveImage($url, 'twitter', $caption, $alt);
		}
		return $images;
	}

	private function updateFacebookImage($post) {
		$pattern = '/http[^\'\"\>\<]+(?:safe_image|app_full_proxy).php\?([^\"\'\>]+)/i';
		preg_match($pattern, $post, $matches);
		if(isset($matches[1])) {
			$params = str_replace('&amp;', '&', $matches[1]);

			$patternUrl = '/\&(?:url|src)=([^\"\'\&]+)/';
			preg_match($patternUrl, $params, $matches2);
			if(isset($matches2[1])) {
				$url = rawurldecode($matches2[1]);
				$post = str_replace($matches[0], $url, $post);
			}
		}
		return $post;
	}

	private function getTweetImage($mediaObject, $caption, $alt)
	{
		if (property_exists($mediaObject, 'media')) {
			$mediaArray = $mediaObject->media;
			if ($mediaArray) {
				foreach ($mediaArray as $mediaItem) {
					if (property_exists($mediaItem, 'media_url')) {
						$mediaURL = $mediaItem->media_url;
						return $this->saveImage($mediaURL, 'twitter', $caption, $alt);
					}
				}
			}
		}
		return NULL;
	}

	private function isRetweet($content) {
		return (preg_match('/^[\s\t\r\n]*RT/', $content) ? 1 : 0);
	}

	private function updateTweetUrls($content) {
		$maxLen = 16;
		//split long words
		$pattern = '/[^\s\t]{'.$maxLen.'}[^\s\.\,\+\-\_]+/';
		$content = preg_replace($pattern, '$0 ', $content);

		//
		$pattern = '/\w{2,5}\:\/\/[^\s\"]+/';
		$content = preg_replace($pattern, '<a href="$0" title="" target="_blank">$0</a>', $content);

		//search
		$pattern = '/\#([a-zA-Z0-9_-]+)/';
		$content = preg_replace($pattern, '<a href="https://twitter.com/#%21/search/%23$1" title="" target="_blank">$0</a>', $content);

		//user
		$pattern = '/\@([a-zA-Z0-9_-]+)/';
		$content = preg_replace($pattern, '<a href="https://twitter.com/#!/$1" title="" target="_blank">$0</a>', $content);

		return $content;
	}

	private function getPostTitle($txt) {
		$txt = strip_tags($txt);
		$txt = preg_replace('/[^a-zA-Z0-9\.\,\-\_\?\!\@\#\s]/', '', $txt);
		if(strlen($txt) > 64) {
			$posDot = strpos($txt, '.', 32);
			$posCom = strpos($txt, ',', 32);
			if($posDot !== false && $posDot < 64) {
				$txt = substr($txt, 0, $posDot);
			} elseif($posCom !== false && $posCom < 64) {
				$txt = substr($txt, 0, $posCom);
			} else {
				$txt = substr($txt, 0, 64);
			}
		}

		return $txt;
	}

	private function getImageCaption($txt) {
		$txt = strip_tags($txt);
		$txt = preg_replace('/[\s\t\r\n]+/', ' ', $txt);
		$txt = substr($txt, 0, 32);
		return $txt;
	}

	private function getValidImages($aImages, $limit = 1) {
		$aImages2 = array();
		if(count($aImages)) {
			$cnt = 0;
			foreach ($aImages as $img) {
				//if(!is_file($img)) continue;
				$isValidImg = $this->checkImgSize($img);
				if($isValidImg) {
					$cnt++;
					$aImages2[] = $img;
					if($cnt >= $limit) {
						break;//get only 1 images
					}
				}
			}
		}
		return $aImages2;
	}

	private function parseImageFromContent($content, $url = '', $source = '') {
		$aImages = array();
		$aIgnore = $this->getIgnoreWords();
		$numIngnore = count($aIgnore);

		$pattern = '/<img[^>]+src\s*=\s*["\']([^"\']+)["\']/i';
		preg_match_all($pattern, $content, $matches);
		if(isset($matches[1])) {
			for ($i = 0; $i < count($matches[1]); $i++) {
				$imgName = basename($matches[1][$i]);
				$imgName = strtolower($imgName);
				$ignore = 0;
				for($j=0; $j < $numIngnore; $j++) {
					if(strpos($imgName, $aIgnore[$j]) !== false) {
						$ignore = 1;
						break;
					}
				}
				if(!$ignore) {
					$aImages[] = $matches[1][$i];
				}
			}
		}

		//UPDATE URLS TO ABSOLUTE FORMAT
		if(!empty($url)) {
			$domain = preg_replace('/(^\w+\:\/\/[^\/]+).*/i', '$1', $url);
			$path = preg_replace('/^\w+\:\/\/[^\/]+/i', '', $url);//remove domain
			$path = preg_replace('/\?.*$/i', '', $path);//remove query string
			$paths = explode('/', $path);

			$aPaths = array();
			if(count($paths)) {
				$path = $domain.'/';
				$aPaths[] = $path;
				for ($i=0; $i<count($paths); $i++) {
					if(!empty($paths[$i])) {
						$path .= $paths[$i].'/';
						$aPaths[] = $path;
					}
				}
			}

			if(!count($aPaths)) {
				$aPaths[] = $domain . '/';
			}


			$numPath = count($aPaths);
			if($numPath) {
				$pattern = '/^\w+\:\/\//i';
				$aImgTmp = array();

				$aCheck = array();

				for ($j=0; $j < $numPath; $j++) {
					for ($i = 0; $i < count($aImages); $i++) {
						if(isset($aCheck[$i])) continue;

						$img = $aImages[$i];
						$img = preg_replace('/^[\/\\\\]+/', '', $img);
						if(!preg_match($pattern, $img)) {
							$aImgTmp[] = $aPaths[$j] . $img;
						} else {
							$aImgTmp[] = $img;
							$aCheck[] = $i;
						}
					}
				}
				$aImgTmp = array_unique($aImgTmp);

				$aImages = $aImgTmp;
			}
		}

		if($source == 'facebook') {
			if(count($aImages)) {
				//JAECPLGSOCIALFEED-44 Get images from FB with better resolution
				$patternSmallImg = '/_s\.(jpg|jpeg|png|gif|bmp)$/i';
				foreach ($aImages as $index => $img) {
					if(strpos($img, 'fbcdn') !== false) {
						if(preg_match('/url=http/', $img)) {
							//eg: https://fbexternal-a.akamaihd.net/safe_image.php?d=AQBr4qx2iuYe6k6f&amp;w=158&amp;h=158&amp;url=https%3A%2F%2Fscontent-a-lax.xx.fbcdn.net%2Fhphotos-xpf1%2Ft31.0-8%2Fs720x720%2F10943719_848687791857700_7419083212834719221_o.jpg
							$img = preg_replace('/.*?url=(http.*)/', '$1', $img);
							$img = rawurldecode($img);
						}

						if(preg_match('#/([0-9]+)_([0-9]+)_([0-9]+)_(o|b)?\.(jpg|png|jpeg|gif|bmp)#i', $img, $matches)) {
							//is original, big image
							$aImages[$index] = $img;
						} else if(preg_match('#/([0-9]+)_([0-9]+)_([0-9]+)(?:_[a-z])?\.(jpg|png|jpeg|gif|bmp)#i', $img, $matches)) {
							if (!strpos($img, 'hphotos')) // if the image from fb already big size.
								$img = 'https://graph.facebook.com/'.$matches[2].'/picture';
							$aImages[$index] = $img;
						} else if (preg_match($patternSmallImg, $img)) {
							$aImages[$index] = preg_replace($patternSmallImg, '_b.$1', $img);
						}
					} else {
						if (preg_match('/external/', $img))
							$aImages[$index] = str_replace(array('w=130', 'h=130'), array('w=476', 'h=249'), $img);
						else
							$aImages[$index] = $img;
					}
				}
			}
		}

		return $aImages;
	}

	private function urlIsImage($url) {
		$rPos = strrpos($url, '?');
		if($rPos !== false) {
			$url = substr($url, 0, $rPos);
		}
		if(preg_match('/\.(jpg|jpeg|png|gif|bmp)$/i', $url)) {
			return $url;
		}
		return false;
	}

	private function getContent(&$url) {
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

	private function getCacheFile() {
		$file = dirname(__FILE__).DIRECTORY_SEPARATOR.'cache'.DIRECTORY_SEPARATOR.'cache.txt';
		if(!JFile::exists($file)) {
			$content = '';
			$result = JFile::write($file, $content);
			if(!$result) {
				JFactory::getApplication()->enqueueMessage(JText::_('PLUGIN_JA_SOCIAL_FEED_CAN_NOT_CACHE_FILE'), 'warning');
				return false;
			}
		}
		return $file;
	}

	private function tracelog($mesage){
		$file = dirname(__FILE__).DIRECTORY_SEPARATOR.'cache'.DIRECTORY_SEPARATOR.'runhere.txt';
		JFile::write($file, $mesage);
	}

	/**
	 * getCacheInfo
	 *
	 * @return array information of the last run
	 */
	private function getCacheInfo() {
		$aInfo = array();
		$file = $this->getCacheFile();
		if($file) {
			$content = JFile::read($file);
			$aItem = preg_split('/[\r*\n]+/', $content);
			for ($i=0; $i<count($aItem); $i++) {
				$item = explode(':', $aItem[$i], 2);
				if(count($item) == 2) {
					$aInfo[trim($item[0])] = trim($item[1]);
				}
			}
		}
		return $aInfo;
	}

	private function updateCacheInfo($updateTime = 1) {
		$content = '';
		if($updateTime) {
			$this->aInfo['last_run'] = time();
		}
		if(count($this->aInfo)) {
			$aInfo = array();
			foreach ($this->aInfo as $key => $val) {
				$aInfo[] = $key.':'.$val;
			}
			$content = implode("\r\n", $aInfo);
		}
		$file = $this->getCacheFile();
		if($file) {
			JFile::write($file, $content);
		}
	}

	private function getNextRun() {

		$last_run = isset($this->aInfo['last_run']) ? $this->aInfo['last_run'] : 0;
		$cron_interval = $this->plgParams->get('cache_time', 3600);

		$next_run = $last_run + $cron_interval;

		return $next_run;
	}

	private function cmpLongInt($n1, $n2) {
		$a1 = str_split($n1);
		$a2 = str_split($n2);
		$len1 = count($a1);
		$len2 = count($a1);
		if($len1 > $len2) {
			return 1;
		} elseif ($len2 > $len1) {
			return -1;
		} else {
			if(!$len1) {
				return 0;
			} else {
				for ($i = 0; $i<$len1; $i++) {
					if ($a1[$i] > $a2[$i]) {
						return 1;
					} elseif ($a1[$i] < $a2[$i]) {
						return -1;
					}
				}
				return 0;
			}
		}

	}

	private function getIgnoreWords () {
		$aIgnore = array('logo', 'banner', 'advertising');
		return $aIgnore;
	}

	private function cutTitleFromContent($content, $maxlen = 50) {
		$content = strip_tags($content);
		//$content = htmlspecialchars_decode($content);
		$content = html_entity_decode( $content, ENT_QUOTES, "utf-8" );
		$content = trim(preg_replace('/[\r\n\s\t]+/', ' ', $content));
		if(strlen($content) < $maxlen) {
			return $content;
		}
		$pos = strpos($content, ' ', $maxlen);
		$content = ($pos !== false) ? substr($content, 0, $pos) : $content;
		if(strlen($content) > $maxlen) {
			$pos = strrpos($content, ' ');
			if($pos !== false) {
				$content = substr($content, 0, $pos);
			} else {
				$content = substr($content, 0, $maxlen);
			}
		}
		return $content;
	}

	private function getIntroText($source, $content) {
		$introtext = '';
		if($source != 'twitter' && $this->intro_text) {
			$introtext = $this->cutTitleFromContent($content, $this->intro_text_limit);
		}
		return $introtext;
	}
}