package com.unifenas.Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.unifenas.DAO.ResidencialDao;
import com.unifenas.dominio.Residencial;

@WebServlet({"/ControllerResidencial","/controllerResidencial"})
public class ControllerResidencial extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ControllerResidencial() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	if(request.getParameter("action").equals("del")) {
	    	int ResidencialId = Integer.parseInt(request.getParameter("ResidencialID"));
	    	ResidencialDao residencialDao = new ResidencialDao();
	    	Residencial delResidencial = residencialDao.get(ResidencialId);
	    	residencialDao.delete(delResidencial);
	    	response.sendRedirect("residencialcon.jsp?msg=del");
	}
}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ResidencialDao ResidencialDao=  new ResidencialDao();
		int idResidencial=0;
		
		if(!(request.getParameter("ResidencialID")==null)) {
			
			idResidencial = Integer.parseInt(request.getParameter("ResidencialID"));
           
			Residencial residencial = ResidencialDao.get(idResidencial);
            
			residencial.setComodos(Integer.parseInt(request.getParameter("comodos")));
			
			ResidencialDao.update(residencial);
				
		}else 
		{

			Residencial residencial = new Residencial();
			residencial.setComodos(Integer.parseInt(request.getParameter("comodos")));
			
			ResidencialDao.save(residencial);	
		}
		response.sendRedirect("residencialcon.jsp?msg=add");
}
}