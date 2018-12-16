<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <base href="<?php echo $base; ?>" />
    <title><?php echo $title;?></title>
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
</head>
<body>
<div class="container invoice m-t-25">
<div class="card">
	<div class="card-header ch-alt text-center">
		<img class="i-logo" src="application/view/image/logo.gif" alt="">
	</div>

	<div class="card-body card-padding">
		<div class="row m-b-10">
			<div class="col-xs-6">
				<div class="text-right">
					<p class="c-gray m-b-5">
						Profile Information
					</p>
					<h4 class="m-t-5 m-b-5"><?php echo $patient_info['fullname'];?></h4>
					<span class="text-muted">
					    <?php if(!empty($patient_info['address'])){?>
						<address>
							<?php echo $patient_info['address'];?><br />
							<?php echo $patient_info['city'].', '.$patient_info['state'].' '.$patient_info['zipcode'];?>
						</address>
						<?php } ?>
						<?php echo $patient_info['phone'];?><br />
						<?php echo $patient_info['email'];?>
					</span>
				</div>
			</div>

			<div class="col-xs-6">
				<div class="i-to">
					<p class="c-gray m-b-5">
						Employer Information
					</p>
                    <?php if(!empty($employer_info['name'])){?>
					<h4 class="m-t-5 m-b-5"><?php echo $employer_info['name'];?></h4>
					<span class="text-muted">
						<address>
							<?php echo $employer_info['address'];?><br />
                            <?php echo $employer_info['city'].', '.$employer_info['state'].' '.$employer_info['zipcode'];?>
						</address> 
						<?php echo $employer_info['phone'];?><br />
					</span>
					<?php }else{ ?>
					<span class="text-muted">
					    <h4>No Employer specified</h4>
					</span>
					<?php } ?>
				</div>
			</div>
			
		</div>
        <div class="row text-center">
            <div class="col-md-4 col-xs-4">
                <h4><strong>Spoke to:</strong> <?php echo (!empty($patient_gen_info['spoke_to'])?$patient_gen_info['spoke_to']:'N/A');?></h4>
            </div>
            <div class="col-md-4 col-xs-4">
                <h4><strong>Verified By:</strong> <?php echo (!empty($patient_gen_info['verified_by'])?$patient_gen_info['verified_by']:'N/A');?></h4>
            </div>
            <div class="col-md-4 col-xs-4">
                <h4><strong>Ref. Number:</strong> <?php echo (!empty($patient_gen_info['ref_number'])?$patient_gen_info['ref_number']:'N/A');?></h4>
            </div>
        </div>
		<div class="clearfix"></div>

		<div class="row m-t-25 p-0 m-b-25">
			<div class="col-xs-3">
				<div class="bgm-amber brd-2 p-15">
					<div class="c-white m-b-5">
						Profile ID
					</div>
					<h2 class="m-0 c-white f-300"><?php echo $patient_info['patient_id'];?></h2>
				</div>
			</div>

			<div class="col-xs-3">
				<div class="bgm-blue brd-2 p-15">
					<div class="c-white m-b-5">
						Policy Eff Date:
					</div>
					<h2 class="m-0 c-white f-300"><?php echo (!empty($policy_holder_info['policy_eff_date'])?$policy_holder_info['policy_eff_date']:'None');?></h2>
				</div>
			</div>

			<div class="col-xs-3">
				<div class="bgm-green brd-2 p-15">
					<div class="c-white m-b-5">
						Group ID
					</div>
					<h2 class="m-0 c-white f-300"><?php echo (!empty($employer_info['group_id'])?$employer_info['group_id']:'None');?></h2>
				</div>
			</div>

			<div class="col-xs-3">
				<div class="bgm-red brd-2 p-15">
					<div class="c-white m-b-5">
						Payor ID
					</div>
					<h2 class="m-0 c-white f-300"><?php echo (!empty($insurance_info['payor_id'])?$insurance_info['payor_id']:'None');?></h2>
				</div>
			</div>
		</div>

		<div class="clearfix"></div>
