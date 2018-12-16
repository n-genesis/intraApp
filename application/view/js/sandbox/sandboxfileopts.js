var sandboxFileOpts = {
	changeDirectory : function(event) {
		event.preventDefault();
		globalAjax.htmlRequest({
			dom: $('#file-list'),
			url :'index.php?route=appinfo/filemanager/files',
			data : {directory:event.target.dataset.sandboxFileDirectory},
			callback : function(data) {
				$('[data-sandbox="directory-title"]').html(event.target.dataset.sandboxFileDirectory);
			}
		});
	},
	fileOptions: function(event){
		event.preventDefault();
		var element = $(this);
		var searchbox = bootbox.dialog({
            title: element.find('[data-sandbox-file="name"]').html(),
            message: 'Hello World',
            buttons: {
                close: {
                    className: 'btn btn-primary btn-lg'
                }
            }
         });
	},
	fileMenu: function(event){
		var menu = new BootstrapMenu($(this), {
			menuEvent: 'right-click',
			actions: [{
				name: '<i class="zmdi zmdi-eye"></i> Preview',
				onClick: function() {
					alert("'Action' clicked!");
				}
		    }, {
				name: 'Another action',
				onClick: function() {
					toastr.info("'Another action' clicked!");
				}
		    }, {
				name: 'A third action',
				onClick: function() {
					toastr.info("'A third action' clicked!");
				}
		  }]
		});
	}
};
/**
 * File Manager Operations
 */
$('[data-sandbox-file-manager="directory"]').on('click',sandboxFileOpts.changeDirectory);
$('[data-sandbox-file="select"]').on('click',sandboxFileOpts.fileOptions);
$('[data-sandbox-file="select"]').on('contextmenu',sandboxFileOpts.fileMenu);
$(document).ajaxStop(function() {
  $('[data-sandbox-file="select"]').on('click',sandboxFileOpts.fileOptions);
  $('[data-sandbox-file="select"]').on('contextmenu',sandboxFileOpts.fileMenu);
});
