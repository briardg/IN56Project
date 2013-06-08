package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.User;

/**
 * Servlet implementation class Inscription
 */
public class Inscription extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Inscription() {
        super();
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
		try {
			if(request.getParameter("nom")==null 
					|| ((String)request.getParameter("nom")).isEmpty()
					|| request.getParameter("prenom")==null
					|| ((String)request.getParameter("prenom")).isEmpty()
					|| request.getParameter("numrue")==null
					|| ((String)request.getParameter("numrue")).isEmpty()
					|| request.getParameter("rue")==null
					|| ((String)request.getParameter("rue")).isEmpty()
					|| request.getParameter("ville")==null
					|| ((String)request.getParameter("ville")).isEmpty()
					|| request.getParameter("cp")==null
					|| ((String)request.getParameter("cp")).isEmpty()
					|| request.getParameter("pwd")==null
					|| ((String)request.getParameter("pwd")).isEmpty()
					|| request.getParameter("mail")==null
					|| ((String)request.getParameter("mail")).isEmpty()
					|| !request.getParameter("pwd").equals(request.getParameter("pwd2"))
					|| !request.getParameter("mail").equals(request.getParameter("mail2"))){
				throw new Exception();
			}
			User user=null;
			User u = new User(0,
					request.getParameter("nom"),
					request.getParameter("prenom"),
					request.getParameter("numrue"),
					request.getParameter("rue"),
					request.getParameter("ville"),
					request.getParameter("cp"),
					request.getParameter("pwd"),
					false,
					request.getParameter("mail"));
			if((user=(User)request.getSession().getAttribute("User"))==null){
			u.save();
			request.setAttribute("message", "Félicitation! Vous pouvez, maintenant, vous connecter <img src='./public/images/arrow-red.png' alt='arrow-red' width='30px'/>");
			}else{
				u.setId(user.getId());
				request.getSession().setAttribute("User", u);
				u.updateInBDD(u.getId());
				request.setAttribute("message", "Données personnelles mises à jour !");
			}
			request.getRequestDispatcher("index.jsp").forward(request, response);
		} catch (Exception e) {
			request.setAttribute("error","error" );
			if(request.getSession().getAttribute("User")==null){
				request.getRequestDispatcher("inscription.jsp").forward(request, response);
			}else{
				request.getRequestDispatcher("monCompte.jsp").forward(request, response);
			}
		}
	}

}
