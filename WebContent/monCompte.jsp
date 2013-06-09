<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.Connexion"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@ include file="WEB-INF/verification/testconnexion.jsp" %>
<%
  boolean error=false;
  if(request.getAttribute("error")!=null){
	error=true;
  }
  User user=(User)session.getAttribute("User");
%> 
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="WEB-INF/head/head.jsp" %>
        <title>IN56 Project: Mon Compte</title>
    </head>
    <body>
        <header>
        	<%@include file="WEB-INF/header/header.jsp" %>
        </header>
        
		<section>
            <div class="content">
            	<div id="articles">
            		<article id="tabs">
						<ul>
							<li><a href="#tabs-1">Mes Ventes</a></li>
							<li><a href="#tabs-2">Mes Achats</a></li>
							<li><a href="#tabs-3">Mes Informations Personnelles</a></li>
						</ul>
						
						<div id="tabs-1">
							<span class="message">
								<%if(request.getAttribute("Message")!=null)
									out.print(request.getAttribute("Message"));
								%>
							</span>
							<form method="POST" action="VendreBillet" enctype="multipart/form-data" id="VendreBillet">
								<table>
									<tbody>
										<tr>
											<td><label for="villeD">Ville de Départ:</label></td>
											<td><input type="text" name="villeD" id="villeD" size="10" required="required" class="autocompleteVille" autocomplete="off"/></td>
											<td><label for="villeA">Ville d'arrivée:</label></td>
											<td><input type="text" name="villeA" id="villeA" size="10" required="required" class="autocompleteVille" autocomplete="off"/></td>
										</tr>
										<tr>
											<td><label for="dateD">Date de Départ:</label></td>
											<td><input type="text" name="dateD" id="dateD" class="datepicker" size="10" required="required"/></td>
											<td><label for="heureD">Heure de Départ:</label></td>
											<td><input type="text" name="heureD" id="heureD" class="heurepicker" size="3" required="required"/></td>
										</tr>
										<tr>
											<td><label for="dateR">Date de Retour:</label></td>
											<td><input type="text" name="dateR" id="dateR" class="datepicker" size="10"/></td>
											<td><label for="heureR">Heure de Retour:</label></td>
											<td><input type="text" name="heureR" id="heureR" class="heurepicker" size="3"/></td>
										</tr>
										<tr>
											<td><label for="prixI">Prix Initial:</label></td>
											<td><input type="text" name="prixI" id="prixI" size="5" required="required"/>€</td>
											<td><label for="prixV">Prix de Vente:</label></td>
											<td><input type="text" name="prixV" id="prixV" size="5" required="required"/>€</td>
										</tr>
										<tr>
											<td><label for="dateV">Date de Validité*:</label></td>
											<td><input type="text" name="dateV" id="dateV" class="datepicker" size="10" required="required"/></td>
											
										</tr>
										<tr>
											<td><label for="image">Image du Billet</label></td>
											<td colspan="2"><input type="file" name="image" id="image" size="25" required="required"/></td>
										</tr>
									</tbody>
								</table>
								<input type="submit" value="Je mets en vente" />
								<p class="small">*La date de Validité doit être de 10 jours supérieur à la date du jour.</p>
								<br/>
							</form>
							<div style="border-bottom:1px solid black">
								<h3>Ventes Non conclues</h3>
								<%Connexion c = new Connexion(); 
								  String sql="select * "+
										     "from billet "+
										     "where ID_COMMANDE is null "+
										     "and id_utilisateur="+user.getId()+
										     " order by ville_depart, ville_arrivee, date_Depart, date_retour, date_validite";
								  ResultSet res=c.executeQuery(sql);
								  
								  while(res.next()){
								%>
								
								<table>
									<tbody>
										<tr>
											<td><%=res.getString("VILLE_DEPART") %> > <%=res.getString("VILLE_ARRIVEE") %></td>
										</tr>
										<tr>
											<td>Depart: <%=new SimpleDateFormat("dd/MM/yyyy HH:mm").format(res.getTimestamp("DATE_DEPART")) %></td>
											<%if(res.getDate("DATE_RETOUR")!=null){ %>
												<td>Retour: <%=new SimpleDateFormat("dd/MM/yyyy HH:mm").format(res.getTimestamp("DATE_RETOUR")) %></td>
											<%} %>
										</tr>
										<tr>
											<td>Prix initial: <%=res.getDouble("PRIX_INITIAL") %>€</td>
											<td>Prix de Vente: <%=res.getDouble("PRIX_VENTE") %>€</td>
										</tr>
										<tr>
											<td>Valide jusqu'au: <%=new SimpleDateFormat("dd/MM/yyyy").format(res.getDate("DATE_VALIDITE")) %></td>
										</tr>
										<tr>
											<td><a href="/IN56Project<%=res.getString("CHEMIN_IMAGE")%>"><img width="150px" alt="image du billet" src="/IN56Project<%=res.getString("CHEMIN_IMAGE")%>"/></a></td>
										</tr>
									</tbody>
								</table>	
								<br/>
								<br/>
								<%
								  }
								  c.close();
								%>
							</div>
							<div>
								<h3>Ventes conclues</h3>
								<%Connexion c1 = new Connexion(); 
								  sql="select * from billet where ID_COMMANDE is not null and id_utilisateur="+user.getId()+
									  " order by id_commande";
								  res=c1.executeQuery(sql);
								  
								  while(res.next()){
								%>
								
								<table>
									<tbody>
										<tr>
											<td><%=res.getString("VILLE_DEPART") %> > <%=res.getString("VILLE_ARRIVEE") %></td>
										</tr>
										<tr>
											<td>Depart: <%=new SimpleDateFormat("dd/MM/yyyy HH:mm").format(res.getTimestamp("DATE_DEPART")) %></td>
											<%if(res.getDate("DATE_RETOUR")!=null){ %>
												<td>Retour: <%=new SimpleDateFormat("dd/MM/yyyy HH:mm").format(res.getTimestamp("DATE_RETOUR")) %></td>
											<%} %>
										</tr>
										<tr>
											<td>Prix initial: <%=res.getDouble("PRIX_INITIAL") %>€</td>
											<td>Prix de Vente: <%=res.getDouble("PRIX_VENTE") %>€</td>
										</tr>
										<tr>
											<td>Argent réellement gagné: <%=(res.getDouble("PRIX_VENTE")-7) %>€</td>
										</tr>
										<tr>
											<td><a href="/IN56Project<%=res.getString("CHEMIN_IMAGE")%>"><img width="150px" alt="image du billet" src="/IN56Project<%=res.getString("CHEMIN_IMAGE")%>"/></a></td>
										</tr>
									</tbody>
								</table>
								<br/>
								<br/>
								<%
								  }
								  c1.close();
								%>
							</div>
							
						</div>
						<div id="tabs-2">
							<%Connexion c2 = new Connexion(); 
								  sql="select * "+
							          "from commande c inner join billet b on c.ID_COMMANDE=b.ID_COMMANDE "+
							          "where c.id_utilisateur="+user.getId()+
							          " order by date_commande";
								  res=c2.executeQuery(sql);
								  while(res.next()){
								%>
								
								<table>
									<tbody>
										<tr>
											<td><%=res.getString("VILLE_DEPART") %> > <%=res.getString("VILLE_ARRIVEE") %></td>
										</tr>
										<tr>
											<td>Depart: <%=new SimpleDateFormat("dd/MM/yyyy HH:mm").format(res.getTimestamp("DATE_DEPART")) %></td>
											<%if(res.getDate("DATE_RETOUR")!=null){ %>
												<td>Retour: <%=new SimpleDateFormat("dd/MM/yyyy HH:mm").format(res.getTimestamp("DATE_RETOUR")) %></td>
											<%} %>
										</tr>
										<tr>
											<td>Date de commande: <%=new SimpleDateFormat("dd/MM/yyyy").format(res.getDate("DATE_COMMANDE")) %></td>
										</tr>
										<tr>
											<td colspan="2">Date approximative de livraison: <%=new SimpleDateFormat("dd/MM/yyyy").format(res.getDate("DATE_LIVRAISON")) %></td>
										</tr>	
										<tr>
											<td>Prix d'achat: <%=res.getDouble("PRIX_VENTE") %>€</td>
										</tr>
										<tr>
											<td><a href="/IN56Project<%=res.getString("CHEMIN_IMAGE")%>"><img width="150px" alt="image du billet" src="/IN56Project<%=res.getString("CHEMIN_IMAGE")%>"/></a></td>
										</tr>
									</tbody>
								</table>
								<br/>
								<br/>
								<%
								  }
								  c2.close();
								%>
						</div>
						<div id="tabs-3">
							<form method="POST" action="Inscription"><br/>
								<table>
									<tbody>
										<tr>
											<td><label for="nom">Nom:</label></td>
											<td><input type="text" name="nom" id="nom" value="<%=user.getNom()%>"
											required="required"/></td>
										</tr>
										<tr>
											<td><label for="prenom">Prenom:</label></td>
											<td><input type="text" name="prenom" id="prenom" value="<%=user.getPrenom()%>"
											required="required"/></td>
										</tr>
										<tr>
											<td><label for="numrue">Numéro rue:</label></td>
											<td><input type="text" name="numrue" id="numrue" value="<%=user.getNum_rue()%>"
											size="5" required="required"/></td>
										</tr>
										<tr>
											<td><label for="rue">Rue:</label></td>
											<td><input type="text" name="rue" id="rue" value="<%=user.getRue()%>"
											required="required"/></td>
										</tr>
										<tr>
											<td><label for="cp">Code Postal:</label></td>
											<td><input type="text" name="cp" id="cp" size="5" value="<%=user.getCp()%>"
											required="required"/></td>
										</tr>
										<tr>
											<td><label for="ville">Ville:</label></td>
											<td><input type="text" name="ville" id="ville" value="<%=user.getVille()%>"
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
											<td><input type="text" name="mail" id="mail" autocomplete="off" value="<%=user.getMail()%>" 
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
								<input type="submit" value="Sauvegarde"/>
							</form>
						</div>
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