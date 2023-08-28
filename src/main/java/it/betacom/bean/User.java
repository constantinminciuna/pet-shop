package it.betacom.bean;

public class User {
	
	private int id;
	private String username, nome, cognome, email, cellulare, data_di_nascita, password;
	private String ruolo, stato;
	
	public User() {
	}

	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public String getCognome() {
		return cognome;
	}

	public String getCellulare() {
		return cellulare;
	}

	public String getData_di_nascita() {
		return data_di_nascita;
	}

	public String getPassword() {
		return password;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public void setCellulare(String cellulare) {
		this.cellulare = cellulare;
	}

	public void setData_di_nascita(String data_di_nascita) {
		this.data_di_nascita = data_di_nascita;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getRuolo() {
		return ruolo;
	}

	public String getStato() {
		return stato;
	}

	public void setRuolo(String ruolo) {
		this.ruolo = ruolo;
	}

	public void setStato(String stato) {
		this.stato = stato;
	}
	
	
}
