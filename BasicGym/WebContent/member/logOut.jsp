<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>  
<%
	String m_id = (String)session.getAttribute("m_id");
	/* if(m_id == null || m_id.trim().equals("")){
		response.sendRedirect(".././main.jsp");
		return;
	}
	session.invalidate();
	response.sendRedirect(".././main.jsp"); */
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>베이직헬스</title>
</head>
<body>
	
	<c:if test="${empty m_id}">
		<script type="text/javascript">
			location.href='.././main.jsp';
		</script>
	</c:if>
	
	<c:if test="${not empty m_id}">
		<script type="text/javascript">
	  		alert("로그아웃 하시겠습니까?")
	  		<% session.invalidate(); %>
	  		location.href='.././main.jsp';
		</script>
	</c:if>

</body>
</html>