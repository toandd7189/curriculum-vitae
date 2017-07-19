<?php
/**
 * @package     Joomla.Libraries
 * @subpackage  Form
 *
 * @copyright   Copyright (C) 2005 - 2009 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('JPATH_PLATFORM') or die;
JFormHelper::loadFieldClass('moduleposition');
/**
 * Form Field class for the Joomla Framework.
 *
 * @since  2.5
 */
class JFormFieldTplhelper extends JFormField
{
	/**
	 * The field type.
	 *
	 * @var		string
	 */
	protected $type = 'TplHelper';
	protected function getInput()
	{
		return '<input type="hidden" id="tplhelper" name="' . $this->name . '" value="' . htmlspecialchars($this->value) . '" />';
	}

	/**
	 * Method to get the field label markup for a spacer.
	 * Use the label text or name from the XML element as the spacer or
	 * Use a hr="true" to automatically generate plain hr markup
	 *
	 * @return  string  The field label markup.
	 *
	 * @since   11.1
	 */
	protected function getLabel()
	{
		return '';
	}

	public function setup(SimpleXMLElement $element, $value, $group = null)
	{
		// Define some CONSTANT LANGUAGE to use in script file
		JText::script('JA_GOOGLECHART_GUIDE');
		JText::script('JA_GOOGLECHART_GUIDE_CONTENT');
		JText::script('JA_GOOGLECHART_GUIDE_TITLE');
		
		// get template name
		$path = str_replace (JPATH_ROOT, '', __DIR__);
		$path = str_replace ('\\', '/', substr($path, 1));

		$doc = JFactory::getDocument();
		$doc->addStyleSheet (JUri::root() . $path . '/assets/css/style.css');
		$doc->addStyleSheet ('https://fonts.googleapis.com/css?family=Roboto:400,500');
		$script = 'var site_root_url = "' . JUri::root(true) . '";';
		$doc->addScriptDeclaration($script);
		
		//Load the AJAX API
		$doc->addScript('https://www.google.com/jsapi');
		$doc->addScript('https://www.gstatic.com/charts/loader.js');
		$doc->addScriptDeclaration('google.load("visualization", "1", {packages: ["corechart"]});');
		$doc->addScriptDeclaration('google.load("visualization", "1", {packages: ["geochart"]});');
		$doc->addScript (JUri::root() . $path . '/assets/js/script.js');
		//$doc->addScript ('http://livejs.com/live.js#css');
		return parent::setup($element, $value, $group);
	}

}
