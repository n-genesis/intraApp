<section data-alert="system">
<?php if(isset($system_notice)){ echo $system_notice; } ?>
</section>
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
        <li class="active"><a href="<?php echo $link['insurance_policy'];?>">Insurance/Policy</a></li>
        <li><a href="<?php echo $link['employer'];?>">Employer</a></li>
        <li><a href="<?php echo $link['records'];?>">Records</a></li>
        <li><a href="<?php echo $link['notice_action'];?>">Notes/Actions</a></li>
    </ul>
		</div>
	</div>    
</div>
</section>
<!--Template notice-->
<div class="alert alert-info" role="alert">
   <span class="zmdi zmdi-info-outline large"></span> Use the search feature to add an insurace entery to a profile. New insutance entries can be added in <strong>Application Information</strong>.
</div>
<div class="card">
    <div class="card-header bgm-cyan">
        <h2>Insurance Information</h2>
        <ul class="actions actions-alt">
            <li class="dropdown"><a href="#" data-toggle="dropdown"> <i class="zmdi zmdi-more-vert"></i> </a>
                <ul class="dropdown-menu dropdown-menu-right">
                    <li><a href="#tab-1" data-sandbox-button="tag"> <i class="zmdi zmdi-assignment"></i> Information</a></li>
                    <li><a href="#tab-2" data-sandbox-button="tag"><i class="zmdi zmdi-search"></i> Search For Insurance</a></li>
                    <li><a href="#" data-sandbox-remove="insurance" data-sandbox-form="patient-insurance-form" data-sandbox-controller="<?php echo $remove_insurace;?>"> <span class="zmdi zmdi-minus-circle"></span> Clear record</a></li>
                </ul>
            </li>
        </ul>
        <button class="btn icon-btn bgm-green btn-lg waves-effect pull-right save-btn" type="submit" form="patient-insurance-form"><i class="zmdi zmdi-check-all"></i> Save</button>
    </div>

<!-- Operations -->
<ul class="tab-nav tn-justified tn-icon" role="tablist">
    <li role="presentation" class="active"><a class="col-sx-4" href="#tab-1" aria-controls="tab-1" role="tab" data-toggle="tab">Information</a></li>
    <li role="presentation"><a class="col-xs-4" href="#tab-2" aria-controls="tab-2" role="tab" data-toggle="tab">Search For Insurance</a></li>
</ul>

    <div class="card-body card-padding">

<div class="tab-content p-20">
    <div role="tabpanel" class="tab-pane animated fadeIn in active" id="tab-1">
        <form id="patient-insurance-form" action="<?php echo $patient_insurance_action;?>" data-sandbox-update="insurance" accept-charset="utf-8" role="form" onkeypress="return event.keyCode != 13;">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Name:</label>
                            <div class="fg-line" style="height:39px;">
                                <input id="insurance-name" class="form-control input-lg insurance-name" placeholder="Name" type="text" name="name" value="<?php echo $insurance_info['name'];?>">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Phone Number:</label>
                            <div class="fg-line">
                                <input id="insurance-phone" type="text" class="form-control input-lg input-mask insurance-phone" data-mask="000-000-0000" placeholder="000-000-0000" name="phone" value="<?php echo $insurance_info['phone'];?>">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="form-group">
                            <label>Address:</label>
                            <div class="fg-line">
                                <input id="insurance-address" class="form-control input-lg " placeholder="address" type="text" name="address" value="<?php echo $insurance_info['address'];?>">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>City:</label>
                            <div class="fg-line">
                                <input id="insurance-city" class="form-control input-lg" placeholder="city" type="text" name="city" value="<?php echo $insurance_info['city'];?>">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-1">
                        <div class="form-group">
                            <label>State:</label>
                            <div class="fg-line">
                                <input id="insurance-state" class="form-control input-lg" placeholder="state" maxlength="2" name="state" value="<?php echo $insurance_info['state'];?>">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label>Zipcode:</label>
                            <div class="fg-line">
                                <input id="insurance-zipcode" class="form-control input-lg input-mask" data-mask="00000" placeholder="00000" type="text" name="zipcode" value="<?php echo $insurance_info['zipcode'];?>">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Payor ID #:</label>
                            <div class="fg-line">
                                <input id="insurance-payor_id" class="form-control input-lg insurance-payor-id" placeholder="Payor ID" type="text" name="payor_id" value="<?php echo $insurance_info['payor_id'];?>">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Ins Co ID #:</label>
                            <div class="fg-line">
                                <input id="insurance-ins_id" class="form-control input-lg insurance-ins-id" placeholder="Ins Co ID" type="text" name="ins_id" value="<?php echo $insurance_info['ins_id'];?>">
                            </div>
                        </div>
                    </div>
                </div>
                <input type="hidden" name="patient_id" value="<?php echo $patient_info['patient_id'];?>" />
                <input id="insurance-insurance_id" type="hidden" name="insurance_id" value="<?php echo $insurance_info['insurance_id'];?>" />
                </form>
            
    </div>

    <div role="tabpanel" class="tab-pane animated fadeIn" id="tab-2">
        <form id="patient-search-form" action="<?php echo $insurance_search_action;?>" data-sandbox-search="insurance" accept-charset="utf-8" role="form">
            <div class="row">
                <div class="col-md-12">
                    <h3 class="text-center m-t-0">Search For Insurance</h3>
                </div>
                <div class="col-md-12">
                    <div class="form-group">
                        <label>Name:</label>
                        <div class="fg-line" style="height:39px;">
                            <input class="form-control input-lg insurance-name" placeholder="Insurance Name" name="name" type="text">
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Payor ID #:</label>
                        <div class="fg-line">
                            <input class="form-control input-lg insurance-payor-id" placeholder="Payor ID" type="text" name="payor_id">
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                <div class="form-group">
                    <label>Ins Co ID #:</label>
                    <div class="fg-line">
                        <input class="form-control input-lg insurance-ins-id" placeholder="Ins Co ID" type="text" name="ins_id">
                    </div>
                </div>
                </div>
                <div class="col-md-4 col-md-offset-4"><button type="submit" class="btn btn-success btn-block">Search</button></div>
            </div>
        </form>
    </div>
