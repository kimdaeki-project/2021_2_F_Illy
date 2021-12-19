<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${updateMember == '1'}">
			true
		</c:when>
	<c:when test="${passwordCheck == '0'}">
			false
		</c:when>
</c:choose>