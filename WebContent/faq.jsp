<%@page contentType="text/html;charset=UTF-8"%>
<%@ include file="WEB-INF/verification/testconnexion.jsp" %>
<%@ page import="model.Faq"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.Connexion"%>

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
							<%
								try {
									Connexion c = new Connexion();
									String sql = "SELECT * FROM FAQ";
									ResultSet rs = c.executeQuery(sql);

									while (rs.next()) {%>
										<h2>
											<img width="40px" height="40px" style="float:left" src="/IN56Project/public/images/pointInt.jpg"/>
											<%=rs.getString(2)%>
										</h2>
										<p><%=rs.getString(3)%></p>
									<%}
									rs.close();
									c.close();
								} catch (Exception e) {
									response.getWriter().write(e.toString());
								}
							%>
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