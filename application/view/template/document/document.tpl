<!DOCTYPE html>
<?php echo $header; ?>
<body>
<!-- Page Loader
        <div class="page-loader">
            <div class="preloader pls-blue">
                <svg class="pl-circular" viewBox="25 25 50 50">
                    <circle class="plc-path" cx="50" cy="50" r="20" />
                </svg>

                <p>Please wait...</p>
            </div>
        </div>
  -->       
        <header id="header" class="clearfix" data-ma-theme="blue">
            <ul class="h-inner">
                <li class="hi-trigger ma-trigger" data-ma-action="sidebar-open" data-ma-target="#sidebar">
                    <div class="line-wrap">
                        <div class="line top"></div>
                        <div class="line center"></div>
                        <div class="line bottom"></div>
                    </div>
                </li>

                <li class="hidden-xs">
                    <a href="./" class="m-l-10">
                        <img src="application/view/image/logo.png" alt="">
                    </a>
                </li>

                <li class="pull-right">
                    <ul class="hi-menu">
                        
                        <?php echo (!empty($notification)?$notification:''); ?>
                        <?php echo (!empty($previously_viewed)?$previously_viewed:''); ?>

                        <li class="dropdown">
                            <a data-toggle="dropdown" href="#"><i class="him-icon zmdi zmdi-more-vert"></i></a>
                            <ul class="dropdown-menu dm-icon pull-right">
                                <li class="hidden-xs">
                                    <a data-ma-action="fullscreen" href="#"><i class="zmdi zmdi-fullscreen"></i> Toggle Fullscreen</a>
                                </li>
                                <!--
                                <li>
                                    <a data-ma-action="clear-localstorage" href="#"><i class="zmdi zmdi-delete"></i> Clear Session Data</a>
                                </li>
                                -->
                                <li>
                                    <a href="<?php echo $logout;?>"><i class="zmdi zmdi-time-restore"></i> Logout</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
            </ul>
        </header>

        <section id="main">
            <!-- Navigation bar -->
            <?php echo $navigation;?>
            <section id="content">
                <div class="container">
                    <!-- Array of content to be displayed  -->
                    <?php foreach ($content as $content_sections) {?>
                    <? echo $content_sections;?>
                    <?php } ?>
                </div>
                <!-- AJAX Loader -->
                <div class="ajax-loader">
                    <div class="cssload-container">
                    <div class="cssload-speeding-wheel"></div>
                    </div>
                </div>
            </section>
        </section>
        
        <footer id="footer">
            <p>IntraApp developed by [<a href="http://ngendesign.net" target="_blank" rel="copyright">N-Gen Design</a>]</p>
        </footer>


<?php echo $footer; ?>
</body>
</html>