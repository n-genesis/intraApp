var sandboxModal = {
    insuranceSearch: function(event){
        event.preventDefault();
        var data = $(this)[0].dataset;
        bootbox.dialog({
            title: data.sandboxTitle,
            message: function(){
            	var dom = this;
                globalAjax.htmlRequest({
                	url:'index.php?route=profile/profile_insurance_policy/searchform',
                	dom: dom,
                	callback: function(){
                		
                	}
                });
            },
            buttons: {
                close: {
                    className: 'btn btn-primary'
                }
            }
         });
    },
    changePolicyHolder: function(event){
        event.preventDefault();
        var dom = $(this)[0].dataset;
        var searchbox = bootbox.dialog({
            title: dom.sandboxTitle,
            message : 
            '<div class="row no-margin">' + 
            '<form id="modal-form" role="form" onsubmit="return false;">' + 
            '<div class="col-md-12">' + 
            '<div class="row no-margin">' + 
            '<div class="col-md-6">' + 
            '<div class="form-group has-feedback">' + 
            '<input type="text" id="newpassword" class="form-control" name="first_name" placeholder="First Name">' + 
            '</div>' +
            '</div>' + 
            '<div class="col-md-6">' + 
            '<div class="form-group has-feedback">' + 
            '<input type="text" id="newpassword" class="form-control" name="last_name" placeholder="Last Name">' + 
            '</div>' +
            '</div>' + 
            '<div class="col-md-12">' + 
            '<div class="form-group has-feedback">' + 
            '<input type="text" class="form-control" name="ssn" placeholder="SSN">' + 
            '</div>' +
            '</div>' + 
            '</div>' + 
            '</div>' + 
            '</form>' + 
            '</div>',
            buttons: {
            	Search: {
            		className: 'btn btn-success',
            		callback: function(){
            			globalAjax.generalRequest({
							url : event.target.dataset.sandboxController,
							datasend : $('#modal-form').serialize(),
							callback : function(searchData) {
								if(searchData.operation == 'found'){
									bootbox.hideAll();
									swal({
										title : 'Profile Found',
										text : searchData.response,
										html: true,
										type : "success",
										showCancelButton : true,
										confirmButtonClass : "btn bgm-green waves-effect",
										confirmButtonText : "Yes, update info",
										closeOnConfirm : true
									}, function() {
										globalAjax.generalRequest({
											url : searchData.action,
											datasend : 'patient_id='+dom.sandboxPatientId+'&policy_holder_id='+searchData.patient_id,
											callback : function(data) {
												$('#holder-name').val(searchData.first_name+' '+searchData.last_name);
												$('#holder-dob').val(searchData.dob);
												$('#holder-ssn').val(searchData.ssn);
												$('#holder-date').val(searchData.policy_eff_date);
												$('#new-policy-claim').attr('data-sandbox-policy-holder-id',searchData.patient_id);
												$('#claims-list').attr('data-sandbox-policy-id',searchData.patient_id);
												if(dom.sandboxPatientId == searchData.patient_id){
													$('#holder-date').removeAttr('readonly');
													$('#policy-date-btn').removeClass('hidden');
												}else{
													$('#holder-date').attr('readonly','true');
													$('#policy-date-btn').addClass('hidden');
												}
												$.notify({
													message : data.response
												}, {
													type : 'success',
													offset : {
														x : 20,
														y : 85
													},
													onShow : function() {
														globalAjax.htmlRequest({
															url:'index.php?route=profile/profile_insurance_policy/claimsajax',
															data: 'policy_holder_id='+searchData.patient_id,
															dom: $('#claims-list'),
															callback: function(){
																window.setTimeout(function(){
																	location.reload();
																},260);
															}
														});
													}
												});
											}
										});
				
									});
								}else if(searchData.operation == 'notfound'){
									$.notify({
									message : searchData.response
									}, {
										type : 'info',
										offset : {
											x : 20,
											y : 85
										},
										z_index: 9999,
										placement: {
											align:'center'
										},
										onShow : function() {
											
										}
									});
								}
								
							}
						});
            			return false;
            		}
            	},
                close: {
                    className: 'btn btn-primary'
                }
            }
         });
    },
    newClaim: function(event){
        event.preventDefault();
        var dom = $(this)[0].dataset;
        var searchbox = bootbox.dialog({
        	style: 'full',
            title: dom.sandboxTitle,
            message: function(){
            	var modal = this;
                globalAjax.htmlRequest({
                	url:dom.sandboxController,
                	dom: modal,
                	data:'patient_id='+dom.sandboxPolicyHolderId,
                	callback: function(){
                		//empty for now
                	}
                });
            },
            buttons: {
            	'Submit': {
            		className: 'btn btn-success btn-lg',
            		callback: function(){
            			if (!formVal.noError('modal-form')) {
            				return false;
            			}
            			globalAjax.generalRequest({
							url : $('#modal-form')[0].action,
							datasend : $('#modal-form').serialize(),
							callback : function(data) {
								$.notify({
									message : data.response
									}, {
										type : 'success',
										offset : {
											x : 20,
											y : 85
										},
										onShow : function() {
											globalAjax.htmlRequest({
												url:'index.php?route=profile/profile_insurance_policy/claimsajax',
												data: 'policy_holder_id='+$('#claims-list').attr('data-sandbox-policy-id'),
												dom: $('#claims-list'),
												callback: function(){
													location.reload();	
												}
											});
										}
									});
								
							}
						});
            		}
            	},
                close: {
                    className: 'btn btn-primary btn-lg'
                }
            }
         });
    },
    viewClaim: function(event){
        event.preventDefault();
        var data = $(this)[0].dataset;
        bootbox.dialog({
            title: data.sandboxTitle,
            message: function(){
            	var dom = this;
                globalAjax.generalRequest({
                	url:'index.php?route=profile/profile_insurance_policy/viewclaim',
                	datasend: 'claim_id='+data.sandboxClaimId,
                	dom: dom,
                	callback: function(claim_data){
	                		dom.innerHTML = '<div class="row">' + 
				            '<div class="col-md-12">' + 
				            '<div class="row">' + 
				            '<div class="col-md-6">' +
				            '<div class="form-group">' +
				            '<label>Title:</label>' +
				            '<div class="fg-line">' +
				            '<input type="text" class="form-control" readonly value="'+claim_data.title+'">' + 
				            '</div>' +
				            '</div>' +
				            '</div>' + 
				            '<div class="col-md-6">' + 
				            '<div class="form-group">' +
				            '<label>Date:</label>' +
				            '<div class="fg-line">' +
				            '<input type="text" class="form-control" readonly value="'+claim_data.date+'">' + 
				            '</div>' +
				            '</div>' +
				            '</div>' + 
				            '<div class="col-md-12">' + 
				            '<div class="form-group">' +
				            '<label>Claim Note:</label>' +
				            '<div class="fg-line">' +
				            '<textarea type="text" class="form-control" readonly rows="5">'+claim_data.claim+'</textarea>' +
				            '</div>' +
				            '</div>' +
				            '</div>' + 
				            '</div>' + 
				            '</div>' + 
				            '</div>';
                	}
                });
            },
            buttons: {
                close: {
                    className: 'btn btn-primary'
                }
            }
         });
    },
    viewNote: function(event){
        event.preventDefault();
        var element = $(this)[0].dataset;
        var note = bootbox.dialog({
            title: '&nbsp;',
            style: 'full',
            message: function(){
            	var dom = this;
                globalAjax.generalRequest({
                	url:element.sandboxController,
                	datasend: 'note_id='+element.sandboxNoteId,
                	callback: function(data){
                		//IF error
				            if(data.action == 'notfound'){
				            	note.modal('hide');
				            	$.notify({
									message : data.response
								}, {
									type : 'danger',
									offset : {
										x : 20,
										y : 85
									}
								});
				            }else{
	                		dom.innerHTML = '<div class="row">' + 
				            '<div class="col-md-12">' + 
				            '<div class="row">' +
				            '<div class="col-md-6">' + 
				            '<div class="form-group">' +
				            '<label>User:</label>' +
				            '<div class="fg-line">' +
				            '<input type="text" class="form-control input-lg" readonly value="'+data.username+'">' + 
				            '</div>' +
				            '</div>' +
				            '</div>' +
				            '<div class="col-md-6">' + 
				            '<div class="form-group">' +
				            '<label>Date:</label>' +
				            '<div class="fg-line">' +
				            '<input type="text" class="form-control input-lg" readonly value="'+data.date+'">' + 
				            '</div>' +
				            '</div>' +
				            '</div>' + 
				            '<div class="col-md-12">' +
				            '<div class="form-group">' +
				            '<label>Title:</label>' +
				            '<div class="fg-line">' +
				            '<input type="text" class="form-control input-lg" readonly value="'+data.title+'">' + 
				            '</div>' +
				            '</div>' +
				            '</div>' + 
				            '<div class="col-md-12">' + 
				            '<div class="form-group">' +
				            '<label>Note:</label>' +
				            '<div class="fg-line">' +
				            '<textarea type="text" class="form-control" readonly rows="7">'+data.note+'</textarea>' +
				            '</div>' +
				            '</div>' +
				            '</div>' + 
				            '</div>' + 
				            '</div>' + 
				            '</div>';}
				            
                	}
                });
            },
            buttons: {
                close: {
                    className: 'btn btn-primary btn-lg'
                }
            }
         });
    },
    newNote: function(event){
        event.preventDefault();
        var dom = $(this)[0].dataset;
        var searchbox = bootbox.dialog({
        	style: 'full',
            title: dom.sandboxTitle,
            message: function(){
            	var modal = this;
                globalAjax.htmlRequest({
                	url:dom.sandboxController,
                	dom: modal,
                	data:'patient_id='+dom.sandboxPatientId,
                	callback: function(){
                		//empty for now
                	}
                });
            },
            buttons: {
            	'Submit': {
            		className: 'btn btn-success btn-lg',
            		callback: function(){
            			if (!formVal.noError('modal-form')) {
            				return false;
            			}
            			globalAjax.generalRequest({
							url : $('#modal-form')[0].action,
							datasend : $('#modal-form').serialize(),
							callback : function(data) {
								$.notify({
									message : data.response
									}, {
										type : 'success',
										offset : {
											x : 20,
											y : 85
										},
										onShow : function() {
											window.setTimeout(function(){
												location.reload();
											},260);
										}
									});
								
							}
						});
            		}
            	},
                close: {
                    className: 'btn btn-primary btn-lg'
                }
            }
         });
    },
    viewCall: function(event){
        event.preventDefault();
        var element = $(this)[0].dataset;
        var note = bootbox.dialog({
            title: 'Call Record',
            style: 'full',
            message: function(){
            	var dom = this;
                globalAjax.generalRequest({
                	url:element.sandboxController,
                	datasend: 'call_id='+element.sandboxCallId,
                	callback: function(data){
                		//IF error
				            if(data.action == 'notfound'){
				            	note.modal('hide');
				            	$.notify({
									message : data.response
								}, {
									type : 'danger',
									offset : {
										x : 20,
										y : 85
									}
								});
				            }else{
	                		dom.innerHTML = '<div class="row">' + 
				            '<div class="col-md-12">' + 
				            '<div class="row">' +
				            '<div class="col-md-4">' + 
				            '<div class="form-group">' +
				            '<label>User:</label>' +
				            '<div class="fg-line">' +
				            '<input type="text" class="form-control input-lg" readonly value="'+data.username+'">' + 
				            '</div>' +
				            '</div>' +
				            '</div>' +
				            '<div class="col-md-4">' + 
				            '<div class="form-group">' +
				            '<label>Date:</label>' +
				            '<div class="fg-line">' +
				            '<input type="text" class="form-control input-lg" readonly value="'+data.date+'">' + 
				            '</div>' +
				            '</div>' +
				            '</div>' + 
				            '<div class="col-md-4">' +
				            '<div class="form-group">' +
				            '<label>Phone:</label>' +
				            '<div class="fg-line">' +
				            '<input type="text" class="form-control input-lg" readonly value="'+data.phone+'">' + 
				            '</div>' +
				            '</div>' +
				            '</div>' + 
				            '<div class="col-md-12">' + 
				            '<div class="form-group">' +
				            '<label>Note:</label>' +
				            '<div class="fg-line">' +
				            '<textarea type="text" class="form-control" readonly rows="7">'+data.note+'</textarea>' +
				            '</div>' +
				            '</div>' +
				            '</div>' + 
				            '</div>' + 
				            '</div>' + 
				            '</div>';}
				            
                	}
                });
            },
            buttons: {
                close: {
                    className: 'btn btn-primary btn-lg'
                }
            }
         });
    },
    newCall: function(event){
        event.preventDefault();
        var dom = $(this)[0].dataset;
        var searchbox = bootbox.dialog({
        	style: 'full',
            title: dom.sandboxTitle,
            message: function(){
            	var modal = this;
                globalAjax.htmlRequest({
                	url:dom.sandboxController,
                	dom: modal,
                	data:'patient_id='+dom.sandboxPatientId,
                	callback: function(){
                		//empty for now
                	}
                });
            },
            buttons: {
            	'Submit': {
            		className: 'btn btn-success btn-lg',
            		callback: function(){
            			if (!formVal.noError('modal-form')) {
            				return false;
            			}
            			globalAjax.generalRequest({
							url : $('#modal-form')[0].action,
							datasend : $('#modal-form').serialize(),
							callback : function(data) {
								$.notify({
									message : data.response
									}, {
										type : 'success',
										offset : {
											x : 20,
											y : 85
										},
										onShow : function() {
											window.setTimeout(function(){
												location.reload();
											},260);
										}
									});
								
							}
						});
            		}
            	},
                close: {
                    className: 'btn btn-primary btn-lg'
                }
            }
         });
    }
};
