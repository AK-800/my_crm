<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>客户信息管理</title>
    <link rel="stylesheet" type="text/css" href="skin/css/base.css">
</head>
<script src="js/jquery-2.1.1.min.js"></script>
<script language="JavaScript" type="text/javascript">
    $(function () {
        pagerows();
        $("#subs").click(function () {
            pagerows();
        })

        $("#checkall").click(function () {
            $(".checkboxs").prop("checked", "checked");
        })
        $("#decheckall").click(function () {
            $(":checkbox").removeAttr("checked");
        })
        $(".pages").click(function () {
            var attr = $(this).attr("value");
            // alert(attr);
            pagerows(eval(attr));
        })

    })
    function pagerows(begin) {
        $.ajax({
            type: "GET",
            url: "/crm/cus/showAllCustomer",
            data: {"begin":begin,"cid": $("#cid").val(), "keyword": $("#keyword").val(), "orderby": $("#orderby").val()},
            dataType: "json",
            success: function (data) {
                $("#now").html(data.pageNum);
                $("#total").html(data.pages);
                $("#end").attr("value",data.pages);
                $("#previousPage").attr("value",data.prePage);
                $("#nextPage").attr("value",data.nextPage);
                var str = "";
                $(data.list).each(function (i,cus) {
                    str += "<tr class='trs' align='center' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\"\n" +
                        "                onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\">\n" +
                        "                <td><input  class='checkboxs' name='id' type=\"checkbox\"  value=" + cus.id + " ></td>\n" +
                        "                <td>" + cus.id + "</td>\n" +
                        "                <td>" +cus.companyperson + "</td>\n" +
                        "                <td align=\"center\">" + cus.comname + "</td>\n" +
                        "                <td>" + new Date(cus.addtime).toLocaleDateString() + "</td>\n" +
                        "                <td>" + cus.comphone + "</td>\n" +
                        "                <td><a href=\"<%=request.getContextPath()%>/cus/showCustomer?id=" +cus.id + "&page=customer-edit\">编辑</a> | <a\n" +
                        "                        href=\"<%=request.getContextPath()%>/cus/showCustomer?id=" + cus.id + "&page=customer-look\">查看详情</a></td>\n" +
                        "            </tr>";
                })
                $("#tbody").html(str);
                str = "";
            },
            error: function () {
                alert("error")
            }
        });
    }
</script>
<body leftmargin="8" topmargin="8" background='skin/images/allbg.gif'>

<!--  快速转换位置按钮  -->
<table width="98%" border="0" cellpadding="0" cellspacing="1" bgcolor="#D1DDAA" align="center">
    <tr>
        <td height="26" background="skin/images/newlinebg3.gif">
            <table width="58%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td>
                        当前位置:客户信息管理>>客户信息
                    </td>
                    <td>
                        <input type='button' class="coolbg np" onClick="location='customer-add.jsp';" value='添加客户信息'/>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<!--  搜索表单  -->
<input type='hidden' name='dopost' value=''/>
<table width='98%' border='0' cellpadding='1' cellspacing='1' bgcolor='#CBD8AC' align="center"
       style="margin-top:8px">
    <tr bgcolor='#EEF4EA'>
        <td background='skin/images/wbg.gif' align='center'>
            <table border='0' cellpadding='0' cellspacing='0'>
                <tr>
                    <td width='90' align='center'>搜索条件：</td>
                    <td width='160'>
                        <select id="cid" name='cid' style='width:150px'>
                            <option value='0'>选择类型...</option>
                            <option value='1'>客户所在公司名称</option>
                            <option value='2'>联系人姓名</option>
                        </select>
                    </td>
                    <td width='70'>
                        关键字：
                    </td>
                    <td width='160'>
                        <input id="keyword" type='text' name='keyword' value='' style='width:120px'/>
                    </td>
                    <td width='110'>
                        <select id="orderby" name='orderby' style='width:120px'>
                            <option value='id'>排序...</option>
                            <option value='pubdate'>添加时间</option>

                        </select>
                    </td>
                    <td>
                        &nbsp;&nbsp;&nbsp;<input alt="查询" id="subs" name="imageField" type="image"
                                                 src="skin/images/frame/search.gif"
                                                 width="45" height="20" border="0" class="np"/>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<!--  内容列表   -->
<form name="form2" action="<%=request.getContextPath()%>/cus/deleteCustomer">

    <table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center"
           style="margin-top:8px">


        <tr bgcolor="#E7E7E7">
            <td height="24" colspan="12" background="skin/images/tbg.gif">&nbsp;需求列表&nbsp;</td>
        </tr>
        <tr align="center" bgcolor="#FAFAF1" height="22" id="tr2">
            <td width="4%">选择</td>
            <td width="6%">序号</td>
            <td width="10%">联系人</td>
            <td width="10%">公司名称</td>
            <td width="8%">添加时间</td>
            <td width="8%">联系电话</td>
            <td width="10%">操作</td>
        </tr>
        <tbody id="tbody">

        </tbody>
        <%--            <tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';"--%>
        <%--                onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">--%>
        <%--                <td><input name="id" type="checkbox" id="id" value="101" class="np"></td>--%>
        <%--                <td>${cus.id}</td>--%>
        <%--                <td>${cus.companyperson}</td>--%>
        <%--                <td align="center">${cus.companyperson}</td>--%>
        <%--                <td><fmt:formatDate value="${cus.addtime}" pattern="yyyy-MM-dd"/></td>--%>
        <%--                <td>${cus.comphone}</td>--%>
        <%--                <td><a href="<%=request.getContextPath()%>/cus/showCustomer?id=${cus.id}">编辑</a> | <a--%>
        <%--                        href="<%=request.getContextPath()%>/cus/showCustomer?id=${cus.id}">查看详情</a></td>--%>
        <%--            </tr>--%>
        <tr bgcolor="#FAFAF1">
            <td height="28" colspan="12">
                &nbsp;
                <a class="coolbg" id="checkall">全选</a>
                <a class="coolbg" id="decheckall">反选</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a class="coolbg">&nbsp;<input type="submit" value="删除">&nbsp;</a>
                <a href="" class="coolbg">&nbsp;导出Excel&nbsp;</a>
            </td>
        </tr>
        <tr align="right" bgcolor="#EEF4EA">
            <td height="36" colspan="18" align="center" id="tdd">
                当前是第<span id="now"></span>页
                <a class="pages" id="first" value="1">首页</a>
                <a class="pages" id="previousPage" value="" >上一页</a>
                <a class="pages" id="nextPage" value="2">下一页</a>
                <a class="pages" id="end"  value="">末页</a>
                共<span id="total"></span>页
            </td>
        </tr>
    </table>

</form>


</body>
</html>