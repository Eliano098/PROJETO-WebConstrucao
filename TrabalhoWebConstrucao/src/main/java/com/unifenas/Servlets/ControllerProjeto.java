package com.unifenas.Servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.unifenas.DAO.*;
import com.unifenas.dominio.*;
import com.unifenas.dominio.EnumProjeto.*;

@WebServlet("/ControllerProjeto")
public class ControllerProjeto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ControllerProjeto() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("action").equals("del")) {
	    	int ProjetoId = Integer.parseInt(request.getParameter("ProjetoID"));
	    	int tipo =Integer.parseInt(request.getParameter("Tipo"));
	    	int IDUser =Integer.parseInt(request.getParameter("Id"));
	    	CronogramaDao cronogramaDao = new CronogramaDao();
			Cronograma cronograma = cronogramaDao.getProjeto(ProjetoId); 
		    cronogramaDao.delete(cronograma);
		    
		    if(tipo==0) 
		    {
		    	ResidencialDao projetoDao = new ResidencialDao();
		    	Residencial delProjeto = projetoDao.get(ProjetoId);
		    	projetoDao.delete(delProjeto);
		    }else if(tipo==1) 
		    {
		    	ComercialDao projetoDao = new ComercialDao();
		    	Comercial delProjeto = projetoDao.get(ProjetoId);
		    	projetoDao.delete(delProjeto);
		    }else 
		    {
		    	EdificioDao projetoDao = new EdificioDao();
		    	Edificio delProjeto = projetoDao.get(ProjetoId);
		    	projetoDao.delete(delProjeto);
		    }

	    	response.sendRedirect("projetoscon.jsp?Tipo="+tipo+"&id="+IDUser+"&msg=del");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ProjetoDao projetoDao=  new ProjetoDao();
		int idProjeto=0,idUsuario=0;
		
