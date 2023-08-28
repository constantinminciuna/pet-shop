package it.betacom.bean;

public class Animale {

	private int matricola;

	private String dataAcquisto;

	private String nomeAnimale;

	private int prezzo;

	private String tipoAnimale;

	//bi-directional many-to-one association to Cliente
	private int cliente;

	public Animale() {
	}

	public int getMatricola() {
		return this.matricola;
	}

	public void setMatricola(int matricola) {
		this.matricola = matricola;
	}

	public String getDataAcquisto() {
		return this.dataAcquisto;
	}

	public void setDataAcquisto(String dataAcquisto) {
		this.dataAcquisto = dataAcquisto;
	}

	public String getNomeAnimale() {
		return this.nomeAnimale;
	}

	public void setNomeAnimale(String nomeAnimale) {
		this.nomeAnimale = nomeAnimale;
	}

	public int getPrezzo() {
		return this.prezzo;
	}

	public void setPrezzo(int prezzo) {
		this.prezzo = prezzo;
	}

	public String getTipoAnimale() {
		return this.tipoAnimale;
	}

	public void setTipoAnimale(String tipoAnimale) {
		this.tipoAnimale = tipoAnimale;
	}

	public int getClienteShop() {
		return this.cliente;
	}

	public void setClienteShop(int cliente) {
		this.cliente = cliente;
	}

}