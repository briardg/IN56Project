<%@page contentType="text/html;charset=UTF-8"%>
<%@ include file="WEB-INF/verification/testconnexion.jsp" %>
<%@ page import="model.Faq"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.Connexion"%>

<%@ page import="java.util.Vector" language="java" %>

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
            	<div id="articles">
					<article>
						<table>
		            		<tbody>
					        	<table id="faq">
					            <%
					        		try {
					        			Connexion c = new Connexion();
					        			String sql = "SELECT * FROM FAQ";
					        			ResultSet rs = c.executeQuery(sql);
					        			
					        			while(rs.next()) {		
					        				out.print("<tr><td class=\"question\"><img width=\"50px\" height=\"50px\" style=\"float:left;\" src=\"/IN56Project/public/images/pointInt.jpg\"/>"+rs.getString(2)+"</tr></td>");
					        				out.print("<tr><td class=\"reponse\">"+rs.getString(3)+"</tr></td>");
					        			}
					        			rs.close();
					        			c.close();
					        		} catch (Exception e) {
					        			response.getWriter().write(e.toString());
					        		}
				        		%>      
				        		</table>				        		
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