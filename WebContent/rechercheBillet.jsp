<%@page contentType="text/html;charset=UTF-8"%>
<%if(session.getAttribute("User")==null) {%>
	<jsp:forward page="index.jsp" />
<%} %>

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
          <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
        <script src="public/js/script.js"></script>
        <title>IN56 Project</title>
         <script>
$(function() {
$( ".datepicker" ).datepicker();
});
</script>
    </head>
    <body>
        <header>
        	<%@include file="header.jsp" %>
        </header>
        
		<section>
            <div class="content">
            	<div class="articles">
					<article>
						<h2>Recherchez un billet de train:</h2>
						<div>
							<form method="POST" action="RechercheBillet">
								<table>
									<tbody>
										<tr>
											<td><label for="villeD">Ville de Départ:</label></td>
											<td><input type="text" name="villeD" id="villeD"/></td>
											<td><label for="villeA">Ville d'arrivée:</label></td>
											<td><input type="text" name="villeA" id="villeA"/></td>
										</tr>
										<tr>
											<td><label for="dateD">Date de Départ:</label></td>
											<td><input type="text" name="dateD" id="dateD" class="datepicker"/></td>
											<td><label for="dateR">Date de Retour:</label></td>
											<td><input type="text" name="dateR" id="dateR" class="datepicker"/></td>
										</tr>
									</tbody>
								</table>
								<br/>
								<input type="submit" value="Recherchez"/>
							</form>
						</div>
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