<?php if(isset($insurance_info['insurance_id'])){?>
<div class="row m-b-15">
    <div class="col-md-12">
        <h2 class="text-center"><u>Insurance Information</u></h2>
    </div>
    <div class="<?php echo (!empty($sharded_policy_holders)?'col-md-6 col-xs-6':'col-md-6 col-md-offset-3');?>" id="no-more-tables">
        <h3 class="text-center">Profile Insurance</h3>
        <table class="col-md-12 col-xs-12 table-bordered table-striped table-condensed cf">
            <tbody>
                <tr>
                    <td>Insurance ID</td>
                    <td><?php echo $insurance_info['insurance_id'];?></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><?php echo $insurance_info['name'];?></td>
                </tr>
                <tr>
                    <td>Adress</td>
                    <td><?php echo $insurance_info['address'].' '.$insurance_info['city'].', '.$insurance_info['state'].' '.$insurance_info['zipcode'];?></td>
                </tr>
                <tr>
                    <td>Payor ID #</td>
                    <td><?php echo $insurance_info['payor_id'];?></td>
                </tr>
                <tr>
                    <td>Ins Co ID #</td>
                    <td><?php echo $insurance_info['ins_id'];?></td>
                </tr>
            </tbody>
        </table>
    </div>
    <?php if(!empty($sharded_policy_holders)){?>
    <div class="col-md-6 col-xs-6">
        <h3 class="text-center">Shared policy profiles</h3>
        <?php for ($i=0; $i <count($sharded_policy_holders) ; $i++) { ?>
        <table class="col-md-12 col-xs-12 table-bordered table-striped table-condensed cf m-b-5">
            <tbody>
                <tr>
                    <td>Name</td>
                    <td><?php echo $sharded_policy_holders[$i]['first_name'].' '.$sharded_policy_holders[$i]['last_name'];?></td>
                </tr>
                <tr>
                    <td>DOB</td>
                    <td><?php echo $sharded_policy_holders[$i]['dob'];?></td>
                </tr>
                <tr>
                    <td>SSN</td>
                    <td><?php echo $sharded_policy_holders[$i]['ssn'];?></td>
                </tr>
                <tr>
                    <td>Phone</td>
                    <td><?php echo $sharded_policy_holders[$i]['phone'];?></td>
                </tr>
                <tr class="hidden-xs">
                    <td>Profile</td>
                    <td><a href="<?php echo $shared_profile_link.$sharded_policy_holders[$i]['patient_id'];?>">Click to view profile</a></td>
                </tr>
            </tbody>
        </table>
        <?php } ?>
    </div>
    <?php } ?>
</div>
<?php }else{?>
<div class="m-b-25">
    <h2 class="text-center"><u>No associated insurance</u></h2>
</div>
<?php }?>
<div class="clearfix"></div>
<?php if(!empty($profile_note)){ ?>
<div class="alert alert-info hidden-xs" role="alert">
   <span class="zmdi zmdi-info-outline large"></span> Note section is editable.
</div>
<!-- Note section -->
<div contenteditable>
<h3 class="c-green f-400">Profile Notes</h3>
<h4><span class="c-blue">[<?php echo $profile_note['date'];?>]</span> <strong><?php echo $profile_note['title'];?></strong></h4>
<p><?php echo $profile_note['note'];?></p>
</div>
<?php } ?>
</div>

<footer class="m-t-15 p-20">
    <ul class="list-inline text-center list-unstyled">
        <li class="m-l-5 m-r-5"><small>INTRAapp</small></li>
    </ul>
</footer>
</div>
</div>
<!-- Print page button -->
<button class="btn btn-float bgm-red m-btn waves-effect waves-circle waves-float" data-action="print" onclick="window.print()">
    <i class="zmdi zmdi-print"></i>
</button>
<!-- Javascript Libraries -->
<script src="application/view/vendors/bower_components/jquery/dist/jquery.min.js"></script>
<script src="application/view/vendors/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

<script src="application/view/vendors/bower_components/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="application/view/vendors/bower_components/Waves/dist/waves.min.js"></script>
<script src="application/view/vendors/bootstrap-notify/bootstrap-notify.min.js"></script>
<script src="application/view/vendors/bower_components/sweetalert/dist/sweetalert.min.js"></script>
<script src="application/view/vendors/bower_components/typeahead.js/dist/typeahead.bundle.min.js"></script>
<script src="application/view/vendors/input-mask/input-mask.min.js"></script>

<script src="application/view/vendors/bower_components/bootstrap-select/dist/js/bootstrap-select.js"></script>
<script src="application/view/vendors/bootbox/bootbox.js"></script>

<script src="application/view/js/app.min.js"></script>

<script type="text/javascript" src="application/view/js/sandbox/html5audio.js"></script>

<script type="text/javascript" src="application/view/js/sandbox/globalajax.js"></script>
<script type="text/javascript" src="application/view/js/sandbox/sandboxmodal.js"></script>
<script type="text/javascript" src="application/view/js/sandbox/sandboxopts.js"></script>
<script type="text/javascript" src="application/view/js/sandbox/formval.js"></script>
<script type="text/javascript" src="application/view/js/sandbox/sandbox.js"></script>
</body>
</html>