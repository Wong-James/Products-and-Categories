<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home page</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css">
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<h1>Products and Categories</h1>
	<div class="list-group">
		<a href="/products/new"><button type="button" class="list-group-item list-group-item-action">New Product</button></a>
		<a href="/categories/new"><button type="button" class="list-group-item list-group-item-action">New Category</button></a>
		<a href="/products/all"><button type="button" class="list-group-item list-group-item-action">Show all Products</button></a>
		<a href="/categories/all"><button type="button" class="list-group-item list-group-item-action">Show all Categories</button></a>
	</div>
</body>
</html>