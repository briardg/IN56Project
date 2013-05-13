<%@page contentType="text/html;charset=UTF-8"%>
<%@ include file="WEB-INF/verification/testconnexion.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="WEB-INF/head/head.jsp" %>
        <title>IN56 Project: mon Compte</title>
    </head>
    <body>
        <header>
        	<%@include file="WEB-INF/header/header.jsp" %>
        </header>
        
		<section>
            <div class="content">
            	<div id="articles">
            		<article id="tabs">
						<ul>
							<li><a href="#tabs-1">Mon Compte</a></li>
							<li><a href="#tabs-2">Mes Ventes</a></li>
							<li><a href="#tabs-3">Mes Achats</a></li>
						</ul>
						<div id="tabs-1">
							<p>Proin elit arcu, rutrum commodo, vehicula tempus, commodo a, risus. Curabitur nec arcu. Donec sollicitudin mi sit amet mauris. Nam elementum quam ullamcorper ante. Etiam aliquet massa et lorem. Mauris dapibus lacus auctor risus. Aenean tempor ullamcorper leo. Vivamus sed magna quis ligula eleifend adipiscing. Duis orci. Aliquam sodales tortor vitae ipsum. Aliquam nulla. Duis aliquam molestie erat. Ut et mauris vel pede varius sollicitudin. Sed ut dolor nec orci tincidunt interdum. Phasellus ipsum. Nunc tristique tempus lectus.</p>
						</div>
						<div id="tabs-2">
							<form method="POST" action="VendreBillet" enctype="multipart/form-data" id="VendreBillet">
								<table>
									<tbody>
										<tr>
											<td><label for="villeD">Ville de Départ:</label></td>
											<td><input type="text" name="villeD" id="villeD" size="10" required="required"/></td>
											<td><label for="villeA">Ville d'arrivée:</label></td>
											<td><input type="text" name="villeA" id="villeA" size="10" required="required"/></td>
										</tr>
										<tr>
											<td><label for="dateD">Date de Départ:</label></td>
											<td><input type="text" name="dateD" id="dateD" class="datepicker" size="10" required="required"/></td>
											<td><label for="dateR">Date de Retour:</label></td>
											<td><input type="text" name="dateR" id="dateR" class="datepicker" size="10"/></td>
										</tr>
										<tr>
											<td><label for="prixI">Prix Initial:</label></td>
											<td><input type="text" name="prixI" id="prixI" size="5" required="required"/>€</td>
											<td><label for="prixV">Prix de Vente:</label></td>
											<td><input type="text" name="prixV" id="prixV" size="5" required="required"/>€</td>
										</tr>
										<tr>
											<td><label for="dateV">Date de Validité:</label></td>
											<td><input type="text" name="dateV" id="dateV" class="datepicker" size="10" required="required"/></td>
										</tr>
										<tr>
											<td><label for="image">Image du Billet</label></td>
											<td colspan="2"><input type="file" name="image" id="image" size="25" required="required"/></td>
										</tr>
									</tbody>
								</table>
								<input type="submit" value="Je mets en vente" />
								<br/><br/>
							</form>
							
							//ventes non conclus
							//ventes conclus
							
						</div>
						<div id="tabs-3">
							<p>Morbi tincidunt, dui sit amet facilisis feugiat, odio metus gravida ante, ut pharetra massa metus id nunc. Duis scelerisque molestie turpis. Sed fringilla, massa eget luctus malesuada, metus eros molestie lectus, ut tempus eros massa ut dolor. Aenean aliquet fringilla sem. Suspendisse sed ligula in ligula suscipit aliquam. Praesent in eros vestibulum mi adipiscing adipiscing. Morbi facilisis. Curabitur ornare consequat nunc. Aenean vel metus. Ut posuere viverra nulla. Aliquam erat volutpat. Pellentesque convallis. Maecenas feugiat, tellus pellentesque pretium posuere, felis lorem euismod felis, eu ornare leo nisi vel felis. Mauris consectetur tortor et purus.</p>
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