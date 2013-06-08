package model;

import java.sql.*;

public class Connexion {
	
	 private static String url = "jdbc:mysql://localhost:3306/IN56Project";
     private static String user = "root";
     private static String password = "root";
     
     private Connection con = null;
     private Statement st = null;
     private ResultSet rs = null;
     
     
     
	
	public Connexion() throws Exception {
		super();
		try{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
        	this.con = DriverManager.getConnection(url, user, password);
        	this.st = this.con.createStatement();
		}catch(Exception ex){
			throw new Exception("Probleme constructeur model.Connexion:"+ex);
		}
	}

	public ResultSet executeQuery(String sql) throws SQLException{
		try {
			return rs=this.st.executeQuery(sql);
		} catch (SQLException e) {
			throw new SQLException("Error executeQuery in model.Connexion: "+e);
		}
	}
	
	public int executeUpdate(String sql) throws SQLException{
		try {
			return this.st.executeUpdate(sql);
		} catch (SQLException e) {
			throw new SQLException("Error executeUpdate in model.Connexion: "+e);
		}
	}
	
	public void close() throws SQLException{
		try {
            if (rs != null) {
                rs.close();
            }
            if (st != null) {
                st.close();
            }
            if (con != null) {
                con.close();
            }

        } catch (SQLException ex) {
            throw new SQLException("CLose in model.Connexion:"+ex);
        }
	}

}
