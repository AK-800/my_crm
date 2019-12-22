<%@ page language="java"  import="com.ujiuye.usual.bean.Baoxiao,java.util.*" pageEncoding="UTF-8"%>
<%
	//获取项目名
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>添加附件</title>
<link rel="stylesheet" type="text/css" href="skin/css/base.css">
	<script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="application/javascript">
		$(function () {

			// $.ajaxSettings.async = false;
			$.post("<%=path%>/Baoxiao/queryBx",{bxid:${param.bxid}},function (data) {

				//添加审批回复，根据status判断是通过还是驳回
				$(data.baoxiaoreply).each(function (index,item) {
					//转换日期的格式，把毫秒值转成yyyy-MM-dd类型
					var date = new Date(item.replytime)
					var newDate = date.getFullYear()+"-"+(date.getMonth()+1<10?"0"+(date.getMonth()+1):date.getMonth()+1)+"-"+(date.getDate()<10?"0"+date.getDate():date.getDate())+" "+(date.getHours() < 10 ? "0" + date.getHours() : date.getHours())+":"+(date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes())
					if(item.status == 1){
						var opt = "<div style='font-size: 15px'><span style='font-size:15px;color: green'>同意审批</span>&nbsp;&nbsp;&nbsp;&nbsp;回复时间:"+newDate+" &nbsp;&nbsp;&nbsp; 回复内容:"+item.content+"</div>"
					}
					if(item.status == 2){
						var opt = "<div style='font-size: 15px'><span style='font-size:15px;color: red'>驳回审批</span>&nbsp;&nbsp;&nbsp;&nbsp;回复时间:"+newDate+" &nbsp;&nbsp;&nbsp; 回复内容:"+item.content+"</div>"
					}
					$("#recordTr").append(opt)
				})

				$(data).each(function (index,item) {
					$("#bxid").val(item.bxid)
					//转换日期的格式，把毫秒值转成yyyy-MM-dd类型
					var date = new Date(item.bxtime)
					var newDate = date.getFullYear()+"-"+(date.getMonth()+1<10?"0"+(date.getMonth()+1):date.getMonth()+1)+"-"+(date.getDate()<10?"0"+date.getDate():date.getDate())

					var opt = "<tr >\n" +
							"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">支出类型：</td>\n" +
							"\t<td  align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\">\n" + "\n" +
							"\t\t<select name=\"paymode\" id=\"paymode\">\n" + "\n" +
							"\t\t\t\t<option value=\""+item.expendituretype.etid+"\" selected>"+item.expendituretype.etname+"</option>\n" +
							"\t\t\t\n" + "\t\t</select>\n" + "\t</td>\n" +
							"</tr>\n" +
							"<tr >\n" +
							"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">总金额：</td>\n" +
							"\t<td  align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\">\n" +
							"\t\t<input size=\"26\"  id=\"totalmoney\" name=\"totalmoney\" value=\""+item.totalmoney+"\"/>\n" + "\t</td>\n" +
							"</tr>\n" +
							"<tr >\n" +
							"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">使用时间：</td>\n" +
							"\t<td  align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\">\n" +
							"\t\t<input type='date' size=\"52\" name=\"bxtime\" id=\"bxtime\" value=\""+newDate+"\"/>\n" + "\t</td>\n" +
							"</tr>\n" +
							"<tr >\n" +
							"\t<td align=\"right\" bgcolor=\"#FAFAF1\" >备注：</td>\n" +
							"\t<td colspan=3 align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" >\n" +
							"\t\t<textarea rows=10 cols=130  id=\"bxremark\" name=\"bxremark\">"+item.bxremark+"</textarea>\n" + "\t</td>\n"

					$("#baotr").after(opt)
				})

			})

			//显示报销单的类型
			$.post("<%=path%>/Expendituretype/queryExp",function (data) {
				$(data).each(function (index,item) {
					var opt = "<option value=\""+item.etid+"\">"+item.etname+"</option>"
					$("#paymode").append(opt)
				})
			})
		})

		function commit(status) {
			$("#bxstatus").val(status)
			$.ajax({
				url:"<%=path%>/Baoxiao/updateBx",
				data:$("#form11").serialize(),
				success:function (data) {
					if(data){
						alert("成功修改报销单！")
						location.href = "mybaoxiao-base.jsp"
					}else{
						alert("修改报销单失败！")
					}
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
    当前位置:报销管理>>添加新的报销
 </td>
 </tr>
</table>
</td>
</tr>
</table>

<form name="form2" id="form11" action="" method="post" >
	<input type="hidden" id="bxstatus" name="bxstatus">
	<input type="hidden" id="bxid" name="bxid">
<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
<tr bgcolor="#E7E7E7" id="baotr">
	<td height="24" colspan="2" background="skin/images/tbg.gif">&nbsp;添加新的报销单&nbsp;</td>
</tr>

<%--<tr >--%>
<%--	<td align="right" bgcolor="#FAFAF1" height="22">支出类型：</td>--%>
<%--	<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">--%>

<%--		<select name="paymode" id="paymode">--%>
<%--				<option value="出差票据" selected>出差票据</option>--%>
<%--				<option value="办公采购">办公采购</option>--%>
<%--				<option value="其他">其他</option>--%>
<%--		</select>--%>
<%--	</td>--%>
<%--</tr>--%>
<%--<tr >--%>
<%--	<td align="right" bgcolor="#FAFAF1" height="22">总金额：</td>--%>
<%--	<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">--%>
<%--		<input size="26"  id="totalmoney" name="totalmoney" value="${nnbx.totalmoney}"/>--%>
<%--	</td>--%>
<%--</tr>--%>
<%--<tr >--%>
<%--	<td align="right" bgcolor="#FAFAF1" height="22">使用时间：</td>--%>
<%--	<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">--%>
<%--		<input size="52" name="bxtime" id="bxtime" value="2019-09-09"/>--%>
<%--	</td>--%>
<%--</tr>--%>
<%--<tr >--%>
<%--	<td align="right" bgcolor="#FAFAF1" >备注：</td>--%>
<%--	<td colspan=3 align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" >--%>
<%--		<textarea rows=10 cols=130  id="bxremark" name="bxremark">${nnbx.bxremark}</textarea>--%>
<%--	</td>--%>
<%--</tr>--%>
<%--    <tr >--%>
<%--		<td align="right" bgcolor="#FAFAF1" >批注：</td>--%>
<%--		<td colspan=3 align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" >--%>
<%--			<textarea rows=3 cols=130 name="bxremark" id="pizhu" readonly="true">${nnbx.result}</textarea>--%>
<%--		</td>--%>
<%--	</tr>--%>
	<tr>
		<td height="70px" style="font-size: 15px">审批记录</td>
		<td id="recordTr">
<%--			<div>回复时间：2019-10-18 &nbsp;&nbsp; 内容：同意报销</div>--%>
<%--			<div>回复时间：2019-10-18 &nbsp;&nbsp; 内容：同意报销</div>--%>
<%--			<div>回复时间：2019-10-18 &nbsp;&nbsp; 内容：同意报销</div>--%>
		</td>
	</tr>

<tr bgcolor="#FAFAF1">
<td height="28" colspan=4 align=center>
	&nbsp;
	<a href="javascript:commit(3)" class="coolbg">保存</a>
	<a href="mybaoxiao-base.jsp" class="coolbg">返回</a>
</td>
</tr>
</table>

</form>
  

</body>
</html>