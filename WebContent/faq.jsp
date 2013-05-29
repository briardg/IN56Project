<%@page contentType="text/html;charset=UTF-8"%>
<%@ include file="WEB-INF/verification/testconnexion.jsp" %>
<%@ page import="model.Faq"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="/WEB-INF/head/head.jsp" %>
        <title>IN56 Project: FAQ</title>
    </head>
    <body>
        <header>
        	<%@include file="/WEB-INF/header/header.jsp" %>
        </header>
        
		<section>
            <div class="content">
            	<div class="articles">
					<article>
						<table>
		            		<tbody>
					            <%
						            Faq [] f = new Faq[1];
					            	f[0]=(Faq)request.getAttribute("faq");
		
						            for(int i = 0; i < f.length; i++) {
						            	out.print("<tr><td>"+f[i].getQuestion()+"</td></tr>");
						            	out.print("<tr><td>"+f[i].getReponse()+"</td></tr>");
					            	}
				        		%>
		            		</tbody>            	
		            	</table>
					</article>
				</div>
				<aside>
					<%@include file="/WEB-INF/aside/aside.jsp" %>
				</aside>
			</div>
		</section>
         
        <footer>
        	<%@include file="/WEB-INF/footer/footer.jsp" %>
        </footer>
    </body>
</html>