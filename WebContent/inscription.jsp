<%@page contentType="text/html;charset=UTF-8"%>
<%
  boolean error=false;
  if(request.getAttribute("error")!=null){
	error=true;
  }
%> 
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="WEB-INF/head/head.jsp" %>
        <title>IN56 Project: Inscription</title>
    </head>
    <body>
        <header>
        	<%@include file="WEB-INF/header/header.jsp" %>
        </header>
        
		<section>
            <div class="content">
            	<div id="articles">
					<article id="inscription">
						<h2>Inscription:</h2>
						<div>
							<form method="POST" action="Inscription"><br/>
								<table>
									<tbody>
										<tr>
											<td><label for="nom">Nom:</label></td>
											<td><input type="text" name="nom" id="nom" 
											<%if(request.getParameter("nom")!=null) 
												out.print("value='"+request.getParameter("nom")+"'");
											  else if(error)
												out.print("class='error'");   
											%>
											required="required"/></td>
										</tr>
										<tr>
											<td><label for="prenom">Prenom:</label></td>
											<td><input type="text" name="prenom" id="prenom" 
											<%if(request.getParameter("prenom")!=null) 
												out.print("value='"+request.getParameter("prenom")+"'");
											else if(error)
												out.print("class='error'");
											%>
											required="required"/></td>
										</tr>
										<tr>
											<td><label for="numrue">Numéro rue:</label></td>
											<td><input type="text" name="numrue" id="numrue"
											<%if(request.getParameter("numrue")!=null) 
												out.print("value='"+request.getParameter("numrue")+"'");
											else if(error)
												out.print("class='error'");
											%>
											size="5" required="required"/></td>
										</tr>
										<tr>
											<td><label for="rue">Rue:</label></td>
											<td><input type="text" name="rue" id="rue"
											<%if(request.getParameter("rue")!=null) 
												out.print("value='"+request.getParameter("rue")+"'");
											else if(error)
												out.print("class='error'");
											%> 
											required="required"/></td>
										</tr>
										<tr>
											<td><label for="cp">Code Postal:</label></td>
											<td><input type="text" name="cp" id="cp" size="5"
											<%if(request.getParameter("cp")!=null) 
												out.print("value='"+request.getParameter("cp")+"'");
											else if(error)
												out.print("class='error'");
											%> 
											required="required"/></td>
										</tr>
										<tr>
											<td><label for="ville">Ville:</label></td>
											<td><input type="text" name="ville" id="ville" 
											<%if(request.getParameter("ville")!=null) 
												out.print("value='"+request.getParameter("ville")+"'");
											else if(error)
												out.print("class='error'");
											%> 
											required="required"/></td>
										</tr>
										<tr>
											<td><label for="pwd">Mot de passe:</label></td>
											<td><input type="password" name="pwd" id="pwd" autocomplete="off"
											<%if(request.getParameter("pwd")!=null) 
												out.print("value='"+request.getParameter("pwd")+"'");
											else if(error)
												out.print("class='error'");
											%>  
											required="required"/></td>
										</tr>
										<tr>
											<td><label for="pwd2">Répétition du mot de passe:</label></td>
											<td><input type="password" name="pwd2" id="pwd2"
											<%if(error && !request.getParameter("pwd").equals(request.getParameter("pwd2"))) 
												out.print("class='error'");									
											%>
											 required="required"/></td>
										</tr>
										<tr>
											<td><label for="mail">Courriel:</label></td>
											<td><input type="text" name="mail" id="mail" autocomplete="off"
											<%if(request.getParameter("mail")!=null) 
												out.print("value='"+request.getParameter("mail")+"'");
											else if(error)
												out.print("class='error'");
											%> 
											required="required"/></td>
										</tr>
										<tr>
											<td><label for="mail2">Répétition du courriel:</label></td>
											<td><input type="text" name="mail2" id="mail2" 
											<%if(error && !(request.getParameter("mail")).equals(request.getParameter("mail2"))) 
												out.print("class='error'");									
											%>
											required="required"/></td>
										</tr>
									</tbody>
								</table>
								<br/>
								<%
								  if(request.getAttribute("error")!=null)
									out.print("<span class='message'>Champs non remplis ou mal remplis !<span>");
								%> 
								<br/>
								<input type="submit" value="Je m'inscris"/>
							</form>
						</div>
					</article>
				</div>
				<aside>
					<%@include file="WEB-INF/aside/aside.jsp" %>
				</aside>
			</div>
		</section>
         
        <footer>
        	<%@include file="WEB-INF/footer/footer.jsp" %>
        </footer>
    </body>
</html>