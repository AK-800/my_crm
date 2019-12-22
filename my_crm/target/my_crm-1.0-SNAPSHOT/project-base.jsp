<%@ page language="java"  pageEncoding="UTF-8"%>
<%
    //获取项目名
    String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>项目信息管理</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/skin/css/base.css">
    <script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript">
        $(function () {
            search(1,0,0,"")
        })

        function search(curPage,cid,oid,keyword){
            $(".proTr").remove()
            $.get("<%=path%>/Project/getProjectByCond",{curPage:curPage,cid:cid,oid:oid,keyword:keyword},function(data) {
                if(data.list == 0){
                    alert("没有查询到数据！")
                }
                $(data.list).each(function (index,item) {
                    var opt = "<tr class='proTr' align='center' bgcolor='#FFFFFF' onMouseMove='javascript:this.bgColor='#FCFDEE';' onMouseOut='javascript:this.bgColor='#FFFFFF';' height='35' >"
                        +"<td><input name='proInp' type='checkbox' id='id' value='101' class='np'></td>"
                        +"<td>"+item.pid+"</td>"
                        +"<td align='left'><a href='' style='text-decoration: none'>"+item.pname+"</a></td>"
                        +" <td>"+item.customer.comname+"</td>"
                        +"<td>"+item.customer.companyperson+"</td>"
                        +"<td>"+item.employee.ename+"</td>"
                        +"<td>"+item.empcount+"</td>"
                        +"<td>"+item.buildtime+"</td>"
                        +"<td>"+item.starttime+"</td>"
                        +"<td>"+item.endtime+"</td>"
                        +"<td>进行中</td>"
                        +"<td><a href=<%=path%>/project-base-edit.jsp?id="+item.pid+">编辑</a> | <a href='<%=path%>/project-base-look.jsp?id="+item.pid+"'>查看详情</a></td></tr>"
                    $("#ttr").after(opt)

                    $("#optPage").remove()
                    var optPage = "<tr id='optPage' align=\"right\" bgcolor=\"#EEF4EA\">\n" +
                        "<td height=\"36\" colspan=\"18\" align=\"center\" id=\"tdd\">\n" +
                        "<a href=\"javascript:search(1,"+cid+","+oid+",'"+keyword+"')\">首页</a>\n" +
                        "<a id=\"prePage\" value=\"\" href=\"javascript:search("+data.prePage+","+cid+","+oid+",'"+keyword+"')\">上一页</a>\n" +
                        "<a id=\"nextPage\" value=\"\" href=\"javascript:search("+data.nextPage+","+cid+","+oid+",'"+keyword+"')\">下一页</a>\n" +
                        "<a id=\"endPage\" value=\"\" href=\"javascript:search("+data.pages+","+cid+","+oid+",'"+keyword+"')\">尾页</a>\n" +
                        "<a href=\"#\" style=\"float: right;margin-right: 30px;font-size: 15px\" >共<span id=\"total_count\" style=\"font-size: 15px\">"+data.total+"</span>条数据</a>\n" +
                        "<a href=\"#\" style=\"float: right;margin-right: 30px;font-size: 15px\" >当前第<span id=\"curPage\" style=\"font-size: 15px\">"+data.pageNum+"</span>页</a>\n" +
                        "</td>\n</tr>"
                    $("#optTrr").after(optPage)
                })
            })
        }

        //搜索功能
        function queryByCond() {
            var cid = $("#cid").val()
            var oid = $("#oid").val()
            var keyword = $("#keyword").val()
            search(1,cid,oid,keyword)
        }

        //批量删除
        function delPro() {
            var ids = $("[name='proInp']:checked")    //获取所有选中状态的表单
            var arr = new Array()
            if(ids.length == 0){
                alert("请至少选择一条数据!")
                return
            }
            for(var i=0;i<ids.length;i++){
                arr[i] = $(ids[i]).parent().next().text()
            }
            var str = arr.join(",")
            $.get("<%=path%>/Project/delPro",{str:str},function (data) {
                for(var i=0;i<ids.length;i++){
                    $(ids[i]).parent().parent().remove()
                }
                if(data>0) alert("成功删除"+data+"条数据！")
            })
        }

    </script>

</head>
<body leftmargin="8" topmargin="8" background='${pageContext.request.contextPath}/skin/images/allbg.gif'>

<!--  快速转换位置按钮  -->
<table width="98%" border="0" cellpadding="0" cellspacing="1" bgcolor="#D1DDAA" align="center">
<tr>
 <td height="26" background="skin/images/newlinebg3.gif">
  <table width="58%" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td >
    当前位置:项目管理>>基本信息管理
 </td>
  <td>
    <input type='button' class="coolbg np" onClick="location='<%=path%>/project-base-add.jsp';" value='添加新项目' />
 </td>
 </tr>
