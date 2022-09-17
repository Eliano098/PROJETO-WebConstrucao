package com.unifenas.dominio;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class Cronograma {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Id;
	@OneToOne
	private Projeto projeto;
	private String dataEntrega;
	
	public Cronograma() {
		super();
	}
	public Cronograma(Projeto auxId, String dataEntrega) {
		super();
		projeto = auxId;
		this.dataEntrega = dataEntrega;
	}
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public Projeto getAuxId() {
		return projeto;
	}
	public void setAuxId(Projeto auxId) {
		projeto = auxId;
	}
	public String getDataEntrega() {
		return dataEntrega;
	}
	public void setDataEntrega(String dataEntrega) {
		this.dataEntrega = dataEntrega;
	}
	
	public void CalculoCronogramaResidencial(Residencial obj){
		int dias=0;
	    //Tamanho área M²
		if(obj.getArea()<60){
	       dias+=5;
	    }else if((obj.getArea()>60)&&(obj.getArea()<100)){
	       dias+=10;
	    }else{
	       dias+=15;
	    }
		
	    //Tamanho do Imóvel M²
	    if(obj.getTamanho()<60){
	    	dias+=40;
	    }else if((obj.getTamanho()>60)&&(obj.getTamanho()<100)){
	    	dias+=60;
	    }else{
	        dias+=90;
	    }
	    
	    //Nº de Comodos
	    if(obj.getComodos()<5){
	    	dias-=5;
	    }else if((obj.getComodos()>5)&&(obj.getComodos()<10)){
	    	dias-=2;
	    }else{
	        dias+=10;
	    }
	    
	    //Acabamento
	    if(obj.getAcabamento().toString().equals("Gesso")){
	         dias+=10;
	    }else if(obj.getAcabamento().toString().equals("MassaCorrida")){
	    	dias+=15;
	    }else{
	    	dias+=6;
	    }
	    
	    //Piso
	    if(obj.getPiso().toString().equals("Ceramica")){
		    dias+=3;
	    }else if(obj.getPiso().toString().equals("Porcelanato")){
	    	dias+=5;
	    }else{
	    	dias+=15;
	    }
	    
	    //Telhado
	    if(obj.getTelhado().toString().equals("Embutido")){
		    dias-=10;
	    }else if(obj.getTelhado().toString().equals("Fibrocimento")){
	    	dias-=7;
	    }else{
	    	dias-=3;
	    }
	    
	    //Tijolo
	    if(obj.getTijolo().toString().equals("Baiano")){
		    dias-=5;
	    }else if(obj.getTijolo().toString().equals("Bloco")){
	    	dias-=10;
	    }else{
	    	dias+=15;
	    }
	    
	    CalculoBase(dias);
	}
	
	public void CalculoBase(int i) 
	{
		Date data= new Date();
		Calendar cal = Calendar.getInstance(); 
		cal.setTime(data);
		for(int j=i;j>0;j--) 
		{
			cal.add(Calendar.DATE, 1);
			data = cal.getTime();
		}
		try {
			data = new SimpleDateFormat("dd/MM/yyyy").parse(data.toString());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		SimpleDateFormat formatador = new SimpleDateFormat ("dd/MM/yyyy");
		dataEntrega = formatador.format(data);
	}
	public void CalculoCronogramaComercial(Comercial obj){
		int dias=0;
	    //Tamanho área M²
		if(obj.getArea()<60){
	       dias+=5;
	    }else if((obj.getArea()>60)&&(obj.getArea()<100)){
	       dias+=10;
	    }else{
	       dias+=15;
	    }
		
	    //Tamanho do Imóvel M²
	    if(obj.getTamanho()<60){
	    	dias+=40;
	    }else if((obj.getTamanho()>60)&&(obj.getTamanho()<100)){
	    	dias+=60;
	    }else{
	        dias+=90;
	    }
	    
	    //Nº de Lojas
	    if(obj.getNumLojas()<5){
	    	dias-=5;
	    }else if((obj.getNumLojas()>5)&&(obj.getNumLojas()<10)){
	    	dias-=2;
	    }else{
	        dias+=10;
	    }
	    
	    //Acabamento
	    if(obj.getAcabamento().toString().equals("Gesso")){
	         dias+=10;
	    }else if(obj.getAcabamento().toString().equals("MassaCorrida")){
	    	dias+=15;
	    }else{
	    	dias+=6;
	    }
	    
	    //Piso
	    if(obj.getPiso().toString().equals("Ceramica")){
		    dias+=3;
	    }else if(obj.getPiso().toString().equals("Porcelanato")){
	    	dias+=5;
	    }else{
	    	dias+=15;
	    }
	    
	    //Telhado
	    if(obj.getTelhado().toString().equals("Embutido")){
		    dias-=10;
	    }else if(obj.getTelhado().toString().equals("Fibrocimento")){
	    	dias-=7;
	    }else{
	    	dias-=3;
	    }
	    
	    //Tijolo
	    if(obj.getTijolo().toString().equals("Baiano")){
		    dias-=5;
	    }else if(obj.getTijolo().toString().equals("Bloco")){
	    	dias-=10;
	    }else{
	    	dias+=15;
	    }
	    
	    CalculoBase(dias);
	}

	public void CalculoCronogramaEdificio(Edificio obj){
		int dias=0;
	    //Tamanho área M²
		if(obj.getArea()<60){
	       dias+=5;
	    }else if((obj.getArea()>60)&&(obj.getArea()<100)){
	       dias+=10;
	    }else{
	       dias+=15;
	    }
		
	    //Tamanho do Imóvel M²
	    if(obj.getTamanho()<60){
	    	dias+=40;
	    }else if((obj.getTamanho()>60)&&(obj.getTamanho()<100)){
	    	dias+=60;
	    }else{
	        dias+=90;
	    }
	    
	    //Nº de Apartamentos por Andar
	    if(obj.getApartamentos()<5){
	    	dias-=5;
	    }else if((obj.getApartamentos()>5)&&(obj.getApartamentos()<10)){
	    	dias-=2;
	    }else{
	        dias+=10;
	    }
	    
	    //Acabamento
	    if(obj.getAcabamento().toString().equals("Gesso")){
	         dias+=10;
	    }else if(obj.getAcabamento().toString().equals("MassaCorrida")){
	    	dias+=15;
	    }else{
	    	dias+=6;
	    }
	    
	    //Piso
	    if(obj.getPiso().toString().equals("Ceramica")){
		    dias+=3;
	    }else if(obj.getPiso().toString().equals("Porcelanato")){
	    	dias+=5;
	    }else{
	    	dias+=15;
	    }
	    
	    //Telhado
	    if(obj.getTelhado().toString().equals("Embutido")){
		    dias-=10;
	    }else if(obj.getTelhado().toString().equals("Fibrocimento")){
	    	dias-=7;
	    }else{
	    	dias-=3;
	    }
	    
	    //Tijolo
	    if(obj.getTijolo().toString().equals("Baiano")){
		    dias-=5;
	    }else if(obj.getTijolo().toString().equals("Bloco")){
	    	dias-=10;
	    }else{
	    	dias+=15;
	    }
	    
	    //Nº de Andares
	    dias=dias*obj.getNumAndar();
	    
	    CalculoBase(dias);
	}
}
