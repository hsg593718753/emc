$(function () {
	//用户列表
	var userTable = $('#user-table-list').bootstrapTable({
		height: getHeight() + 30,//高度
        cache: false,//禁用 AJAX 数据缓存
        url: _platform + '/user/list',//获取数据的Servlet地址
        method: 'post',//使用POST请求到服务器获取数据
        contentType: "application/x-www-form-urlencoded",
        dataType: "json",
        idField: "ID",
        pagination: true,//是否分页
        pageSize: 10,//每页显示的记录数
        pageNumber: 1,//当前第几页
        pageList: [10, 30, 50],//记录数可选列表
        search: false,  //是否启用查询
        striped: true,//表格显示条纹
        //showColumns: false,//不显示隐藏列
        sidePagination: "server", //服务端请求
        //设置为undefined可以获取pageNumber，pageSize，searchText，sortName，sortOrder
        //设置为limit可以获取limit, offset, search, sort, order
        queryParamsType: "undefined",
        queryParams: function queryParams(params) {
            var param = {
                _method: "PATCH",
                pageNumber: params.pageNumber,
                pageSize: params.pageSize
            };
            formsParam(param,'user-form',true);
            return param;
        }, formatLoadingMessage: function () {
            return "请稍等，正在加载中...";
        },
        responseHandler: function (res) {
            return {
                "rows": res.list.list,
                "total": res.list.page.total
            };
        },
        columns: [
            {
                field: 'id', title: 'ID', visible: false
            },
            {
                checkbox: true
            },
            {
                title: '序号',
                field: 'sn',
                align: 'center',
                formatter:function(value,row,index){
                    return index+1;
                }
            },
            {
                title: '用户名称',
                field: 'userName',
                align: 'center'
            },
            {
                title: '登录账号',
                field: 'login',
                align: 'center'
            },
            {
                title: '联系电话',
                field: 'mobile',
                align: 'center'
            },
            {
                title: '电子邮箱',
                field: 'mail',
                align: 'center'
            },
            {
                title: '使用状态',
                field: 'useStatus',
                align: 'center',
                formatter:function(value,row,index){
                    if(value=="0"){
                    	return "启用";
                    }else if(value="1"){
                    	return "禁用";
                    }
                }
            },
            {
                title: '备注',
                field: 'memo',
                align: 'center',
                formatter:function(value,row,index){
                    if(value.length>20){
                        return '<span title="'+value+'">'+value.substr(0,20)+'</span>';
                    }
                    return value;
                }
            },
            {
                title: '操作',
                field: 'opt',
                align: 'center' ,
                formatter:function(value,row,index){
                    return '<a title="编辑" class="btn btn-xs btn-info top-layer-min" layer-form-id="userEditForm" layer-title="编辑用户" layer-url="'+_platform+'/user/edit/'+row.id+'" > <i class="fa fa-edit"></i></a>&nbsp;' +
                        '<a title="删除" class="btn btn-xs btn-danger" onclick="deleteUser(&quot;'+row.id+'&quot;)"><i class="fa fa-trash-o"></i></a>&nbsp;' +
                        '<a title="授权权限" class="btn btn-xs btn-warning" onclick="roleAuthPage()"><i class="fa fa-wrench"></i></a>';
                }
            }

        ]
	});
	//初始化日期控件
	initDateBox(['cStartTime','cEndTime','lStartTime','lEndTime']);
});

/**
 * 初始化日期框
 * @param ids
 */
function initDateBox(ids){
	if(ids!=null&&ids.length>0){
		for(var index in ids){
			if(!isNaN(index)){
				var id = ids[index];
				var datebox = {
			        elem: '#'+id,
			        format: 'YYYY-MM-DD hh:mm:ss',
			        max: '2099-06-16 23:59:59',
			        istime: true,
			        istoday: false,
			        choose: function (datas) {
//			            start.max = datas; //结束日选好后，重置开始日的最大日期
			        }
			    };
			    laydate(datebox);
			}
		}
	}
}
/**
 * 点击“搜索”按钮事件
 */
function searchUser(){
	$('#user-table-list').bootstrapTable('refresh');
}

/**
 * 获取页面表单中的input和select元素的name和value，并放入param对象中
 * @param param form请求参数对象
 * @param formId form表单id
 * @param isVisible 是否只获取可见元素
 */
function formsParam(param,formId,isVisible){
	var paramStr="";
	var forms=null;
	if(isVisible){
		forms = $('#'+formId+' input:visible');
		forms.push($('#'+formId+' select:visible'));
	}else{
		forms = $('#'+formId+' input');
		forms.push($('#'+formId+' select'));
	}
    for(var i in forms){
    	if(!isNaN(i)){
    		var k = $(forms[i]).attr("name");
    		var v = $(forms[i]).val();
    		param[k] = v;
    		paramStr+=k+"="+v+"&";
    	}
    }
    return paramStr.substring(0,paramStr.length-1);
}

