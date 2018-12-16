<?php if(isset($system_notice)){ echo $system_notice; } ?>
<?php if(!empty($patient_info) && empty($page_notice)){ ?>
<div class="block-header">
	<h2><?php echo $patient_info['fullname']; ?></h2>
	<ul class="actions">
    <li class="dropdown"><a href="#" data-toggle="dropdown"> <i class="zmdi zmdi-more-vert"></i> </a>
        <ul class="dropdown-menu dropdown-menu-right">
            <li><a href="#" onclick="document.location.reload(true); return false;"><span class="zmdi zmdi-refresh"></span> Refresh</a></li>
            <li><a href="<?php echo $print_action;?>" target="_blank"><span class="zmdi zmdi-local-printshop"></span> Print Profile</a></li>
        </ul></li>
</ul>
</div>
<section class="row profile-nav">
 <div role="tabpanel" class="col-md-12">
<div class="card">
		<div class="card-body">
    <ul class="tab-nav text-center" role="tablist" data-tab-color="cyan">
        <li><a href="<?php echo $link['general'];?>">General</a></li>
        <li><a href="<?php echo $link['insurance_policy'];?>">Insurance/Policy</a></li>
        <li class="active"><a href="<?php echo $link['employer'];?>">Employer</a></li>
        <li><a href="<?php echo $link['records'];?>">Records</a></li>
        <li><a href="<?php echo $link['notice_action'];?>">Notes/Actions</a></li>
    </ul>
		</div>
	</div>    
</div>
</section>
<!--Template notice-->
<div class="alert alert-info" role="alert">
   <span class="zmdi zmdi-info-outline large"></span> Use the search feature to add an employer entery to a profile. New employer entries can be add in <strong>Application Information</strong>.
</div>
<div class="card">
    <div class="card-header bgm-cyan">
        <h2>Employer Information</h2>
        <!-- Operations -->
        <ul class="actions actions-alt">
            <li class="dro pdown"><a href="#" data-toggle="dropdown"> <i class="zmdi zmdi-more-vert"></i> </a>
                <ul class="dropdown-menu dropdown-menu-right">
                    <li><a href="#tab-1" data-sandbox-button="tag"> <i class="zmdi zmdi-assignment"></i> Information</a></li>
                    <li><a href="#tab-2" data-sandbox-button="tag"><i class="zmdi zmdi-search"></i> Search For Insurance</a></li>
                    <li><a href="#" data-sandbox-remove="employer" data-sandbox-form="employer-form" data-sandbox-controller="<?php echo $remover_employer_action;?>"><span class="zmdi zmdi-minus-circle"></span> Clear record</a></li>
                </ul>
            </li>
        </ul>
        <button class="btn icon-btn bgm-green btn-lg waves-effect pull-right save-btn" type="submit" form="employer-form"><i class="zmdi zmdi-check-all"></i> Save</button>
    </div>

<!-- Operations -->
<ul class="tab-nav tn-justified tn-icon" role="tablist">
    <li role="presentation" class="active"><a class="col-sx-4" href="#tab-1" aria-controls="tab-1" role="tab" data-toggle="tab">Information</a></li>
    <li role="presentation"><a class="col-xs-4" href="#tab-2" aria-controls="tab-2" role="tab" data-toggle="tab">Search For Employer</a></li>
</ul>

<div class="card-body card-padding">
    <div class="tab-content p-20">
    <div role="tabpanel" class="tab-pane animated fadeIn in active" id="tab-1">    
     <form id="employer-form" action="<?php echo $employer_action;?>" data-sandbox-update="employer" accept-charset="utf-8" role="form" onkeypress="return event.keyCode != 13;">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Name:</label>
                            <div class="fg-line" style="height:39px;">
                                <input id="employer-name" class="form-control input-lg" placeholder="Name" type="text" name="name" value="<?php echo $employer_info['name'];?>">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Phone Number:</label>
                            <div class="fg-line">
                                <input type="text" id="employer-phone" class="form-control input-lg input-mask emploryer-phone" data-mask="000-000-0000" placeholder="000-000-0000" name="phone" value="<?php echo $employer_info['phone'];?>">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="form-group">
                            <label>Address:</label>
                            <div class="fg-line">
                                <input id="employer-address" class="form-control input-lg" data-sandbox="hasinput" placeholder="address" type="text" name="address" value="<?php echo $employer_info['address'];?>">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>City:</label>
                            <div class="fg-line">
                                <input id="employer-city" class="form-control input-lg" placeholder="city" type="text" name="city" value="<?php echo $employer_info['city'];?>">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-1">
                        <div class="form-group">
                            <label>State:</label>
                            <div class="fg-line">
                                <input id="employer-state" class="form-control input-lg" placeholder="state" maxlength="2" name="state" value="<?php echo $employer_info['state'];?>">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label>Zipcode:</label>
                            <div class="fg-line">
                                <input id="employer-zipcode" class="form-control input-lg input-mask" data-mask="00000" placeholder="00000" type="text" name="zipcode" value="<?php echo $employer_info['zipcode'];?>">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Group #:</label>
                            <div class="fg-line">
                                <input id="employer-group_id" class="form-control input-lg" placeholder="Group #" type="text" name="group_id" value="<?php echo $employer_info['group_id'];?>">
                            </div>
                        </div>
                    </div>
                </div>
                <input type="hidden" name="patient_id" value="<?php echo $patient_info['patient_id'];?>" />
                <input id="employer_id" type="hidden" name="employer_id" value="<?php echo $employer_info['employer_id'];?>" />
      </form>
     </div>
    <div role="tabpanel" class="tab-pane animated fadeIn" id="tab-2">
        <form id="emploryer-search-form" action="<?php echo $employer_search_action;?>" data-sandbox-search="employer" accept-charset="utf-8" role="form">
            <div class="row">
                <div class="col-md-12">
                    <h3 class="text-center m-t-0">Search For Employer</h3>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Name:</label>
                        <div class="fg-line" style="height:39px;">
                            <input class="form-control input-lg employer-name" placeholder="Employer Name" name="name" type="text">
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Group #:</label>
                        <div class="fg-line">
                            <input class="form-control input-lg group-id" placeholder="Group ID" type="text" name="group_id">
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-md-offset-4">
                    <button type="submit" class="btn btn-success btn-block">
                        Search
                    </button>
                </div>
            </div>
        </form>
    </div>
    </div>
</div>
</div>
<?php } else{ ?>
<section id="patient-not-found">
    <h1><?php echo $page_notice;?></h1>
    <img src="application/view/image/not-found.png" class="center-block" />
</section>
<?php } ?>