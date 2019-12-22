<%@ page language="java"  pageEncoding="UTF-8"%>
<%
	//获取项目名
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>附件管理</title>
<link rel="stylesheet" type="text/css" href="skin/css/base.css">
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript">
		$(function () {
			$.post("<%=path%>/Baoxiao/getMyBx",function (data) {
				$(data).each(function (index,item) {
					//转换日期的格式，把毫秒值转成yyyy-MM-dd类型
					var date = new Date(item.bxtime)
					var newDate = date.getFullYear()+"-"+(date.getMonth()+1<10?"0"+(date.getMonth()+1):date.getMonth()+1)+"-"+(date.getDate()<10?"0"+date.getDate():date.getDate())

					if(item.bxstatus == 1){
						var st = "<td style='color: green'>审批通过</td>\n" +
								"\t\t\t\t\t<td><a href=\"mybaoxiao-look.jsp?bxid='"+item.bxid+"'\">查看详情</a> </td>\n"
					}
					if(item.bxstatus == 2){
						var st = "<td style='color: red'>驳回</td>\n" +
								"\t\t\t\t\t\t\t\t\t<td><a href=\"mybaoxiao-edit.jsp?bxid='"+item.bxid+"'\">修改重新提交</a> </td>"
					}
					if(item.bxstatus == 3){
						var st = "<td>未审批</td>\n" +
								"\t\t\t\t\t\t\t<td><a href=\"mybaoxiao-edit.jsp?bxid='"+item.bxid+"'\">编辑</a> </td>"
					}

					var opt = "<tr id='bxtr02' align='center' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\" >\n" +
							"\t<td><input name=\"id\" type=\"checkbox\" id=\"id\" value=\"101\" class=\"np\"></td>\n" +
							"\t<td>"+item.bxid+"</td>\n" +
							"\t<td>"+item.totalmoney+"</td>\n" +
							"\t<td align=\"center\">"+newDate+"</td>\n" +
							"\t<td>"+item.employee.ename+"</td>\n" +
							"\t<td>"+item.bxremark+"</td>\n" +
							"</tr>"

					$("#bxtr").after(opt)
					$("#bxtr02").append(st)
				})
			})
		})

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
    当前位置:个人报销管理>>报销列表
 </td>
  <td>
    <input type='button' class="coolbg np" onClick="location='mybaoxiao-add.jsp';" value='添加报销' />
 </td>
 </tr>
</table>
</td>
</tr>
</table>


<!--  内容列表   -->
<form name="form2">

<table width="98%"  cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
<tr bgcolor="#E7E7E7">
	<td height="24" colspan="12" background="skin/images/tbg.gif">&nbsp;附件列表&nbsp;</td>
</tr>
<tr align="center" bgcolor="#FAFAF1" height="22" id="bxtr">
	<td width="4%">选择</td>
	<td width="15%">编号</td>
	<td width="10%">总金额</td>
	<td width="10%">使用时间</td>
	<td width="13%">报销人</td>
	<td width="20%">备注信息</td>
	<td width="15%">审批状态</td>
	<td width="20%">操作</td>
</tr>

	
<%--<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22" >--%>
<%--	<td><input name="id" type="checkbox" id="id" value="101" class="np"></td>--%>
<%--	<td>11</td>--%>
<%--	<td>123</td>--%>
<%--	<td align="center"><a href=''><u> 2019-09-09 </u></a></td>--%>
<%--	<td>提莫</td>--%>
<%--	<td>222222</td>--%>
<%--</tr>--%>
	


<tr align="right" bgcolor="#EEF4EA">
	<td height="36" colspan="12" align="center"><!--翻页代码 --></td>
</tr>
</table>

</form>
  

</body>
</html>