/**
 * 重置密码
 */
function resetPassword() {
	var ids = getCheckedIds();
	if(ids.length==0){
		layer.msg("请选择要重置密码的用户");
        return false;
	}
    var index = layer.load(1, {
        shade: [0.1, '#fff'] //0.1透明度的白色背景
    });
    $.ajax({
        url: _platform + '/user/reset/pwd',
        timeout: 5000,
        type: 'POST',
        dataType: 'json',
        data: {ids: ids.join()},
        success: function (result) {
            layer.close(index);
            $('#user-table-list').bootstrapTable("refresh");
            layer.msg(result.msg);
        },
        error: function () {
            layer.close(index);
            layer.msg("重置密码失败");
        },
        complete: function (XMLHttpRequest, status) { //请求完成后最终执行参数
            layer.close(index);
            if (status == 'timeout') {//超时,status还有success,error等值的情况
                layer.msg("请求超时");
            }
        }
    });
}

/**
 * 禁用
 */
function disableUser() {
	var ids = getCheckedIds();
	if(ids.length==0){
		layer.msg("请选择要禁用的用户");
        return false;
	}
    var index = layer.load(1, {
        shade: [0.1, '#fff'] //0.1透明度的白色背景
    });
    $.ajax({
        url: _platform + '/user/status/1',
        timeout: 5000,
        type: 'POST',
        dataType: 'json',
        data: {ids: ids.join()},
        success: function (result) {
            layer.close(index);
            $('#user-table-list').bootstrapTable("refresh");
            layer.msg(result.msg);
        },
        error: function () {
            layer.close(index);
            layer.msg("禁用失败");
        },
        complete: function (XMLHttpRequest, status) { //请求完成后最终执行参数
            layer.close(index);
            if (status == 'timeout') {//超时,status还有success,error等值的情况
                layer.msg("请求超时");
            }
        }
    });
}

/**
 * 启用
 */
function enableUser() {
	var ids = getCheckedIds();
	if(ids.length==0){
		layer.msg("请选择要启用的用户");
        return false;
	}
    var index = layer.load(1, {
        shade: [0.1, '#fff'] //0.1透明度的白色背景
    });
    $.ajax({
        url: _platform + '/user/status/0',
        timeout: 5000,
        type: 'POST',
        dataType: 'json',
        data: {ids: ids.join()},
        success: function (result) {
            layer.close(index);
            $('#user-table-list').bootstrapTable("refresh");
            layer.msg(result.msg);
        },
        error: function () {
            layer.close(index);
            layer.msg("启用失败");
        },
        complete: function (XMLHttpRequest, status) { //请求完成后最终执行参数
            layer.close(index);
            if (status == 'timeout') {//超时,status还有success,error等值的情况
                layer.msg("请求超时");
            }
        }
    });
}

/**
 * 获取被选中的用户的id数组
 * @returns {Array}
 */
function getCheckedIds(){
	var ts= $('#user-table-list').bootstrapTable('getSelections');
	var ids = [];
	for(var i=0;i<ts.length;i++){
		ids.push(ts[i].id);
	}
	return ids;
}

/**
 * 批量删除用户
 * @returns {Boolean}
 */
function deleteUsers() {

    var ids = getCheckedIds();
    if (ids.length == 0) {
        layer.msg("请选择要删除的用户");
        return false;
    }
    layer.confirm('您是否确定删除所选用户？', {
        btn: ['确定', '取消'] //按钮
    }, function () {
        var index = layer.load(1, {
            shade: [0.1, '#fff'] //0.1透明度的白色背景
        });
        $.ajax({
            url: _platform + '/user/delete',
            data: {ids: ids.join()},
            type: 'POST',
            dataType: 'json',
            success: function (result) {
                if (result.flag) {
                    layer.closeAll();
                    $('#user-table-list').bootstrapTable("refresh");
                    layer.msg(result.msg);
                } else {
                    layer.close(index);
                    layer.msg(result.msg);
                }
            }
        });
    });
}

/**
 * 删除用户
 * @param id
 */
function deleteUser(id) {
    layer.confirm('您是否确定删除用户？', {
        btn: ['确定', '取消'] //按钮
    }, function () {
        var index = layer.load(1, {
            shade: [0.1, '#fff'] //0.1透明度的白色背景
        });
        $.ajax({
            url: _platform + '/user/delete/' + id,
            type: 'DELETE',
            dataType: 'json',
            success: function (result) {
                if (result.flag) {
                    layer.closeAll();
                    $('#user-table-list').bootstrapTable("refresh");
                    layer.msg(result.msg);
                } else {
                    layer.close(index);
                    layer.msg(result.msg);
                }
            }
        });
    });
}

/**
 * 导出用户信息到excel
 */
function exportUser(){
	var paramStr = formsParam({},"user-form",true);
	var url = _platform + '/user/export?'+paramStr;
	window.location.href = url;
}