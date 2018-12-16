var globalAjax = {
    /*General request*/
    generalRequest : function(parameters) {
        $.ajax({
            type : 'POST',
            url : parameters.url,
            dataType: 'json',
            data : parameters.datasend,
            cache : false,
            beforeSend : function() {
                $(".ajax-loader").fadeIn();
            }
        }).fail(function(jqXHR, textStatus, errorThrown) {
        	$.notify({
				message: 'Unable to complete request.' 
			},{
				type: 'danger',
				onShow:function(){
					html5Audio.audioPlay('ding');
				}
			});
			$(".ajax-loader").fadeOut();
        }).done(function(data) {
            if (data.status == 'true') {
                //method callback action
                if (typeof parameters.callback === 'function') {
                    parameters.callback(data);
                };
            }else if(data.status == 'false'){
                $.notify({
				message: data.response 
				},{
					type: 'danger',
					onShow:function(){
						html5Audio.audioPlay('ding');
					}
				});             
            }else{
            	swal({
					title : "System Error",
					text : 'A reponse was given that does not compute. Please try again',
					type : "warning"
				});
            };
            $(".ajax-loader").fadeOut();
        }); 

    },
    htmlRequest : function(parameter) {
        $.ajax({
            type : (typeof parameter.type != 'undefined'?parameter.type :'POST'),
            url : parameter.url,
            dataType: 'html',
            data : (typeof parameter.data != 'undefined'?parameter.data :''),
            cache : false,
            beforeSend : function() {
                var loader = '<div class="preloader pl-xxl"><svg class="pl-circular" viewBox="25 25 50 50"><circle class="plc-path" cx="50" cy="50" r="20"/></svg>';
                //Loading
                (parameter.dom instanceof jQuery?parameter.dom.html(loader):parameter.dom.innerHTML = loader);
            }
        }).fail(function() {
        	$.notify({
				message: 'Unable to complete request. Please try again' 
			},{
				type: 'danger'
			});
        }).done(function(data) {
            if ( typeof parameter.callback === 'function') {
                parameter.callback(data);
            };
            (parameter.dom instanceof jQuery?parameter.dom.html(data):parameter.dom.innerHTML = data);
        });
    }
}; 

