<%@ page language="java"  pageEncoding="UTF-8"%>
<%
	//获取项目名
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>添加需求分析信息</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/skin/css/base.css">
	<script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/utf8-jsp/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/utf8-jsp/ueditor.all.min.js"> </script>
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/utf8-jsp/lang/zh-cn/zh-cn.js"></script>
	<style type="text/css">
		div{
			width:100%;
		}
	</style>
	<script type="application/javascript">
        var ue = UE.getEditor('editor');


		$(function () {
			$.post("${pageContext.request.contextPath}/Forumpost/getComment",{id:${param.id}},function (data) {
					//转换日期的格式，把毫秒值转成yyyy-MM-dd类型
					var date = new Date(data.createtime)
					var newDate = date.getFullYear()+"-"+(date.getMonth()+1<10?"0"+(date.getMonth()+1):date.getMonth()+1)+"-"+(date.getDate()<10?"0"+date.getDate():date.getDate())+" "+(date.getHours() < 10 ? "0" + date.getHours() : date.getHours())+":"+(date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes())

					var opt = "<tr >\n" +
							"\t\t\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">\n" +
							"\t\t\t\t<span >\n" +
							"\t\t\t\t\t<img src='${pageContext.request.contextPath}/images/"+data.employee.emppic+"' height='50px' width='50px'/>\n" +
							"\t\t\t\t</span>\n\t\t\t</td>\n" +
							"\t\t\t<td  align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\">\n" +
							"<input type=\"hidden\" id=\"hid_forumfk\" value=\""+data.forumid+"\">"+
							"\t\t\t\t<span>标题："+data.forumtitle+" </span><br>\n" +
							"\t\t\t\t发布人：<span style='color:green'>"+data.employee.ename+"</span><br>\n" +
							"\t\t\t\t<span>发布时间："+newDate+" </span><br>\n" +
							"\t\t\t\t<span>内容："+data.forumcontent+"</span>\n" +
							"\t\t\t</td>\n\t\t</tr>\n"+"<tr><tr><tr><tr><tr><tr>"

					$(data.evaluate).each(function (index,item) {
						// 这里用bean层的属性名,bean层和数据库字段不对应的时候一定要注意！
						// 显示第一层的评论(不是回复评论的评论)
						if(item.evaidFk == null){
							//转换日期的格式，把毫秒值转成yyyy-MM-dd类型
							var date = new Date(item.evatime)
							var newDate = date.getFullYear()+"-"+(date.getMonth()+1<10?"0"+(date.getMonth()+1):date.getMonth()+1)+"-"+(date.getDate()<10?"0"+date.getDate():date.getDate())+" "+(date.getHours() < 10 ? "0" + date.getHours() : date.getHours())+":"+(date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes())
							opt += "<tr >\n" +
									"\t\t\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">\n" +
									"\t\t\t\t\t<span >\n" +
									"\t\t\t\t\t\t<img src='${pageContext.request.contextPath}/images/"+item.employee.emppic+"' height='50px' width='50px'/>\n" +
									"\t\t\t\t\t</span>\n\t\t\t</td>\n" +
									"\t\t\t<td  align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\">\n" +
									//加一个hidden属性的input框,存放评论的主键evaid。每个id属性在后面拼接item.evaid,保证fun函数每次都能获取到正确的evaid值
									"<input type=\"hidden\" id=\"reply_id"+item.evaid+"\" value=\""+item.evaid+"\">"+
									"\t\t\t\t评论人：<span style='color:green'>"+item.employee.ename+"</span><br>\n" +
									"\t\t\t\t<span>评论时间："+newDate+" </span><br>\n" +
									"\t\t\t\t<span>评论内容："+item.evacontent+"</span>\n" +
									"\t\t\t\t&nbsp;<span><a href=\"#replyTr\" onclick='fun($(\"#reply_id"+item.evaid+"\").val(),1)' >【回复】</a></span>\n" +
									"\t\t\t</td>\n\t\t</tr>"

									//递归查询评论的全部回复
									if(item.evaluate.length > 0){
										opt += getReply(item.evaluate,item.employee)
									}
									opt = opt + "<tr><tr><tr><tr><tr><tr><tr><tr><tr><tr><tr><tr><tr><tr><tr>"
								}

							})
						$("#trr").after(opt)
					})
				})


		function getReply(list,emp) {
			var opt = ""
			$(list).each(function (index,item) {
				//转换日期的格式，把毫秒值转成yyyy-MM-dd类型
				var date = new Date(item.evatime)
				var newDate = date.getFullYear()+"-"+(date.getMonth()+1<10?"0"+(date.getMonth()+1):date.getMonth()+1)+"-"+(date.getDate()<10?"0"+date.getDate():date.getDate())+" "+(date.getHours() < 10 ? "0" + date.getHours() : date.getHours())+":"+(date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes())

				opt += "<tr>\n" +
						"\t\t\t\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">\n" +
						"\t\t\t\t\t\t<span >\n" +
						"\t\t\t\t\t\t\t<img src='${pageContext.request.contextPath}/images/"+item.employee.emppic+"' height='50px' width='50px'/>\n" +
						"\t\t\t\t\t\t</span>\n\t\t\t\t</td>\n" +
						"\t\t\t\t<td  align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\">\n" +
						//加一个hidden属性的input框,存放评论的主键evaid。每个id属性在后面拼接item.evaid,保证fun函数每次都能获取到正确的evaid值
						"<input type=\"hidden\" id=\"reply_id"+item.evaid+"\" value=\""+item.evaid+"\">"+
						"\t\t\t\t\t<span style='color:green' >"+item.employee.ename+"</span>&nbsp;回复了&nbsp;<span style='color:green'>"+emp.ename+"</span><br>\n" +
						"\t\t\t\t\t<span>回复时间："+newDate+"</span><br>\n" +
						"\t\t\t\t\t<span>回复内容&nbsp;:&nbsp;"+item.evacontent+"</span>\n" +
						"\t\t\t\t\t&nbsp;<span><a href=\"#replyTr\" onclick='fun($(\"#reply_id"+item.evaid+"\").val(),1)'>【回复】</a></span>\n" +
						"\t\t\t\t</td></tr>"
				if(item.evaluate.length > 0){
					opt += getReply(item.evaluate,item.employee)
				}
			})
			return opt
		}

		function fun(evaid,state) {
			$("#hid_evaid").val(evaid)
			//根据state的值判断是回复评论还是新加评论
			$("#hid_state").val(state)

		}

		//添加评论
		function commit() {
			//获取富文本编辑器的内容
			var evacontent = ue.getPlainTxt()
			var evaidFk = $("#hid_evaid").val()
			var forumFk = $("#hid_forumfk").val()
			var state = $("#hid_state").val()
			$.post("<%=path%>/Forumpost/addPin",{evacontent:evacontent,evaidFk:evaidFk,forumFk:forumFk,state:state},function (data) {
				if(data == 1){
					alert("成功添加评论")
					location.href = "forum-reply.jsp?id="+$("#hid_forumfk").val()
				}else{
					alert("添加评论失败")
				}
			})
		}

		function changeState() {
			$("#hid_evaid").val("")
			$("#hid_state").val("")
		}

	</script>
