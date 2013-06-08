<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Billet"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@ include file="WEB-INF/verification/testconnexion.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="/WEB-INF/head/head.jsp" %>
        <title>IN56 Project: Panier</title>
    </head>
    <body>
        <header>
        	<%@include file="/WEB-INF/header/header.jsp" %>
        </header>
        
		<section>
            <div class="content">
            	<div id="articles">
					<article>
						<h2>Panier:</h2>
						<%if(request.getAttribute("Panier")!=null && ((LinkedList<Billet>)request.getAttribute("Panier")).size()==0){%>
							<p>Panier Vide</p>
						<%} %>
					</article>
					<%if(request.getAttribute("Panier")!=null){
						Double prixTotal=0.0;
						int actuelV=0;
						int nbV=0;
						for(Billet b : ((LinkedList<Billet>)request.getAttribute("Panier"))){
	            			User v = b.getVendeur();
	            			if(actuelV!=v.getId()){
	            				actuelV=v.getId();
	            				nbV++;
	            			}
	            			prixTotal+=b.getVente();
	            		%>
	            		<article>
            				<table>
									<tbody>
										<tr>
											<td><%=b.getVille_depart()+" > "+b.getVille_arrivee()%><td>
											<td rowspan="4"><a href="/IN56Project<%=b.getImage()%>"><img width="150px" alt="image du billet" src="/IN56Project<%=b.getImage()%>"/></a></td>
											<td></td>
										</tr>
										<tr>
											<td>Depart: <%=new SimpleDateFormat("dd/MM/yyyy HH:mm").format(b.getDate_depart()) %></td>
										</tr>
										<%if(b.getDate_retour()!=null){ %>
												<tr><td>Retour: <%=new SimpleDateFormat("dd/MM/yyyy HH:mm").format(b.getDate_retour()) %></td></tr>
											<%} %>
										<tr>
											<td>Valide jusqu'au: <%=new SimpleDateFormat("dd/MM/yyyy").format(b.getDate_validite()) %></td>
											<td></td>
											<td>Prix de Vente: <%=b.getVente() %>€</td>
										</tr>
									</tbody>
								</table>
            		</article>	
	            	<%}%> 
					<%if(request.getAttribute("Panier")!=null && ((LinkedList<Billet>)request.getAttribute("Panier")).size()!=0){%>
						<article>
							<h4>Prix Billet(s) = <%=prixTotal %>€</h4> 
							<h4>Frais Expédition = 2€ x <%=nbV %>Vendeur = <%=2*nbV %>€</h4>
							<h3>Prix Total => <%=prixTotal+2*nbV %>€</h3> 
							<a class="button" href="paiement.jsp" >Payer</a>
						</article>
					<%}%>
				<%}%>
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