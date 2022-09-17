package com.unifenas.DAO;

import java.util.List;
import java.util.function.Consumer;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import com.unifenas.dominio.Usuario;

public class UsuarioDao implements Dao<Usuario> {
	private EntityManager em;
    
    public UsuarioDao(){
    	em = JPAUtil.getEntityManagerFactory().createEntityManager();
    }
   
    private void ExecuteInsideTrasaction(Consumer<EntityManager>action) {
        EntityTransaction tx = em.getTransaction();
        try {
        	tx.begin();
        	action.accept(em);
        	tx.commit();
        }catch(RuntimeException e) {///Exceção de execução
        	tx.rollback();//Não realizar a persistencia de dados
        	throw e;//Lanca para o utilizador a responsabilidade de resolver o problema.
        }
    }
    
	@Override
	public Usuario get(int id) {	
		return em.find(Usuario.class,id);
	}

	@Override
	public List<Usuario> getAll() {
		return em.createQuery("From Usuario",Usuario.class).getResultList();
	}

	@Override
	public void save (Usuario objeto) {
		ExecuteInsideTrasaction(em->em.persist(objeto));
	}

	@Override
	public void update(Usuario objeto) {
		ExecuteInsideTrasaction(em->em.merge(objeto));
	}

	@Override
	public void delete(Usuario objeto) {
		ExecuteInsideTrasaction(em->em.remove(objeto));
	}

	@Override
	public List<Usuario> getAllWhere(int id) {
		// TODO Auto-generated method stub
		return null;
	}
}
