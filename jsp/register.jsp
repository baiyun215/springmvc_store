<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta content="text/html; charest=UTF-8" http-equiv="Content-Type">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>系统注册页面</title>

    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <link href="css/signin.css" rel="stylesheet">
  </head>

  <body>

    <div class="container">

      <form class="form-signin" action="${pageContext.request.contextPath}/register.action" method="post">
        <h2 class="form-signin-heading">Please register</h2>
        <input type="text" name="username" id="inputEmail" class="form-control" placeholder="Username" required autofocus/>
        <input type="text" name="password" id="inputPassword" class="form-control" placeholder="Password" required/>
        <input type="text" name="name" class="form-control" placeholder="Name" required/>
        <input type="last" name="address" class="form-control" placeholder="Address" required/>
        <input type="hidden" name="type" value="2"/>
        <button class="btn btn-lg btn-primary btn-block" type="submit">注册</button>
        <button class="btn btn-lg btn-primary btn-block" onclick="${pageContext.request.contextPath}/pleaseLogin.action">返回</button>
      </form>

    </div> <!-- /container -->


  </body>
</html>
