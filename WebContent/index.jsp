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
					<h2>Titre</h2>
					<p>
						Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
					</P>
				</article>
				<article>
					<h2>Titre</h2>
					<p>
						Blalala lalalalalal alalalablalab baalbalbalbalbalba
						<br/>
						Blalala lalalalalal alalalablalab baalbalbalbalbalba
						<br/>Blalala lalalalalal alalalablalab baalbalbalbalbalba
						<br/>Blalala lalalalalal alalalablalab baalbalbalbalbalba
						<br/>Blalala lalalalalal alalalablalab baalbalbalbalbalba
						<br/>Blalala lalalalalal alalalablalab baalbalbalbalbalbo
						<br/>azertyu
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