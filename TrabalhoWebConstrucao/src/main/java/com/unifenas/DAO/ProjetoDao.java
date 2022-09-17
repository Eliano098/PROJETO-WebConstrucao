package com.unifenas.DAO;

import java.util.List;
import java.util.function.Consumer;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import com.unifenas.dominio.*;

public class ProjetoDao implements Dao<Projeto> {
	private EntityManager em;
    
    public ProjetoDao(){
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
	public Projeto get(int id) {	
		return em.find(Projeto.class,id);
	}

	@Override
	public List<Projeto> getAll() {
		return em.createQuery("From Projeto",Projeto.class).getResultList();
	}
	
	@Override
	public List<Projeto> getAllWhere(int id) {
		
		return em.createQuery("From Projeto Where usuario_id="+id,Projeto.class).getResultList();
	}
	
	@Override
	public void save (Projeto objeto) {
		ExecuteInsideTrasaction(em->em.persist(objeto));
	}

	@Override
	public void update(Projeto objeto) {
		ExecuteInsideTrasaction(em->em.merge(objeto));
	}

	@Override
	public void delete(Projeto objeto) {
		ExecuteInsideTrasaction(em->em.remove(objeto));
	}
}
