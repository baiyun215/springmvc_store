<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">
		<link rel="icon" href="../../favicon.ico">

		<title>store</title>

		<!-- Bootstrap core CSS -->
		<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<!-- Custom styles for this template -->
		<link href="css/carousel.css" rel="stylesheet">
		<style type="text/css">
			.navbar-form{
				display: inline-block;
			}
			#content{
				margin-top: 50px;
			}
			.row{
				margin-left: 10px;
				line-height: 30px;
			}
		</style>
	</head>
	<!-- NAVBAR
================================================== -->

	<body>
		<div class="navbar-wrapper">
			<div class="container">
				<nav class="navbar navbar-inverse navbar-fixed-top">
					<div class="container">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
	            <span class="sr-only">Toggle navigation</span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	          </button>
							<a class="navbar-brand" href="#">购物商城</a>
						</div>
						<div id="navbar" class="collapse navbar-collapse">
							<ul class="nav navbar-nav">
								<li>
								<a href="${pageContext.request.contextPath }/index.jsp">主页</a>
								</li>
								<li class="dropdown">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">分类 <span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li>
											<a href="${pageContext.request.contextPath }/typeList.action?type=phone">手机</a>
										</li>
										<li>
											<a href="${pageContext.request.contextPath }/typeList.action?type=washer">洗衣机</a>
										</li>
										<li>
											<a href="${pageContext.request.contextPath }/typeList.action?type=laptop">笔记本</a>
										</li>
									</ul>
								</li>
								<li>
									<a href="${pageContext.request.contextPath }/queryCart.action?userId=${user.id}">购物车</a>
								</li>
								<li class="active">
									<a href="${pageContext.request.contextPath }/queryOrder.action?userId=${user.id}">我的订单</a>
								</li>
								<li>
									<a href="#contact">我的信息</a>
								</li>
							</ul>
							<form class="navbar-form">
								<div class="form-group">
									<input type="text" placeholder="请输入商品名称" class="form-control">
								</div>
								<button type="submit" class="btn btn-success">查询</button>
							</form>
							<ul class="nav navbar-nav navbar-right">
								<li><a href="#">欢迎您!${user.name}</a></li>
								<c:if test="${user.name!=null }">
								<li><a href="${pageContext.request.contextPath }/logout.action">退出</a></li>
								</c:if>
								<c:if test="${user.name==null }">
								<li><a href="${pageContext.request.contextPath }/pleaseLogin.action">请登录</a></li>
								</c:if>
							</ul>
						</div>
						<!--/.nav-collapse -->
					</div>
				</nav>
			</div>
		</div>

		<!--主体页面-->
		<div class="container marketing" id="content">
			<div class="col-md-9">
				<h3>管理订单</h3>
				<c:forEach items="${oqv}" var="oqv">
					<div class="thumbnail">
						<div class="row">
							<div class="col-sm-3">
								<a href="product.html">${oqv.items.name }</a>
							</div>
							<div class="col-sm-1">${oqv.myorder.num }</div>
							<div class="col-sm-2">￥${oqv.items.price }</div>
							<div class="col-sm-2" id="status">${oqv.myorder.status }</div>
							<c:if test="${oqv.myorder.status=='已完成'}">
							<div class="col-sm-2">
								<input type="button" class="btn btn-sm btn-default" id="confirm" value="确认" onclick="pay(${oqv.myorder.id},this)" disabled="true"/>
							</div>
							</c:if>
							<c:if test="${oqv.myorder.status=='未完成'}">
							<div class="col-sm-2">
								<input type="button" class="btn btn-sm btn-default" id="confirm" value="确认" onclick="pay(${oqv.myorder.id},this)"/>
							</div>
							</c:if>
							<div class="col-sm-2">
								<input type="button" id="cancel" value="取消" class="btn btn-sm btn-default" onclick="javascript:window.location.href='${pageContext.request.contextPath}/delOrder.action?id=${oqv.myorder.id}'"/>
							</div>
						</div>
					</div>
					</c:forEach>
			</div>
			<div class="col-sm-12">
				<ul class="pagination" id="barcon">
				</ul>
			</div>
			<!-- /.row -->
			<!-- FOOTER -->
			<footer>
				<p class="pull-right">
					<a href="#">Back to top</a>
				</p>
			</footer>
		</div>
		<!-- /.container -->

		<!-- Bootstrap core JavaScript
    ================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
		<script src="js/myJs.js"></script>
		<script>
			window.jQuery || document.write('<script src="../js/jquery.min.js><\/script>')
		</script>
		<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			function pay(orderid,btn){
				var message = confirm("是否确认收货?");
				if(message==true){
					/* window.location.href="${pageContext.request.contextPath}/finishOrder.action?id="+orderid; */
					$.ajax({
						type:"post",
						url:"${pageContext.request.contextPath}/finishOrder.action",
						data:{id:orderid},
						success:function(){
							$(btn).val("已完成");
							$(btn).attr('disabled',"true");
							$(btn).parent().next().children().attr('disabled',"true");
						}
					});
				}
			}
			
			
			window.onload=function(){
				page(1);
			}
		</script>
	</body>

</html>