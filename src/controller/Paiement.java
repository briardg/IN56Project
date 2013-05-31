package controller;

import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Connexion;
import model.User;

/**
 * Servlet implementation class Paiement
 */
public class Paiement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Paiement() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getSession().getAttribute("User")!=null && ((LinkedList<Integer>)request.getSession().getAttribute("Panier")).size()>0){
			User u = (User)request.getSession().getAttribute("User");
			Connexion c=null;
			try{
				c = new Connexion();
				String sql="insert into commande (id_utilisateur,date_commande,date_livraison) " +
						   "values ("+u.getId()+",now(),ADDDate(now(), INTERVAL 2 DAY)); ";
				System.out.println(sql);
				for(Integer i : ((LinkedList<Integer>)request.getSession().getAttribute("Panier"))){
				   sql="Update billet " +
				   "set id_commande=(select max(id_commande) from commande ) " +
				   "where id_billet="+i+"; ";	
				   c.executeUpdate(sql);
				}
				
				
				
			}catch(Exception e){
				System.err.println(e);
			}finally{
				try{
					c.close();
				}catch(Exception e){
					System.err.println(e);
				}
			//	((LinkedList<Integer>)request.getSession().getAttribute("Panier")).clear();
				request.setAttribute("message", "Merci de votre paiement!");
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		}else{
			request.setAttribute("message", "Vous devez être connecté et/ou avoir des billets dans votre panier !");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}

}
