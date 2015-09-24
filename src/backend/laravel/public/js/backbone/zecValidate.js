// Backbone.ZecValidate v0.1
// (c) 2014 fireburnheart2005@gmai.com
// Distributed Under MIT License

Backbone.ZecValidate = (function(_, $, Backbone) {
  'use strict';

  // Default options
  // ---------------
  var defaultOptions = {formValid:''};
  var defaultCallbacks = {};

  var checkSelect = function(el){
    if(parseInt($(el).val())==0)
      return false;
    else
      return true;
  }

  var Validation = (function() {
    return {
      // Current version of the library
      version: '0.1',
      // Called to configure the default options
      configure: function(options) {
        _.extend(defaultOptions, options);
      },
      setCustomValid: {
        name: '',
        customValid: '',
        mess:''
      },
      addCustomValid: function() {
        $.validator.addMethod(
          Backbone.ZecValidate.setCustomValid.name,
          function(value, element) {
            return Backbone.ZecValidate.setCustomValid.customValid(value, element);
          },
           Backbone.ZecValidate.setCustomValid.mess
        );
      },
      selectChangeValid:function(){
        var select = defaultOptions.select;
        $.each(select,function(i,v){
          $(i).on('change',function(){
            //var valid = checkSelect(this);
            if(parseInt($(this).val())==0)
            {
              $(this).parents('div.col-sm-9').append('<span for="" class="help-block" style="display: block;">'+v+'</span>');
              $(this).parents('div.form-group').addClass('has-error select-error');
            }
            else
            {
                $(this).parents('div.col-sm-9').find('span.help-block').remove();
                $(this).parents('div.form-group').removeClass('has-error select-error');
            }//end if
        })
        });

      },
      selectSubmitValid:function(el,mess){
         if(parseInt($(el).val())==0)
            {
              //$(el).parents('div.col-sm-9').append('<span for="" class="help-block" style="display: block;">'+mess+'</span>');
              $(el).parents('div.form-group').addClass('has-error select-error');
            }
            else
            {
                //$(el).parents('div.col-sm-9').find('span.help-block').remove();
                $(el).parents('div.form-group').removeClass('has-error select-error');
            }//end if
      },
      checkSelectValid:function(el){
         if(el.find('div.select-error').length>0)
          return false;
        else
          return true;
      },
      bind: function(view, options) {

        options = _.extend({}, defaultOptions, defaultCallbacks, options);
        var model = options.model || view.model,
          collection = options.collection || view.collection;
        var select = options.select;
        var formValid = options.formValid;
        console.log(formValid);
        if (typeof model === 'undefined' && typeof collection === 'undefined') {
          throw 'Before you execute the binding your view must have a model or a collection.';
        }
        var customValidation = model.validation ? _.result(model, 'validation')['custom'] || {} : {};
        var rulersValidation = model.validation ? _.result(model, 'validation')['rules'] || {} : {};
        var messagesValidation = model.validation ? _.result(model, 'validation')['messages'] || {} : {};
        model = undefined;

        formValid.validate({
          ignore: '' ,
          rules: rulersValidation,
          messages: messagesValidation,
          highlight: function(element) {
            $(element).closest('.form-group').addClass('has-error');
          },
          unhighlight: function(element) {
            $(element).closest('.form-group').removeClass('has-error');
          },
          errorElement: 'span',
          errorClass: 'help-block',
          errorPlacement: function(error, element) {
            if (element.parent('.input-group').length) {
              error.insertAfter(element.parent());
            } else {
              error.insertAfter(element);
            }
          }
        });


        var result = formValid.valid();

        /*
        if(!_.isEmpty(select))
        {

          $.each(select,function(i,v){
            Validation.selectSubmitValid(i,v);
          })
          result = Validation.checkSelectValid(formValid);

        }
        */
        return result;

      },
    };
  }());
  return Validation;
}(_, $, Backbone));