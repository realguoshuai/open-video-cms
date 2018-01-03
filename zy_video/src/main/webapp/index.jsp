<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>

<!-- Bootstrap -->
<link href='<c:url value="/css/bootstrap.min.css"></c:url>'
	rel="stylesheet">
<link href='<c:url value="/css/bootstrap-table.min.css"></c:url>'
	rel="stylesheet">
</head>
<body>


	<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">智游公开课后台管理系统</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active">
					<a href="#"> 首页 </a>
				</li>
				<li>
					<a href='<c:url value="/video"></c:url>'> 视频管理 </a>
				</li>
				<li>
					<a href='<c:url value="/speaker"></c:url>'>讲师管理</a>
				</li>
				<li>
					<a href='<c:url value="/course"></c:url>'>课程管理</a>
				</li>
				<li>
					<a href='<c:url value="/subject"></c:url>'>学科管理</a>
				</li>
			</ul>
		</div>
	</div>


	<script src='<c:url value="/js/jquery-3.2.1.min.js"></c:url>'></script>
	<script src='<c:url value="/js/bootstrap.min.js"></c:url>'></script> <script
		src='<c:url value="/js/bootstrap-table.min.js"></c:url>'></script> <script
		src='<c:url value="/js/bootstrap-table-zh-CN.min.js"></c:url>'></script>
</body>
</html>