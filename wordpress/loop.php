<?php if ( ! have_posts() ) : ?>
	<div id="post-0" class="post error404">
	  <header>
		  <h2>Page Not Found</h2>
		</header>
		<div class="content">
			<p>Apologies, but no results were found for the requested archive. Perhaps searching will help find a related post.</p>
			<?php get_search_form(); ?>
		</div>
	</div><!-- #post-0 -->
<?php endif; ?>

<?php while ( have_posts() ) : the_post(); ?>

  <div id="post-<?php the_ID(); ?>" class="post">
    <header>
      <h2><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h2>
      <div class="date">
        <?php $date_day = get_the_date('d'); ?>
        <?php $date_month = ucfirst(get_the_date('M')); ?>
        <span><?php echo $date_day; ?></span>
        <span><?php echo $date_month; ?></span>
      </div>
      <div class="meta">
        <span>Posted by <?php the_author(); ?></span>
        <span><?php comments_popup_link( __( 'Leave a comment', 'twentyeleven' ), __( '1 Comment', 'twentyeleven' ), __( '% Comments', 'twentyeleven' ) ); ?></span>
      </div>
    </header>
    
    <ul class="share">
      <li><iframe src="http://www.facebook.com/plugins/like.php?href=<?php the_permalink(); ?>&amp;send=false&amp;layout=box_count&amp;width=50&amp;show_faces=false&amp;action=like&amp;colorscheme=light&amp;font=arial&amp;height=90" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:80px; height:90px;" allowTransparency="true"></iframe></li>
      <li><a href="http://twitter.com/share" class="twitter-share-button" data-count="vertical" data-url="<?php the_permalink(); ?>">Tweet</a><script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script></li>
      <li><g:plusone size="tall" href="<?php the_permalink(); ?>"></g:plusone></li>
    </ul>

    <div class="content">
      <?php if ( is_archive() || is_search() ) : // Only display excerpts for archives and search. ?>
    		<?php the_excerpt(); ?>
    	<?php else : ?>
    		<?php the_content( __( 'Continue reading <span class="more">&rarr;</span>', 'twentyeleven' ) ); ?>
    	<?php endif; ?>
    </div>
    <footer>
    <?php
			$tags_list = get_the_tag_list( '', '' );
			if ( $tags_list ):
		?>
		  <span>Tags:</span>
			<ul class="tags">
				<?php printf( __( '<li>%2$s</li>', 'twentyeleven' ), 'entry-utility-prep entry-utility-prep-tag-links', $tags_list ); ?>
			</ul>
		<?php endif; ?>
	  </footer>
  </div>

	<?php comments_template( '', true ); ?>

<?php endwhile; // End the loop. Whew. ?>

<?php if (  $wp_query->max_num_pages > 1 ) : ?>
				<ul class="navigation">
					<li><?php next_posts_link('&larr; Older posts'); ?></li>
					<li><?php previous_posts_link('Newer posts &rarr;'); ?></li>
				</ul><!-- #nav-below -->
<?php endif; ?>