package it.betacom.bean;

public class Cliente {
	
	private int idC;
	private String nome;
	private String cognome;
	private String citta;
	private String telefono;
	private String indirizzo;

	public int getIdC() {
		return idC;
	}

	public void setIdC(int idC) {
		this.idC = idC;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public String getCitta() {
		return citta;
	}

	public void setCitta(String citta) {
		this.citta = citta;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getIndirizzo() {
		return indirizzo;
	}

	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}

	@Override
	public String toString() {
		return "Cliente [idC=" + idC + ", nome=" + nome + ", cognome=" + cognome + ", citta=" + citta + ", telefono="
				+ telefono + ", indirizzo=" + indirizzo + "]";
	}
	
	

}
