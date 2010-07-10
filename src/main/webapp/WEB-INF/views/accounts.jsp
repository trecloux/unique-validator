<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Accounts</title>
    </head>
    <body>
    	<div>
    		<form:form action="accounts" method="POST" modelAttribute="account">
    			<div>
    				<label>
    					Name : <form:input path="name"/>
    				</label>
    				<form:errors path="name"/>			
    			</div>
    			<div>
    				<label>
    					Email : <form:input path="email"/>
    				</label>
    				<form:errors path="email"/>			
    			</div>
    			<input type="submit" />
    		</form:form>
        </div>
        <div>
	        <h1>Accounts</h1>
	        <ul>
	        <c:forEach items="${accountList}" var="thisAccount">
	        	<li><c:out value="${thisAccount.email}"/> </li>
	        </c:forEach>	
	        </ul>
        </div>
        
    </body>
</html>
