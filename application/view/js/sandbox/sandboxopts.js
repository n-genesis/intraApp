var sandboxOpts = {
	logIn : function(event) {
		event.preventDefault();
		if (!$('[data-sandbox-user="default"]').is(':focus')) {
			if (!formVal.noError($(this))) {
				return false;
			}
		}

		globalAjax.generalRequest({
			url : event.target.action,
			datasend : (!$('[data-sandbox-user="default"]').is(':focus') ? $(event.target).serialize() : null),
			callback : function(data) {
				$.notify({
					message : data.response
				}, {
					type : 'info',
					onShow : function() {
						window.location.href = data.location;
					}
				});
			}
		});
	},
	updatePatientInfo : function(event) {
		event.preventDefault();
		if (!formVal.noError($(this))) {
			return false;
		}
		var dom = $(this)[0];
		globalAjax.generalRequest({
			url : event.target.action,
			datasend : $(event.target).serialize(),
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
						html5Audio.audioPlay('success');
					}
				});
			}
		});
	},
	updateInsurance : function(event) {
		event.preventDefault();
		var dom = event.target;
		if (!formVal.noError($(this))) {
			return false;
		}
		//Change to information tab
		$('.tab-nav a[href="#tab-1"]').tab('show');
		globalAjax.generalRequest({
			url : dom.action,
			datasend : $(dom).serialize(),
			callback : function(data) {
				if(data.action == 'new'){
					$('#insurance-insurance_id').val(data.insurance_id);
					$.notify({
						message : data.response
					}, {
						type : 'success',
						offset : {
							x : 20,
							y : 85
						},
						onShow : function() {
							html5Audio.audioPlay('success');
						}
					});
				}else if(data.action == 'exists'){
					swal({
						title : data.title,
						text : data.response,
						html: true,
						type : "info",
						showCancelButton : true,
						confirmButtonText : "Yes, update info",
						closeOnConfirm : true
					}, function() {
						globalAjax.generalRequest({
							url : data.controller,
							datasend : $(dom).serialize(),
							callback : function(data_2) {
								$('#insurance-insurance_id').val(data_2.insurance_id);
								$.notify({
									message : data_2.response
								}, {
									type : 'success',
									offset : {
										x : 20,
										y : 85
									},
									onShow : function() {
										html5Audio.audioPlay('success');
									}
								});
							}
						});
						//$('[data-sandbox-update="insurance"]').trigger('submit');
					});
				}
			}
		});
	},
	searchInsurance : function(event) {
		event.preventDefault();
		var dom = event.target;
		globalAjax.generalRequest({
			url : dom.action,
			datasend : $(dom).serialize(),
			callback : function(data) {
				if (data.action == 'found') {
					swal({
						title : data.insure_data.name,
						text : data.response,
						html: true,
						type : "success",
						showCancelButton : true,
						confirmButtonText : "Confirm",
						closeOnConfirm : true
					}, function() {
						var i = 1;
						for (var value in data.insure_data) {
							var element = 'insurance-' + value + '';
							$('#' + element).val(data.insure_data[value]);
							i++;
						};
						$('#insurance-insurance_id').val(data.insure_data.insurance_id);
						//Clear shear form
						$('#patient-search-form')[0].reset();
						$('.tab-nav a[href="#tab-1"]').tab('show');
						$('[data-sandbox-update="insurance"]').trigger('submit');

					});
				}else if(data.action == 'notfound'){
					$.notify({
						message : data.response
					}, {
						type : 'info',
						offset : {
							x : 20,
							y : 85
						}
					});
				}
			}
		});
	},
	removePatientInsurance : function(event) {
		event.preventDefault();
		var dom = event.target;
		var form = document.getElementById(dom.dataset.sandboxForm);
		var formElements = form.elements;
		
		globalAjax.generalRequest({
			url : dom.dataset.sandboxController,
			datasend : $(form).serialize(),
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
						html5Audio.audioPlay('success');
					}
				});

			}
		});
		for (var i = 0; i < formElements.length; i++) {
			if (formElements[i].tagName != 'BUTTON' && formElements[i].name != 'patient_id') {
				formElements[i].value = '';
			}
		}
	},
	makePrimaryHolder : function(event) {
		event.preventDefault();
		var dom = $(this)[0];
		globalAjax.generalRequest({
			url : dom.dataset.sandboxController,
			datasend : 'patient_id='+dom.dataset.sandboxPatientId+'&insurance_id='+dom.dataset.sandboxPatientId,
			callback : function(data) {
				$('#holder-name').val(data.form_data.first_name+' '+data.form_data.last_name);
				$('#holder-dob').val(data.form_data.dob);
				$('#holder-ssn').val(data.form_data.ssn);
				$('#holder-date').val(data.form_data.policy_eff_date).removeAttr('readonly');
				$('#policy-date-btn').removeClass('hidden');
				$('#new-policy-claim').attr('data-sandbox-policy-holder-id',data.form_data.patient_id);
				$('#claims-list').attr('data-sandbox-policy-id',data.form_data.patient_id);
				$.notify({
					message : data.response
				}, {
					type : 'success',
					offset : {
						x : 20,
						y : 85
					},
					onShow : function() {
						html5Audio.audioPlay('success');
						globalAjax.htmlRequest({
							url:'index.php?route=profile/profile_insurance_policy/claimsajax',
							data: 'policy_holder_id='+$('#claims-list').data('sandbox-policy-id'),
							dom: $('#claims-list'),
							callback: function(){
								window.setTimeout(function(){
									location.reload();
								},200);
								
							}
						});
					}
				});
			}
		});
	},
	updateHolderDate : function(event) {
		event.preventDefault();
		if (!formVal.noError($(this))) {
			return false;
		}
		var form = event.target;
		globalAjax.generalRequest({
			url : form.action,
			datasend : $(event.target).serialize(),
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
						html5Audio.audioPlay('success');
					}
				});
			}
		});
	},
	removePolicy : function(event) {
		event.preventDefault();
		var dom = event.target;
		globalAjax.generalRequest({
			url : dom.dataset.sandboxController,
			datasend : 'patient_id='+dom.dataset.sandboxPatientId,
			callback : function(data) {
				$('#holder-name').val('');
				$('#holder-dob').val('');
				$('#holder-ssn').val('');
				$('#holder-date').val('').attr('readonly');
				$('#policy-date-btn').addClass('hidden');
				$('#new-policy-claim').attr('data-sandbox-policy-holder-id','');
				$('#claims-list').attr('data-sandbox-policy-id','');
				$.notify({
					message : data.response
				}, {
					type : 'success',
					offset : {
						x : 20,
						y : 85
					},
					onShow : function() {
						html5Audio.audioPlay('success');
						globalAjax.htmlRequest({
							url:'index.php?route=profile/profile_insurance_policy/claimsajax',
							data: 'policy_holder_id='+$('#claims-list').data('sandbox-policy-id'),
							dom: $('#claims-list'),
							callback: function(){
								
							}
						});
					}
				});
			}
		});
	},
	deleteClaim : function(event) {
		event.preventDefault();
		var dom = $(this)[0];
		globalAjax.generalRequest({
			url : dom.dataset.sandboxController,
			datasend : 'claim_id='+dom.dataset.sandboxClaimId,
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
						html5Audio.audioPlay('success');
						globalAjax.htmlRequest({
							url:'index.php?route=profile/profile_insurance_policy/claimsajax',
							data: 'policy_holder_id='+$('#claims-list').data('sandbox-policy-id'),
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
	},
	updateEmployer : function(event) {
		event.preventDefault();
		var dom = event.target;
		//Change to information tab
		$('.tab-nav a[href="#tab-1"]').tab('show');
		globalAjax.generalRequest({
			url : dom.action,
			datasend : $(dom).serialize(),
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
						html5Audio.audioPlay('success');
						var i = 1;
						for (var value in data.employer_data) {
							var element = 'employer-' + value + '';
							$('#' + element).val(data.employer_data[value]);
							i++;
						};
					}
				});
			}
		});
	},
	searchEmployer : function(event) {
		event.preventDefault();
		var dom = event.target;
		globalAjax.generalRequest({
			url : dom.action,
			datasend : $(dom).serialize(),
			callback : function(data) {
				if (data.action == 'found') {
					swal({
						title : data.employer_data.name,
						text : data.response,
						html: true,
						type : "success",
						showCancelButton : true,
						confirmButtonText : "Confirm",
						closeOnConfirm : true
					}, function() {
						var i = 1;
						for (var value in data.employer_data) {
							var element = 'employer-' + value + '';
							$('#' + element).val(data.employer_data[value]);
							i++;
						};
						$('#employer_id').val(data.employer_data.employer_id);
						//Clear shear form
						$('.tab-nav a[href="#tab-1"]').tab('show');
						$('#emploryer-search-form')[0].reset();
						$('[data-sandbox-update="employer"]').trigger('submit');
					});
				}
			}
		});
	},
	removePatientEmployer : function(event) {
		event.preventDefault();
		var dom = event.target;
		var form = document.getElementById(dom.dataset.sandboxForm);
		var formElements = form.elements;
		
		globalAjax.generalRequest({
			url : dom.dataset.sandboxController,
			datasend : $(form).serialize(),
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
						html5Audio.audioPlay('success');
					}
				});

			}
		});
		for (var i = 0; i < formElements.length; i++) {
			if (formElements[i].tagName != 'BUTTON' && formElements[i].name != 'patient_id') {
				formElements[i].value = '';
			}
		}
	},
	updateRecord : function(event) {
		event.preventDefault();
		var dom = event.target;
		globalAjax.generalRequest({
			url : dom.action,
			datasend : $(dom).serialize(),
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
						html5Audio.audioPlay('success');
					}
				});
			}
		});
	},
	/**
	 * ***************************************************************
	 * **********NEED TO CHANGE OPERATION AFTER DELETE****************
	 * ***************************************************************
	 */
	deleteItem : function(event) {
		event.preventDefault();
		var parent = $(this).parents('tr');
		var dom = $(this)[0].dataset;
		globalAjax.generalRequest({
			url : dom.sandboxController,
			datasend : 'item_id='+dom.sandboxId,
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
						parent.fadeOut();
					}
				});

			}
		});
	},
	changeStatus: function(event){
		event.preventDefault();
		var dataSet = $(this)[0].dataset;
		var status = $(event.target).not('li')[0];
		if (typeof status != 'undefined') {
		globalAjax.generalRequest({
			url : dataSet.sandboxController,
			datasend :'patient_id='+dataSet.sandboxId+'&status_id='+status.dataset.sandboxStatus,
			callback : function(data) {
				$(".ajax-loader").show();
				$.notify({
					message : data.response
				}, {
					type : 'success',
					offset : {
						x : 20,
						y : 85
					},
					onShow : function() {
						$('[data-alert="system"]').html(data.html);
						html5Audio.audioPlay('success');
					}
				});

			}
		});
		}
	}
};
