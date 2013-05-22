<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <%@ page import="model.Faq"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		 <%@ include file="WEB-INF/head/head.jsp" %>
		<title>IN56 Project: FAQ</title>
	</head>
	<body>
        <header>
        	<%@include file="WEB-INF/header/header.jsp" %>
        </header>
        
		<section>
            <div class="content">
            	<table>
            		<tbody>
			            <%
				            Faq[] f = (Faq[])request.getAttribute("contact");

				            for(int i = 0; i < f.length; i++) {
				            	out.print("<tr><td>"+f[i].getQuestion()+"</td></tr>");
				            	out.print("<tr><td>"+f[i].getReponse()+"</td></tr>");
			            	}
		        		%>
            		</tbody>            	
            	</table>
            </div>
        </section>	
	</body>
</html>