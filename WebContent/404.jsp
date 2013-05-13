<%@page contentType="text/html;charset=UTF-8"%>
<%@ page isErrorPage="true"%>
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
        	<%@include file="header.jsp" %>
        </header>
        
		<section>
            <div class="content">
            	<div class="articles">
					<article>
					<h1 class="message">ERROR 404</h1>
					</article>
				</div>
				<aside>
					<%@include file="aside.jsp" %>
				</aside>
			</div>
		</section>
         
        <footer>
        	<%@include file="footer.jsp" %>
        </footer>
    </body>
</html>