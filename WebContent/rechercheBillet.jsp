<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Billet"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@ include file="WEB-INF/verification/testconnexion.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="WEB-INF/head/head.jsp" %>
        <title>IN56 Project: Recherche de Billet</title>
    </head>
    <body>
        <header>
        	<%@include file="WEB-INF/header/header.jsp" %>
        </header>
        
		<section>
            <div class="content">
            	<div id="articles">
            		<%LinkedList<Billet> l= (LinkedList<Billet>)request.getAttribute("billetsList");
            		if(l!=null){%>
            		<article>
	            		<h2>Resultat de la Recherche:</h2>
	            		
	            		<%if(l.size()==0){%>
	            			<p>Aucun billet ne correspond à votre recherche.<p>
	            		<%}%>
	            	</article>
	            		<%for(Billet b : l){
	            			User v = b.getVendeur();
	            		%>

            		<article>
            			<h3><%=b.getVille_depart()+" > "+b.getVille_arrivee()+" par "+v.getMail()%></h3>
            			<div>
            				<table>
									<tbody>
										<tr>
											<td>Depart: <%=new SimpleDateFormat("dd/MM/yyyy HH:mm").format(b.getDate_depart()) %></td>
											<%if(b.getDate_retour()!=null){ %>
												<td>Retour: <%=new SimpleDateFormat("dd/MM/yyyy HH:mm").format(b.getDate_retour()) %></td>
											<%} %>
										</tr>
										<tr>
											<td>Prix initial: <%=b.getInitial()%>€</td>
											<td>Prix de Vente: <%=b.getVente() %>€</td>
										</tr>
										<tr>
											<td>Valide jusqu'au: <%=new SimpleDateFormat("dd/MM/yyyy").format(b.getDate_validite()) %></td>
										</tr>
										<tr>
											<td><a href="/IN56Project<%=b.getImage()%>"><img width="150px" alt="image du billet" src="/IN56Project<%=b.getImage()%>"/></a></td>
										</tr>
										<tr>
											<td><input type="button" 
											value=<%if(((LinkedList<Integer>)request.getSession().getAttribute("Panier")).contains(b.getId())) {%>
														"Supprimer du panier"
													<%}else{ %>
														"Ajouter au panier"
													<%}%> 
											id='<%=b.getId()%>' class="panier" /></td>
										</tr>
									</tbody>
								</table>
            			</div>
            		</article>	
            		<%}
            		  }%>
					<article>
						<h2>Recherchez un billet de train:</h2>
						<div>
							<form method="POST" action="RechercheBillet">
								<table>
									<tbody>
										<tr>
											<td><label for="villeD">Ville de Départ:</label></td>
											<td><input type="text" name="villeD" id="villeD" required="required" class="autocompleteVille" autocomplete="off"/></td>
											<td><label for="villeA">Ville d'arrivée:</label></td>
											<td><input type="text" name="villeA" id="villeA" required="required" class="autocompleteVille" autocomplete="off"/></td>
										</tr>
										<tr>
											<td><label for="dateD">Date de Départ:</label></td>
											<td><input type="text" name="dateD" id="dateD" class="datepicker" required="required"/></td>
											<td><label for="dateR">Date de Retour:</label></td>
											<td><input type="text" name="dateR" id="dateR" class="datepicker"/></td>
										</tr>
									</tbody>
								</table>
								<br/>
								<input type="submit" value="Recherchez"/>
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