package controller;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


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
						   "from billet " +
						   "where " +
						   "ville_depart ='"+(String)request.getParameter("villeD")+"'" +
						   "and ville_arrivee='"+(String)request.getParameter("villeD")+"'" +
						   "and date_depart = str_to_date('"+(String)request.getParameter("dateD")+"','DD/MM/YYY')";
			    if(!((String)request.getParameter("dateR")).isEmpty()){
			    	sql+=" and date_retour = str_to_date('"+(String)request.getParameter("dateR")+"','DD/MM/YYY')";
			    }
			    System.out.println(sql);
			    model.Connexion c = new model.Connexion();
			    ResultSet rs=c.executeQuery(sql);
			    
			    c.close();
			}
		}catch(Exception e){
			System.out.println(e);
			request.getRequestDispatcher("rechercheBillet.jsp").forward(request, response);
		}
	}

}
