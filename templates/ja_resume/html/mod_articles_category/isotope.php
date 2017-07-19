<?php
/**
 * ------------------------------------------------------------------------
 * JA Resume Template
 * ------------------------------------------------------------------------
 * Copyright (C) 2004-2011 J.O.O.M Solutions Co., Ltd. All Rights Reserved.
 * @license - Copyrighted Commercial Software
 * Author: J.O.O.M Solutions Co., Ltd
 * Websites:  http://www.joomlart.com -  http://www.joomlancers.com
 * This file may not be redistributed in whole or significant part.
 * ------------------------------------------------------------------------
*/

defined('_JEXEC') or die;

?>
<div class="ja-masonry-wrap isotope-layout">
	<div class="category-module<?php echo $moduleclass_sfx; ?> isotope grid clearfix grid-xs-1 grid-smx-2 grid-sm-3 grid-md-4 grid-lg-4">
		<div class="item grid-sizer"></div>
			<?php foreach ($list as $item) : ?>
				<?php $extrafields = new JRegistry($item->attribs); ?>
				<div class="item isotope-item item-<?php echo $extrafields->get('selectitem') ? $extrafields->get('selectitem') : '1'; ?> item-bg-<?php echo $extrafields->get('background') ? $extrafields->get('background') : 'default'; ?>"><div class="item-inner">
					<div class="article-img">
						<a href="<?php echo $item->link; ?>" title="<?php echo $item->title; ?>" >
						<?php  
						//Get images 
						$images = "";
						if (isset($item->images)) {
							$images = json_decode($item->images);
						}
						$imgexists = (isset($images->image_intro) and !empty($images->image_intro)) || (isset($images->image_fulltext) and !empty($images->image_fulltext));
						
						if ($imgexists) {			
						$images->image_intro = $images->image_intro?$images->image_intro:$images->image_fulltext;
						$images->image_intro_caption = $images->image_intro_caption?$images->image_intro_caption:$images->image_fulltext_caption;
						$images->image_intro_alt = $images->image_intro_alt?$images->image_intro_alt:$images->image_fulltext_alt;
						?>

							<img
								<?php if ($images->image_intro_caption):ja-animate
									echo 'class="caption"'.' title="' .htmlspecialchars($images->image_intro_caption) .'"';
								endif; ?>
								src="<?php echo htmlspecialchars($images->image_intro); ?>" alt="<?php echo htmlspecialchars($images->image_intro_alt); ?>"/>
						<?php }else{ ?>
							<img src="<?php echo JURI::root(true);?>/images/joomlart/demo/default.jpg" alt="Default Image"/>
						<?php } ?>
						</a>
					</div>

					<?php if ($params->get('link_titles') == 1) : ?>
						<a class="mod-articles-category-title <?php echo $item->active; ?>" href="<?php echo $item->link; ?>">
							<?php if($extrafields->get('badge')) {
								echo '<span class="badge '.$extrafields->get('badge').'">'.$extrafields->get('badge').'</span>';
							} ?>
							<?php echo $item->title; ?>
						</a>
					<?php else : ?>
						<?php echo $item->title; ?>
					<?php endif; ?>
				
					<?php if ($params->get('show_author')) : ?>
						<span class="mod-articles-category-writtenby">
							<?php echo $item->displayAuthorName; ?>
						</span>
					<?php endif;?>
		
					<?php if ($item->displayCategoryTitle) : ?>
						<span class="mod-articles-category-category">
							<?php echo $item->displayCategoryTitle; ?>
						</span>
					<?php endif; ?>
		
					<?php if ($item->displayDate) : ?>
						<span class="mod-articles-category-date">
							<?php echo $item->displayDate; ?>
						</span>
					<?php endif; ?>
		
					<?php if ($params->get('show_introtext')) : ?>
						<p class="mod-articles-category-introtext">
							<?php echo $item->displayIntrotext; ?>
						</p>
					<?php endif; ?>

					<?php if ($params->get('show_hits') || $params->get('show_readmore')) : ?>
					<div class="article-footer">
						<?php if ($params->get('show_hits')) : ?>
							<span class="mod-articles-category-hits">
								<?php echo $item->displayHits; ?>
							</span>
						<?php endif; ?>

						<?php if ($params->get('show_readmore')) : ?>
							<p class="mod-articles-category-readmore">
								<a class="btn btn-primary <?php echo $item->active; ?>" href="<?php echo $item->link; ?>">
									<?php if ($item->params->get('access-view') == false) : ?>
										<?php echo JText::_('MOD_ARTICLES_CATEGORY_REGISTER_TO_READ_MORE'); ?>
									<?php elseif ($readmore = $item->alternative_readmore) : ?>
										<?php echo $readmore; ?>
										<?php echo JHtml::_('string.truncate', $item->title, $params->get('readmore_limit')); ?>
									<?php elseif ($params->get('show_readmore_title', 0) == 0) : ?>
										<?php echo JText::sprintf('MOD_ARTICLES_CATEGORY_READ_MORE_TITLE'); ?>
									<?php else : ?>
										<?php echo JText::_('MOD_ARTICLES_CATEGORY_READ_MORE'); ?>
										<?php echo JHtml::_('string.truncate', $item->title, $params->get('readmore_limit')); ?>
									<?php endif; ?>
								</a>
							</p>
						<?php endif; ?>
					</div>
					<?php endif; ?>
				</div></div>
			<?php endforeach; ?>
	</div>
</div>