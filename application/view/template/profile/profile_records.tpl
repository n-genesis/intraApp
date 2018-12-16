<?php if(isset($system_notice)){ echo $system_notice; } ?>
<?php if(!empty($patient_info) && empty($page_notice)){ ?>
<div class="block-header">
    <h2><?php echo $patient_info['fullname']; ?></h2>
    <ul class="actions">
    <li class="dropdown"><a href="#" data-toggle="dropdown"> <i class="zmdi zmdi-more-vert"></i> </a>
        <ul class="dropdown-menu dropdown-menu-right">
            <li><a href="#" onclick="document.location.reload(true); return false;"><span class="zmdi zmdi-refresh"></span> Refresh</a></li>
            <li><a href="<?php echo $print_action;?>" target="_blank"><span class="zmdi zmdi-print"></span> Print Profile</a></li>
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
        <li><a href="<?php echo $link['employer'];?>">Employer</a></li>
        <li class="active"><a href="<?php echo $link['records'];?>">Records</a></li>
        <li><a href="<?php echo $link['notice_action'];?>">Notes/Actions</a></li>
    </ul>
        </div>
    </div>    
</div>
</section>
<!--Template notice-->
<div class="alert alert-info" role="alert">
   <span class="zmdi zmdi-info-outline large"></span> To associate a record to a profile an insurance entery much be assigned. Insurance record entries can be edited in <strong>Application Information</strong>.
</div>
<div class="card">
    <div class="card-header bgm-cyan">
        <h2>Profile Records</h2>
        <ul class="actions actions-alt">
            <li class="dropdown"><a href="#" data-toggle="dropdown"> <i class="zmdi zmdi-more-vert"></i> </a>
                <ul class="dropdown-menu dropdown-menu-right">
                    <li><a href="<?php echo $print_record_action;?>" target="_blank"><span class="zmdi zmdi-print"></span> Print Records</a></li>
                    <!--
                    <li><a href="#" data-sandbox-delete="record" data-sandbox-form="patient-record-form" data-sandbox-controller="<?php echo $patient_insurance_action;?>"><span class="zmdi zmdi-minus-circle"></span> Clear record</a></li>
                    -->
                </ul>
            </li>
        </ul>
        <!--
        <button class="btn icon-btn bgm-green btn-lg waves-effect pull-right save-btn" type="submit" form="patient-record-form"><i class="zmdi zmdi-check-all"></i> Save</button>
        -->
    </div>
    <div class="card-body card-padding">
    <form id="patient-record-form" action="<?php echo $record_action;?>" data-sandbox-update="record" accept-charset="utf-8" role="form" onkeypress="return event.keyCode != 13;">
<ul class="tab-nav tn-justified tn-icon" role="tablist">
    <li role="presentation" class="active"><a class="col-sx-4" href="#tab-1" aria-controls="tab-1" role="tab" data-toggle="tab"> General </a></li>
    <li role="presentation"><a class="col-xs-4" href="#tab-2" aria-controls="tab-2" role="tab" data-toggle="tab"> Perio </a></li>
    <li role="presentation"><a class="col-xs-4" href="#tab-3" aria-controls="tab-3" role="tab" data-toggle="tab"> Implants and Related Coverage </a></li>
    <li role="presentation"><a class="col-xs-4" href="#tab-4" aria-controls="tab-4" role="tab" data-toggle="tab"> Alternate Benefits </a></li>
    <li role="presentation"><a class="col-xs-4" href="#tab-5" aria-controls="tab-5" role="tab" data-toggle="tab"> Miscellaneous </a></li>
</ul>

<div class="tab-content p-20">
    <div role="tabpanel" class="tab-pane animated fadeIn in active" id="tab-1">
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label>Annual Plan Individual Maximum:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="ann_min" value="<?php  echo $record['ann_min']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>YTD Max Used:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="ann_min_max_used" value="<?php  echo $record['ann_min_max_used']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>Ded Met:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="ann_min_met" value="<?php  echo $record['ann_min_met']; ?>">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label>Insurance Renews: Calendar:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="renews_calendar" value="<?php  echo $record['renews_calendar']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>Fiscal:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="renews_calendar_fiscal" value="<?php  echo $record['renews_calendar_fiscal']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>Date:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="renews_calendar_date" value="<?php  echo $record['renews_calendar_date']; ?>">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <div class="form-group">
                    <label>UCR:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="ucr" value="<?php  echo $record['ucr']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label>Fee Schedule:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="fee_schedule" value="<?php  echo $record['fee_schedule']; ?>">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <div class="form-group">
                    <label>Individual Deductible:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="ind_ded" value="<?php  echo $record['ind_ded']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <label>Met Amt:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="ind_ded_met_amt" value="<?php  echo $record['ind_ded_met_amt']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <label>Family Deductible:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="fam_ded" value="<?php  echo $record['fam_ded']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <label>Met Amt:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="fam_ded_met_amt" value="<?php  echo $record['fam_ded_met_amt']; ?>">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label>Deductible Applies to:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="ded_app_to" value="<?php  echo $record['ded_app_to']; ?>">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label>Preventative:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="prev" value="<?php  echo $record['prev']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>Max:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="prev_max" value="<?php  echo $record['prev_max']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>Basic:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="prev_basic" value="<?php  echo $record['prev_basic']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>Major:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="prev_major" value="<?php  echo $record['prev_major']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>Endo:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="prev_endo" value="<?php  echo $record['prev_endo']; ?>">
                    </div>
                </div>
            </div>
        </div>
         <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label>Pano Freq:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="pano_freq" value="<?php echo $record['pano_freq'] ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label>Pano per:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="pano_freq_per" value="<?php echo $record['pano_freq_per'] ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label>Pano Ded:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="pano_freq_ded" value="<?php echo $record['pano_freq_ded'] ?>">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label>Elig for Exam, Prophy, B/W:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="elig" value="<?php echo $record['elig'] ?>">
                    </div>
                </div>
            </div>
       </div>
       <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label>D1330:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d1330" value="<?php echo $record['d1330'] ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label>Denture Consult:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="denture_consult" value="<?php echo $record['denture_consult'] ?>">
                    </div>
                </div>
            </div>
       </div>
       <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label>Exam D0140 Freq:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d0140_freq" value="<?php echo $record['d0140_freq'] ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>per:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d0140_freq_per" value="<?php echo $record['d0140_freq_per'] ?>">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label>Sealants Freq:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="sealants_freq" value="<?php echo $record['sealants_freq'] ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>per:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="sealants_freq_per" value="<?php echo $record['sealants_freq_per'] ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>Age Limit:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="sealants_freq_age_limit" value="<?php echo $record['sealants_freq_age_limit'] ?>">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label>Sealant Teeth:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="sealant_teeth" value="<?php echo $record['sealant_teeth'] ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>Hx:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="sealant_teeth_hx" value="<?php echo $record['sealant_teeth_hx'] ?>">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label>Flouride Freq:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="flouride_freq" value="<?php echo $record['flouride_freq'] ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>per:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="flouride_freq_per" value="<?php echo $record['flouride_freq_per'] ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>Age Limit:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="flouride_freq_age_limit" value="<?php echo $record['flouride_freq_age_limit'] ?>">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <div class="form-group">
                    <label>Perio:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="prev_perio" value="<?php  echo $record['prev_perio']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>Oral Surg:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="prev_oral_surg" value="<?php  echo $record['prev_oral_surg']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>Implant:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="prev_implant" value="<?php  echo $record['prev_implant']; ?>">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <h3>OS Codes that go to Medical and Percent Covered:</h3>
            <div class="col-md-2">
                <div class="form-group">
                    <label>D7140:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d7140" value="<?php  echo $record['d7140']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>D7210:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d7210" value="<?php  echo $record['d7210']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>D7220:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d7220" value="<?php  echo $record['d7220']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>D7230:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d7230" value="<?php  echo $record['d7230']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>D7240:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d7240" value="<?php  echo $record['d7240']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>D7250:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d7250" value="<?php  echo $record['d7250']; ?>">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label>Waiting Period(Y/N):</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="wai_per" value="<?php  echo $record['wai_per']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label>If Yes: Months on Basic:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="wai_per_yes" value="<?php  echo $record['wai_per_yes']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label>Months on Major:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="wai_per_mon" value="<?php  echo $record['wai_per_mon']; ?>">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label>Missing Tooth Clause(Y/N):</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="mis_tee" value="<?php  echo $record['mis_tee']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label>Replacement Rule:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="mis_tee_rul" value="<?php  echo $record['mis_tee_rul']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label>Removables Hx:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="mis_tee_rem" value="<?php  echo $record['mis_tee_rem']; ?>">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label>Same Day Tx Allowed(Y/N):</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="sam_day_tx" value="<?php  echo $record['sam_day_tx']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>Pays on: Seat:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="sam_day_tx_pay" value="<?php  echo $record['sam_day_tx_pay']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-1">
                <div class="form-group">
                    <label>Prep:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="sam_day_tx_prep" value="<?php  echo $record['sam_day_tx_prep']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>COB: Standard:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="sam_day_tx_cob" value="<?php  echo $record['sam_day_tx_cob']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-1">
                <div class="form-group">
                    <label>Non-Dup:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="sam_day_tx_dup" value="<?php  echo $record['sam_day_tx_dup']; ?>">
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div role="tabpanel" class="tab-pane animated fadeIn" id="tab-2">
        <div class="row">
            <div class="col-md-2">
                <div class="form-group">
                    <label>D4341 Freq:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d4341_freq" value="<?php  echo $record['d4341_freq']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-1">
                <div class="form-group">
                    <label>Per:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d4341_freq_per" value="<?php  echo $record['d4341_freq_per']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <label>Maximum Quads per Visit:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d4341_freq_max" value="<?php  echo $record['d4341_freq_max']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>Hx:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d4341_freq_max_hx" value="<?php  echo $record['d4341_freq_max_hx']; ?>">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <div class="form-group">
                    <label>D4355(Y/N):</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d4355" value="<?php  echo $record['d4355']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>Gross Debridement Freq:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d4355_fre" value="<?php  echo $record['d4355_fre']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-1">
                <div class="form-group">
                    <label>Per:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d4355_per" value="<?php  echo $record['d4355_per']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>Hx:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d4355_hx" value="<?php  echo $record['d4355_hx']; ?>">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <div class="form-group">
                    <label>D4381(Y/N):</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d4381" value="<?php  echo $record['d4381']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>Freq:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d4381_fre" value="<?php  echo $record['d4381_fre']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>Per:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d4381_per" value="<?php  echo $record['d4381_per']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <label>Max Sites per Visit:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d4381_fre_max" value="<?php  echo $record['d4381_fre_max']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>Add Req:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d4381_req" value="<?php  echo $record['d4381_req']; ?>">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <div class="form-group">
                    <label>D4249(Y/N):</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d4249" value="<?php  echo $record['d4249']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label>Allowed same date as crown prep(Y/N):</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d4249_all" value="<?php  echo $record['d4249_all']; ?>">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label>Crown lengthening allowed on same day as build-up(Y/N):</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="crown_len" value="<?php  echo $record['crown_len']; ?>">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label>D4910 Freq:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d4910_fer" value="<?php  echo $record['d4910_fer']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>Per:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d4910_per" value="<?php  echo $record['d4910_per']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label>Allowed with prophy(Y/N):</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d4910_all" value="<?php  echo $record['d4910_all']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>%</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d4910_pre" value="<?php  echo $record['d4910_pre']; ?>">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <div class="form-group">
                    <label>D4266 Membrane(Y/N):</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d4266_mem" value="<?php  echo $record['d4266_mem']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <label>D4273 Connective Tissue Graft:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d4273_con" value="<?php  echo $record['d4273_con']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <label>D4263 Bone Placement:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="D4263_bon" value="<?php  echo $record['D4263_bon']; ?>">
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div role="tabpanel" class="tab-pane animated fadeIn" id="tab-3">
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label>D6010 Implant Placement(Y/N):</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d6010_imp" value="<?php  echo $record['d6010_imp']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>%:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d6010_pre" value="<?php  echo $record['d6010_pre']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>Downgrade:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d6010_dow" value="<?php  echo $record['d6010_dow']; ?>">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label>D6057/D6056 Implant Abutment(Y/N):</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d6057_d6056" value="<?php  echo $record['d6057_d6056']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>%:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d6057_d6056_pre" value="<?php  echo $record['d6057_d6056_pre']; ?>">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label>D6058 Implant Crown(Y/N):</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d6058" value="<?php  echo $record['d6058']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>%:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d6058_pre" value="<?php  echo $record['d6058_pre']; ?>">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label>D6104 Bone Graft Same Time as Implant(Y/N):</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d6104" value="<?php  echo $record['d6104']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>%:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d6104_pre" value="<?php  echo $record['d6104_pre']; ?>">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <div class="form-group">
                    <label>D6011(Y/N):</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d6011" value="<?php  echo $record['d6011']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>%:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d6011_pre" value="<?php  echo $record['d6011_pre']; ?>">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label>D6059 Subject to Downgrade?(Y/N):</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d6059" value="<?php  echo $record['d6059']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>%:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d6059_pre" value="<?php  echo $record['d6059_pre']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <label>If Yes to what code:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d6059_code" value="<?php  echo $record['d6059_code']; ?>">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label>D6110 Subject to Downgrade?(Y/N):</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d6110" value="<?php  echo $record['d6110']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <label>If Yes to what code:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d6110_code" value="<?php  echo $record['d6110_code']; ?>">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label>D6111 Subject to Downgrade?(Y/N):</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d6111" value="<?php  echo $record['d6111']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <label>If Yes to what code:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d6111_code" value="<?php  echo $record['d6111_code']; ?>">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label>D6114 Subject to Downgrade?(Y/N):</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d6114" value="<?php  echo $record['d6114']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <label>If Yes to what code:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d6114_code" value="<?php  echo $record['d6114_code']; ?>">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label>D6115 Subject to Downgrade?(Y/N):</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d6115" value="<?php  echo $record['d6115']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <label>If Yes to what code:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d6115_code" value="<?php  echo $record['d6115_code']; ?>">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label>Is there a separate Oral Surgery / Implant Rider?(Y/N):</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="sur_imp" value="<?php  echo $record['sur_imp']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <label>Maximum:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="sur_imp_max" value="<?php  echo $record['sur_imp_max']; ?>">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label>D5820 Flipper(Y/N):</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d5820" value="<?php  echo $record['d5820']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>Anterior only(Y/N):</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d5820_ant" value="<?php  echo $record['d5820_ant']; ?>">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <div class="form-group">
                    <label>D7951 Sinus Lift(Y/N):</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d7951" value="<?php  echo $record['d7951']; ?>">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <div class="form-group">
                    <label>D7560:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d7560" value="<?php  echo $record['d7560']; ?>">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label>D7953 Bone Graft /Preserve Site(Y/N):</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d7953" value="<?php  echo $record['d7953']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>%:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d7953_pre" value="<?php  echo $record['d7953_pre']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <label>Implant Specific(Y/N):</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d7953_imp" value="<?php  echo $record['d7953_imp']; ?>">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label>D7510 Incision and Drainage(Y/N):</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d7510" value="<?php  echo $record['d7510']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>%:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d7510_pre" value="<?php  echo $record['d7510_pre']; ?>">
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div role="tabpanel" class="tab-pane animated fadeIn" id="tab-4">
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label>Composites Subject to Downgrade(Y/N):</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="com_sub_dow" value="<?php  echo $record['com_sub_dow']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label>Which Teeth:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="com_sub_dow_whi" value="<?php  echo $record['com_sub_dow_whi']; ?>">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label>D2750 PFM Subject to Downgrade?(Y/N):</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d2750" value="<?php  echo $record['d2750']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label>If Yes to what code:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d2750_whi_tee" value="<?php  echo $record['d2750_whi_tee']; ?>">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label>D2950 Build-up(basic/major):</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d2950" value="<?php  echo $record['d2950']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>%:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d2750_pre" value="<?php  echo $record['d2750_pre']; ?>">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label>D2954 Post and Core(basic/major):</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d2954" value="<?php  echo $record['d2954']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>%:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d2954_pre" value="<?php  echo $record['d2954_pre']; ?>">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div role="tabpanel" class="tab-pane animated fadeIn" id="tab-5">
        <div class="row">
            <div class="col-md-2">
                <div class="form-group">
                    <label>D5811(Y/N):</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d5811" value="<?php  echo $record['d5811']; ?>">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <div class="form-group">
                    <label>D9940 Occlusal Guard(Y/N):</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d9940" value="<?php  echo $record['d9940']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>%:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d9940_pre" value="<?php  echo $record['d9940_pre']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>Freq:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d9940_fre" value="<?php  echo $record['d9940_fre']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>per:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d9940_per" value="<?php  echo $record['d9940_per']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <label>For: Bruxism/Surgery:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d9940_for" value="<?php  echo $record['d9940_for']; ?>">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label>D9110 Emergency Visit(Y/N):</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d9110" value="<?php  echo $record['d9110']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>%:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d9110_pre" value="<?php  echo $record['d9110_pre']; ?>">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label>D9310 Consultation(Y/N):</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d9310" value="<?php  echo $record['d9310']; ?>">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>%:</label>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="d9310_pre" value="<?php  echo $record['d9310_pre']; ?>">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
    <input type="hidden" name="patient_id" value="<?php echo $patient_info['patient_id'];?>" />
    </form>
    </div>
</div>
<?php } else{ ?>
<section id="patient-not-found">
    <h1><?php echo $page_notice;?></h1>
    <img src="application/view/image/not-found.png" class="center-block" />
</section>
<?php } ?>