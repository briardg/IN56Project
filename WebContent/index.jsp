<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
		<!--[if lt IE 9]>
            <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
		<link rel="stylesheet" href="public/css/styles.css" />
		<!--[if lte IE 7]>
        	<link rel="stylesheet" href="public/css/style_ie.css" />
        <![endif]-->
        <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
        <script src="public/js/script.js"></script>
        <title>IN56 Project</title>
    </head>
 
    <body>
        <header>
            <div class="content">
				<div class="logo">
					<h1>IN56 Project</h1>
				</div>
				<div class="advert-nav">
					<div class="advert">
						<%@include file="pub.jsp" %>
					</div>
					<nav>
						<%@include file="menu.jsp" %>
					</nav>
				</div>
			</div>
        </header>
        
		<section>
            <div class="content">
            	<div class="articles">
					<article>
						<h1>Titre</h1>
						<p>
							Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
						</P>
					</article>
					<article>
						<h1>Titre</h1>
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
					<%@include file="aside.jsp" %>
				</aside>
			</div>
		</section>
         
        <footer>
        	<div class="content">
            	<p>
            		Copyright Gautier & Anthony - Tous droits réservés
            	</p>
        	</div>
        </footer>
         
    </body>
</html>