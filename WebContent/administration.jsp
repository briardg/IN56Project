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
        <title>IN56 Project: Adminitstration</title>
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
		            			<table>
		            				<tr>
		            					<td>
							        		Liste utilisateur : 
							        	</td>
							        </tr>
							        <tr>
							        	<td>
						        			<form method="POST" action="Administration"><br/>
								        		<select name="userId">
								        		<%
								        			try {
									        			Connexion c = new Connexion();
									        			String sql = "SELECT * FROM utilisateur WHERE ESTADMIN = 0";
									        			ResultSet rs = c.executeQuery(sql);
									        			
									        			while(rs.next()) {		
									        				out.print("<option value=\""+rs.getInt("ID_UTILISATEUR")+"\">"+rs.getString("PRENOM")+" - "+rs.getString("NOM")+"</option>");
									        			}
									        			rs.close();
									        			c.close();
								        			} catch (Exception e) {
									        			response.getWriter().write(e.toString());
									        		}
								        		%>
								        		</select>
								        		<input type="hidden"  name="isadmin"  value="0">
								        		<input type="submit" value="Mettre admin">
							        		</form>		
							        	</td>	
					        		</tr>
					        		<tr>
					        			<td>
					        				Liste admin : 
					        			</td>
				        			</tr>
				        			<tr>
				        				<td>
							        		<form method="POST" action="Administration">
								        		<select name="userId">
							        			<%
								        			try {
									        			Connexion c = new Connexion();
									        			String sql = "SELECT * FROM utilisateur WHERE ESTADMIN = 1";
									        			ResultSet rs = c.executeQuery(sql);
									        			
									        			while(rs.next()) {		
									        				out.print("<option value=\""+rs.getInt("ID_UTILISATEUR")+"\">"+rs.getString("PRENOM")+" - "+rs.getString("NOM")+"</option>");
									        			}
									        			rs.close();
									        			c.close();
								        			} catch (Exception e) {
									        			response.getWriter().write(e.toString());
									        		}
								        		%>
								        		</select>
								        		<input type="hidden"  name="isadmin"  value="1">
								        		<input type="submit" value="enlever le statut d'admin">
							        		</form>
							        	</td>
							        </tr>
					        	</table><br/>
					        	<table>
					        		<tr>
					        			<td>
					        				Création d'un nouvelle question pour la FAQ :
					        			</td>					        			
					        		</tr>
					        		<tr>
					        			<td>
					        				<form method="POST" action="Administration">
								        		<input type="text" name="question"/>
								        		<input type="text" name="reponse"/>								        		
								        		<input type="hidden" name="faq"  value="1">
								        		<input type="submit" value="Créer">
							        		</form>
					        			</td>
					        		</tr>
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