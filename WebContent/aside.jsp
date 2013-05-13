<%@page contentType="text/html;charset=UTF-8"%>
<%if(session.getAttribute("User")==null){%>	
<h2>Connexion:</h2>
<div>
	<%if(request.getAttribute("messageConnexion")!=null){
		out.print(request.getAttribute("messageConnexion"));
	}%>
	<form action="Connexion" method="POST">
		<table>
			<tbody>
				<tr>
					<td><label for="Identifiant">Identifiant:</label></td>
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
		Recherche Rapide: <input type="text" name="recherche" />
	</nav>
	<div>
		<ul>
			<li>boucle sur les dernier billets</li>
			
		</ul>
	</div>
<%}%>