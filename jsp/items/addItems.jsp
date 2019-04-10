<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta content="text/html; charest=UTF-8" http-equiv="Content-Type">
<title>添加商品信息</title>
</head>
<body>
<form id="itemForm" action="${pageContext.request.contextPath }/addItems.action" method="post" enctype="multipart/form-data">
添加商品信息
<table width="100%" border=1>
<tr>
	<td>商品名称</td>
	<td><input type="text" name="name"/></td>
</tr>
<tr>
	<td>商品价格</td>
	<td><input type="text" name="price"/></td>
</tr>
<tr>
	<td>商品生产日期</td>
	<td><input type="text" name="createtime"/></td>
</tr>
<tr>
	<td>商品图片</td>
	<td>
		<input type="file" name="items_pic" />
	</td>
</tr>
<tr>
<td>商品类型：</td>
<td><select name="type">
	<option value="phone">手机</option>
	<option value="laptop">笔记本</option>
	<option value="washer">洗衣机</option>
	</select></td>
</tr>
<tr>
	<td>商品简介</td>
	<td>
		<textarea rows="3" cols="30" name="detail"></textarea>
	</td>
</tr>
<tr>
<td colspan="2" align="center">
<input type="submit" value="提交" />
<input type="button" value="返回" onclick="javascript:window.location.href='${pageContext.request.contextPath}/adminItemsList.action'"/>
</td>
</tr>
</table>
</form>
</body>
</html>