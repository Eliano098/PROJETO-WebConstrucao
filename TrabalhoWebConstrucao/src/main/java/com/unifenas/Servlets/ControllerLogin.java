package com.unifenas.Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.unifenas.DAO.UsuarioDao;
import com.unifenas.dominio.Usuario;

/**
 * Servlet implementation class ControllerUsuarios
 */
@WebServlet({"/ControllerLogin","/controllerLogin"})
public class ControllerLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ControllerLogin() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  UsuarioDao usuarioDao = new UsuarioDao();
		  List<Usuario> Lista = usuarioDao.getAll();
		  int valida=0;
		  for (Usuario usuario : Lista) {
		     if((usuario.getNome().equals(request.getParameter("nome")))&&(usuario.getSenha().equals(request.getParameter("senha"))))
		   	 {
		    	  valida=1;
                  response.sendRedirect("Home.jsp?user="+usuario.getTipo().toString()+"&id="+usuario.getId());
		    	 }
		     }
		  if(valida==0) 
		  {
	        	  response.sendRedirect("Login.jsp?false");
		  }
	   } 
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
 
	}
}