</head>
<body leftmargin="8" topmargin="8" background='skin/images/allbg.gif'>

<!--  快速转换位置按钮  -->
<table width="98%" border="0" c1ellpadding="0" cellspacing="1" bgcolor="#D1DDAA" align="center">
	<tr>
		 <td height="26" background="skin/images/newlinebg3.gif">
			  <table width="58%" border="0" cellspacing="0" cellpadding="0">
				  <tr >
					  <td >
						当前位置:论坛>>评论
					  </td>
				 </tr>
			  </table>
		</td>
	</tr>
</table>

<div>

<form name="form2" action="${pageContext.request.contextPath}/eval/add" id="form15" method="post">
<input type="hidden" id="hid_evaid">
<input type="hidden" id="hid_state">
<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
<tr bgcolor="#E7E7E7" id="trr">
	<td height="24" colspan="2" background="skin/images/tbg.gif">&nbsp;评论&nbsp;</td>
</tr>
<%--		<tr >--%>
<%--			<td align="right" bgcolor="#FAFAF1" height="22">--%>
<%--				<span >--%>
<%--					<img src='${pageContext.request.contextPath}/images/tx.png' height='50px' width='50px'/>--%>
<%--				</span>--%>
<%--			</td>--%>
<%--			<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">--%>
<%--				<span>标题：租房 </span><br>--%>
<%--				<span>发布人：张三</span><br>--%>
<%--				<span>发布时间：2019-09-09 </span><br>--%>
<%--				<span>内容：水电费第三方</span>--%>
<%--			</td>--%>
<%--		</tr>--%>

	
<%--		<tr >--%>
<%--			<td align="right" bgcolor="#FAFAF1" height="22">--%>
<%--					<span >--%>
<%--						<img src='${pageContext.request.contextPath}/images/tx.png' height='50px' width='50px'/>--%>
<%--					</span>--%>
<%--			</td>--%>
<%--			<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">--%>
<%--				<span>评论人：李四</span><br>--%>
<%--				<span>评论时间：2019-09-09 </span><br>--%>
<%--				<span>评论内容：你好</span>--%>
<%--				&nbsp;<span><a href="#">【回复】</a></span>--%>
<%--			</td>--%>
<%--		</tr>--%>
	     
<%--		<tr>--%>
<%--				<td align="right" bgcolor="#FAFAF1" height="22">--%>
<%--						<span >--%>
<%--							<img src='${pageContext.request.contextPath}/images/tx.png' height='50px' width='50px'/>--%>
<%--						</span>--%>
<%--				</td>--%>
<%--				<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">--%>
<%--					<span>张三&nbsp;回复了&nbsp;李四</span><br>--%>
<%--					<span>回复时间：2019-09-09</span><br>--%>
<%--					<span>回复内容:不好</span>--%>
<%--					&nbsp;<span><a href="#">【回复】</a></span>--%>
<%--				</td>--%>
<%--		</tr>--%>


	<tr id="replyTr">
	<td align="right" bgcolor="#FAFAF1" height="22" ><a onclick="changeState()">我也说两句：</a></td>
	<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
	<script id="editor" name="content" type="text/plain" style="width:1024px;height:100px;"></script>
	</td>
	</tr>
<tr bgcolor="#FAFAF1">
<td height="28" colspan=4 align=center>
&nbsp;
<a href="javascript:commit()" class="coolbg">发布</a>
<a href="<%=path%>/forum-reply.jsp" class="coolbg">返回</a>
</td>
</tr>

</table>
 </form>

</div>

</body>
</html>