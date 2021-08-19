<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
	<h1><c:out value="${product.name}"></c:out></h1>
	<div class="d-flex justify-content-around">
		<ul class="list-group">
  			<li class="list-group-item disabled">Categories</li>
  				<c:forEach items="${product.categories}" var="category">
  			<li class="list-group-item"><c:out value="${category.name}"></c:out></li>
  			</c:forEach>
		</ul>
		
		<form action="/update/${product.id}" method="post" >
			<div class="d-flex align-items-end flex-column form-group">
			<input type="hidden" name="_method" value="put">
			<p>
				<label for="categories">Add Category</label>
				<select class="custom-select" name="categories"> 
	    			<c:forEach items="${categories}" var="category">
    					<option value="${category.id}">${category.name}</option>
    				</c:forEach>
   				</select>
			</p>	
   			<button type="submit" class="btn btn-primary">Submit</button>
			</div>
   		</form>
	<a href="/">Dashboard</a>
	</div>
	

</body>
</html>