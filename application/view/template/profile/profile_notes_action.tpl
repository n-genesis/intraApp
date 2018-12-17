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
        <li><a href="<?php echo $link['employer'];?>">Employer</a></li>
        <li><a href="<?php echo $link['records'];?>">Records</a></li>
        <li class="active"><a href="<?php echo $link['notes_action'];?>">Notes/Actions</a></li>
    </ul>
        </div>
    </div>    
</div>
</section>
<div class="card">
    <div class="card-header ch-alt">
        <h2>Notes/Calls Entries</h2>

        <ul class="actions">
            <li class="dropdown"><a href="#" data-toggle="dropdown"> <i class="zmdi zmdi-more-vert"></i> </a>
                <ul class="dropdown-menu dropdown-menu-right">
                    <li><a href="#" data-sandbox-new="note" data-sandbox-patient-id="<?php echo $patient_info['patient_id'];?>" data-sandbox-controller="<?php echo $note_controller;?>" data-sandbox-title="New Note">Create Note Entry</a></li>
                    <li><a href="#" data-sandbox-new="call" data-sandbox-patient-id="<?php echo $patient_info['patient_id'];?>" data-sandbox-controller="<?php echo $call_controller;?>" data-sandbox-title="New Call">Create Call Entry</a></li>
                </ul>
            </li>
        </ul>
        <button class="btn icon-btn bgm-green btn-lg waves-effect pull-right save-btn" style="margin-left:12px;" type="button" data-sandbox-new="note" data-sandbox-patient-id="<?php echo $patient_info['patient_id'];?>" data-sandbox-controller="<?php echo $note_controller;?>" data-sandbox-title="New Note">Note Entry</button>

        <button class="btn icon-btn bgm-green btn-lg waves-effect pull-right save-btn" type="button" data-sandbox-new="call" data-sandbox-patient-id="<?php echo $patient_info['patient_id'];?>" data-sandbox-controller="<?php echo $call_controller;?>" data-sandbox-title="New Call">Call Entry</button>
    </div>
    <ul class="tab-nav tn-justified tn-icon" role="tablist">
            <li role="presentation" class="active"><a class="col-sx-4" href="#tab-1" role="tab" data-toggle="tab"> <i class="zmdi zmdi-comment-alt-text icon-tab"></i> Notes</a></li>
            <li role="presentation"><a class="col-xs-4" href="#tab-2" role="tab" data-toggle="tab"> <i class="zmdi zmdi-phone icon-tab"></i> Calls</a></li>
        </ul>
    <div class="card-body">

        <div class="tab-content p-10">
            <div role="tabpanel" class="tab-pane animated active fadeIn" id="tab-1">
                <div class="row">
                    <div class="col-md-12">
                        <?php if(!empty($notes)){ ?>
                         <div class="tab-max-size c-overflow">
                         <div class="list-box">     
                            <table class="table table-list table-hover">
                                <thead>
                                    <tr>
                                        <th>Title</th>
                                        <th>Note</th>
                                        <th>Date</th>
                                        <th>Action</th>
                                      </tr>
                                </thead>
                                <tbody>
                                <?php for ($i=0; $i < count($notes) ; $i++) { ?>
                                    <tr>
                                        <td data-sandbox-note="title"><?php echo $notes[$i]['title'] ?></td>
                                        <td><?php echo $notes[$i]['note'] ?></td>
                                        <td class="date"><?php echo $notes[$i]['date'] ?></td>
                                        <td class="action">
                                            <a href="#" class="btn btn-success" data-sandbox-view="note" data-sandbox-note-id="<?php echo $notes[$i]['note_id']; ?>" data-sandbox-controller="<?php echo $view_note;?>"><i class="zmdi zmdi-eye"></i></a>
                                            <a href="#" class="btn btn-danger" data-sandbox-delete="note" data-sandbox-id="<?php echo $notes[$i]['note_id']; ?>" data-sandbox-controller="<?php echo $delete_note;?>"><i class="zmdi zmdi-delete"></i></a>    
                                        </td>
                                    </tr>
                                <?php } ?>
                            
                                </tbody>
                            </table>
                        </div>
                        </div>
                        <?php }else{ ?>
                            <div class="col-md-12">
                                <h2 class="text-center">There are no notes</h2>
                            </div>
                        <?php } ?>
                        </div>
                    </div>  
                </div>
            <div role="tabpanel" class="tab-pane animated fadeIn" id="tab-2">
                <div class="row">
                    <div class="col-md-12">
                        <?php if(!empty($calls)){ ?>
                            <div class="tab-max-size c-overflow">
                            <div class="list-box">
                            <table class="table table-list table-hover">
                                <thead>
                                    <tr>
                                        <th>Phone</th>
                                        <th>Note</th>
                                        <th>Date/Time</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php for ($j=0; $j<count($calls) ; $j++) { ?>
                                        <tr>
                                        <td><?php echo $calls[$j]['phone'] ?></td>
                                        <td><?php echo $calls[$j]['note'] ?></td>
                                        <td class="date"><?php echo $calls[$j]['date'] ?></td>
                                        <td class="action">
                                            <a href="#" class="btn btn-success" data-sandbox-view="call" data-sandbox-call-id="<?php echo $calls[$j]['call_id']; ?>" data-sandbox-controller="<?php echo $view_call;?>"><i class="zmdi zmdi-eye"></i></a>
                                            <a href="#" class="btn btn-danger" data-sandbox-delete="call" data-sandbox-id="<?php echo $calls[$j]['call_id']; ?>" data-sandbox-controller="<?php echo $delete_call;?>"><i class="zmdi zmdi-delete"></i></a>    
                                        </td>
                                    </tr>
                                    <?php } ?>
                                </tbody>
                            </table>
                            </div>
                            </div>
                        <?php }else{ ?>
                            <div class="col-md-12">
                                <h2 class="text-center">There are no calls</h2>
                            </div>
                        <?php } ?>
                    </div>  
                </div>
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