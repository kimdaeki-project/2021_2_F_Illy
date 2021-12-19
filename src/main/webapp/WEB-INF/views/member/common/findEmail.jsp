<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${empty findEmail.member_email}">
		false
	</c:when>
	<c:when test="${sendSuccess == true}">
		success
	</c:when>
</c:choose>