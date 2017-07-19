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

// Ensure this file is being included by a parent file
defined('_JEXEC') or die( 'Restricted access' );
require_once(JPATH_ROOT.'/plugins/system/jasocial_feed/helpers.php');
/**
 * Radio List Element
 *
 * @since      Class available since Release 1.2.0
 */
class JFormFieldJaDepend extends JFormField
{
	/**
	 * Element name
	 *
	 * @access	protected
	 * @var		string
	 */
	protected $type = 'JaDepend';
	
	/**
	 * Check and load assets file if needed
	 */
	function loadAsset(){
		
		if (!defined ('_JA_DEPEND_ASSET_')) {
			define ('_JA_DEPEND_ASSET_', 1);
			$uri = str_replace(DIRECTORY_SEPARATOR, '/', str_replace( JPATH_SITE, JURI::base(), dirname(__FILE__) ));
			$uri = str_replace('/administrator/', '', $uri);
			//mootools support joomla 1.7 and 2.5
			JHTML::_('behavior.framework', true);
			JHTML::stylesheet($uri.'/assets/css/jadepend.css');
			JHTML::script($uri.'/assets/js/jadepend.js');
			JHTML::script($uri.'/assets/js/subcat.js');
			JHTML::script($uri . '/assets/js/jat3.js?v=2');
			JHTML::script($uri . '/assets/js/ja_tabs.js');
			JHTML::stylesheet($uri . '/assets/css/style.css');
			$doc = JFactory::getDocument();
			$doc->addScriptDeclaration("var plugin_admin_url = '".JURI::root()."/plugins/system/jasocial_feed/admin.php';");
		}
		
	}

	protected function getInput(){
		$this->loadAsset();
		
		$func 	= (string)$this->element['function'] ? (string)$this->element['function'] : '';
		$value 	= $this->value ? $this->value : (string) $this->element['default'];

		if (substr($func, 0, 1) == '@'){
			$func = substr($func, 1);
			if (method_exists($this, $func)) {
				return $this->$func();
			}
		} else {
			$subtype = ( isset( $this->element['subtype'] ) ) ? trim($this->element['subtype']) : '';
			if (method_exists ($this, $subtype)) {
				return $this->$subtype ();
			}
		}

		return null;
	}
	
	/**
     *
     * Get profile config
     * @return Ambigous <string, multitype:>|string
     */
	protected function profile()
	{
		$this->loadAsset();
		$extpath = $this->element['extpath'];

		$jsonData = array();
		$folder_profiles = array();

		/* Get all profiles name folder from folder profiles */
		$profiles = array();
		$jsonData = array();

        // get in module
        jimport('joomla.filesystem.folder');
		jimport('joomla.filesystem.file');
		$path = JPATH_SITE . DIRECTORY_SEPARATOR . $extpath . DIRECTORY_SEPARATOR . 'profiles';
		if (!JFolder::exists($path)){
			return JText::_('PROFILE_FOLDER_NOT_EXIST');
		}
		$files = JFolder::files($path, '.ini');
		if ($files) {
			foreach ($files as $fname) {
				$fname = substr($fname, 0, -4);

				$f = new stdClass();
				$f->id = $fname;
				$f->title = $fname;

				$profiles[$fname] = $f;
				
				$params = new JRegistry(JFile::read($path . DIRECTORY_SEPARATOR . $fname . '.ini'));
				$jsonData[$fname] = $params->toArray();
			}
		}


		$xmlparams = JPATH_SITE . DIRECTORY_SEPARATOR . $extpath . DIRECTORY_SEPARATOR . 'admin/config.xml';
		if (file_exists($xmlparams)) {
			/* For General Form */
			$options = array('control' => 'jaform');
			$paramsForm = JForm::getInstance('jform', $xmlparams, $options);

			$HTML_Profile = JHTML::_('select.genericlist', $profiles, '' . $this->name, 'style="width:150px;"', 'id', 'title', $this->value);
			ob_start();
				require_once dirname(__FILE__) . DIRECTORY_SEPARATOR . 'tpls' . DIRECTORY_SEPARATOR . 'profile.php';
				$content = ob_get_clean();
			
			
			return $content;
		}
	}
	
