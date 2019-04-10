<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta content="text/html; charest=UTF-8" http-equiv="Content-Type">
<title>查询商品列表</title>
<script type="text/javascript">
function del(){
	var msg = "确认删除?"
	if(confirm(msg) == true)
	return true;
	else
	return false;
}
</script>
</head>
<body>
当前用户:${username },
<c:if test="${username!=null }">
	<a href="${pageContext.request.contextPath }/logout.action">退出</a>
</c:if>
<form action="${pageContext.request.contextPath }/queryItems.action" method="post">
查询条件:
<table width=100% border=1>
<tr>
<td>
商品名称:<input name="itemsCustom.name"/>
</td>
<td><input type="submit" value="查询" /><input type="button" value="添加商品" onclick="javascript:window.location.href='${pageContext.request.contextPath }/toAddItems.action'"></td>
</tr>
</table>
商品列表:
<table width=100% border=1>
<tr>
	<td>商品名称</td>
	<td>商品价格</td>
	<td>生产日期</td>
	<td>商品描述</td>
	<td>操作</td>
</tr>
<c:forEach items="${itemsList }" var="item">
<tr>
	<td>${item.name }</td>
	<td>${item.price }</td>
	<td><fmt:formatDate value="${item.createtime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
	<td>${item.detail }</td>
	<td><a href="${pageContext.request.contextPath }/editItems.action?id=${item.id}">修改</a></td>
	<td><a href="${pageContext.request.contextPath }/deleteItems.action?id=${item.id}" onclick="javascript:return del()">删除</a></td>
</tr>
</c:forEach>
</table>
</form>
</body>
</html>