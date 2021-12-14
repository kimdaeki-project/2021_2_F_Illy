<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:choose>
		<c:when test="${empty findId.username}">
			회원 정보를 찾을 수 없습니다.
		</c:when>
		
		<c:when test="${not empty findId.username}">
			${findId.username}
		</c:when>
	</c:choose>
	
	
