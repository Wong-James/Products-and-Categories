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
	<title>All Products</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css">
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<h1>All Products</h1>
	<table class="table table-striped  table-sm">
		<tr>
			<th>Name</th>
			<th>Description</th>
			<th>Price</th>
			
		</tr>
		<c:forEach items="${products}" var="product">
			<tr>
				<td><a href="/product/${ product.id }">${ product.name }</a></td>
				<td>${product.description}</td>
				<td>${product.price}</td>
			</tr>
		</c:forEach>
	</table>
	
	<a href="/">Back to dashboard</a>

</body>
</html>