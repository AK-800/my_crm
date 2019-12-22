<%@ page language="java"  pageEncoding="UTF-8"%>
<%
	//获取项目名
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>编辑项目信息</title>
<link rel="stylesheet" type="text/css" href="skin/css/base.css">
	<script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript">
		$(function () {
			$.get("<%=path%>/Project/getPro",{pid:${param.id}},function (data) {
				$("#pid").val(data.pid)
				$("#pname").val(data.pname)
				$("#newcomname").text(data.customer.comname)
				$("#newcomname").val(data.customer.id)
				$("#companyperson").val(data.customer.companyperson)
				$("#ename").text(data.employee.ename)
				$("#ename").val(data.employee.eid)  //给下拉列表的第一层数据，赋上val
				$("#empcount").val(data.empcount)
				$("#starttime").val(data.starttime)
				$("#buildtime").val(data.buildtime)
				$("#cost").val(data.cost)
				$("#endtime").val(data.endtime)
				$("#remark").val(data.remark)
			})

			$.get("<%=path%>/Customer/getCusInfo",function (data) {
				$(data).each(function(index,item) {
					var opt = "<option value='"+item.id+","+item.companyperson+"'>"+item.comname+"</option>"
					$("#optCus").append(opt);
					$("#companyperson").val(item.companyperson)
				})
			})

			$.get("<%=path%>/Employee/getEmpByP_fk",{p_fk:4},function (data) {
				$(data).each(function(index,item) {
					var opt = "<option value='"+item.eid+"'>"+item.ename+"</option>"
					$("#optEmp").append(opt);
				})
			})

		})

		//选择公司，自动填充公司负责人
		function changeCus() {
			var companyperson = $("#optCus").val().split(",")[1]
			$("#companyperson").val(companyperson)
		}
		
		function commit() {
			$("#form2").submit()   //submit要加括号！
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
    当前位置:项目管理>>编辑项目基本信息
 </td>
 </tr>
</table>
</td>
</tr>
</table>

<form name="form2" id="form2" action="<%=path%>/Project/updatePro">
<input type="hidden" name="pid" id="pid">
<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
<tr bgcolor="#E7E7E7">
	<td height="24" colspan="12" background="skin/images/tbg.gif">&nbsp;编辑项目信息&nbsp;</td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">项目名称：</td>
	<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22"><input name="pname" id="pname" value="${project.pname}"/></td>
	<td align="right" bgcolor="#FAFAF1" height="22">客户公司名称：</td>
	<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
<%--		<input value="中国农业银行"/>--%>
		<select style="width: 170px" id="optCus" name="newcomname" onchange="changeCus()">
			<option id="newcomname"></option>
		</select>
	</td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">客户方负责人：</td>
	<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22"><input name="companyperson" id="companyperson" /></td>
	<td align="right" bgcolor="#FAFAF1" height="22">项目经理：</td>
	<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
<%--		<input value="${project.employee.ename}"/>--%>
		<select style="width: 170px"  id="optEmp" name="emp_fk">
			<option id="ename"></option>
		</select>
	</td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">开发人数：</td>
	<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22"><input name="empcount" id="empcount" value="${project.empcount}">人</td>
	<td align="right" bgcolor="#FAFAF1" height="22">开始时间：</td>
	<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22"><input name="starttime" id="starttime" value="${project.starttime}"/></td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">立项时间：</td>
	<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22"><input name="buildtime" id="buildtime" value="${project.buildtime}"/></td>
	<td align="right" bgcolor="#FAFAF1" height="22">预估成本：</td>
	<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22"><input name="cost" id="cost" value="${project.cost}"/>&nbsp;万</td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">级别：</td>
	<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22"><select><option value=1>紧急</option><option value=2>一般</option><option value=3>暂缓</option></select></td>
	<td align="right" bgcolor="#FAFAF1" height="22">计划完成时间：</td>
	<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22"><input name="endtime" id="endtime" value="${project.endtime}"/></td>
</tr>

<tr >
	<td align="right" bgcolor="#FAFAF1" >备注：</td>
	<td colspan=3 align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" >
		<textarea rows=15 cols=130 name="remark" id="remark">${project.remark}</textarea>
	</td>
</tr>


<tr bgcolor="#FAFAF1">
<td height="28" colspan=4 align=center>
	&nbsp;
	<a onclick="commit()" class="coolbg">保存</a>
	<a href="project-base.jsp" class="coolbg">返回</a>
</td>
</tr>
</table>

</form>
  

</body>
</html>