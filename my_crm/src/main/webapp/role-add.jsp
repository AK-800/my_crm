<%@ page language="java"  pageEncoding="UTF-8"%>
<%
	//获取项目名
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>添加角色</title>

	<script src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/script/docs.min.js"></script>
	<script src="${pageContext.request.contextPath}/layer/layer.js"></script>
	<script src="${pageContext.request.contextPath}/ztree/jquery.ztree.all-3.5.min.js"></script>
	<link rel="stylesheet" type="text/css" href="skin/css/base.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/ztree/zTreeStyle.css">

	<script type="application/javascript">
		$(function () {
			$.post("<%=path%>/Sources/getAll",function (data) {
				$(data).each(function (index,item) {
					if(item.pid == 1){
						var opt = "<input type=\"checkbox\" name='source' value='"+item.id+"'/>"+item.name+"<br/>"
						$(item.sources).each(function (index,item) {
							opt += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"checkbox\" name='source' value='"+item.id+"'/>"+item.name+"<br/>"
						})
						$("#tdd").append(opt)
					}
				})
			})
		})

		function commit() {
			$.post("<%=path%>/Role/addRole",$("#form18").serialize(),function (data) {
				if(data){
					alert("成功添加新角色！")
				}else {
					alert("添加角色失败！")
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
    当前位置:权限管理>>添加角色信息
 </td>
 </tr>
</table>
</td>
</tr>
</table>

<form name="form2"  method="post" id="form18">
 <input type="hidden"  id="sid" name="sourcesid">
<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
<tr bgcolor="#E7E7E7">
	<td height="24" colspan="2" background="skin/images/tbg.gif">&nbsp;添加角色&nbsp;</td>
</tr>

<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">角色名称：</td>
	<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
		<input name="rolename"/></td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">状态：</td>
	<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
		<select name="status"><option value="1">启用</option><option value="0">禁用</option></select>
	</td>
</tr>

<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">赋菜单资源：</td>
	<td id="tdd" align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">

<%--		<input type="checkbox" checked/>项目管理<br/>--%>
<%--		<input type="checkbox" checked/>基本信息管理<br/>--%>
<%--		<input type="checkbox" checked/>需求分析管理<br/>--%>
<%--		<input type="checkbox" checked/>模块管理<br/>--%>
<%--		<input type="checkbox" checked/>功能管理<br/>--%>
<%--		<input type="checkbox" checked/>附件管理<br/>--%>

<%--		<input type="checkbox" checked/>任务管理<br/>--%>
<%--		<input type="checkbox" checked/>创建任务<br/>--%>
<%--		<input type="checkbox" checked/>任务信息<br/>--%>
<%--		<input type="checkbox" checked/>我的任务<br/>--%>
	</td>
</tr>

<tr >
	<td align="right" bgcolor="#FAFAF1" >备注：</td>
	<td colspan=3 align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" >
		<textarea rows=10 cols=130  name="roledis"></textarea>
	</td>
</tr>


<tr bgcolor="#FAFAF1">
<td height="28" colspan=4 align=center>
	&nbsp;
	<a href="javascript:commit()" class="coolbg">保存</a>
	<a href="role.jsp" class="coolbg">返回</a>
</td>
</tr>
</table>

</form>
  

</body>
</html>