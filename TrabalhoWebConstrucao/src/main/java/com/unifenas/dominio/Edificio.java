package com.unifenas.dominio;

import javax.persistence.Entity;

@Entity
public class Edificio extends Projeto{
	
	private int apartamentos;
	private int numAndar;
	public Edificio() {
		super();
	}
	public Edificio(int apartamentos, int numAndar) {
		super();
		this.apartamentos = apartamentos;
		this.numAndar = numAndar;
	}
	public int getApartamentos() {
		return apartamentos;
	}
	public void setApartamentos(int apartamentos) {
		this.apartamentos = apartamentos;
	}
	public int getNumAndar() {
		return numAndar;
	}
	public void setNumAndar(int numAndar) {
		this.numAndar = numAndar;
	}
	
	
}
