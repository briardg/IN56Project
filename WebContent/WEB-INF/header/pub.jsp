<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.Random"%>
<%
int nb;
do{
	nb=new Random().nextInt(3);
}
while(session.getAttribute("nbpub")!=null && nb==(Integer)session.getAttribute("nbpub"));
	
session.setAttribute("nbpub", nb);

if(nb==0){
%>
<a href="http://www.betaseries.com/" target="_blank">
	<img alt="Advert" src="/IN56Project/public/images/FMA.jpg"/>
</a>
<%}else if(nb==1){%>
<a href="http://www.betaseries.com/" target="_blank">
	<img alt="Advert" src="/IN56Project/public/images/dexter.jpg"/>
</a>
<%}else if(nb==2){%>
<a href="http://www.betaseries.com/" target="_blank">
	<img alt="Advert" src="/IN56Project/public/images/personofinterest.jpg"/>
</a>
<%}%>