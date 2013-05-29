package model;

import java.util.Date;

public class Billet {
	
	private int id;
	private Commande commande;
	private User vendeur;
	private String ville_depart;
	private String ville_arrivee;
	private Date date_depart;
	private Date date_arrivee;
	private Date date_validite;
	private double initial;
	private double vente;
	private String image;
	
	
	//constructeur
	public Billet(){}
	
	public Billet(int id, Commande commande, User vendeur, String ville_depart,
			String ville_arrivee, Date date_depart, Date date_arrivee,
			Date date_validite, double initial, double vente, String image) {
		super();
		this.id = id;
		this.commande = commande;
		this.vendeur = vendeur;
		this.ville_depart = ville_depart;
		this.ville_arrivee = ville_arrivee;
		this.date_depart = date_depart;
		this.date_arrivee = date_arrivee;
		this.date_validite = date_validite;
		this.initial = initial;
		this.vente = vente;
		this.image = image;
	}
	
	//getter setter
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Commande getCommande() {
		return commande;
	}
	public void setCommande(Commande commande) {
		this.commande = commande;
	}
	public User getVendeur() {
		return vendeur;
	}
	public void setVendeur(User vendeur) {
		this.vendeur = vendeur;
	}
	public String getVille_depart() {
		return ville_depart;
	}
	public void setVille_depart(String ville_depart) {
		this.ville_depart = ville_depart;
	}
	public String getVille_arrivee() {
		return ville_arrivee;
	}
	public void setVille_arrivee(String ville_arrivee) {
		this.ville_arrivee = ville_arrivee;
	}
	public Date getDate_depart() {
		return date_depart;
	}
	public void setDate_depart(Date date_depart) {
		this.date_depart = date_depart;
	}
	public Date getDate_arrivee() {
		return date_arrivee;
	}
	public void setDate_arrivee(Date date_arrivee) {
		this.date_arrivee = date_arrivee;
	}
	public Date getDate_validite() {
		return date_validite;
	}
	public void setDate_validite(Date date_validite) {
		this.date_validite = date_validite;
	}
	public double getInitial() {
		return initial;
	}
	public void setInitial(double initial) {
		this.initial = initial;
	}
	public double getVente() {
		return vente;
	}
	public void setVente(double vente) {
		this.vente = vente;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	

}
