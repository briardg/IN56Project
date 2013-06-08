<%@page contentType="text/html;charset=UTF-8"%>
<%@ page import="model.User"%>
<div class="content">
	<p>Copyright Gautier &amp; Anthony - Tous droits réservés <% if(session.getAttribute("User") != null && ((User)session.getAttribute("User")).isAdmin()) out.print(" - <a href=\"/IN56Project/administration.jsp\">Administration</a>"); %></p>
</div>