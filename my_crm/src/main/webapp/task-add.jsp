<%@ page language="java"  pageEncoding="UTF-8"%>
<%
	//获取项目名
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>创建任务</title>
<link rel="stylesheet" type="text/css" href="skin/css/base.css">
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="<%=path%>/js/WdatePicker.js"></script>
	<script type="application/javascript">
		$(function () {
			$.post("<%=path%>/Project/getProByFun",function (data) {
				$(data).each(function (index,item) {
					var opt = "<option value=\""+item.pid+"\">"+item.pname+"</option>"
					$("#pro").append(opt)
				})
			})

			//自动填充执行者
			$.post("<%=path%>/Employee/getEmpByDept",{id:10},function (data) {
				$(data).each(function (index,item) {
					var opt = "<option value=\""+item.eid+"\">"+item.ename+"</option>"
					$("#emp").append(opt)
				})
			})
		})

		//自动填充需求
		function addAyalysis(val) {
			$.post("<%=path%>/Analysis/getInfoById",{id:val},function (data) {
					$("#anid").html("")
					var opt = "<option value=\""+data.id+"\">"+data.title+"</option>"
					$("#anid").append(opt)
				})
		}

		//自动填充模块
		function addMod(val) {
			$.post("<%=path%>/Module/queryModByAna",{id:val},function (data) {
				$("#mod").html("")
				$(data).each(function (index,item) {
					var opt = "<option value=\""+item.id+"\">"+item.modname+"</option>"
					$("#mod").append(opt)
				})
			})
		}

		//自动填充功能
		function addFun(val) {
			$.post("<%=path%>/Function/getFunByMod",{id:val},function (data) {
				$("#fun").html("")
				$(data).each(function (index,item) {
					var opt = "<option value=\""+item.id+"\">"+item.functionname+"</option>"
					$("#fun").append(opt)
				})
			})
		}

		function commit() {
			$("#form7").submit()
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
    当前位置:任务管理>>创建任务
 </td>
 </tr>
</table>
</td>
</tr>
</table>

<form name="form2" id="form7" action="${pageContext.request.contextPath}/Task/insertTask" method="post">

<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
<tr bgcolor="#E7E7E7">
	<td height="24" colspan="2" background="skin/images/tbg.gif">&nbsp;创建任务&nbsp;</td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">参考位置：</td>
	<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
		<select  id="pro" onchange="addAyalysis(this.value),addMod(this.value)">
<%--			<option value="">请选择项目</option>--%>
		</select>
		<select id="anid">
			<option value="">请选择需求</option>
		</select>
		<select id="mod" onclick="addFun(this.value)">
			<option value="">请选择模块</option>
		</select>
		<select id="fun" name="funFk">
			<option value="">请选择功能</option>
		</select>
	</td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">任务标题：</td>
	<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22"><input name="tasktitle"/></td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">开始时间：</td>
	<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22"><input type="Date" name="starttime" /></td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">结束时间：</td>
	<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22"><input type="Date" name="endtime" /></td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">执行者：</td>
	<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
		<select id="emp" name="empFk">
<%--			<option value="">任务的执行者</option>--%>
		</select>
	</td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">优先级：</td>
	<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
		<select name="level"><option value="高">高</option><option value="中">中</option><option value="低">低</option></select></td>
</tr>

<tr >
	<td align="right" bgcolor="#FAFAF1" >详细说明：</td>
	<td colspan=3 align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" >
		<textarea rows=10 cols=130 name="remark"></textarea>
	</td>
</tr>


<tr bgcolor="#FAFAF1">
<td height="28" colspan=4 align=center>
	&nbsp;
	<a href="javascript:commit()" class="coolbg">保存</a>
</td>
</tr>
</table>

</form>
  

</body>
</html>