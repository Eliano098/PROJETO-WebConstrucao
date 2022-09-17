package com.unifenas.DAO;

import java.util.List;
import java.util.function.Consumer;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import com.unifenas.dominio.*;

public class ResidencialDao implements Dao<Residencial> {
	private EntityManager em;
    
    public ResidencialDao(){
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
	public Residencial get(int id) {	
		return em.find(Residencial.class,id);
	}

	@Override
	public List<Residencial> getAll() {
		return em.createQuery("From Residencial",Residencial.class).getResultList();
	}

	@Override
	public void save (Residencial objeto) {
		ExecuteInsideTrasaction(em->em.persist(objeto));
	}

	@Override
	public void update(Residencial objeto) {
		ExecuteInsideTrasaction(em->em.merge(objeto));
	}

	@Override
	public void delete(Residencial objeto) {
		ExecuteInsideTrasaction(em->em.remove(objeto));
	}

	@Override
	public List<Residencial> getAllWhere(int id) {
		
		return em.createQuery("From Residencial Where usuario_id="+id,Residencial.class).getResultList();
	}
}
