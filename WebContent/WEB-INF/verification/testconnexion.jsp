<%@page contentType="text/html;charset=UTF-8"%>
<%if(session.getAttribute("User")==null) {%>
	<jsp:forward page="index.jsp" />
<%} %>