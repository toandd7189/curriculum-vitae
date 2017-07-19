<?php
/**
 * @package     Joomla.Libraries
 * @subpackage  Form
 *
 * @copyright   Copyright (C) 2005 - 2009 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('JPATH_PLATFORM') or die;

/**
 * Form Field class for the Joomla Framework.
 *
 * @since  2.5
 */
class JFormFieldJainstagram extends JFormField
{
	/**
	 * The field type.
	 *
	 * @var		string
	 */
	protected $type = 'Jainstagram';
	protected function getInput()
	{
		$document = JFactory::getDocument();
		// Add styles
		$style = 'label#jform_params_insta_accesstoken-lbl.hasTooltip {
						float: right;
						margin-top: 53px;
					}'; 
		$document->addStyleDeclaration($style);
		$html = '<a href="#" data-clientid="" data-redirecturl="" onclick="return getCodeInsta();" id="instalink">'.JText::_('JA_GET_INSTAGRAM_LINK').'</a><br/><br/>';
		$html .= '<input type="password" id="jform_params_insta_accesstoken" name="'.$this->name.'" value="'.$this->value.'" />';
		return $html;
	}
}
