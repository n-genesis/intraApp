<section data-alert="system">
<?php if(isset($system_notice)){ echo $system_notice; } ?>
</section>
<?php if(!empty($patient_info) && empty($page_notice)){ ?>
<div class="block-header">
	<h2><?php echo $patient_info['fullname']; ?></h2>
<ul class="actions">
    <?php if(isset($profile_status)){ ?>
    <li class="dropdown" title="Change status"><a href="#" data-toggle="dropdown"> <i class="zmdi zmdi-notifications"></i> </a>
        <ul class="dropdown-menu dropdown-menu-right" data-sandbox-change="status" data-sandbox-controller="<?php echo $profile_status; ?>" data-sandbox-id="<?php echo $patient_info['patient_id'];?>">
            <li class="text-center c-blue">Change status</li>
            <li role="separator" class="divider"></li>
            <li><a href="#" data-sandbox-status="0">Active</a></li>
            <li><a href="#" data-sandbox-status="2">Pending</a></li>
            <li><a href="#" data-sandbox-status="3">Suspended</a></li>
        </ul>
    </li>
    <?php } ?>
    <li class="dropdown"><a href="#" data-toggle="dropdown"> <i class="zmdi zmdi-more-vert"></i> </a>
        <ul class="dropdown-menu dropdown-menu-right">
            <li><a href="#" onclick="document.location.reload(true); return false;"><span class="zmdi zmdi-refresh"></span> Refresh</a></li>
            <li><a href="<?php echo $print_action;?>" target="_blank"><span class="zmdi zmdi-local-printshop"></span> Print Profile</a></li>
            <?php if(isset($profile_activity)){ ?>
                <li><a href="<?php echo $profile_activity;?>"><span class="zmdi zmdi-chart"></span> Profile Activity</a></li>
            <?php } ?>
        </ul>
    </li>
</ul>
</div>
<section class="row profile-nav">
<div role="tabpanel" class="col-md-12">
<div class="card">
    <div class="card-body">
        <ul class="tab-nav text-center" role="tablist" data-tab-color="cyan">
            <li class="active"><a href="<?php echo $link['general'];?>">General</a></li>
            <li><a href="<?php echo $link['insurance_policy'];?>">Insurance/Policy</a></li>
            <li><a href="<?php echo $link['employer'];?>">Employer</a></li>
            <li><a href="<?php echo $link['records'];?>">Records</a></li>
            <li><a href="<?php echo $link['notes_action'];?>">Notes/Actions</a></li>
        </ul>
	</div>
</div>    
</div>
</section>
<div class="card" id="profile-main">
	<div class="pm-overview c-overflow">

		<div class="pmo-pic">
			<div class="p-relative">
				<img class="img-responsive" src="files/patient-profile/<?php echo $patient_info['image']; ?>" alt="">
			</div>
			<div class="dropdown pmop-edit">
            <button type="submit" class="btn bgm-green btn-float z-depth-1" form="patient-contact-form">
            <i class="zmdi zmdi-floppy"></i>
            </button>
            </div>
			<div class="pmo-stat">
				<h2 class="m-0 c-white">#<?php echo $patient_info['patient_id']; ?></h2>
				<p><?php echo $patient_info['fullname']; ?></p>
			</div>
		</div>

		<div class="pmo-block pmo-contact hidden-xs">
			<h2>Contact</h2>
			<form id="patient-contact-form" action="<?php echo $patient_contact_action;?>" data-sandbox-update="patient" accept-charset="utf-8" role="form">
			    <div class="row">
			        <div class="col-md-12 p-l-0">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="zmdi zmdi-phone"></i></span>
                            <div class="fg-line">
                                <input type="text" class="form-control input-mask" data-sandbox-validate="true" data-mask="000-000-0000" placeholder="000-000-0000" name="phone" value="<?php echo $patient_info['phone'];?>">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 p-l-0">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="zmdi zmdi-email"></i></span>
                            <div class="fg-line">
                                <input class="form-control" data-sandbox-validate="true" placeholder="Email" type="text" name="email" value="<?php echo $patient_info['email'];?>">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 p-l-0">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="zmdi zmdi-pin"></i></span>
                            <div class="fg-line">
                                <textarea class="form-control" data-sandbox-validate="true" rows="4" placeholder="Address" name="address"><?php echo $patient_info['address']; ?></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 p-l-0">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="zmdi zmdi-pin"></i></span>
                            <div class="fg-line">
                                <input class="form-control" data-sandbox-validate="true" placeholder="City" type="text" name="city" value="<?php echo $patient_info['city'];?>">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 p-l-0">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="zmdi zmdi-pin"></i></span>
                            <div class="fg-line">
                                <input class="form-control" data-sandbox-validate="true" placeholder="State" type="text" maxlength="2" name="state" value="<?php echo $patient_info['state'];?>">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 p-l-0">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="zmdi zmdi-pin"></i></span>
                            <div class="fg-line">
                                <input class="form-control" data-sandbox-validate="true" placeholder="Zipcode" type="text" maxlength="5" name="zipcode" value="<?php echo $patient_info['zipcode'];?>">
                            </div>
                        </div>
                    </div>
			    </div>
			    <input type="hidden" name="patient_id" value="<?php echo $patient_info['patient_id'];?>" />
			</form>
		</div>
	</div>

	<div class="pm-body clearfix">

		<!--Profile note -->
		<?php if(!empty($patient_info['patient_note'])){ echo $patient_info['patient_note']; }?>

		<div class="pmb-block">
		    <div class="pmbb-header">
                <h2><i class="zmdi zmdi-account m-r-10"></i> Basic Information</h2>
                <ul class="actions">
                   <li><button class="btn bgm-blue btn-icon waves-effect waves-circle waves-float" form="patient-basic-info-form"><i class="zmdi zmdi-floppy"></i></button></li>
                </ul>
            </div>
		    <form id="patient-basic-info-form" action="<?php echo $patient_basic_info_action;?>" data-sandbox-update="patient" accept-charset="utf-8" role="form">
		        <div class="row">
		            <div class="col-md-6">
                        <div class="form-group">
                            <label>First Name:</label>
                            <div class="fg-line">
                                <input class="form-control input-lg" data-sandbox-validate="true" data-sandbox="value-update" placeholder="First Name" type="text" name="first_name" value="<?php echo $patient_info['first_name'];?>">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Last Name:</label>
                            <div class="fg-line">
                                <input class="form-control input-lg" data-sandbox-validate="true" placeholder="Last Name" type="text" name="last_name" value="<?php echo $patient_info['last_name'];?>">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>DOB:</label>
                            <div class="fg-line">
                                <input class="form-control input-lg input-mask" data-sandbox-validate="true" data-mask="00/00/0000" placeholder="00/00/0000" type="text" name="dob" value="<?php echo $patient_info['dob'];?>">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>SSN:</label>
                            <div class="fg-line">
                                <input class="form-control input-lg input-mask" data-sandbox-validate="true" data-mask="000000000" placeholder="000000000" placeholder="SSN" type="text" name="ssn" value="<?php echo $patient_info['ssn'];?>">
                            </div>
                        </div>
                    </div>
		        </div>
		        <input type="hidden" name="patient_id" value="<?php echo $patient_info['patient_id'];?>" />
		    </form>

		</div>
		<div class="pmb-block">
			<div class="pmbb-header">
				<h2><i class="zmdi zmdi-info m-r-10"></i> Patient Information</h2>
				<ul class="actions">
                   <li><button class="btn bgm-blue btn-icon waves-effect waves-circle waves-float" form="patient-info-form"><i class="zmdi zmdi-floppy"></i></button></li>
                </ul>
			</div>
			<form id="patient-info-form" action="<?php echo $patient_info_action;?>" data-sandbox-update="patient" accept-charset="utf-8" role="form">
			<div class="row">
			    <div class="col-md-4">
                    <div class="form-group">
                        <label>Spoke to:</label>
                        <div class="fg-line">
                            <input class="form-control input-lg" data-sandbox-validate="true" placeholder="Spoke to" type="text" name="spoke_to" value="<?php echo $patient_info['spoke_to'];?>">
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Verified By:</label>
                        <div class="fg-line">
                            <input class="form-control input-lg" data-sandbox-validate="true" placeholder="Verified By" type="text" name="verified_by" value="<?php echo $patient_info['verified_by'];?>">
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Ref. Number:</label>
                        <div class="fg-line">
                            <input class="form-control input-lg" data-sandbox-validate="true" placeholder="Ref. Number" type="text" name="ref_number" value="<?php echo $patient_info['ref_number'];?>">
                        </div>
                    </div>
                </div>   
			</div>
			<input type="hidden" name="patient_id" value="<?php echo $patient_info['patient_id'];?>" />
			</form>
		</div>
	</div>
</div>
<?php } else{ ?>
<section id="patient-not-found">
    <h1><?php echo $page_notice;?></h1>
    <img src="application/view/image/not-found.png" class="center-block" />
</section>
<?php } ?>