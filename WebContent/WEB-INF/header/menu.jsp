<%@page contentType="text/html;charset=UTF-8"%>
<ul>
	<li><a href="/IN56Project/">Accueil</a></li>
	<%if(session.getAttribute("User")==null){%>								
		<li><a href="/IN56Project/inscription.jsp">Inscription</a></li>							
	<%}else{%>
		<li><a href="/IN56Project/rechercheBillet.jsp">Rechercher</a></li>
		<li><a href="/IN56Project/monCompte.jsp">Mon Compte</a></li>
		<li><a href="/IN56Project/Panier">Panier</a></li>
		<li><a href="/IN56Project/Faq">FAQ</a></li>
		<li><a href="/IN56Project/Connexion">Deconnexion</a></li>
	<%}%>
</ul>