    /**
     *
     * Get Label of element param
     * @return string label
     */
    function getLabel()
    {
    	$func 	= (string)$this->element['function']?(string)$this->element['function']:'';
    	if (substr($func, 0, 1) == '@' || !isset( $this->label ) || !$this->label){
    		return;
    	} else {
    		return parent::getLabel ();
    	}
    }

	/**
	 * render title: name="@title"
     * @param	string	$name The name of element param
     * @param	string	$value	The value of element
     * @param	object	$node The node of element
     * @param	string	$control_name
     * @return	string  title
     */
	function title()
	{
		$_title = (string) $this->element['label'];
		$_description = $this->description;
		$_url = (isset($this->element['url'])) ? (string) $this->element['url'] : '';
		$class = (isset($this->element['class'])) ? (string) $this->element['class'] : '';
		$level = (isset($this->element['level'])) ? (string) $this->element['level'] : '';
		$group = (isset($this->element['group'])) ? (string) $this->element['group'] : '';
		$group = $group ? "id='params$group-group'" : "";
		if ($_title) {
			$_title = html_entity_decode(JText::_($_title));
		}

		if ($_description) {
			$_description = html_entity_decode(JText::_($_description));
		}
		if ($_url) {
			$_url = " <a target='_blank' href='{$_url}' >[" . html_entity_decode(JText::_("Demo")) . "]</a> ";
		}
		
		$regionID = time()+rand();
		
		$class_name = trim(str_replace(" ", "", strtolower($_title) ));
		
		if($level==1){
			$html = '
			<h4 rel="'.$level.'" class="block-head block-head-'.$class_name.' open '.$class.' " '.$group.' id="'.$regionID.'">
			<span class="block-setting" >'.$_title.$_url.'</span> 
			<span class="icon-help editlinktip hasTip" title="'.htmlentities($_description).'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
			<a class="toggle-btn open" title="'.JText::_('Expand all').'" onclick="JADepend.inst.showseg(\''.$regionID.'\', \'level'.$level.'\'); return false;">'.JText::_('Expand all').'</a>
			<a class="toggle-btn close" title="'.JText::_('Collapse all').'" onclick="JADepend.inst.showseg(\''.$regionID.'\', \'level'.$level.'\'); return false;">'.JText::_('Collapse all').'</a>
			</h4>';
		} else {
			$html = '
			<h4 rel="'.$level.'" class="block-head block-head-'.$class_name.' open '.$class.' " '.$group.' id="'.$regionID.'">
			<span class="block-setting" >'.$_title.$_url.'</span> 
			<span class="icon-help editlinktip hasTip" title="'.htmlentities($_description).'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
			<a class="toggle-btn" title="'.JText::_('Click here to expand or collapse').'" onclick="JADepend.inst.segment(\''.$regionID.'\', \'level'.$level.'\'); return false;">open</a>
			</h4>';
		} 
		//<div class="block-des '.$class.'"  id="desc-'.$regionID.'">'.$_description.'</div>';
		
		return $html;
	}
	
	/**
	 * Subtype - Checkbox: subtype="checkbox"
	 */
	function checkbox(){		
		$k = 0;
		$html = "";
		
		$cols = intval($this->element['cols']);
		if($cols == 0){
			$cols = 1;
		}
		$width = floor(100/$cols);
		$style = ' style="width:'.$width.'%;"';
		if($this->element->children()){
			foreach ($this->element->children() as $option)
			{
				$group = isset($option['group'])?intval($option['group']):0;
				$odesc	= isset($option['description'])?JText::_($option['description']):'';
				$otext	= JText::_(trim((string) $option));

				$tooltip	= addslashes(htmlspecialchars($odesc, ENT_QUOTES, 'UTF-8'));
				$titletip		= addslashes(htmlspecialchars($otext, ENT_QUOTES, 'UTF-8'));

				if($titletip) {
					$titletip = $titletip.'::';
				}
				
				if($group) {
					$html .= "\n\t<div class=\"group_title\"><span class=\"hasTip\" title=\"{$titletip}{$tooltip}\">$otext</span></div>";
				} else {

					
					$oval	= $option['value'];
					$children	= $option['children'];
					$alt = ($children) ? ' alt="'.$children.'"' : '';
					$extra	 = '';

					if (is_array( $this->value ))
					{
						foreach ($value as $val)
						{
							$val2 = is_object( $val ) ? $val->$key : $val;
							if ($oval == $val2)
							{
								$extra .= ' checked="checked"';
								break;
							}
						}
					} else {
						$extra .= ( (string)$oval == (string)$this->value  ? ' checked="checked"' : '' );
					}
					
					$html .= "\n\t<div class=\"group_item\" $style>";	
					$html .= "\n\t<input type=\"checkbox\" name=\"{$this->name}[]\" id=\"{$this->id}{$k}\" value=\"$oval\"$extra $alt />";
					$html .= "\n\t<label id=\"{$this->id}{$k}-label\" class=\"hasTip\" title=\"{$titletip}{$tooltip}\" for=\"{$this->id}{$k}\">$otext</label>";
					$html .= "\n\t</div>";
					
					$k++;
				}
			}
		}

		return $html;
	}
	
