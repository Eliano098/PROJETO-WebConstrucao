package com.unifenas.dominio;

import javax.persistence.Entity;
@Entity
public class Comercial extends Projeto{
   
	private int numLojas;
	public Comercial() {
		super();
	}
	public Comercial(int comodos, int numLojas) {
		super();
		this.numLojas = numLojas;
	}
	public int getNumLojas() {
		return numLojas;
	}
	public void setNumLojas(int numLojas) {
		this.numLojas = numLojas;
	}
	
	
}
