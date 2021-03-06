<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lichao
  Date: 2016/8/25
  Time: 12:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    //以下为修改jQuery Validation插件兼容Bootstrap的方法，没有直接写在插件中是为了便于插件升级
    $.validator.setDefaults({
        highlight: function (element) {
            $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
        },
        success: function (element) {
            element.closest('.form-group').removeClass('has-error').addClass('has-success');
        },
        errorElement: "span",
        errorPlacement: function (error, element) {
            if (element.is(":radio") || element.is(":checkbox")) {
                error.appendTo(element.parent().parent().parent());
            } else {
                error.appendTo(element.parent());
            }
        },
        errorClass: "help-block m-b-none m-t-xs",
        validClass: "help-block m-b-none m-t-none"


    });

    //以下为官方示例
    $(function () {
        var icon = "<i class='fa fa-times-circle'></i> ";
        $(top.document).find(".chosen-select:not([name='searchComp'])").chosen();
        var comId = $(top.document).find(".chosen-select").find("option:selected").val();//选中的文本
        $(top.document).find("#comId").val(comId);
        $.validator.addMethod("checkUnique", function(value, element) {
            var orgName = $(top.document).find('#orgName').val();
            var comId = $(top.document).find('#comId').val();
            var deferred = $.Deferred();
            if("${org.orgName}" == $(top.document).find("#orgName").val()){
                //deferred.state()有3个状态:pending:还未结束,rejected:失败,resolved:成功
                deferred.resolve();
            }else{
                $.ajax({
                    url:_platform+'/org/checknode',
                    type:'POST',
                    async:false,//要指定不能异步,必须等待后台服务校验完成再执行后续代码
                    data: {orgName:orgName,comId:comId},
                    dataType: 'json',
                    success:function(result) {
                        //alert(result.flag);
                        //return false;
                        if (!result.flag) {
                            deferred.reject();
                        } else {
                            deferred.resolve();
                        }
                    }
                });
            }
            //deferred.state()有3个状态:pending:还未结束,rejected:失败,resolved:成功
            return deferred.state() == "resolved" ? true : false;
        }, "机构名称已存在");

        //提示信息绑定
        $('input:not(:submit):not(:button)').mousedown(function () {
            $(this).closest('.form-group').removeClass('has-error');
            $(this).siblings('.help-block').remove();
        });
        //下拉框信息绑定
        $('select').change(function () {
            if($(this).find('option:first').val()!=$(this).val()){
                $(this).siblings('.help-block').remove();
            }
            return false;
        });
        // validate signup form on keyup and submit

        $(top.document).find("#orgTreeEditForm").validate({
            onsubmit:true,// 是否在提交是验证
            //移开光标:如果有内容,则进行验证
        onfocusout: function (element) {
            if ($(element).val()==null||$(element).val()=="") {
                $(element).closest('.form-group').removeClass('has-error');
                $(element).siblings('.help-block').remove();
            }else{
                $(element).valid();
            }
        },
        onkeyup :false,// 是否在敲击键盘时验证
                rules: {
            orgName: {
                required: true,
                        minlength: 2,
                        checkUnique: true
            }
        },
        messages: {
            orgName: {
                required: icon + "请输入机构名称",
                        minlength: icon + "机构名称必须2个字符以上"
            }
        },
        submitHandler:function(){

            var index = top.layer.load(1, {
                shade: [0.1,'#fff'] //0.1透明度的白色背景
            });
            var data = $(top.document).find('#orgTreeEditForm').serialize();
            //alert(data);
            $.ajax({
                    url:_platform + '/org/tree/edit',
                    data:$(top.document).find('#orgTreeEditForm').serialize(),
                    type:'post',
                    dataType:'json',
                    success:function(result) {

                        //alert(result.flag);
                        if(result.flag){
                            top.layer.closeAll();
                            top.layer.msg(result.msg);
                            ztreeValue();
                        }else{
                            top.layer.close(index);
                            top.layer.msg(result.msg);
                        }
            }
        });
    }
    });
  });
</script>
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-sm-12">
            <form class="form-horizontal" id="orgTreeEditForm" role="form">
                <input type="hidden" name="id" value="${id}">
                <input id="comId" name="comId" type="hidden" class="class-comid" value="">
                <input type="hidden" name="orgNameOld" id="orgNameOld" value="${org.orgName}">

                <div class="form-group">
                    <label class="col-sm-3  control-label"><span class="red">*</span>机构名称：</label>
                    <div class="col-sm-8">
                        <input id="orgName" name="orgName" value="${org.orgName}" class="form-control orgNameID" type="text" maxlength="8" placeholder="请输入机构名称">
                        <input id="pOrgId" name="pOrgId" type="hidden" class="class-comid" value="${org.pOrgId}">
                    </div>
                </div>

            </form>
        </div>
    </div>
</div>
