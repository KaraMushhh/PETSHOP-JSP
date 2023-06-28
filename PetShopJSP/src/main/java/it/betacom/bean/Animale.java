package it.betacom.bean;

import java.util.Date;

public class Animale {
	
	private int idA;
	private String nome;
	private int matricola;
	private Date dataAcquisto;
	private double prezzo;
	private int idT;
	private int idC;

	public int getIdA() {
		return idA;
	}

	public void setIdA(int idA) {
		this.idA = idA;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public int getMatricola() {
		return matricola;
	}

	public void setMatricola(int matricola) {
		this.matricola = matricola;
	}

	public Date getDataAcquisto() {
		return dataAcquisto;
	}

	public void setDataAcquisto(Date dataAcquisto) {
		this.dataAcquisto = dataAcquisto;
	}

	public double getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}

	public int getIdT() {
		return idT;
	}

	public void setIdT(int idT) {
		this.idT = idT;
	}

	public int getIdC() {
		return idC;
	}

	public void setIdC(int idC) {
		this.idC = idC;
	}

	@Override
	public String toString() {
		return "Animale [idA=" + idA + ", nome=" + nome + ", matricola=" + matricola + ", dataAcquisto=" + dataAcquisto
				+ ", prezzo=" + prezzo + ", idT=" + idT + ", idC=" + idC + "]";
	}


}
