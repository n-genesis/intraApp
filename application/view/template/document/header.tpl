<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <base href="<?php echo $base; ?>" />
    <title><?php echo $title; ?></title>
    <link rel="shortcut icon" href="application/view/image/favicon.gif">
    <!-- Vendor CSS -->
    <link href="application/view/vendors/bower_components/animate.css/animate.min.css" rel="stylesheet">
    <link href="application/view/vendors/bower_components/sweetalert/dist/sweetalert.css" rel="stylesheet">
    <link href="application/view/vendors/bower_components/material-design-iconic-font/dist/css/material-design-iconic-font.min.css" rel="stylesheet">
    <link href="application/view/vendors/bower_components/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.min.css" rel="stylesheet">        
    <link href="application/view/vendors/bower_components/bootstrap-select/dist/css/bootstrap-select.css" rel="stylesheet">
    <!-- CSS -->
    <link href="application/view/css/app_1.min.css" rel="stylesheet">
    <link href="application/view/css/app_2.min.css" rel="stylesheet">
    <link href="application/view/css/style.css" rel="stylesheet">
    <!-- add links -->
    <?php foreach ($styles as $style) { ?>
    <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
    <?php } ?>
</head>