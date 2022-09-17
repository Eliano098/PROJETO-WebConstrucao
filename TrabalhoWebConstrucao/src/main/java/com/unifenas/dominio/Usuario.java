package com.unifenas.dominio;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Usuario {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Id;
	private String nome;
	private String senha;
	private TipoUsuario tipo;
	
	@OneToMany(mappedBy = "usuario")
	private List<Projeto>projeto;
	
	public Usuario() {
		
		super();
	}
	
	public Usuario(String nome, String senha, TipoUsuario tipo) {
		super();
		this.nome = nome;
		this.senha = senha;
		this.tipo = tipo;
	}

	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public TipoUsuario getTipo() {
		return tipo;
	}
	public void setTipo(TipoUsuario tipo) {
		this.tipo = tipo;
	}
	
}