</table>
</td>
</tr>
</table>

<!--  搜索表单  -->
<input type='hidden' name='dopost' value='' />
<table width='98%'  border='0' cellpadding='1' cellspacing='1' bgcolor='#CBD8AC' align="center" style="margin-top:8px">
  <tr bgcolor='#EEF4EA'>
    <td background='skin/images/wbg.gif' align='center'>
      <table border='0' cellpadding='0' cellspacing='0'>
        <tr>
          <td width='90' align='center'>搜索条件：</td>
          <td width='160'>
          <select name='cid' id="cid" style='width:150px'>
          <option value='0'>选择类型...</option>
          	<option value='1'>项目名称</option>
          	<option value='2'>客户公司名称</option>
            <option value='4'>客户公司负责人</option>
            <option value='3'>项目经理</option>
          </select>
        </td>
        <td width='70'>
          关键字：
        </td>
        <td width='160'>
          	<input type='text' name='keyword' id="keyword" value='' style='width:120px' />
        </td>
        <td width='110'>
    		<select name='orderby' id="oid" style='width:120px'>
            <option value='0'>排序...</option>
            <option value='1'>序号</option>
            <option value='2'>项目开始时间</option>
      	</select>
        </td>
        <td>
          &nbsp;&nbsp;&nbsp;<input name="imageField" onclick="queryByCond()" type="image" src="${pageContext.request.contextPath}/skin/images/frame/search.gif" width="45" height="20" border="0" class="np" />
        </td>
       </tr>
      </table>
    </td>
  </tr>
</table>
<!--  内容列表   -->
<form name="form2">

<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
<tr bgcolor="#E7E7E7">
	<td height="24" colspan="12" background="skin/images/tbg.gif">&nbsp;项目信息列表&nbsp;</td>
</tr>
<tr align="center" bgcolor="#FAFAF1" height="30px" id="ttr">
	<td width="4%">选择</td>
	<td width="6%">序号</td>
	<td width="10%">项目名称</td>
	<td width="10%">客户公司名称</td>
	<td width="10%">客户方负责人</td>
	<td width="5%">项目经理</td>
	<td width="8%">开发人员数</td>
	<td width="6%">立项时间</td>
	<td width="8%">最近更新时间</td>
	<td width="8%">计划完成时间</td>
	<td width="8%">状态</td>
	<td width="10%">操作</td>
</tr>


<%--<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22" >--%>
<%--	<td><input name="id" type="checkbox" id="id" value="101" class="np"></td>--%>
<%--	<td>1</td>--%>
<%--	<td align="left"><a href=''><u>农业银行自助管理系统</u></a></td>--%>
<%--	<td>中国农业银行</td>--%>
<%--	<td>张云</td>--%>
<%--	<td>苏鑫超</td>--%>
<%--	<td>6</td>--%>
<%--	<td>2015-01-03</td>--%>
<%--	<td>2015-02-03</td>--%>
<%--	<td>2015-06-03</td>--%>
<%--	<td>进行中</td>--%>
<%--	<td><a href="project-base-edit.jsp">编辑</a> | <a href="project-base-look.jsp">查看详情</a></td>--%>
<%--</tr>--%>



<tr bgcolor="#FAFAF1" id="optTrr">
<td height="28" colspan="12">
	<a href="" class="coolbg">全选</a>
	<a href="" class="coolbg">反选</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a onclick="delPro()" class="coolbg">&nbsp;删除&nbsp;</a>
	<a href="" class="coolbg">&nbsp;导出Excel&nbsp;</a>
</td>
</tr>

<%--<tr  align="right" bgcolor="#EEF4EA">--%>
<%--    <td height="36" colspan="18" align="center" id="tdd">--%>
<%--        <a href="javascript:search(1)">首页</a>--%>
<%--        <a id="prePage" value="" href="javascript:prePage()">上一页</a>--%>
<%--        <a id="nextPage" value="" href="javascript:nextPage()">下一页</a>--%>
<%--        <a id="endPage" value="" href="javascript:endPage()">尾页</a>--%>
<%--        <a href="#" style="float: right;margin-right: 30px;font-size: 15px" >共<span id="total_count" style="font-size: 15px"></span>条数据</a>--%>
<%--        <a href="#" style="float: right;margin-right: 30px;font-size: 15px" >当前第<span id="curPage" style="font-size: 15px"></span>页</a>--%>
<%--    </td>--%>
<%--</tr>--%>
</table>

</form>
  

</body>
</html>