<%@page import="model.User" %>
<%@page contentType="text/html;charset=UTF-8"%>
<div class="content">
	<p>Copyright Gautier &amp; Anthony - Tous droits réservés 
		<%if(session.getAttribute("User")!=null && ((User)session.getAttribute("User")).isAdmin()){%>
			 - <a href="/IN56Project/Admin">Administration</a>
		<%}%>
	</p>
</div>