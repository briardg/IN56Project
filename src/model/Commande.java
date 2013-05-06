package model;

import java.util.Date;

public class Commande {
	
	private int id;
	private User user;
	private Date date;
	
	//constructeur
	public Commande() {}
	
	public Commande(int id, User user, Date date) {
		super();
		this.id = id;
		this.user = user;
		this.date = date;
	}
	
	//getter setter
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
	

}
