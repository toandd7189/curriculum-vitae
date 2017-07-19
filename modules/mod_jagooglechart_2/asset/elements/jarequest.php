<?php
/**
 * ------------------------------------------------------------------------
 * JA Google Chart 2 Module for J25 & J34
 * ------------------------------------------------------------------------
 * Copyright (C) 2004-2011 J.O.O.M Solutions Co., Ltd. All Rights Reserved.
 * @license - GNU/GPL, http://www.gnu.org/licenses/gpl.html
 * Author: J.O.O.M Solutions Co., Ltd
 * Websites: http://www.joomlart.com - http://www.joomlancers.com
 * ------------------------------------------------------------------------
 */

defined('_JEXEC') or die( 'Restricted access' );

jimport('joomla.form.formfield');

class JFormFieldJarequest extends JFormField {
    protected $type = 'Jarequest';    
    protected function getInput() {
		$params = $this->form->getValue('params');
		//remove request param lable
		$doc = JFactory::getDocument();
		$doc->addScriptDeclaration("$(window).addEvent('load', function(){jQuery('#jform_params_jarequest-lbl').parent().remove();});");
		$jinput = JFactory::getApplication()->input;
		$task = $jinput->getString('jatask', '');
		$jarequest = strtolower($jinput->getString('jarequest'));
		//process
        if ($jarequest && $task) {
			
			//load file to excute task
			require_once(dirname(dirname(dirname(__FILE__))).'/admin/jarequest/'.$jarequest.'.php');
            $obLevel = ob_get_level();
			if($obLevel){
				while ($obLevel > 0 ) {
					ob_end_clean();
					$obLevel --;
				}
			}else{
				ob_clean();
			}
            $obj = new $jarequest();
			
			$data = $obj->$task($params);
			echo json_encode($data);
			
            exit;
        }
    }    
    
}