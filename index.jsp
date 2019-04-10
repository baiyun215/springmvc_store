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
								<li class="active">
									<a href="${pageContext.request.contextPath }/index.jsp">主页</a>
								</li>
								<li class="dropdown">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">分类 <span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li>
											<a href="${pageContext.request.contextPath }/typeList.action?type=phone&userId=${user.id }">手机</a>
										</li>
										<li>
											<a href="${pageContext.request.contextPath }/typeList.action?type=washer&userId=${user.id }">洗衣机</a>
										</li>
										<li>
											<a href="${pageContext.request.contextPath }/typeList.action?type=laptop&userId=${user.id }">笔记本</a>
										</li>
									</ul>
								</li>
								<li>
									<a href="${pageContext.request.contextPath }/queryCart.action?userId=${user.id}">购物车</a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath }/queryOrder.action?userId=${user.id}">我的订单</a>
								</li>
								<li>
									<a href="#contact">我的信息</a>
								</li>
							</ul>
							<form class="navbar-form" action="${pageContext.request.contextPath }/queryItems.action" method="post">
								<div class="form-group">
									<input type="text" name="itemsCustom.name" placeholder="请输入商品名称" class="form-control">
								</div>
								<button type="submit" class="btn btn-success">查询</button>
							</form>
							<ul class="nav navbar-nav navbar-right">
								<li><a href="#">欢迎您!${user.name}</a></li>
								<c:if test="${user.type==1 }">
								<li><a href="${pageContext.request.contextPath }/adminItemsList.action">管理页面</a></li>
								</c:if>
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

		<!-- Carousel
    ================================================== -->
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<div class="item active" align="center">
					<img class="first-slide" src="img/nav1.jpg" alt="First slide">
				</div>
				<div class="item" align="center">
					<img class="second-slide" src="img/nav2.jpg" alt="Second slide">
				</div>
				<div class="item" align="center">
					<img class="third-slide" src="img/nav3.jpg" alt="Third slide">
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		<!-- /.carousel -->

		<!-- Marketing messaging and featurettes
    ================================================== -->
		<!-- Wrap the rest of the page in another container to center all the content. -->

		<div class="container marketing">

			<!-- Three columns of text below the carousel -->
			<div class="row" id="dataList">
				<%-- <div class="col-lg-4">
					<img src="/pic/${item.pic }" alt="Generic placeholder image" width="140" height="140">
					<h2>￥${item.price }</h2>
					<h4>${item.name }</h4>
					<div style="text-overflow:ellipsis">${item.detail }</div>
					<p>
						<a class="btn btn-default" href="#" role="button" onclick="addCart(${item.id})">加入购物车 &raquo;</a>
					</p>
				</div> --%>
			</div>
			<!-- /.row -->
			<!-- FOOTER -->
			<footer>
				<p class="pull-right">
					<a href="#">Back to top</a>
				</p>
				<p>&copy; 2016 Company, Inc. &middot;
					<a href="#">Privacy</a> &middot;
					<a href="#">Terms</a>
				</p>
			</footer>
		</div>
		<!-- /.container -->


		<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
		<script>
			window.jQuery || document.write('<script src="../js/jquery.min.js><\/script>')
		</script>
		<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script>
		function addCart(item_id){
				var num = prompt("请输入您要添加的商品件数");
				if(num != null){
				window.location.href="${pageContext.request.contextPath }/addCart.action?userId=${user.id}&itemId="+item_id+"&num="+num;
				}
			}
		window.onload=function requestJson(){
			$.ajax({
				type:'post',
				url:'${pageContext.request.contextPath}/requestJson.action',
				success:function(data){
					var temp = "";
					for(var i=0;i<data.length;i++){
						temp += "<div class='col-lg-4'><img src='/pic/"+data[i].pic+"' alt='Generic placeholder image' width='140' height='140'><h2>￥"+data[i].price+"</h2><h4>"+data[i].name+"</h4><div style='text-overflow:ellipsis'>"+data[i].detail+"</div><p><a class='btn btn-default' href='#' role='button' onclick='addCart("+data[i].id+")'>加入购物车 &raquo;</a></p></div>";
					}
					document.getElementById("dataList").innerHTML=temp;
				}
			});
		}
		</script>
	</body>

</html>