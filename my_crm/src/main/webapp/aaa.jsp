<%@ page language="java" pageEncoding="UTF-8" %>

<%
    //获取项目名
    String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>客户信息管理</title>
    <link rel="stylesheet" type="text/css" href="<%=path%>/skin/css/base.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript">
        //进来先查询第一页
        $(function () {
            search(1);
        })

        //分页点击下一页
        function nextPage() {
            var nextPage = $("#nextPage").val();
            search(nextPage)
        }

        //分页点击上一页
        function prePage() {
            var prePage = $("#prePage").val();
            search(prePage)
        }

        //分页点击尾页
        function endPage() {
            var endPage = $("#endPage").val();
            search(endPage)
        }

        // 查询当前页的用户数据
        function search(curPage) {
            // if(state == 0){
            //     var cid = $("#cid").val();
            //     var oid = $("#oid").val();
            //     var keyword = $("#keyword").val();
            // }else{
            //     var cid = 0;
            //     var oid = 0;
            //     var keyword = "";
            // }
            $(".addtr").remove();
            $.post("<%=path%>/Customer/getCustomerByPage",{curPage:curPage},function (data) {
                $("#total_count").text(data.total_count)
                $("#curPage").text(data.curPage)
                $("#nextPage").val(data.nextPage)
                $("#prePage").val(data.prePage)
                $("#endPage").val(data.total_page)
                $(data.list).each(function (index,item) {
                    var date = new Date(item.addtime)
                    var newDate = date.getFullYear() +"-"+ (date.getMonth()+1) +"-"+ date.getDate()
                    var tr = "<tr class='addtr' align='center' bgcolor='#FFFFFF' onMouseMove='javascript:this.bgColor='#FCFDEE';' onMouseOut='javascript:this.bgColor='#FFFFFF';' height='22'>"
                        +"<td><input name='ids' type='checkbox' id='id' value='101' class='ck'></td>"
                        +"<td id='td2'>"+item.id+"</td>"
                        +"<td>"+item.companyperson+"</td>"
                        +"<td align='center'>"+item.comname+"</td>"
                        +"<td>"+newDate+"</td>"
                        +"<td>"+item.comphone+"</td>"
                        +"<td><a href=${pageContext.request.contextPath}/Customer/getCustomer?id="+item.id+">编辑</a> | <a href=${pageContext.request.contextPath}/Customer/getCustomerDetail?id="+item.id+">查看详情</a></td></tr>"
                    $("#tr2").after(tr);
                })

            },"json")
        }

        <%--$(function () {--%>
        <%--    $.post("${pageContext.request.contextPath}/Customer/getAllCustomer",function(data) {--%>
        <%--        $(data).each(function (index,item) {--%>
        <%--            var tr = "<tr class='addtr' align='center' bgcolor='#FFFFFF' onMouseMove='javascript:this.bgColor='#FCFDEE';' onMouseOut='javascript:this.bgColor='#FFFFFF';' height='22'>"--%>
        <%--                +"<td><input name='ids' type='checkbox' id='id' value='101' class='ck'></td>"--%>
        <%--                +"<td id='td2'>"+item.id+"</td>"--%>
        <%--                +"<td>"+item.companyperson+"</td>"--%>
        <%--                +"<td align='center'>"+item.comname+"</td>"--%>
        <%--                +"<td>"+item.addtime+"</td>"--%>
        <%--                +"<td>"+item.comphone+"</td>"--%>
        <%--                +"<td><a href='${pageContext.request.contextPath}/Customer/getCustomer?id="+item.id+"'>编辑</a> | <a href='${pageContext.request.contextPath}/Customer/getCustomerDetail?id="+item.id+"'>查看详情</a></td></tr>"--%>
        <%--            $("#tr2").after(tr);--%>
        <%--        })--%>
        <%--    },"json")--%>
        <%--})--%>

        // 批量删除
        function deleteCustomer() {
            var arr = new Array()
            var ids = $("[name='ids']:checked")
            if(ids.length == 0){
                alert("请至少选择一条数据！")
                return
            }
            for(var i=0;i<ids.length;i++){
                arr[i] = $(ids[i]).parent().next().text()
            }
            // var str = arr.join(",")
            $.post("${pageContext.request.contextPath}/Customer/batchDelete",{arr:arr.toString()},function (data) {
                alert("成功删除一组数据")
                search(1)
            },"json")
        }

        //全选
        function queryAll() {
            $("input[name='ids']").prop("checked",true);
        }

        //全不选
        function reverseAll() {
            $(".ck").prop("checked",false)
        }

        <%--function search() {--%>
        <%--    var cid = $("#cid").val();--%>
        <%--    var oid = $("#oid").val();--%>
        <%--    var keyword = $("#keyword").val();--%>
        <%--    $.get("${pageContext.request.contextPath}/Customer/searchCustomer",{cid:cid,oid:oid,keyword:keyword},function(data) {--%>
        <%--        // $(".addtr").remove();--%>
        <%--        $(data).each(function(index,item){--%>
        <%--            alert(item.comname)--%>
        <%--            var tr = "<tr class='addtr' align='center' bgcolor='#FFFFFF' onMouseMove='javascript:this.bgColor='#FCFDEE';' onMouseOut='javascript:this.bgColor='#FFFFFF';' height='22'>"--%>
        <%--                +"<td><input name='ids' type='checkbox' id='id' value='101' class='ck'></td>"--%>
        <%--                +"<td id='td2'>"+item.id+"</td>"--%>
        <%--                +"<td>"+item.companyperson+"</td>"--%>
        <%--                +"<td align='center'>"+item.comname+"</td>"--%>
        <%--                +"<td>"+item.addtime+"</td>"--%>
        <%--                +"<td>"+item.comphone+"</td>"--%>
        <%--                +"<td><a href='${pageContext.request.contextPath}/Customer/getCustomer?id="+item.id+"'>编辑</a> | <a href='${pageContext.request.contextPath}/Customer/getCustomerDetail?id="+item.id+"'>查看详情</a></td></tr>"--%>
        <%--            $("#tr2").after(tr);--%>
        <%--        })--%>
        <%--    },"json")--%>
        <%--}--%>
    </script>
