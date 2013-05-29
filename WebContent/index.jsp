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
						Venez créer un compte, connectez-vous  et recherchez les billets parmis nos meilleurs offres !
					</P>
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