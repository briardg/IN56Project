package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Billet;
import model.Connexion;
import model.User;

/**
 * Servlet implementation class Panier
 */
public class Panier extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Panier() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		LinkedList<Billet> panier=new LinkedList<>();
		if(request.getSession().getAttribute("Panier")!=null && ((LinkedList<Integer>)request.getSession().getAttribute("Panier")).size()>0){
			String sql="select * from billet b inner join utilisateur u on b.id_utilisateur=u.id_utilisateur " +
					   "where";
			int i =0;
			for (Integer b: (LinkedList<Integer>)request.getSession().getAttribute("Panier")) {
				if(i>0){
					sql+=" or ";
				}
				sql+=" b.id_billet="+b;
				i++;
			}
			Connexion c=null;
			try {
				c = new Connexion();
				ResultSet rs = c.executeQuery(sql);
				while(rs.next()){
					panier.add(new Billet(rs.getInt("ID_BILLET"),
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
			} catch (Exception e) {
				System.out.println(e);;
			}
			finally{
				try {
					c.close();
				} catch (SQLException e) {
					System.out.println(e);
				}
			}
		}
		request.setAttribute("Panier", panier);
		request.getRequestDispatcher("panier.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("User")!=null){
			if(((LinkedList<Integer>)request.getSession().getAttribute("Panier")).contains(Integer.parseInt(request.getParameter("id")))){

				((LinkedList<Integer>)request.getSession().getAttribute("Panier")).remove((Object)Integer.parseInt(request.getParameter("id")));
			}else{

				((LinkedList<Integer>)request.getSession().getAttribute("Panier")).add(Integer.parseInt(request.getParameter("id")));
			}
		}
	}

}
