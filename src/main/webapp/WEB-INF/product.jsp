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
	<title>Insert title here</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css">
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<h1>New Product</h1>
	<form:form action="/products" method="post" modelAttribute="product">
		<p>
        	<form:label path="name">Name:</form:label>
        	<form:errors path="name"/>
        	<form:input path="name"/>
    	</p>
		<p>
        	<form:label path="description">Description:</form:label>
        	<form:errors path="description"/>
        	<form:textarea path="description"/>
    	</p>
		<p>
        	<form:label path="price">Price:</form:label>
        	<form:errors path="price"/>
        	<form:input path="price"/>
    	</p>
		<input type="submit" value="Create"/>
    </form:form>
</body>
</html>