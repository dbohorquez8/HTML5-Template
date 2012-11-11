<!DOCTYPE html>
<html class="no-js" lang="en">
  <head>
    <meta charset="utf-8" />
    <!--[if IE]><![endif]-->
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
    <title><?php
    	global $page, $paged;
    	wp_title( '|', true, 'right' );
    	bloginfo( 'name' );
    	if ( $paged >= 2 || $page >= 2 )
    		echo ' | ' . sprintf( __( 'Page %s', 'twentyeleven' ), max( $paged, $page ) );
    	?></title>
    <link href="<?php bloginfo( 'template_url' ); ?>/images/favicon.png" rel="shortcut icon" />
    <link href="<?php bloginfo( 'template_url' ); ?>/stylesheets/global.css" rel="stylesheet" />
    <script src="<?php bloginfo( 'template_url' ); ?>/javascripts/modernizr.js"></script>
    <?php wp_head(); ?>
  </head>
  
  <!--[if lte IE 7 ]> <body class="ie8 ie7"> <![endif]-->
  <!--[if IE 8 ]> <body class="ie8"> <![endif]-->
  <!--[if (gte IE 9)|!(IE)]><!--> <body> <!--<![endif]-->
    <div id="wrapper">
      <header id="header">
        <h1 id="logo"><a href="<?php echo home_url( '/' ); ?>"><img src="<?php bloginfo( 'template_url' ); ?>/images/logo.png" alt="<?php bloginfo( 'name' ); ?>" /></a></h1>
        <nav>
          <?php wp_nav_menu(array('menu' => 'main')); ?>
        </nav>
      </header>

      <div id="content">