	/**
	 * render js to control setting form.
     * @param	string	$name The name of element param
     * @param	string	$value	The value of element
     * @param	object	$node The node of element
     * @param	string	$control_name
     * @return	string  group param
	 */
	function group(){
		preg_match_all('/jform\\[([^\]]*)\\]/', $this->name, $matches);
		$group_name = 'jform';
		
		if(!isset($matches[1]) || empty($matches[1])){
			preg_match_all('/jaform\\[([^\]]*)\\]/', $this->name, $matches);
			$group_name = 'jaform';
		}
		
		if(isset($matches[1]) && !empty($matches[1])):

			?>
		<span class="hideanchor"></span>
		<script type="text/javascript">
		$(window).addEvent('load', function(){
			<?php 
			foreach ($this->element->children() as $option){
				$elms = preg_replace('/\s+/', '', (string)$option[0]);
				?>
				JADepend.inst.add('<?php echo $option['for']; ?>', {
					val: '<?php echo $option['value']; ?>',
					elms: '<?php echo $elms?>',
					group: '<?php echo $group_name . '[' . @$matches[1][0] . ']'; ?>'
				});
				<?php
			}
			?>
		});
		</script>
		<?php
		endif;
	}

	function legend(){
		return '<legend class="t3legend">' . JText::_($this->element['label']) . '<small class="t3legend-desc">' . JText::_($this->element['description']) . '</small> </legend>';
	}
	
	/**
     *
     * Get Template Actived
     * @return string template active name
     */
	function getActiveTemplate(){

		$db = JFactory::getDBO();
		$query = $db->getQuery(true);
		$query->select('template');
		$query->from('#__template_styles');
		$query->where('client_id = 0');
		$query->where('home = 1');

		$db->setQuery($query);
		$tpl = $db->loadResult();

		return $tpl;
	}
	/**
     * render 	function = categories
     * return list categories
     */
    protected function categories()
    {
    	$extension 	= $this->element['extension'];
    	$config 	= array('filter.published' => array(0, 1));
    	$hash 		= md5($extension.'.'.serialize($config));
    
    
    	$config	= (array) $config;
    	$db		= JFactory::getDbo();
    	$query	= $db->getQuery(true);
    
    	$query->select('a.id, a.title, a.level, a.parent_id');
    	$query->from('#__categories AS a');
    	$query->where('a.parent_id > 0');
    
    	// Filter on extension.
    	$query->where('extension = '.$db->quote($extension));
    
    	// Filter on the published state
    	if (isset($config['filter.published'])) {
    		if (is_numeric($config['filter.published'])) {
    			$query->where('a.published = '.(int) $config['filter.published']);
    		} elseif (is_array($config['filter.published'])) {
    			JArrayHelper::toInteger($config['filter.published']);
    			$query->where('a.published IN ('.implode(',', $config['filter.published']).')');
    		}
    	}
    
    	$query->order('a.lft');
    
    	$db->setQuery($query);
    	$items = $db->loadObjectList();
    
    	$control_name = 'jform';
    	$name = $this->element['name'];
    	$flag = false;
    	//Return label
		$HTMLSelect = '<label title="'.JTEXT::_('SELECT_CATEGORIES').'<br />'.JTEXT::_('SELECT_CATEGORIES_DESC').'" class="hasTip" for="' . $control_name . '_params_' . $name . '" id="' . $control_name . '_params_' . $name . '-lbl">'.JTEXT::_('SELECT_CATEGORIES').'</label>';
    	//Return select box
    	$HTMLSelect .= '<select name="' . $control_name . '[params][' . $name . '][]" id="' . $control_name . '_params_' . $name . '" class="inputbox" multiple="multiple" size="10">';
    
    	$HTMLCats = '';
    	$value = $this->value;
    	foreach ($items as $item) {
    		if(isset($item->id) && $item->id > 0){
    			$repeat = ( $item->level - 1 >= 0 ) ? $item->level - 1 : 0;
    			$item->title = str_repeat('- ', $repeat).$item->title;
    			$check = '';
    			if ((is_array($value) && in_array($item->id, $value)) || (!is_array($value) && $item->id == $value)) {
    				$flag = true;
    				$check = 'selected="selected"';
    			}
    
    			$class = '';
    			if ($repeat)
    				$class = 'class="subcat"';
    
    			$HTMLCats .= '<option value="' . $item->id . '" ' . $check . ' ' . $class . '>' . '&nbsp;&nbsp;&nbsp;' . $item->title . '</option>';
    		}
    	}
    
    	$HTMLSelect .= $HTMLCats;
    	$HTMLSelect .= '</select>';
    	return $HTMLSelect;
    }
	function cpnel() {
		include_once(dirname(__FILE__).'/tmpl/cpanel.php');
    }
    
