<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${changePassword == '1'}">
		changeSuccess
	</c:when>
	<c:when test="${changePassword == '0'}">
		changeFale
	</c:when>
	<c:when test="${changePassword == '3'}">
		passwordNotSame
	</c:when>
</c:choose>