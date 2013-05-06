package model;

public class User {
	
	private int id;
	private String nom;
	private String prenom;
	private String num_rue;
	private String rue;
	private String ville;
	private int cp;
	private String mdp;
	private Boolean isAdmin;
	private String mail;
	
	//constructeur
	public User(){}
	
	public User(int id, String nom, String prenom, String num_rue,
			String rue, String ville, int cp, String mdp, Boolean isAdmin,
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
	public int getCp() {
		return cp;
	}
	public void setCp(int cp) {
		this.cp = cp;
	}
	public String getMdp() {
		return mdp;
	}
	public void setMdp(String mdp) {
		this.mdp = mdp;
	}
	public Boolean getIsAdmin() {
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
	
	
	

}
