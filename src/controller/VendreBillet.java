package controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Connexion;
import model.User;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class VendreBillet
 */
public class VendreBillet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VendreBillet() {
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

	   File file ;
	   int maxFileSize = 5000 * 1024;
	   int maxMemSize = 5000 * 1024;
	   String filePath = getServletContext().getRealPath("/public/images/billetTrain/")+File.separator;

	   String fileName = new SimpleDateFormat("yyyyMMddHHmmssSSZ").format(new Date());
	   
	   // Verify the content type
	   String contentType = request.getContentType();
	   if ((contentType.indexOf("multipart/form-data") >= 0)) {
	
		  String valuesSql="";
		  String message="Bien mise en Vente !";
		  
	      DiskFileItemFactory factory = new DiskFileItemFactory();
	      // maximum size that will be stored in memory
	      factory.setSizeThreshold(maxMemSize);
	      // Location to save data that is larger than maxMemSize.
	      factory.setRepository(new File("c:\\temp"));
	
	      // Create a new file upload handler
	      ServletFileUpload upload = new ServletFileUpload(factory);
	      // maximum file size to be uploaded.
	      upload.setSizeMax( maxFileSize );
	      try{ 
	         // Parse the request to get file items.
	         List fileItems = upload.parseRequest(request);
	
	         // Process the uploaded file items
	         Iterator i = fileItems.iterator();
	         while ( i.hasNext () ) 
	         {
	            FileItem fi = (FileItem)i.next();
	            if ( !fi.isFormField () ){
		            // Write the file
	            	file = new File( filePath + (fileName += fi.getName().substring(fi.getName().lastIndexOf(".")) )) ;
		            fi.write( file ) ;
	            }
	            else{
	            	if(fi.getFieldName().equals("dateD") || fi.getFieldName().equals("dateR")){
	            		if(!fi.getString().equals(""))
	            			valuesSql+="STR_TO_DATE('"+fi.getString()+" ";
	            		else
	            			valuesSql+="";
	            	}else if(fi.getFieldName().equals("heureD") || fi.getFieldName().equals("heureR")){
	            		if(!fi.getString().equals(""))
	            			valuesSql+=fi.getString()+"','%d/%m/%Y %H:%i'),";
	            		else
	            			valuesSql+="null,";
	            	}else if(fi.getFieldName().equals("dateV")){
	            		if(!fi.getString().equals(""))
	            			valuesSql+="STR_TO_DATE('"+fi.getString()+"','%d/%m/%Y'),";
	            	}else{
	            		valuesSql+="'"+fi.getString()+"',";
	            	}
	            }
	         }

	         String sql="INSERT INTO billet (ID_UTILISATEUR, VILLE_DEPART, VILLE_ARRIVEE, DATE_DEPART, DATE_RETOUR, PRIX_INITIAL, PRIX_VENTE, DATE_VALIDITE, CHEMIN_IMAGE)" +
	         		    "VALUES ("+((User)request.getSession().getAttribute("User")).getId()+", "+
	         		    valuesSql+
	         		    "'"+filePath.replace(getServletContext().getRealPath(""),"").replace("\\", "/") + fileName+"'"+
	         		    ")";

	         Connexion c = new Connexion();
	         try{
	        	 c.executeUpdate(sql);
	         }catch(SQLException e){
	        	 System.out.println(e);
		         message="Problème:"+e;
	         }
	         c.close();

	      }catch(Exception e) {
	         System.out.println(e);
	         message="Problème:"+e;
	      }
	      
	      request.setCharacterEncoding("UTF-8");
	      request.setAttribute("Message", message);
	      request.getRequestDispatcher("monCompte.jsp").forward(request, response);
	   }else{
		   request.getRequestDispatcher("index.jsp").forward(request, response);
	   }
	   
	}
}
