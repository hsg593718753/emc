/**
 * Copyright (C), 2009-2012, 北京华热科技发展有限公司.<BR>
 * Author:  lichao  <BR>
 * Project:eccp    <BR>
 * Version: v 1.0      <BR>
 * Date: 2016/8/30<BR>
 */
var bTable;
$(function () {
//    var setting = {
//        view: {
//            addHoverDom: addHoverDom,
//            removeHoverDom: removeHoverDom,
//            selectedMulti: false,
//            fontCss:{color:"blue"}
//        },
//        check: {
//            enable: true
//        },
//        data: {
//            simpleData: {
//                enable: true,
//                idKey: "id",
//                pIdKey: "pId",
//                system:"Name",
//                rootPId: ""
//            }
//        },
//        async : { // 是否异步加载 相当于ajax
//
//            enable : true//设置 zTree 是否开启异步加载模式
//            //默认值：false
//
//        },
//
//        edit: {
//            enable: true
//        },
//        callback: {
//            beforeRemove:beforeRemove,//点击删除时触发，用来提示用户是否确定删除
//            beforeEditName: beforeEditName,//点击编辑时触发，用来判断该节点是否能编辑
//            beforeRename:beforeRename,//编辑结束时触发，用来验证输入的数据是否符合要求
//            onRemove:onRemove,//删除节点后触发，用户后台操作
//            onRename:onRename,//编辑后触发，用于操作后台
//            beforeDrag:beforeDrag, //用户禁止拖动节点
//            onClick:clickNode//点击节点触发的事件
//
//        }
//    };
//    function ztreeValue(){
//        $.ajax({
//            type: "get",
//            url: _platform+"/org/ztreeValue",
//            data: {},
//            dataType: "json",
//            success: function (data) {
//                //console.log(data);
//                var nodes='';
//                var zNodes ='[';
//                for (var i=0;i<data.length;i++){
//                    var orgName='"' + data[i].orgName + '"';
//                    var id='"' + data[i].id + '"';
//                    var pid='"' + data[i].pOrgId + '"';
//                    zNodes+="{ id:"+id+", pId:"+pid+", name:"+orgName+", open:true},";
//                };
//                var newnodes=zNodes.substring(0,zNodes.length-1);
//                nodes= newnodes+"]"
//                //alert(nodes);
//                $.fn.zTree.init($("#treeDemo"), setting, eval("(" + nodes + ")"));
//            },
//            error: function(data) {
//                alert("data is erro");
//            }
//        });
//    }

    bTable = $('#secondnet-table-list').bootstrapTable({
        height: getHeight() + 30,//高度
        cache: false,//禁用 AJAX 数据缓存
        url: _platform + '/secondnet/listpage',//获取数据的Servlet地址
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
                roleName:$('input[name="netTypeId"]').val(),
                _method: "PATCH",
                pageNumber: params.pageNumber,
                pageSize: params.pageSize
            };
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
            /*{
             checkbox: true
             },*/
            {
                title: '序号',
                field: 'sn',
                align: 'center',
                formatter:function(value,row,index){
                    return index+1;
                }
            },
            {
                title: '管线类型',
                field: 'netTypeId',
                align: 'center'
            },
            {
                title: '管线长度',
                field: 'length',
                align: 'center'
            },
            {
                title: '小室数量',
                field: 'cellNum',
                align: 'center'
            },
            {
                title: '管段数量',
                field: 'partNum',
                align: 'center'
            },
            {
                title: '输送介质',
                field: 'medium',
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
                    return '<a title="编辑" class="btn btn-xs btn-info top-layer-min" layer-form-id="secondnetEditForm" layer-title="编辑管线" layer-url="'+_platform+'/secondnet/edit/'+row.id+'"> <i class="fa fa-edit"></i></a>&nbsp;' +
                        '<a title="删除" class="btn btn-xs btn-danger" onclick="deleteOncenet(&quot;'+row.id+'&quot;)"><i class="fa fa-trash-o"></i></a>&nbsp;';
                }
            }

        ]


    });

    //页面说明
    console.info("页面说明：\n1.系统默认2个角色为超级管理员和企业管理员；\n" +
        "2.管理员用户才能进行管理且只能看到自己创建的角色；\n" +
        "功能：\n" +
        "【添加】【删除】【修改】【授权权限】【检索】【重置】【导出EXCEL】\n" +
        "字段：\n角色主键、角色名称、角色备注\n" +
        "创建人、创建人组织、创建时间、修改人、修改人组织、修改时间、是否删除" );

    //日期范围限制
    var start = {
        elem: '#start',
        format: 'YYYY/MM/DD hh:mm:ss',
        //min: laydate.now(), //设定最小日期为当前日期
        max: '2099-06-16 23:59:59', //最大日期
        istime: true,
        istoday: false,
        choose: function (datas) {
            end.min = datas; //开始日选好后，重置结束日的最小日期
            end.start = datas //将结束日的初始值设定为开始日
        }
    };
    var end = {
        elem: '#end',
        format: 'YYYY/MM/DD hh:mm:ss',
        max: '2099-06-16 23:59:59',
        istime: true,
        istoday: false,
        choose: function (datas) {
            start.max = datas; //结束日选好后，重置开始日的最大日期
        }
    };
//    laydate(start);
//    laydate(end);

    //下拉框js
    $(".chosen-select").chosen();

});
function search(){
    $('#oncenet-table-list').bootstrapTable('refresh');
}
//layer
function deleteOncenet(id) {
    top.layer.confirm('您是否确定删除管网吗？', {
        btn: ['确定', '取消'] //按钮
    }, function () {
        var index = top.layer.load(1, {
            shade: [0.1, '#fff'] //0.1透明度的白色背景
        });
        $.ajax({
            url: _platform + '/secondnet/delete/' + id,
            type: 'DELETE',
            dataType: 'json',
            success: function (result) {
                if (result.flag) {
                    top.layer.closeAll();
                    top.layer.msg(result.msg);
                    $('#secondnet-table-list').bootstrapTable("refresh");
                } else {
                    top.layer.close(index);
                    top.layer.msg(result.msg);
                }
            }
        });
    });
}


function treeNodeClick(e,treeId,treeNode){
    //alert(123);
    search();
}