<div class="comments">
  <?php
    if ( ! comments_open() ) :
  ?>
  	<p class="nocomments">Comments are closed</p>
  <?php endif; // end ! comments_open() ?>

  <?php if ( have_comments() ) : ?>
    <h3><?php
  	printf( _n( 'One Comment', '%1$s Comments', get_comments_number(), 'twentyeleven' ),
  	number_format_i18n( get_comments_number() ), '<em>' . get_the_title() . '</em>' );
  	?></h3>
  
  <?php wp_list_comments( array( 'callback' => 'twentyeleven_comment' ) ); ?>
  
  <?php endif; // end have_comments() ?>

  <?php comment_form(); ?>
</div>