		if(!(request.getParameter("ProjetoID")==null)) {
			
			idProjeto = Integer.parseInt(request.getParameter("ProjetoID"));
            Projeto projeto = projetoDao.get(idProjeto);
            
            idUsuario = projeto.getAuxId().getId();
			UsuarioDao usuarioDao = new UsuarioDao();
			Usuario usuario = usuarioDao.get(idUsuario);
			
			int tipo= Integer.parseInt(request.getParameter("Tipo"));
			if(tipo==0) 
			{
				ResidencialDao project=new ResidencialDao();
				Residencial objeto = project.get(idProjeto);
				
				objeto.setAuxId(usuario);
				objeto.setAcabamento(Acabamento.valueOf(request.getParameter("acabamento")));
				objeto.setArea(Float.parseFloat(request.getParameter("area")));
				objeto.setComodos(Integer.parseInt(request.getParameter("comodos")));
				Date data=new Date();
				SimpleDateFormat formatador = new SimpleDateFormat ("dd/MM/yyyy");
				objeto.setDataRegistro(formatador.format(data));
				objeto.setPiso(Piso.valueOf(request.getParameter("piso")));
				objeto.setTamanho(Float.parseFloat(request.getParameter("tamanho")));
				objeto.setTelhado(Telhado.valueOf(request.getParameter("telhado")));
				objeto.setTijolo(Tijolo.valueOf(request.getParameter("tijolo")));
				
				project.update(objeto);
				
				CronogramaDao cronogramaDao = new CronogramaDao();
				Cronograma cronograma = cronogramaDao.getProjeto(objeto.getId()); 
			    cronograma.CalculoCronogramaResidencial(objeto);
				cronograma.setAuxId(objeto);
				
				cronogramaDao.update(cronograma);
				
			}else if(tipo==1) 
			{
				ComercialDao project=new ComercialDao();
				Comercial objeto = project.get(idProjeto);
				
				objeto.setAuxId(usuario);
				
				objeto.setAcabamento(Acabamento.valueOf(request.getParameter("acabamento")));
				objeto.setArea(Float.parseFloat(request.getParameter("area")));
				objeto.setNumLojas(Integer.parseInt(request.getParameter("lojas")));
				Date data=new Date();
				SimpleDateFormat formatador = new SimpleDateFormat ("dd/MM/yyyy");
				objeto.setDataRegistro(formatador.format(data));
				objeto.setPiso(Piso.valueOf(request.getParameter("piso")));
				objeto.setTamanho(Float.parseFloat(request.getParameter("tamanho")));
				objeto.setTelhado(Telhado.valueOf(request.getParameter("telhado")));
				objeto.setTijolo(Tijolo.valueOf(request.getParameter("tijolo")));
				
				project.update(objeto);
				
				CronogramaDao cronogramaDao = new CronogramaDao();
				Cronograma cronograma = cronogramaDao.getProjeto(objeto.getId()); 
			    cronograma.CalculoCronogramaComercial(objeto);
				cronograma.setAuxId(objeto);
				
				cronogramaDao.update(cronograma);
				
			}else 
			{
				EdificioDao project=new EdificioDao();
				Edificio objeto = project.get(idProjeto);
				
				objeto.setAuxId(usuario);
				
				objeto.setAcabamento(Acabamento.valueOf(request.getParameter("acabamento")));
				objeto.setArea(Float.parseFloat(request.getParameter("area")));
				objeto.setApartamentos(Integer.parseInt(request.getParameter("apartamentos")));
				objeto.setNumAndar(Integer.parseInt(request.getParameter("andares")));
				Date data=new Date();
				SimpleDateFormat formatador = new SimpleDateFormat ("dd/MM/yyyy");
				objeto.setDataRegistro(formatador.format(data));
				objeto.setPiso(Piso.valueOf(request.getParameter("piso")));
				objeto.setTamanho(Float.parseFloat(request.getParameter("tamanho")));
				objeto.setTelhado(Telhado.valueOf(request.getParameter("telhado")));
				objeto.setTijolo(Tijolo.valueOf(request.getParameter("tijolo")));
				
				project.update(objeto);

				CronogramaDao cronogramaDao = new CronogramaDao();
				Cronograma cronograma = cronogramaDao.getProjeto(objeto.getId()); 
			    cronograma.CalculoCronogramaEdificio(objeto);
				cronograma.setAuxId(objeto);
				
				cronogramaDao.update(cronograma);
			}
			
		    response.sendRedirect("selecttipoLista.jsp?id="+usuario.getId());
		    
		}else 
		{

			UsuarioDao usuarioDao = new UsuarioDao();
			Usuario usuario = usuarioDao.get(Integer.parseInt(request.getParameter("UsuarioID")));
            int tipo= Integer.parseInt(request.getParameter("tipo"));
            
			if(tipo==0) 
			{
				ResidencialDao project=new ResidencialDao();
				Residencial objeto = new Residencial();
				
				objeto.setAuxId(usuario);
				
				objeto.setAcabamento(Acabamento.valueOf(request.getParameter("acabamento")));
				objeto.setArea(Float.parseFloat(request.getParameter("area")));
				objeto.setComodos(Integer.parseInt(request.getParameter("comodos")));
				Date data=new Date();
				SimpleDateFormat formatador = new SimpleDateFormat ("dd/MM/yyyy");
				objeto.setDataRegistro(formatador.format(data));
				objeto.setPiso(Piso.valueOf(request.getParameter("piso")));
				objeto.setTamanho(Float.parseFloat(request.getParameter("tamanho")));
				objeto.setTelhado(Telhado.valueOf(request.getParameter("telhado")));
				objeto.setTijolo(Tijolo.valueOf(request.getParameter("tijolo")));
				
				CronogramaDao cronogramaDao = new CronogramaDao();
				Cronograma cronograma = new Cronograma();
				cronograma.CalculoCronogramaResidencial(objeto);
				cronograma.setAuxId(objeto);
				
				project.save(objeto);
				cronogramaDao.save(cronograma);
				
			}else if(tipo==1) 
			{
				ComercialDao project=new ComercialDao();
				Comercial objeto = new Comercial();
				
				objeto.setAuxId(usuario);
				
				objeto.setAcabamento(Acabamento.valueOf(request.getParameter("acabamento")));
				objeto.setArea(Float.parseFloat(request.getParameter("area")));
				objeto.setNumLojas(Integer.parseInt(request.getParameter("lojas")));
				Date data=new Date();
				SimpleDateFormat formatador = new SimpleDateFormat ("dd/MM/yyyy");
				objeto.setDataRegistro(formatador.format(data));
				objeto.setPiso(Piso.valueOf(request.getParameter("piso")));
				objeto.setTamanho(Float.parseFloat(request.getParameter("tamanho")));
				objeto.setTelhado(Telhado.valueOf(request.getParameter("telhado")));
				objeto.setTijolo(Tijolo.valueOf(request.getParameter("tijolo")));
				
				CronogramaDao cronogramaDao = new CronogramaDao();
				Cronograma cronograma = new Cronograma();
				cronograma.CalculoCronogramaComercial(objeto);
				cronograma.setAuxId(objeto);
				
				project.save(objeto);
				cronogramaDao.save(cronograma);
				
			}else 
			{
				EdificioDao project=new EdificioDao();
				Edificio objeto = new Edificio();
				
				objeto.setAuxId(usuario);
				
				objeto.setAcabamento(Acabamento.valueOf(request.getParameter("acabamento")));
				objeto.setArea(Float.parseFloat(request.getParameter("area")));
				objeto.setApartamentos(Integer.parseInt(request.getParameter("apartamentos")));
				objeto.setNumAndar(Integer.parseInt(request.getParameter("andares")));
				Date data=new Date();
				SimpleDateFormat formatador = new SimpleDateFormat ("dd/MM/yyyy");
				objeto.setDataRegistro(formatador.format(data));
				objeto.setPiso(Piso.valueOf(request.getParameter("piso")));
				objeto.setTamanho(Float.parseFloat(request.getParameter("tamanho")));
				objeto.setTelhado(Telhado.valueOf(request.getParameter("telhado")));
				objeto.setTijolo(Tijolo.valueOf(request.getParameter("tijolo")));
				
				CronogramaDao cronogramaDao = new CronogramaDao();
				Cronograma cronograma = new Cronograma();
				cronograma.CalculoCronogramaEdificio(objeto);
				cronograma.setAuxId(objeto);
				
				project.save(objeto);
				cronogramaDao.save(cronograma);
			}
			
		    response.sendRedirect("selecttipo.jsp?msg=add&id="+request.getParameter("UsuarioID")+"");
    }
  }
}