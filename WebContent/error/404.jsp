<%@page contentType="text/html;charset=UTF-8"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="/WEB-INF/head/head.jsp" %>
        <title>IN56 Project: Page 404</title>
    </head>
    <body>
        <header>
        	<%@include file="/WEB-INF/header/header.jsp" %>
        </header>
        
		<section>
            <div class="content">
            	<div id="articles">
					<article>
					<h1 class="message">ERROR 404</h1>
					</article>
				</div>
				<aside>
					<%@include file="/WEB-INF/aside/aside.jsp" %>
				</aside>
			</div>
		</section>
         
        <footer>
        	<%@include file="/WEB-INF/footer/footer.jsp" %>
        </footer>
    </body>
</html>