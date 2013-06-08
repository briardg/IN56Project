package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.User;

/**
 * Servlet implementation class Administration
 */
public class Administration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Administration() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("question") != null
				&& !request.getParameter("question").isEmpty()
				&& request.getParameter("reponse") != null
				&& !request.getParameter("reponse").isEmpty()) {

			model.Faq f = new model.Faq();
			f.setQuestion(request.getParameter("question"));
			f.setReponse(request.getParameter("reponse"));

			try {
				f.save();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} else {
			try {
				User user = new User();
				String requete = "";
				String isAdmin = request.getParameter("isadmin");

				if (isAdmin.equals("0")) {
					user.setId(Integer.parseInt(request.getParameter("userId")));
					requete = "UPDATE utilisateur SET ESTADMIN = true WHERE ID_UTILISATEUR = "
							+ user.getId() + ";";

				} else if (isAdmin.equals("1")) {
					user.setId(Integer.parseInt(request.getParameter("userId")));
					requete = "UPDATE utilisateur SET ESTADMIN = false WHERE ID_UTILISATEUR = "
							+ user.getId() + ";";
				}

				model.Connexion c = new model.Connexion();
				c.executeUpdate(requete);

				c.close();
			} catch (Exception e) {
				response.getWriter().write(e.toString());
			}
		}

		RequestDispatcher d = request
				.getRequestDispatcher("administration.jsp");
		d.forward(request, response);
	}

}