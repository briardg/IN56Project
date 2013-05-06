package model;

import java.sql.*;

public class Connexion {
	
	 private static String url = "jdbc:mysql://localhost:3306/IN56Project";
     private static String user = "";
     private static String password = "";
	
	public static ResultSet executeQuery(String sql){
		Connection con = null;
        Statement st = null;
        ResultSet rs = null;

        try {
            con = DriverManager.getConnection(url, user, password);
            st = con.createStatement();
            return st.executeQuery(sql);

        } catch (SQLException ex) {
        	return null;
            
        } finally {
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
                return null;
            }
        }
	}
	
	public static int executeUpdate(String sql) throws SQLException{
		Connection con = null;
        Statement st = null;
        ResultSet rs = null;

        try {
            con = DriverManager.getConnection(url, user, password);
            st = con.createStatement();
            return st.executeUpdate(sql);

        } catch (SQLException ex) {
        	throw new SQLException(ex);
        } finally {
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
                throw new SQLException(ex);
            }
        }
	}
	

}
