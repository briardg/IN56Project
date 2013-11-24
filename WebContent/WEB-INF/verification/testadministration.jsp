<%@page import="model.User"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%if(session.getAttribute("User")==null || !((User)session.getAttribute("User")).isAdmin()) {%>
	<jsp:forward page="index.jsp" />
<%} %>