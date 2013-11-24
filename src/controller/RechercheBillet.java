package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Billet;
import model.User;


/**
 * Servlet implementation class RechercheBillet
 */
public class RechercheBillet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RechercheBillet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String sql="select * " +
					   "from billet b inner join utilisateur u " +
					   "on b.id_utilisateur=u.id_utilisateur " +
					   "where " +
					   "b.id_commande is null";
			if(request.getParameter("id")!=null){
				sql+=" and id_billet="+request.getParameter("id");
			}
			else if(request.getParameter("villeD").isEmpty()){
					throw new Exception();
			}
			else{
				sql+=" and date_validite >= now()" +
					 " and date_depart >= now() " +
					 " and ville_depart ='"+request.getParameter("villeD")+"'";

				if( request.getParameter("villeA")!=null 
					&& request.getParameter("dateD")!=null
					&& !request.getParameter("villeA").isEmpty() 
					&& !request.getParameter("dateD").isEmpty()){
					sql+=" and ville_arrivee='"+request.getParameter("villeA")+"'" +
					     " and (date_depart between str_to_date('"+request.getParameter("dateD")+"','%d/%m/%Y')" +
						 " and (str_to_date('"+request.getParameter("dateD")+"','%d/%m/%Y') + INTERVAL 1 DAY)) ";
				}
				if(request.getParameter("dateR")!=null && !request.getParameter("dateR").isEmpty()){
			    	sql+=" and (date_retour between str_to_date('"+request.getParameter("dateR")+"','%d/%m/%Y')" +
			    		 " and (str_to_date('"+request.getParameter("dateR")+"','%d/%m/%Y') + INTERVAL 1 DAY))";
			    }
				sql+=" order by ville_depart, date_depart";
			}
			model.Connexion c = new model.Connexion();
		    ResultSet rs=c.executeQuery(sql);
		    LinkedList<Billet> billetsList = new LinkedList<Billet>();
		    while(rs.next()){
		    	billetsList.add(new Billet(rs.getInt("ID_BILLET"),
		    							   null,
		    							   new User(rs.getInt("ID_UTILISATEUR"), rs.getString("MAIL")),
		    							   rs.getString("VILLE_DEPART"),
		    							   rs.getString("VILLE_ARRIVEE"),
		    							   rs.getTimestamp("DATE_DEPART"),
		    							   rs.getTimestamp("DATE_RETOUR"),
		    							   rs.getDate("DATE_VALIDITE"),
		    							   rs.getDouble("PRIX_INITIAL"),
		    							   rs.getDouble("PRIX_VENTE"),
		    							   rs.getString("CHEMIN_IMAGE")));
		    }
		    c.close();
		    request.setAttribute("billetsList", billetsList);
		}catch(Exception e){
			System.out.println(e);
		}
		finally{
			request.getRequestDispatcher("rechercheBillet.jsp").forward(request, response);
		}
	}

}
