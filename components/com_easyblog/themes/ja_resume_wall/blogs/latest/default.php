<?php
/**
* @package		EasyBlog
* @copyright	Copyright (C) 2010 - 2015 Stack Ideas Sdn Bhd. All rights reserved.
* @license		GNU/GPL, see LICENSE.php
* EasyBlog is free software. This version may have been modified pursuant
* to the GNU General Public License, and as distributed it includes or
* is derivative of works licensed under the GNU General Public License or
* other free or open source software licenses.
* See COPYRIGHT.php for copyright notices and details.
*/
defined('_JEXEC') or die('Unauthorized Access');
?>
<?php echo $this->output('site/blogs/latest/featured'); ?>
<?php
$model = EB::model('Blog');
$pagination2	= $model->getPagination();
?>
<div id="item-container" class="blog">
	<div itemscope itemtype="http://schema.org/Blog" class="eb-posts eb-responsive" data-blog-posts>
		<div class="ja-masonry-wrap isotope-layout" >
			<div class="isotope grid clearfix grid-xs-1 grid-smx-2 grid-sm-3 grid-md-4 grid-lg-4" id="item-container">
				<div class="item grid-sizer"></div>

				<?php if ($posts) { ?>
					<?php foreach ($posts as $post) { ?>
						<?php if (!EB::isSiteAdmin() && $this->config->get('main_password_protect') && !empty($post->blogpassword) && !$post->verifyPassword()) { ?>
							<div class="item items-row isotope-item item-1 item-bg-default">
							<?php echo $this->output('site/blogs/latest/default.protected', array('post' => $post)); ?>
							</div>
						<?php } else { ?>
							<div class="item items-row isotope-item item-1 item-bg-default">
							<?php echo $this->output('site/blogs/latest/default.main', array('post' => $post)); ?>
							</div>
						<?php } ?>
					<?php } ?>
				<?php } else { ?>
					<div class="eb-empty item items-row isotope-item item-1 item-bg-default">
						<i class="fa fa-paper-plane-o"></i>
						<?php echo JText::_('COM_EASYBLOG_NO_BLOG_ENTRY');?>
					</div>
				<?php } ?>
			</div>
		</div>
	</div>
	<div class="pagination">
		<?php if($pagination) {?>
			<?php echo EB::renderModule('easyblog-before-pagination'); ?>

			<?php echo $pagination;?>

			<?php echo EB::renderModule('easyblog-after-pagination'); ?>
		<?php } ?>
	</div>
	<?php
		$pagination_type = $this->params->get('pagination_type');
		if ($pagination && $pagination_type > 0) {
			JHtml::_('behavior.framework');
			JHtml::_('jquery.framework');
			JHtml::script('templates/ja_resume/js/infinitive-paging.js');
			JHtml::script('templates/ja_resume/js/jquery.infinitescroll.js');
			$mode = $this->params->def('pagination_type', 2) == 1 ? 'manual' : 'auto';

			if($pagination2->pagesTotal > 1 ) : ?>
				<div id="infinity-next" class="btn btn-primary hide" data-limit="<?php echo $pagination2->limit; ?>" data-url="<?php echo JUri::current(); ?>" data-mode="<?php echo $mode ?>" data-pages="<?php echo $pagination2->pagesTotal ?>" data-finishedmsg="<?php echo JText::_('TPL_INFINITY_NO_MORE_ARTICLE');?>"><?php echo JText::_('TPL_INFINITY_MORE_ARTICLE')?></div>
			<?php else:  ?>
				<div id="infinity-next" class="btn btn-primary disabled" data-pages="1"><?php echo JText::_('TPL_INFINITY_NO_MORE_ARTICLE');?></div>    
			<?php endif;
		}
	?>
</div>