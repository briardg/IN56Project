<%@page import="java.sql.ResultSet"%>
<%@page import="model.Connexion"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%if(session.getAttribute("User")==null){%>	
<h2>Connexion:</h2>
<div>
	<%if(request.getAttribute("messageConnexion")!=null){
		out.print(request.getAttribute("messageConnexion"));
	}%>
	<form action="/IN56Project/Connexion" method="POST">
		<table>
			<tbody>
				<tr>
					<td><label for="Identifiant">Email:</label></td>
					<td><input type="text" name="identifiant"/></td>
				</tr>
				<tr>
					<td><label for="mdp">Mot de passe:</label></td>
					<td><input type="password" name="mdp"/></td>
				</tr>
			</tbody>
		</table>
		<br/>
		<input type="submit" value="Se connecter"/>	
	</form>
</div>
<%}else{%>
	<nav>
		<h4>Recherche Rapide:</h4>
		<form method="POST" action="RechercheBillet">
			<input class="autocompleteVille" type="text" name="villeD" autocomplete="off" placeholder="Recherche Rapide"/>
			<input type="submit" value="Go">
		</form>
	</nav>
	<div>
		<% String sqlaside="SELECT * "+
						"FROM billet "+
						"WHERE ID_COMMANDE IS NULL "+
						"AND date_depart >= now() "+
						"AND date_validite >= now() "+
						"ORDER BY date_depart, ville_depart DESC "+
						"LIMIT 1 , 5";
		Connexion caside = new Connexion();
		ResultSet  rs = caside.executeQuery(sqlaside);
		
		%>
		<H4>Derniers billets mis en vente:</H4>
		<ul style="text-align:left">
			<%while(rs.next()){%>
			<li><a href="/IN56Project/RechercheBillet?id=<%=rs.getInt("id_billet")%>" > <%=rs.getString("ville_depart") %> > <%=rs.getString("ville_arrivee") %></a></li>
			<%} %>
		</ul>
		<%caside.close(); %>
	</div>
<%}%>