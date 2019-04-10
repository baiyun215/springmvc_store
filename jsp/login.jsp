<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>系统登陆页面</title>

    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <link href="css/signin.css" rel="stylesheet">
  </head>

  <body>

    <div class="container">
      <form class="form-signin" action="${pageContext.request.contextPath}/login.action" method="post">
        <h2 class="form-signin-heading">${message}</h2>
        <!-- <label for="inputEmail" class="sr-only">Username</label> -->
        <input type="text" name="username" id="inputEmail" class="form-control" placeholder="Username" required autofocus>
        <!-- <label for="inputPassword" class="sr-only">Password</label> -->
        <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required>
        <button class="btn btn-lg btn-primary btn-block" type="submit">登陆</button>
        <button class="btn btn-lg btn-primary btn-block" onclick="javascript:window.location.href='${pageContext.request.contextPath}/pleaseRegister.action'">注册</button>
      </form>

    </div> <!-- /container -->


  </body>
</html>