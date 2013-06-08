<%@page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="WEB-INF/head/head.jsp" %>
        <title>IN56 Project: Accueil</title>
    </head>
    <body>
        <header>
            <div class="content">
				<div class="logo">
					<h1>IN56 Project</h1>
				</div>
				<div class="advert-nav">
					<div class="advert">
						<%@include file="WEB-INF/header/pub.jsp" %>
					</div>
					<nav>
						<%@include file="WEB-INF/header/menu.jsp" %>
					</nav>
				</div>
			</div>
        </header>
        
		<section>
            <div class="content">
            	<div id="articles">
            	<% if(request.getAttribute("message")!=null){%>
            		<article>
						<h2 class="message"><%=request.getAttribute("message") %></h2>
					</article>
            	<%}%>
				<article>
					<h2>IN56 Project Printemps 2013</h2>
					<p>
						Voici notre site internet d'achats-ventes de billets de train.<br/>
						Venez créer un compte, connectez-vous et mettez vos billet en vente ou recherchez les billets parmis nos meilleurs offres !
						
					</P>
					<h3>Acheteur</h3>
					<p>
						Une commission de 2 euros par acheteur est ajouté au prix final 
						pour les frais de dossier et d'envoi.
						<br/>Le ou billets arriveront par la poste dans les 48 à 78h après achat.
					<p>
					<h3>Vendeur</h3>
					<p>
						Une commission de 7 euros est prélevé sur le prix de vente du billet.<br/>
						Envoyer les billets misent en vente à l'adresse suivant:<br/>
						<br/>
						IN56 Project Printemps 2013<br/>
						90 Rue UTBM<br/>
						90000 Belfort<br/>
						cedex 2<br/>
					</p>
					
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