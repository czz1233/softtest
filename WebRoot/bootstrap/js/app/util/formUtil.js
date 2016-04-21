/*
 * 工具类
 */
define(function(require, exports, moudle) {
	moudle.exports = {
			getFormDataObj:function(formId){
				var paramArray = $("#" + formId).serializeArray();
				var param = {};
				if(paramArray && paramArray instanceof Array){
					$(paramArray).each(function(){
						param[this.name] = this.value;
					});
				}
				return param;
			},
			validateForm:function(formID,rules,messages){
				var form = {};
				
				if(formID instanceof jQuery){
					form = formID;
				}else{
					form = $("#" + formID);
				}
				if(form.length == 0) return false;
				var validator = form.validate({
			        errorElement: 'span',
			        errorClass: 'help-block',
			        focusInvalid: false,
			        ignore: "",
			        highlight: function (element) { 
			        	$(element).closest('.form-group').addClass('has-error'); 
			            return false;
			        },
			        success: function (label,element) {
			        		$(element).closest('.form-group').removeClass('has-error');
			        		$(element).next("i").removeClass('ace-icon');
			        		$(element).next("i").removeClass('fa');
			        		$(element).next("i").removeClass('fa-times-circle');
			        		$(element).next("i").removeClass('red');
			        		$(element).next("i").removeClass('tooltip-error');
			        		$(element).next("i").removeAttr("data-rel");
			        		$(element).next("i").removeAttr("title");
			        		$(element).next("i").removeAttr("data-original-title");
			        },
			        errorPlacement: function (error, element) {
			        	if(error != null && error.html() != null && error.html() != "" ){
				        	if(element.next("i").length > 0){
				        		element.next("i").attr("title",error.html());
				        		if(!element.next("i").hasClass("ace-icon")){
				        			element.next("i").addClass("ace-icon");
				        		}
				        		if(!element.next("i").hasClass("fa")){
				        			element.next("i").addClass("fa");
				        		}
				        		if(!element.next("i").hasClass("fa-times-circle")){
				        			element.next("i").addClass("fa-times-circle");
				        		}
				        		if(!element.next("i").hasClass("red")){
				        			element.next("i").addClass("red");
				        		}
				        		if(!element.next("i").hasClass("tooltip-error")){
				        			element.next("i").addClass("tooltip-error");
				        		}
				        		$(element).next("i").attr("data-rel","tooltip");
				        		$(element).next("i").attr("data-original-title",error.html());
				        		$('[data-rel=tooltip]').tooltip();
				        	}else{
				        		$(element).wrap("<span class='block input-icon input-icon-right'></span>");
				        		$(element).after("<i class='ace-icon fa fa-times-circle red tooltip-error' data-rel='tooltip' data-placement='left' title='" + error.html() +"'></span>");
					        	//$(element).before("<span class='block input-icon input-icon-right'>");
					        	//$(element).after("<i class='icon-remove-sign red tooltip-error' data-rel='tooltip' data-placement='left' title='" + error.html() +"'></i></span>");
					        	$('[data-rel=tooltip]').tooltip();
				        	}
			        	}
			        },
			        rules:rules,
			        messages:messages
			    });
				return validator;
			},
			getFormDataObj:function(formId){
				var paramArray = $("#" + formId).serializeArray();
				var param = {};
				if(paramArray && paramArray instanceof Array){
					$(paramArray).each(function(){
						param[this.name] = this.value;
					});
				}
				return param;
			}
	}
});
