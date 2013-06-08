package model;

import java.sql.ResultSet;
import java.sql.SQLException;

public class User {
	
	private int id=0;
	private String nom="";
	private String prenom="";
	private String num_rue="";
	private String rue="";
	private String ville="";
	private String cp="";
	private String mdp="";
	private boolean isAdmin=false;
	private String mail="";
	
	private final static String salt="dusel";
	
	//constructeur
	public User(){}
	
	public User(int id, String mail){
		this.id=id;
		this.mail=mail;
	}
	
	public User(int id, String nom, String prenom, String num_rue,
			String rue, String ville, String cp, String mdp, boolean isAdmin,
			String mail) {
		super();
		this.id = id;
		this.nom = nom;
		this.prenom = prenom;
		this.num_rue = num_rue;
		this.rue = rue;
		this.ville = ville;
		this.cp = cp;
		this.mdp = mdp;
		this.isAdmin = isAdmin;
		this.mail = mail;
	}
	
	//getters setters
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public String getNum_rue() {
		return num_rue;
	}
	public void setNum_rue(String num_rue) {
		this.num_rue = num_rue;
	}
	public String getRue() {
		return rue;
	}
	public void setRue(String rue) {
		this.rue = rue;
	}
	public String getVille() {
		return ville;
	}
	public void setVille(String ville) {
		this.ville = ville;
	}
	public String getCp() {
		return cp;
	}
	public void setCp(String cp) {
		this.cp = cp;
	}
	public String getMdp() {
		return mdp;
	}
	public void setMdp(String mdp) {
		this.mdp = mdp;
	}
	public Boolean isAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(Boolean isAdmin) {
		this.isAdmin = isAdmin;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	
	public void save() throws SQLException{
		String sql="INSERT INTO utilisateur (`NOM`, `PRENOM`, `NUMERO_RUE`, `RUE`, `VILLE`, `CODE_POSTAL`, `MDP`, `ESTADMIN`, `MAIL`) " +
				   "VALUES ('"+this.nom+"', '"+this.prenom+"', '"+this.num_rue+"', '"+this.rue+"', '"+this.ville+"', '"+this.cp+"', sha1('"+this.mdp+salt+"'),"+this.isAdmin+", '"+this.mail+"');";
		try {
			Connexion c = new Connexion();
			c.executeUpdate(sql);
			c.close();
		} catch (Exception e) {
			throw new SQLException("Not Save...");
		}
	}
	
	public void updateInBDD(int id) throws SQLException{
		String sql="UPDATE utilisateur" +
				   " set NOM='"+this.nom+"', PRENOM='"+this.prenom+"', NUMERO_RUE='"+this.num_rue+"', RUE='"+this.rue+"', VILLE='"+this.ville+"', CODE_POSTAL='"+this.cp+"', MDP=sha1('"+this.mdp+salt+"'), MAIL='"+this.mail+"' " +
				   " where ID_UTILISATEUR="+id+";";
		try {
			Connexion c = new Connexion();
			c.executeUpdate(sql);
			c.close();
		} catch (Exception e) {
			throw new SQLException("Not Save...");
		}
	}
	
	public void setUserFomBDD(String login,String pwd) throws SQLException{
		String sql="Select * from utilisateur where mail='"+login+"' and mdp=sha1('"+pwd+salt+"')";
		try{
			Connexion c = new Connexion();
			ResultSet rs= c.executeQuery(sql);
			int i= 0;
			while(rs.next()){
				i++;
				this.id = rs.getInt("ID_UTILISATEUR");
				this.nom = rs.getString("NOM");
				this.prenom = rs.getString("prenom");
				this.num_rue = rs.getString("numero_rue");
				this.rue = rs.getString("rue");
				this.cp = rs.getString("code_postal");
				this.ville = rs.getString("ville");
				this.isAdmin = rs.getBoolean("estadmin");
				this.mail = rs.getString("mail");
			}
			c.close();
			if(i==0)
				throw new SQLException();
		}catch(Exception e){
			throw new SQLException("Not found...");
		}
	}

}
