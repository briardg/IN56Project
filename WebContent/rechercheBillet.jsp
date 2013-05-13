<%@page contentType="text/html;charset=UTF-8"%>
<%@ include file="WEB-INF/verification/testconnexion.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="WEB-INF/head/head.jsp" %>
        <title>IN56 Project: Recherche de Billet</title>
    </head>
    <body>
        <header>
        	<%@include file="WEB-INF/header/header.jsp" %>
        </header>
        
		<section>
            <div class="content">
            	<div id="articles">
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
					<%@include file="WEB-INF/aside/aside.jsp" %>
				</aside>
			</div>
		</section>
         
        <footer>
        	<%@include file="WEB-INF/footer/footer.jsp" %>
        </footer>
    </body>
</html>