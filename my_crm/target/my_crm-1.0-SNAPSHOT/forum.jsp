<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>main</title>
    <base target="_self">
    <link rel="stylesheet" type="text/css" href="skin/css/base.css" />
    <link rel="stylesheet" type="text/css" href="skin/css/main.css" />
    <style type="text/css">
        li,img{float: left;}
        li{margin: 15px;padding-left:30px;width: 500px;}
        *{overflow: auto}
        li div{padding-left:13px;margin-top: 5px;font-size: 23px}
    </style>
    <script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $.ajax({
                url:"Forumpost/getAllForum",
                dataType:"json",
                success:function (data) {
                    $(data).each(function (index,item) {
                        //转换日期的格式，把毫秒值转成yyyy-MM-dd类型
                        var date = new Date(item.createtime)
                        var newDate = date.getFullYear()+"-"+(date.getMonth()+1<10?"0"+(date.getMonth()+1):date.getMonth()+1)+"-"+(date.getDate()<10?"0"+date.getDate():date.getDate())+" "+(date.getHours() < 10 ? "0" + date.getHours() : date.getHours())+":"+(date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes())

                        var li="<a href='forum-reply.jsp?id="+item.forumid+"'><li><img width='85px' src='images/tx.png'><div>标题："+item.forumtitle+"</div><div>时间："+newDate+"</div></li></a>";
                        $("#content").append(li);
                    });
                }
            })
        })
    </script>

</head>
<body leftmargin="8" topmargin='8'>

<table width="98%" align="center" border="0" cellpadding="3"
       cellspacing="1" bgcolor="#CBD8AC"
       style="margin-bottom: 8px; margin-top: 8px;">
    <tr>
        <td colspan="3" background="skin/images/frame/wbg.gif" bgcolor="#EEF4EA"
            class='title'>
            <span>论坛分类</span>|<span>生活广场</span> |<span>租房信息&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><a href='forum-add.jsp'><font size="5">发帖</font></a>
        </td>
    </tr>

    <tr>
        <td colspan="2">
            <ul   id="content" >

            </ul>
        </td>
    </tr>
</table>



</body>
</html>