package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Connexion;

/**
 * Servlet implementation class Faq
 */
public class Faq extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Faq() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<model.Faq> faq = new ArrayList<model.Faq>();
		model.Faq f = null;
		try {
			Connexion c = new Connexion();
			String sql = "SELECT * FROM FAQ";
			ResultSet rs = c.executeQuery(sql);
			while(rs.next()) {
				f = new model.Faq(rs.getInt(1), rs.getString(2), rs.getString(3));
				faq.add(f);
			}
			rs.close();
			c.close();
		} catch (Exception e) {
			response.getWriter().write(e.toString());
		}
		
		//model.Faq[] t = (model.Faq[]) faq.toArray(); 
		
		request.setAttribute("faq",f);
		RequestDispatcher d = request.getRequestDispatcher("faq.jsp");
		d.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
