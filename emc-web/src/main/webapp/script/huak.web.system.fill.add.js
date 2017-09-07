var dataMap =null;
$(function(){
    dataMap = new Map();
    loadDataFun();
})
/**
 * 绑定插件到table - tr - td - class
 * 单击td 出现input
 * 失去焦点，修改隐藏域值，调用回调方法
 *
 * <td class="td-edit">
 <div class="text-left div-edit">{$T.record.usedNum}
 <input type="hidden" name="" value="{$T.record.usedNum}">
 </div>
 </td>
 */

function editTd(){
    var $div,value,$hidden;
    $('.editTable').on('click','tr .td-edit',function(){
        //单击td事件
        var $this = $(this);
        $div = $this.find('.div-edit');
        value = Number($div.text());
        $hidden = $this.find('input:hidden');
        var input = '<input class="input-edit" type="text" value="' + value + '">';
        $this.empty().append($hidden).append(input);
        $this.find('.input-edit').focus();
    }).on('click','tr .input-edit',function(event){
        event.stopPropagation();//阻止冒泡
    }).on('focusout','tr .input-edit',function(){
        //失去焦点事件
        var $this = $(this);
        var $td = $this.parent('.td-edit');
        var num = Number($this.val());
        if(num != value){
            // 修改标记
            var $flag = $td.parent('tr').find('input[name="flag"]');
            var $id = $td.parent('tr').find('input[name="id"]').val();
            $flag.val(1);//1为用修改  2为不用修改
            dataMap.remove($id);
        }
        $hidden.val(num);
        $div.empty().append(num).append($hidden);
        $td.empty().append($div);
    });
}
function loadDataFun() {
    query(1);
    editTd();

}

function reset(){
   $("#unitName").val("");
   $("#name").val("");
   $("#startTime").val("");
   $("#endTime").val("");
}

function query(num){
    debugger;
    dataMap.clear();
//table 数据查询
    var unitName=$("#unitName").val();
    var collectName=$("#collectName").val();
    var collectTime=$("#collectTime").val();
    alert(collectTime);
    var energyType =$("#energyType").val();
    $.ajax({
        url: _web + '/meterData/list',
        type: 'post',
        async: true,//要指定不能异步,必须等待后台服务校验完成再执行后续代null码
        data: {collectName:collectName,collectTime:collectTime,unitName:unitName,energyType:energyType},
        dataType: "json",
        success: function (data) {
            if(data.flag){
                $.each(data.object,function(index,value){
                    if(value.realFlag == 0){
                        dataMap.put(value.id,value.id);
                    }
                });
                $("#projectTbody").setTemplateElement("template");
                $("#projectTbody").processTemplate(data);
            }
        }
    });
}
//下拉切换事件
$("body").on("click", "#energy p", function () {
    var selectval = $(this).html();
    var selectid = $(this).attr("value");
    $('#energyType').val(selectid);
    $(this).parent().prev().find("input").val(selectval);
    $(this).parent().slideUp(200, function () {
    });
});

//下拉切换事件
$("body").on("click", "#x-sfoption1 p", function () {
    var selectval = $(this).html();
    var selectid = $(this).attr("value");
    $('#unitName').val(selectid);
    $(this).parent().prev().find("input").val(selectval);
    $(this).parent().slideUp(200, function () {
    });
});

//重置
function resetDataTable(){
    $("#x-sfoption1").prev().find("input").val("请选择用能单位");
    $("#energy").prev().find("input").val("请选择能源类型");
    $("#unitName").val("");
    $("#collectName").val("");
    $("#collectTime").val("");
    $("#energyType").val("");
}

function dataSave (){
    debugger;
    if(dataMap.size()>0){
        top.layer.alert("填完再保存！");
        return ;
    }
    var data = $("#_editForm").serializeJson();
    $.ajax({
        url:_web +"/data/fill/add",
        type: "POST",
        contentType : 'application/json;charset=utf-8', //设置请求头信息
        dataType:"json",
        data:data,            //将Json对象序列化成Json字符串，toJSON()需要引用jquery.json.min.js
        success: function(data){
           if(data == "1"){
               top.layer.alert("数据填报失败！");
           }
            if(data == "0"){
                top.layer.alert("数据已填报！");
            }
        }
    });
    dataMap.clear();
}