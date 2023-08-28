package it.betacom.bean;

//import java.util.List;

/**
 * The persistent class for the cliente database table.
 * 
 */
public class ClienteShop {

	private int idCliente;

	private String citta;

	private String cognome;

	private String indirizzo;

	private String nome;

	private String telefono;
	
	private String username;
	
	private String password;
	
	private String email;
	
	private String data_di_nascita;

//	//bi-directional many-to-one association to Animale
//	private List<Animale> animales;

	public String getData_di_nascita() {
		return data_di_nascita;
	}

	public void setData_di_nascita(String data_di_nascita) {
		this.data_di_nascita = data_di_nascita;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
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

	public ClienteShop() {
	}

	public int getIdCliente() {
		return this.idCliente;
	}

	public void setIdCliente(int idCliente) {
		this.idCliente = idCliente;
	}

	public String getCitta() {
		return this.citta;
	}

	public void setCitta(String citta) {
		this.citta = citta;
	}

	public String getCognome() {
		return this.cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public String getIndirizzo() {
		return this.indirizzo;
	}

	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}

	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getTelefono() {
		return this.telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

//	public List<Animale> getAnimales() {
//		return this.animales;
//	}
//
//	public void setAnimales(List<Animale> animales) {
//		this.animales = animales;
//	}

//	public Animale addAnimale(Animale animale) {
//		getAnimales().add(animale);
//		animale.setClienteShop(this);
//
//		return animale;
//	}
//
//	public Animale removeAnimale(Animale animale) {
//		getAnimales().remove(animale);
//		animale.setClienteShop(null);
//
//		return animale;
//	}

}