</div>

   </div>
</div>

<!--Template notice-->
<div class="alert alert-info" role="alert">
   <span class="zmdi zmdi-alert-triangle large"></span><strong> If the policy is associated with another profile the Insurance Information must be cleared</strong>.
</div>
<div class="card">
    <div class="card-header bgm-bluegray">
        <h2>Policy Holder</h2>
        <ul class="actions actions-alt">
            <li class="dropdown"><a href="#" data-toggle="dropdown" aria-expanded="false"> <i class="zmdi zmdi-more-vert"></i> </a>
                <ul class="dropdown-menu dropdown-menu-right">
                    <li><a href="#" data-sandbox-policy="primary" data-sandbox-patient-id="<?php echo $patient_info['patient_id'];?>" data-sandbox-controller="<?php echo $patient_make_primary;?>">Make Primary Holder</a></li>
                    <li><a href="#" data-sandbox-policy="change" data-sandbox-patient-id="<?php echo $patient_info['patient_id'];?>" data-sandbox-controller="<?php echo $policy_change;?>" data-sandbox-title="Change Policy Holder">Change Primary Holder</a></li>
                    <li><a href="#" data-sandbox-policy="remove" data-sandbox-patient-id="<?php echo $patient_info['patient_id'];?>" data-sandbox-controller="<?php echo $policy_remove;?>">Remove Policy Holder</a></li>
                </ul>
            </li>
        </ul>
        <button id="policy-date-btn" class="btn icon-btn bgm-blue btn-lg waves-effect pull-right save-btn <?php echo ($patient_info['patient_id'] != $patient_info['policy_holder_id']?'hidden':'');?>" type="submit" form="policy-holder-form"><i class="zmdi zmdi-check-all"></i> Save</button>
    </div>
    <div class="card-body card-padding">
            <div class="row">
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Policy Holder’s Name:</label>
                        <div class="fg-line">
                            <input id="holder-name" class="form-control input-lg" readonly type="text" value="<?php echo $policy_holder_info['first_name'].' '.$policy_holder_info['last_name'];?>">
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Policy Holder’s DOB:</label>
                        <div class="fg-line">
                            <input id="holder-dob" class="form-control input-lg" readonly type="text" value="<?php echo $policy_holder_info['dob'];?>">
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Policy Holder’s SSN:</label>
                        <div class="fg-line">
                            <input id="holder-ssn" class="form-control input-lg" readonly type="text" value="<?php echo $policy_holder_info['ssn'];?>">
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <form id="policy-holder-form" action="<?php echo $policy_action;?>" data-sandbox-update="policy" accept-charset="utf-8" role="form" onkeypress="return event.keyCode != 13;">
                    <div class="form-group">
                        <label>Policy Eff Date:</label>
                        <div class="fg-line">
                            <input id="holder-date" class="form-control input-lg" <?php echo ($patient_info['patient_id'] != $patient_info['policy_holder_id']?'readonly':'');?> data-sandbox-validate="true" data-mask="00/00/0000" placeholder="00/00/0000"  type="text" name="policy_eff_date" value="<?php echo $policy_holder_info['policy_eff_date'];?>">
                        </div>
                    </div>
                    <input type="hidden" name="patient_id" value="<?php echo $patient_info['patient_id'];?>" />
                    </form>
                </div>
            </div>
        <div id="policy-claims">
            <div class="card">
                <div class="card-header bgm-bluegray m-b-20">
                    <h2>Policy Claims</h2>
                    <button id="new-policy-claim" class="btn bgm-blue btn-float waves-effect" data-sandbox-policy="new-claim" data-sandbox-policy-holder-id="<?php echo $patient_info['policy_holder_id'];?>" data-sandbox-controller="<?php echo $new_claim;?>" data-sandbox-title="New Policy Claim">
                        <i class="zmdi zmdi-plus"></i>
                    </button>
                </div>
                <div id="claims-list" data-sandbox-policy-id="<?php echo $patient_info['patient_id'];?>" class="list-group c-overflow-window">
                    <!-- Policy claims -->
                    <?php echo $policy_claims; ?>
                </div>
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