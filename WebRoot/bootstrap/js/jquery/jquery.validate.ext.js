/**
 * <pre>
 * 扩展jqueryvalidate 的验证方法
 * </pre>
 */

jQuery.extend(jQuery.validator.messages, {  
      required: "请输入信息",  
      remote: "请修正该字段",  
      email: "请输入正确格式的电子邮件",  
      url: "请输入合法的网址",  
      date: "请输入合法的日期",  
      dateISO: "请输入合法的日期 (ISO).",  
      number: "请输入合法的数字",  
      digits: "请输入整数",  
      creditcard: "请输入合法的信用卡号",  
      equalTo: "请再次输入相同的值",  
      accept: "请输入拥有合法后缀名的字符串",  
      maxlength: jQuery.validator.format("长度最多是 {0}"),  
      minlength: jQuery.validator.format("长度最少是 {0}"),  
      rangelength: jQuery.validator.format("长度介于 {0} 和 {1}"),  
      range: jQuery.validator.format("介于 {0} 和 {1} 之间的值"),  
      max: jQuery.validator.format("最大为 {0} 的值"),  
      min: jQuery.validator.format("最小为 {0} 的值")  
    });  




// 验证值为整数或者两位小数
jQuery.validator.addMethod("intOrFloat", function(value, element) {
	var decimal = /^[0-9]+([.]{1}[0-9]{1,2})?$/;
	return this.optional(element) || (decimal.test(value));
}, $.validator.format("请输入整数或者两位小数"));
// 验证值为数字或者英文
jQuery.validator.addMethod("intOrchar", function(value, element) {
	var decimal = /^[A-Za-z0-9]+$/;
	return this.optional(element) || (decimal.test(value));
}, $.validator.format("请输入数字或者字母"));
// 只能输入一个大写英文字符
jQuery.validator.addMethod("firstchar", function(value, element) {
	var decimal = /^[A-Z]{1}$/;
	return this.optional(element) || (decimal.test(value));
}, $.validator.format("输入一个大写英文字符"));
// 验证值不能包含特殊字符
jQuery.validator.addMethod("charVal", function(value, element) {
	var decimal = /^[^\?!#\$%\^&\*\(\)]*$/;
	return this.optional(element) || (decimal.test(value));
}, $.validator.format("请不要输入特殊字符"));
jQuery.validator.addMethod("fileRemarkExp", function(value, element) {
	var decimal = /^[,:]*$/;
	return this.optional(element) || (decimal.test(value)) ;
}, $.validator.format("备注中请不要包含英文逗号、冒号,:"));
// 验证后缀(不区分大小写)
jQuery.validator.addMethod("suffix", function(value, element, params) {
	if (this.optional(element)) {
		return true;
	}
	value = (value + "").toLowerCase();
	for (var i = 0, l = params.length; i < l; i++) {
		var suffix = params[i];
		if (value.length < suffix.length) {
			continue;
		}
		if ((suffix + "").toLowerCase() == value.substring(value.length - suffix.length)) {
			return true;
		}
	}
	return false;
}, $.validator.format("后缀不正确"));
// 验证下拉框已选择
jQuery.validator.addMethod("selected", function(value, element, param) {
	return this.optional(element) || !param || (value != "-1");
}, $.validator.format("请选择"));
//验证值为整数
jQuery.validator.addMethod("integer", function(value, element) {
	var decimal = /^(0|([1-9]\d*))$/;
	return this.optional(element) || (decimal.test(value));
}, $.validator.format("请输入整数"));
//验证值手机号码
jQuery.validator.addMethod("mobile", function(value, element) {
	var decimal = /^(13|15|18)\d{9}$/;
	return this.optional(element) || (decimal.test(value));
}, $.validator.format("请输入正确的手机号码"));
//验证值为电子邮箱
jQuery.validator.addMethod("email", function(value, element) {
	var decimal = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
	return this.optional(element) || (decimal.test(value));
}, $.validator.format("请输入正确的电子邮箱"));
//验证不能包含中文，且必须以英文字母开始/^[a-zA-Z][^\u3400-\u9FFF]*$/
jQuery.validator.addMethod("nochinese", function(value, element) {
	var decimal = /^[0-9a-zA-Z][^\u3400-\u9FFF]*$/;
	return this.optional(element) || (decimal.test(value));
}, $.validator.format("不能包含中文"));
jQuery.validator.addMethod("dateAfter", function(value, element) {
	var today = new Date();
	var cur_date = new Date(value);
	var result = false;
	// 选择的下次缴费日期，晚于当天日期
	if(cur_date.getFullYear() >= today.getFullYear() && cur_date.getMonth() >= today.getMonth() && cur_date.getDate() >= today.getDate()) {
		result = true;
	}
	return this.optional(element) || result;
}, $.validator.format("下次缴费时间大于当前日期"));
jQuery.validator.addMethod("ip", function(value, element) {
	var ipExp = /^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/;
	return this.optional(element) || (ipExp.test(value));
}, $.validator.format("请填写正确的IP地址"));
jQuery.validator.addMethod("add_host_ip", function(value, element) {
	if(value == null || '' == value) {
		return false;
	} else {
		return true;
	}
}, $.validator.format("IP地址为空，不能添加主机"));
//验证电子邮箱是否已经被使用
jQuery.validator.addMethod("checkUserName", function(value, element) {
	var result = false;
	$.ajax({
		url: basePath + 'tenant/checkUserName.html',
		data: {userName: value},
		dataType: "json",
		type: "GET",
		async: false,
		success: function(data){
			// 未被使用，则返回true
			if (data.notused) {
				result = true;
			}
		}
	});
	return result;
}, $.validator.format("账号已经注册"));
jQuery.validator.addMethod("file", function(value, element) {
	if(value == '') {
		return false;
	} else {
		return true;
	}
}, $.validator.format("请选择上传文件"));
/*jQuery("#form1").validate({
    focusInvalid:false,
    rules:{
        "timeStart":{
            required: true
        },
        "timeEnd": {
            required: true,
            compareDate: "#timeStart"
        }
    },
    messages:{
        "timeStart":{
            required: "开始时间不能为空"
        },
        "timeEnd":{
            required: "结束时间不能为空",
            compareDate: "结束日期必须大于开始日期!"
        }
    }
});*/
jQuery.validator.addMethod("compareDate", function(value, element, param) {
	
	var result = false;
	var startDate = $(param).val();
	
    var date1 = new Date(Date.parse(startDate.replace(/-/g, "/")));
    var date2 = new Date(Date.parse(value.replace(/-/g, "/")));
    
    if(date1 < date2){
    	result = true;
    }
	return result;
}, $.validator.format("结束日期必须大于开始日期"));
