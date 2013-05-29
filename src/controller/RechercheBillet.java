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
			if(((String)request.getParameter("villeD")).isEmpty()
					&& ((String)request.getParameter("villeA")).isEmpty()
					&& ((String)request.getParameter("dateD")).isEmpty()){
				throw new Exception();
			}
			else{
				String sql="select * " +
						   "from billet b inner join commande c " +
						   "on b.id_commande=c.id_commande " +
						   "inner join user u " +
						   "on b.id_utilisateur.u.id_utilisateur" +
						   "where " +
						   "id_commande is null" +
						   " and ville_depart ='"+(String)request.getParameter("villeD")+"'" +
						   " and ville_arrivee='"+(String)request.getParameter("villeA")+"'" +
						   " and date_depart = str_to_date('"+(String)request.getParameter("dateD")+"','DD/MM/YYY')";
			    if(!((String)request.getParameter("dateR")).isEmpty()){
			    	sql+=" and date_retour = str_to_date('"+(String)request.getParameter("dateR")+"','DD/MM/YYY')";
			    }
			    System.out.println(sql);
			    model.Connexion c = new model.Connexion();
			    ResultSet rs=c.executeQuery(sql);
			    LinkedList<Billet> billetsList = new LinkedList<>();
			    while(rs.next()){
			    	billetsList.add(new Billet(rs.getInt("ID_BILLET"),
			    							   null,
			    							   new User(rs.getInt("ID_UTILISATEUR"), rs.getString("MAIL")),
			    							   rs.getString("VILLE_DEPART"),
			    							   rs.getString("VILLE_ARRIVEE"),
			    							   rs.getDate("DATE_DEPART"),
			    							   rs.getDate("DATE_RETOUR"),
			    							   rs.getDate("DATE_VALIDITE"),
			    							   rs.getDouble("PRIX_INITIAL"),
			    							   rs.getDouble("PRIX_VENTE"),
			    							   rs.getString("CHEMIN_IMAGE")));
			    }
			    c.close();
			    request.setAttribute("billetsList", billetsList);
			}
		}catch(Exception e){
			System.out.println(e);
		}
		finally{
			request.getRequestDispatcher("rechercheBillet.jsp").forward(request, response);
		}
	}

}
