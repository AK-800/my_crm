<%@ page import="com.ujiuye.usual.bean.Baoxiao,java.util.*" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>编辑附件</title>
<link rel="stylesheet" type="text/css" href="skin/css/base.css">
	<script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>


   <script type="application/javascript">
	   $(function () {
			$.post("${pageContext.request.contextPath}/Baoxiao/queryBx",{bxid:${param.bxid}},function (data) {
				$("#bxid").val(data.bxid)
				//转换日期的格式，把毫秒值转成yyyy-MM-dd类型
				var date = new Date(data.bxtime)
				var newDate = date.getFullYear()+"-"+(date.getMonth()+1<10?"0"+(date.getMonth()+1):date.getMonth()+1)+"-"+(date.getDate()<10?"0"+date.getDate():date.getDate())

				var opt = "<tr >\n" + "\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">支出类型：</td>\n" +
						"\t<td  align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\">\n" +
						"\t\t<input value=\""+data.expendituretype.etname+"\" readonly=\"true\"/></td>\n" +
						"</tr>"+ "<tr >\n" + "\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">金额：</td>\n" +
						"\t<td  align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\">\n" +
						"\t\t<input value=\""+data.totalmoney+"\" readonly=\"true\"/></td>\n" +
						"</tr>\n" + "<tr >\n" +
						"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">使用时间</td>\n" +
						"\t<td  align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\">\n" +
						"\n" + "\t\t<input value=\""+newDate+"\" readonly=\"true\" /></td>\n" +
						"</tr>\n" + "<tr >\n" +
						"\t<td align=\"right\" bgcolor=\"#FAFAF1\" >备注：</td>\n" +
						"\t<td colspan=3 align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" >\n" +
						"\t\t<textarea rows=10 cols=130 readonly=\"true\">"+data.bxremark+"</textarea>\n" +
						"\t</td>\n" + "</tr>"
				$("#trr").after(opt)
			})
	   })


	   // {bxstatus:bxstatus,bxid:$("#bxid").val(),content:}
	   function commit(bxstatus){
        $.post("${pageContext.request.contextPath}/Baoxiao/shenpiBx",{bxid:$("#bxid").val(),bxstatus:bxstatus,content:$("#content").val()},function (data) {
			if(data){
				alert("成功审批！")
				location.href = "baoxiao-task.jsp"
			}else {
				alert("审批失败！")
			}
		})   
	   	
	   }
   </script>


</head>
<body leftmargin="8" topmargin="8" background='skin/images/allbg.gif'>





<!--  快速转换位置按钮  -->
<table width="98%" border="0" cellpadding="0" cellspacing="1" bgcolor="#D1DDAA" align="center">
<tr>
 <td height="26" background="skin/images/newlinebg3.gif">
  <table width="58%" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td >
    当前位置:项目管理>>报销审批
 </td>
 </tr>
</table>
</td>
</tr>
</table>

<form name="form2" id="form10">

<table  width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
<tr id="trr">
	<td colspan="2"  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
		<input  type="hidden" name="bxid" id="bxid" value=""/>
	</td>
</tr>
<%--<tr >--%>
<%--	<td align="right" bgcolor="#FAFAF1" height="22">金额：</td>--%>
<%--	<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">--%>
<%--		<input value="${requestScope.nbx.totalmoney}" readonly="true"/></td>--%>
<%--</tr>--%>
<%--<tr >--%>
<%--	<td align="right" bgcolor="#FAFAF1" height="22">使用时间</td>--%>
<%--	<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">--%>

<%--		<input value="<fmt:formatDate value='${requestScope.nbx.bxtime}' pattern='yyyy-MM-dd' ></fmt:formatDate>" readonly="true" /></td>--%>
<%--</tr>--%>
<%--<tr >--%>
<%--	<td align="right" bgcolor="#FAFAF1" >备注：</td>--%>
<%--	<td colspan=3 align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" >--%>
<%--		<textarea rows=10 cols=130 readonly="true">${requestScope.nbx.bxremark}</textarea>--%>
<%--	</td>--%>
<%--</tr>--%>
	<tr >
	<td align="right" bgcolor="#FAFAF1" >批准信息：</td>
	<td colspan=3 align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" >
		<!-- 批注信息 -->
		<textarea rows=10 id="content" cols=130 name="result"></textarea>
	</td>
	</tr >

<tr bgcolor="#FAFAF1">
<td height="28" colspan=4 align=center>
	&nbsp;
	<a href="javascript:commit(1)" class="coolbg">同意</a>
	<a href="javascript:commit(2)" class="coolbg">驳回</a>
</td>
</tr>
</table>

</form>
  

</body>
</html>