    function profiles() {
    	if(version_compare(JVERSION, '3.0', '>=')) {
	    	$source = $this->element['source'];
				//include(dirname(__FILE__).'/tmpl/profiles30.php');
				$profiles = jaSocialFeedGetProfiles($source);
				$str = '
				<div class="control-group"><div class="control-label"></div><div class="controls">
				<div class="ja-tab-content" style="display: block;">
							<div class="ja-tab-subcontent" id="'.sprintf('ja-%s-content', $source).'">
								<script type="text/javascript">
								/*<![CDATA[*/
								window.addEvent(\'load\', function (e){
									initProfiles(\''.$source.'\');
								});
								/*]]>*/
								</script>
								
								<ul id="list-profiles-'.$source.'" class="ja-profile-titles">
								';
				if ($profiles) {
					$i=0;
					foreach ($profiles as $profile => $profilename) {
						if ($profile != 'default') {
							$i++;
							$str .= '<li id="ja-profile-'.$source.'-'.$profile.'" class="ja-profile '.($i==1?' active':'').'" rel="'.$profile.'">
									<span class="ja-profile-title" rel="'.$profile.'">'.$profilename.'</span>
									<span id="ja-profile-action-'.$source.'-'.$profile.'" class="ja-profile-action" rel="'.$profile.'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
							</li>';
						}
					}
				}

				$str .= '<li class="ja-profile-new" onclick="jaNewProfile(\''.$source.'\', this)" title="'.JText::_('CLICK_HERE_TO_ADD_NEW_PROFILE').'"><span>'.JText::_('New').'</span></li>
								</ul>
								
							</div>
						</div></div></div>';
				
				return $str;
    	}
    	return'';
    }
    
	function profile_button() {
    	
		// Initialize some field attributes.
		$name = $this->element['name'];
		$value = $this->element['value'];
		$source = $this->element['source'];
		$class = $this->element['class'] ? ' class="' . (string) $this->element['class'] . '"' : '';
		$disabled = ((string) $this->element['disabled'] == 'true') ? ' disabled="disabled"' : '';
		
		$str = '';
		$str .= '<div class="control-group"><div class="control-label"></div><div class="controls">';
		$str .= '<div style="padding: 0 0 60px 0; clear: both;">';
		$str .= '<input type="hidden" name="profile_'.$source.'" id="profile_'.$source.'" value="" />';
		$str .= '<input type="button" onclick="jaSaveProfile(\''.$source.'\'); return false;" name="' . $name . '" id="' . $this->id . '"' . ' value="'
			. htmlspecialchars($value, ENT_COMPAT, 'UTF-8') . '"' . $class . $disabled . '/>';
		$str .= '</div>';
		$str .= '</div></div>';
		return $str;
    }
} 