<%@ page language="java"  pageEncoding="UTF-8"%>
<%
	//获取项目名
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>编辑角色信息</title>
<link rel="stylesheet" type="text/css" href="skin/css/base.css">
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript">
		$(function () {
			//获取全部的权限，再拼接到页面里面,这里要设置为同步，async的属性改成false
			$.ajaxSettings.async = false;
			$.post("<%=path%>/Sources/getAll",{roleid:${param.roleid}},function (data) {
				$(data).each(function (index,item) {
					if(item.pid == 1){
						var opt = "<input name=\"source\" value='"+item.id+"' type=\"checkbox\"/>"+item.name+"<br/>"
						if(item.sources != null){
							opt += querySources(item.sources)
						}
					}
					$("#tdd").append(opt)
				})
			})

			$.post("<%=path%>/Role/getRoleById",{roleid:${param.roleid}},function (data) {
				var opt = "<tr >\n" +
						"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">角色编号：</td>\n" +
						"\t<td  align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\" ><input name='roleid' readonly value='"+data.roleid+"'></td>\n" +
						"</tr>\n<tr >\n" +
						"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">角色名称：</td>\n" +
						"\t<td  align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\"><input name='rolename' value=\""+data.rolename+"\"/></td>\n" +
						"</tr>\n<tr >\n" +
						"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">状态：</td>\n" +
						"\t<td align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\"><select id='select' name='status'><option value=1>启用</option><option value=0>禁用</option></select></td>\n" + "</tr>"
				$("#trtr").after(opt)
				//设置value要放在after下面,不先after就没有状态的tr标签
				$("#select").val(data.status)
				var opt = "<tr >\n" +
						"\t<td align=\"right\" bgcolor=\"#FAFAF1\" >备注：</td>\n" +
						"\t<td colspan=3 align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" >\n" +
						"\t\t<textarea rows=10 cols=130 name='roledis'>"+data.roledis+"</textarea>\n" +
						"\t</td>\n</tr>"
				$("#ttrttr").after(opt)

				//把这个角色的权限全部勾选上(ajax的请求要设置为同步)
				var arr = $("input[name='source']")
				for(var i=0;i<arr.length;i++){
					$(data.sources).each(function (index,item) {
						if(item.id == $(arr[i]).val()){
							$(arr[i]).prop("checked",true);
						}
					})
				}
			})
		})


		//子权限的下面可能还有子权限，递归查询全部的权限
		function querySources(data) {
			var opt = ""
			$(data).each(function (index,item) {
				opt += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name='source' value='"+item.id+"' type=\"checkbox\"/>"+item.name+"<br/>"
				if(item.sources != null)
					querySources(item.sources)
			})
			return opt
		}

		//提交表单
		function commit() {
			$.ajax({
				url:"<%=path%>/Role/updateRole",
				data:$("#form2").serialize(),
				success:function (data) {
					alert("成功修改角色的权限！")
					location.href = "role.jsp"
				}
				}
			)

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
    当前位置:权限管理>>编辑角色
 </td>
 </tr>
</table>
</td>
</tr>
</table>

<form name="form2" id="form2">
<%--<input type="button" onclick="sss()" value="点击">--%>

<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
<tr bgcolor="#E7E7E7" id="trtr">
	<td height="24" colspan="2" background="skin/images/tbg.gif">&nbsp;编辑角色&nbsp;</td>
</tr>
<%--<tr >--%>
<%--	<td align="right" bgcolor="#FAFAF1" height="22">角色编号：</td>--%>
<%--	<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">role01</td>--%>
<%--</tr>--%>
<%--<tr >--%>
<%--	<td align="right" bgcolor="#FAFAF1" height="22">角色名称：</td>--%>
<%--	<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22"><input value="管理员"/></td>--%>
<%--</tr>--%>
<%--<tr >--%>
<%--	<td align="right" bgcolor="#FAFAF1" height="22">状态：</td>--%>
<%--	<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22"><select><option value=1>启用</option><option value=1>禁用</option></select></td>--%>
<%--</tr>--%>
<tr id="ttrttr">
	<td align="right" bgcolor="#FAFAF1" height="22">赋菜单资源：</td>
	<td id="tdd" align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">

<%--	<input type="checkbox" checked/>项目管理<br/>--%>
<%--	<input type="checkbox" checked/>基本信息管理<br/>--%>
<%--	<input type="checkbox" checked/>需求分析管理<br/>--%>
<%--	<input type="checkbox" checked/>模块管理<br/>--%>
<%--	<input type="checkbox" checked/>功能管理<br/>--%>
<%--	<input type="checkbox" checked/>附件管理<br/>--%>
<%--	--%>
<%--	<input type="checkbox" checked/>任务管理<br/>--%>
<%--	<input type="checkbox" checked/>创建任务<br/>--%>
<%--	<input type="checkbox" checked/>任务信息<br/>--%>
<%--	<input type="checkbox" checked/>我的任务<br/>--%>
	</td>
</tr>

<%--<tr >--%>
<%--	<td align="right" bgcolor="#FAFAF1" >备注：</td>--%>
<%--	<td colspan=3 align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" >--%>
<%--		<textarea rows=10 cols=130></textarea>--%>
<%--	</td>--%>
<%--</tr>--%>


<tr bgcolor="#FAFAF1">
<td height="28" colspan=4 align=center>
	&nbsp;
	<a onclick="commit()" class="coolbg">保存</a>
	<a href="role.jsp" class="coolbg">返回</a>
</td>
</tr>
</table>

</form>
  

</body>
</html>