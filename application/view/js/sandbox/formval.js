/**
 * @author andrewnite
 */
var formVal = {
    noError: function(formElement,callback){
        formVal.updatefields(formElement);
        var form = (formElement instanceof jQuery?formElement[0]:document.getElementById(formElement));
        var formElements = form.elements;
        var error = false;
        for (var i=0; i < formElements.length; i++) {
          if(formElements[i].tagName != 'BUTTON' && formElements[i].value.trim() == '' && formElements[i].dataset.sandboxValidate == 'true'){
              formElements[i].parentNode.setAttribute('class',formElements[i].parentNode.className+' has-error');
              error = true;
          }
        }
        if(error == true){
            return false;
        }else{
            if(typeof callback === 'function'){
                callback(formElements);
            }
        }
        return true;
    },
    updatefields: function(formElement){
        var formElement = (formElement instanceof jQuery?formElement[0]:document.getElementById(formElement));
        formElement.addEventListener('input',function(){
            for (var i=0; i < formElement.elements.length; i++) {
              if(formElement[i].tagName != 'BUTTON' && formElement[i].value.trim() != ''){
                  formElement[i].parentNode.setAttribute('class','form-group');
              }
              
            }
        });
    }
};
