<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <base href="<?php echo $base; ?>" />
    <title>IntraApp</title>
    <link rel="shortcut icon" href="application/view/image/favicon.gif">
    
    <!-- Vendor CSS -->
    <link href="application/view/vendors/bower_components/animate.css/animate.min.css" rel="stylesheet">
    <link href="application/view/vendors/bower_components/material-design-iconic-font/dist/css/material-design-iconic-font.min.css" rel="stylesheet">
        
    <!-- CSS -->
    <link href="application/view/css/app_1.min.css" rel="stylesheet">
    <link href="application/view/css/app_2.min.css" rel="stylesheet">
    <link href="application/view/css/style.css" rel="stylesheet">
</head>
<body>

<div class="row">
  <div class="col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4">
    <section id="login" class="panel panel">
      <div class="panel-body">
        <figure>
          <img src="application/view/image/login-logo.png" class="img-responsive center-block" alt="INTRAapp" />
        </figure>
        <h1 class="text-center">INTRAapp <small>v<?php echo$version;?></small></h1>
          <div class="text-center">
            <form action="<?php echo $action;?>" data-sandbox-form="login" accept-charset="utf-8" role="form">
              <div class="form-group">
              <div class="fg-line">
              <label for="login" class="sr-only">Username</label>
                <input data-sandbox-validate="true" type="text" class="form-control input-lg" name="username" id="login_value" placeholder="Username" />
              </div>
              </div>
              <div class="form-group ">
                <label for="password" class="sr-only">Password</label>
                <input data-sandbox-validate="true" type="password" class="form-control input-lg" name="user_password" id="password" placeholder="Password"/>
              </div>
              <div class="form-group">
                <button type="submit" name="login" id="submit" class="btn btn-lg btn-block btn-primary">
                  LOG IN
                </button>
                <br />
                <button data-sandbox-user="default" type="submit" name="login" class="btn btn-lg bgm-green">
                  Default User
                </button>
              </div>
            </form>
          </div>
      </div>
    </section>
  </div>
</div>

<!-- AJAX Loader -->
<div class="ajax-loader">
    <div class="cssload-container">
        <div class="cssload-speeding-wheel"></div>
    </div>
</div>

<div class="page-loader">
    <div class="preloader pls-blue">
        <svg class="pl-circular" viewBox="25 25 50 50">
            <circle class="plc-path" cx="50" cy="50" r="20" />
        </svg>
        <p>Please wait...</p>
    </div>
</div>
      
<!-- Javascript Libraries -->
<script src="application/view/vendors/bower_components/jquery/dist/jquery.min.js"></script>
<script src="application/view/vendors/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
       
<script src="application/view/vendors/bootstrap-notify/bootstrap-notify.min.js"></script>


<script type="text/javascript" src="application/view/js/sandbox/html5audio.js"></script>

<script type="text/javascript" src="application/view/js/sandbox/globalajax.js"></script>
<script type="text/javascript" src="application/view/js/sandbox/sandboxmodal.js"></script>
<script type="text/javascript" src="application/view/js/sandbox/sandboxopts.js"></script>
<script type="text/javascript" src="application/view/js/sandbox/formval.js"></script>
<script type="text/javascript" src="application/view/js/sandbox/sandbox.js"></script>

</body>
</html>