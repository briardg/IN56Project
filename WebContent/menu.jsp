<ul>
	<li><a href="./IN56Project/">Accueil</a></li>
	<%if(session.getAttribute("User")==null){%>								
		<li>Inscription</li>							
	<%}else{%>
		<li>Rechercher</li>
		<li>Mon Compte</li>
		<li>Panier</li>
	<%}%>
</ul>