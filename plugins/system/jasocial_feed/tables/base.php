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

abstract class jaSocialFeedTableBase extends JObject 
{
	public $table = null;
	public $plgParams = null;
	
	public function __construct($plgParams) {
		$this->plgParams = $plgParams;
	}
	/**
	 * check whether if component is installed or not
	 *
	 */
	abstract public function isAvailable();
	/**
	 * check whether if the article with given alias is existed or not
	 *
	 * @param string $alias
	 */
	abstract public function existsPost($alias);
	
	/**
	 * save article into database
	 *
	 * @param array $post
	 */
	abstract public function store($source, $post, $id = 0);
	
	public function dateToDb($date) {
		if(empty($date)) {
			$date = date('Y-m-d H:i:s');
		} elseif (!preg_match('#[^0-9]#', $date)) { // detect if already is timestamp.
			$date = date('Y-m-d H:i:s', $date);
		} else {
			$date = date('Y-m-d H:i:s', strtotime($date));
			if(date('Y', strtotime($date)) <= 1971) {
				$date = date('Y-m-d H:i:s');
			}
		}

		return $date;
	}
}
