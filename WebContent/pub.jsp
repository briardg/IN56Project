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
<a href="http://www.betaseries.com/">
	<img alt="Advert" src="public/images/FMA.jpg"/>
</a>
<%}else if(nb==1){%>
<a href="http://www.betaseries.com/">
	<img alt="Advert" src="public/images/dexter.jpg"/>
</a>
<%}else if(nb==2){%>
<a href="http://www.betaseries.com/">
	<img alt="Advert" src="public/images/personofinterest.jpg"/>
</a>
<%}%>