</head>
<body leftmargin="8" topmargin="8" background='skin/images/allbg.gif'>

<!--  快速转换位置按钮  -->
<table width="98%" border="0" cellpadding="0" cellspacing="1" bgcolor="#D1DDAA" align="center">
    <tr>
        <td height="26" background="skin/images/newlinebg3.gif">
            <table width="58%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td>
                        当前位置:客户信息管理>>客户信息
                    </td>
                    <td>
                        <input type='button' class="coolbg np" onClick="location='<%=path%>/customer-add.jsp';" value='添加客户信息'/>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<!--  搜索表单  -->
<form name='form3' action='' method='get'>
    <input type='hidden' name='dopost' value=''/>
    <table width='98%' border='0' cellpadding='1' cellspacing='1' bgcolor='#CBD8AC' align="center"
           style="margin-top:8px">
        <tr bgcolor='#EEF4EA'>
            <td background='skin/images/wbg.gif' align='center'>
                <table border='0' cellpadding='0' cellspacing='0'>
                    <tr>
                        <td width='90' align='center'>搜索条件：</td>
                        <td width='160'>
                            <select id="cid" name='cid' style='width:120px'>
                                <option value='0'>选择类型</option>
                                <option value='1'>公司名称</option>
                                <option value='2'>联系人姓名</option>
                            </select>
                        </td>
                        <td width='70'>
                            关键字：
                        </td>
                        <td width='160'>
                            <input id="keyword" type='text' name='keyword' value='' style='width:120px'/>
                        </td>
                        <td width='110'>
                            <select id="oid" name='orderby' style='width:120px'>
                                <option value='0'>排序</option>
                                <option value='1'>序号</option>
                                <option value='2'>添加时间</option>
                            </select>
                        </td>
                        <td>
                            &nbsp;&nbsp;&nbsp;<input name="imageField" onclick="search(1)" type="image" src="<%=path%>/skin/images/frame/search.gif" width="45" height="20" border="0" class="np"/>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>
<!--  内容列表   -->
<form name="form2">

    <table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center"
           style="margin-top:8px">
        <tr bgcolor="#E7E7E7">
            <td height="24" colspan="12" background="skin/images/tbg.gif">&nbsp;需求列表&nbsp;</td>
        </tr>
        <tr align="center" bgcolor="#FAFAF1" height="22" id="tr2">
            <td width="4%">选择</td>
            <td width="6%">序号</td>
            <td width="10%">联系人</td>
            <td width="10%">公司名称</td>
            <td width="8%">添加时间</td>
            <td width="8%">联系电话</td>
            <td width="10%">操作</td>
        </tr>

        <%--        <tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';"--%>
        <%--            onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">--%>
        <%--            <td><input name="id" type="checkbox" id="id" value="101" class="np"></td>--%>
        <%--            <td>1</td>--%>
        <%--            <td>李彦宏</td>--%>
        <%--            <td align="center">百度</td>--%>
        <%--            <td>2015-02-03</td>--%>
        <%--            <td>13257634888</td>--%>
        <%--            <td><a href="customer-edit.jsp">编辑</a> | <a href="customer-look.jsp">查看详情</a></td>--%>
        <%--        </tr>--%>


        <tr bgcolor="#FAFAF1" id="mm">
            <td height="28" colspan="12">
                <a href="javascript:queryAll()" class="coolbg">全选</a>
                <a href="javascript:reverseAll()" class="coolbg">全不选</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="javascript:deleteCustomer()" class="coolbg">&nbsp;删除&nbsp;</a>
                <a href="" class="coolbg">&nbsp;导出Excel&nbsp;</a>

            </td>
        </tr>
        <tr  align="right" bgcolor="#EEF4EA">
            <td height="36" colspan="18" align="center" id="tdd">
                <a href="javascript:search(1)">首页</a>
                <a id="prePage" value="" href="javascript:prePage()">上一页</a>
                <a id="nextPage" value="" href="javascript:nextPage()">下一页</a>
                <a id="endPage" value="" href="javascript:endPage()">尾页</a>
                <a href="#" style="float: right;margin-right: 30px;font-size: 15px" >共<span id="total_count" style="font-size: 15px"></span>条数据</a>
                <a href="#" style="float: right;margin-right: 30px;font-size: 15px" >当前第<span id="curPage" style="font-size: 15px"></span>页</a>
            </td>

            <%--            <td height="30"  align="center">首页</td>--%>
            <%--            <td height="30"  align="center">上一页</td>--%>
            <%--            <td height="30"  align="center">下一页</td>--%>
            <%--            <td height="30"  align="center">尾页</td>--%>
        </tr>
    </table>

</form>


</body>
</html>