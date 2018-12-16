/**
 * @author andrewnite
 */
//Page loader for visual effect
$(window).load(function() {
	$(".page-loader")[0] && setTimeout(function() {
		$(".page-loader").fadeOut();
	}, 500);
});
//Tab function
$('[data-sandbox-button="tag"]').on('click',function(event){
	event.preventDefault();
	$('.tab-nav a[href="'+$(this).attr('href')+'"]').tab('show');
});

//Change tab by URL query e.g. (#tab-2)
var hash = window.location.hash;
$('.tab-nav a[href="' + hash + '"]').tab('show');

  
$(function(){
/*Login Operations*/
$('[data-sandbox-form="login"]').on('submit',sandboxOpts.logIn);

//Update patient info
$('[data-sandbox-update="patient"]').on('submit',sandboxOpts.updatePatientInfo);

//Update insurance
$('[data-sandbox-update="insurance"]').on('submit',sandboxOpts.updateInsurance);
//Search Insurance
$('[data-sandbox-search="insurance"]').on('submit',sandboxOpts.searchInsurance);
//Delete insurance
$('[data-sandbox-remove="insurance"]').on('click',sandboxOpts.removePatientInsurance);
//Make primary holder
$('[data-sandbox-policy="primary"]').on('click',sandboxOpts.makePrimaryHolder);
//update holder
$('[data-sandbox-update="policy"]').on('submit',sandboxOpts.updateHolderDate);
//Change primary holder
$('[data-sandbox-policy="change"]').on('click',sandboxModal.changePolicyHolder);
//Remove policy holder
$('[data-sandbox-policy="remove"]').on('click',sandboxOpts.removePolicy);
//Remove policy holder
$('[data-sandbox-policy="new-claim"]').on('click',sandboxModal.newClaim);
//View Claim
$('[data-sandbox-view="claim"]').on('click',sandboxModal.viewClaim);
//Delete claim
$('[data-sandbox-delete="claim"]').on('click',sandboxOpts.deleteClaim);

//Edit Employer
$('[data-sandbox-update="employer"]').on('submit',sandboxOpts.updateEmployer);
//Search Employer
$('[data-sandbox-search="employer"]').on('submit',sandboxOpts.searchEmployer);
//Remove employer
$('[data-sandbox-remove="employer"]').on('click',sandboxOpts.removePatientEmployer);

//Update Record
$('[data-sandbox-update="record"]').on('submit',sandboxOpts.updateRecord);
//Change Profile Status
$('[data-sandbox-change="status"]').on('click',sandboxOpts.changeStatus);

//New Profile
$('#new-profile').on('submit',function(event){
	event.preventDefault();
	if(!formVal.noError($(this))) {
		console.log('active');
		return false;
	}else{
		event.target.submit();
	}
});

//View Note
$('[data-sandbox-view="note"]').on('click',sandboxModal.viewNote);
//New Note
$('[data-sandbox-new="note"]').on('click',sandboxModal.newNote);
//Delete Note
$('[data-sandbox-delete="note"]').on('click',sandboxOpts.deleteItem);

//View Call
$('[data-sandbox-view="call"]').on('click',sandboxModal.viewCall);
//New Call
$('[data-sandbox-new="call"]').on('click',sandboxModal.newCall);
//Delete Call
$('[data-sandbox-delete="call"]').on('click',sandboxOpts.deleteItem);

});

