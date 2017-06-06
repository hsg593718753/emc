/**
 * Copyright (C), 2009-2012, 北京华热科技发展有限公司.<BR>
 * Author:  lichao  <BR>
 * Project:eccp    <BR>
 * Version: v 1.0      <BR>
 * Date: 2016/8/30<BR>
 */
var bTable;

$(function () {
    init();
    initable();
});
 function initable(){
     bTable = $('#station-table-list').bootstrapTable({
         height: "100%",//高度
         cache: false,//禁用 AJAX 数据缓存
         url: _platform + '/station/list',//获取数据的Servlet地址
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
         queryParams: params,
         formatLoadingMessage: function () {
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
                 title: '序号',
                 field: 'seq',
                 align: 'center',
                 formatter:function(value,row,index){
                     return index+1;
                 }
             },
             {
                 title: '热力站名称',
                 field: 'stationName',
                 align: 'center'
             },
             {
                 title: '热力站编号',
                 field: 'stationCode',
                 align: 'center'
             },
             {
                 title: '管理类型',
                 field: 'manageTypeId',
                 align: 'center'
             },
             {
                 title: '地址',
                 field: 'addr',
                 align: 'center',
                 formatter:function(value,row,index){
                     if(value.length>20){
                         return '<span title="'+value+'">'+value.substr(0,20)+'</span>';
                     }
                     return value;
                 }
             },
             {
                 title: '经度',
                 field: 'lng',
                 align: 'center'
             },
             {
                 title: '纬度',
                 field: 'lat',
                 align: 'center'
             },
             {
                 title: '供热面积',
                 field: 'heatArea',
                 align: 'center'
             },
             {
                 title: '操作',
                 field: 'opt',
                 align: 'center' ,
                 formatter:function(value,row,index){
                     var html = "";
                     if($("#nodeUpdateAuth").val()){
                         html += '<a title="编辑" class="btn btn-xs btn-info top-layer-min" layer-form-id="stationEditForm" layer-title="编辑热力站" layer-url="'+_platform+'/station/edit/'+row.id+'" > <i class="fa fa-edit"></i></a>&nbsp;';
                     }
                     if($("#nodeDeleteAuth").val()){
                         html +=  '<a title="删除" class="btn btn-xs btn-danger" onclick="deletestation(&quot;'+row.id+'&quot;)"><i class="fa fa-trash-o"></i></a>&nbsp;' ;
                     }
                     return html;
                 }
             }

         ]
     });
 }

    function init(){
        var org = new Org({
            class:"org-tree"
        });
        org.initTree();
        var ts = $(top.document).find("[name='searchComp']").val();
        $("#comId").val(ts);
    }

    var deletestation = function (id){
        var ids;
        if(id == undefined){
            ids= getCheckValues("nodeListTable");
            if (ids.length == 0) {
                layer.msg("至少选择一条记录进行删除！");
                return false;
            }
        }else{
            ids = id;
        }
        top.layer.confirm('是否删除数据？', {
            btn: ['删除', '取消'] //按钮
        }, function () {
            var index = top.layer.load(1, {
                shade: [0.1, '#fff'] //0.1透明度的白色背景
            });
            $.ajax({
                url: _platform + '/station/delete',
                type: 'POST',
                dataType: 'json',
                data: {id: ids},
                success: function (result) {
                    if (result.flag) {
                        layer.closeAll();
                        layer.msg(result.msg);
                        getNodeList();
                    } else {
                        layer.close(index);
                        layer.msg(result.msg);
                    }
                }
            });
        });
    }
    //下拉框js
    $(".chosen-select").chosen();



function params(params) {

//    return {
//        status:0,
//        comId:ts,
//        stationName:$("#stationName").val(),
//        stationCode:$("#stationCode").val(),
//        orgId:top.orgId,
//        manageTypeId:$("#manageTypeId").val(),
//        pageNumber: params.pageNumber,
//        pageSize: params.pageSize
//    };
    return $("#station-search-form").serialize();
}

function addStation(){
    var treeNode = top.comm_tree.getSelectedNodes();
    var ts = $(top.document).find("[name='searchComp']").val();
    if(treeNode.length<1){
        layer.msg("请先选择一个组织机构！");
        return;
    }
    if(treeNode.length>1){
        layer.warn("只能选择一个上级组织！");
        return;
    }
    openLayer(_platform+"/station/add/"+treeNode[0].id+"/"+ts,"添加热力站","stationAddForm",null,null);
}

function treeNodeClick(e,treeId,treeNode){
    top.orgId = treeNode.id;
    $("#orgId").val(treeNode.id);
    search();
}

function search(){
    $('#station-table-list').bootstrapTable('refresh');
}



function deletestation(id) {
    top.layer.confirm('您是否确定删除该热力站？', {
        btn: ['确定', '取消'] //按钮
    }, function () {
        var index = top.layer.load(1, {
            shade: [0.1, '#fff'] //0.1透明度的白色背景
        });
        $.ajax({
            url: _platform + '/station/delete/' + id,
            type: 'DELETE',
            dataType: 'json',
            success: function (result) {
                if (result.flag) {
                    top.layer.closeAll();
                    top.layer.msg(result.msg);
                    $('#station-table-list').bootstrapTable("refresh");
                } else {
                    top.layer.close(index);
                    top.layer.msg(result.msg);
                }
            }
        });
    });
}

