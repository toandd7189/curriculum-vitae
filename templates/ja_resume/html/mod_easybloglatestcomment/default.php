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
defined('_JEXEC') or die('Restricted access');

?>
<div id="eb" class="eb eb-mod mod_easybloglatestcomment<?php echo $params->get( 'moduleclass_sfx' ) ?>">
<?php if ($comments) { ?>
	<?php foreach ($comments as $comment) { ?>
	<div class="eb-mod-item">
		
		<div class="eb-mod-head mod-table cell-top">
			<div class="eb-mod-body">
				<div class="mod-muted mod-small">
					<?php echo $comment->dateString; ?>
				</div>
				<?php $text = strip_tags(EB::comment()->parseBBCode( $comment->comment )); ?>
				<?php echo JString::strlen($text) > $maxCharacter? JString::substr($text, 0, $maxCharacter) . '...' : $text; ?>
			</div>


			<?php if ($params->get('showavatar')) { ?>
				<div class="mod-cell pull-left easybloglatestcomment_avatar">
					
					<a href="#" class="mod-avatar mr-10">
						<img src="<?php echo $comment->author->getAvatar();?>" width="48" height="48" />
					</a>
				</div>
			<?php } ?>

			<div class="mod-cell">
							
				

				<?php if ($params->get('showauthor')) { ?>
					<div>						
						<?php echo $comment->created_by == 0 ? $comment->name : '<a href="' . EBR::_( 'index.php?option=com_easyblog&view=blogger&layout=listings&id=' . $comment->author->id) . '" class="eb-mod-author">' . $comment->author->getName() . '</a>';?></a>
					</div>
				<?php } ?>

				<?php if ($params->get('showtitle')) { ?>
					<strong><a href="<?php echo EBR::_('index.php?option=com_easyblog&view=entry&id=' . $comment->post_id); ?>" class="eb-mod-media-title"> <?php echo $comment->blog_title; ?></a></strong>
				<?php } ?>				

				
			</div>
		</div>
	</div>
	<?php } ?>
<?php } else { ?>
	<div><?php echo JText::_('MOD_EASYBLOGLATESTCOMMENT_NO_POST'); ?></div>
<?php } ?>
</div>
