<%if(session.getAttribute("User")==null){%>	
<h2>Connexion:</h2>
<div>
	<form action="Connexion" method="POST">
		<label for="Identifiant">Identifiant:</label><input type="text" name="identifiant"/>
		<br/>
		<label for="mdp">Mot de passe:</label><input type="text" name="mdp"/>
		<br/>
		<br/>
		<input type="submit"/>	
	</form>
</div>
<%}else{%>
	<nav>
		Recherche Rapide: <input type="text" name="recherche" />
	</nav>
	<div>
		<ul>
			<li>boucle sur les dernier billets<li>
			
		</ul>
	</div>
<%}%>