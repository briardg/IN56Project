package model;

import java.sql.SQLException;

public class Faq {
	private int id;
	private String question;
	private String reponse;

	public Faq() {
		super();
		this.id = -1;
		this.question = "";
		this.reponse = "";
	}

	public Faq(int id, String question, String reponse) {
		super();
		this.id = id;
		this.question = question;
		this.reponse = reponse;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getReponse() {
		return reponse;
	}

	public void setReponse(String reponse) {
		this.reponse = reponse;
	}

	public void save() throws SQLException{
		String sql="INSERT INTO faq (`QUESTION`, `REPONSE`) " +
				   "VALUES ('"+this.question+"', '"+this.reponse+"');";
		try {
			Connexion c = new Connexion();
			c.executeUpdate(sql);
			c.close();
		} catch (Exception e) {
			throw new SQLException("Not Save...");
		}
	}
}