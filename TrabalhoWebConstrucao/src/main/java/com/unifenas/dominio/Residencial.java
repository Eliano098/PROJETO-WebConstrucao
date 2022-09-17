package com.unifenas.dominio;

import javax.persistence.Entity;

@Entity
public class Residencial extends Projeto{
	
	private int comodos;

	public Residencial() {
		super();
	}
	
	public Residencial(int comodos) {
		super();
		this.comodos = comodos;
	}

	public int getComodos() {
		return comodos;
	}

	public void setComodos(int comodos) {
		this.comodos = comodos;
	}
	
	
}
