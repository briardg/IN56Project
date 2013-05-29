package controller;

import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
