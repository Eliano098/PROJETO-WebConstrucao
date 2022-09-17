package com.unifenas.dominio;


import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import com.unifenas.DAO.CronogramaDao;
import com.unifenas.dominio.EnumProjeto.*;

@Entity
public class Projeto {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Id;	
	@ManyToOne
	private Usuario usuario; 
	private float area;
	private float tamanho;
	private String dataRegistro;
	@Enumerated(EnumType.STRING)
	private Acabamento acabamento;
	@Enumerated(EnumType.STRING)
	private Piso piso;
	@Enumerated(EnumType.STRING)
	private Telhado telhado;
	@Enumerated(EnumType.STRING)
	private Tijolo tijolo;
	
	public Projeto() {
		super();
	}
	public Projeto(int id, Usuario auxId, float area, float tamanho, String dataRegistro, Acabamento acabamento,
			Piso piso, Telhado telhado, Tijolo tijolo) {
		super();
		Id = id;
		usuario = auxId;
		this.area = area;
		this.tamanho = tamanho;
		this.dataRegistro = dataRegistro;
		this.acabamento = acabamento;
		this.piso = piso;
		this.telhado = telhado;
		this.tijolo = tijolo;
	}
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public Usuario getAuxId() {
		return usuario;
	}
	public void setAuxId(Usuario auxId) {
		usuario = auxId;
	}
	public float getArea() {
		return area;
	}
	public void setArea(float area) {
		this.area = area;
	}
	public float getTamanho() {
		return tamanho;
	}
	public void setTamanho(float tamanho) {
		this.tamanho = tamanho;
	}
	public String getDataRegistro() {
		return dataRegistro;
	}
	public void setDataRegistro(String dataRegistro) {
		this.dataRegistro = dataRegistro;
	}
	public Acabamento getAcabamento() {
		return acabamento;
	}
	public void setAcabamento(Acabamento acabamento) {
		this.acabamento = acabamento;
	}
	public Piso getPiso() {
		return piso;
	}
	public void setPiso(Piso piso) {
		this.piso = piso;
	}
	public Telhado getTelhado() {
		return telhado;
	}
	public void setTelhado(Telhado telhado) {
		this.telhado = telhado;
	}
	public Tijolo getTijolo() {
		return tijolo;
	}
	public void setTijolo(Tijolo tijolo) {
		this.tijolo = tijolo;
	}
	
	public String MostraDias() 
	{
		DateTimeFormatter format = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		LocalDate datainicio = LocalDate.parse(dataRegistro,format);
	
		CronogramaDao cronogramaDao= new CronogramaDao();
		Cronograma cronograma = cronogramaDao.getProjeto(Id);
		LocalDate datafinal = LocalDate.parse(cronograma.getDataEntrega(),format);
		
		long daysBetween = ChronoUnit.DAYS.between(datainicio, datafinal);
		
		String S = String.valueOf(daysBetween);
		return S;
	}
}
