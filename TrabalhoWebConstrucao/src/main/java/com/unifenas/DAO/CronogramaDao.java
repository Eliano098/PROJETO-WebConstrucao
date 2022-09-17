package com.unifenas.DAO;

import java.util.List;
import java.util.function.Consumer;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import com.unifenas.dominio.*;

public class CronogramaDao implements Dao<Cronograma> {
	private EntityManager em;
    
    public CronogramaDao(){
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
	public Cronograma get(int id) {	
		return em.find(Cronograma.class,id);
	}

	@Override
	public List<Cronograma> getAll() {
		return em.createQuery("From Cronograma",Cronograma.class).getResultList();
	}

	@Override
	public void save (Cronograma objeto) {
		ExecuteInsideTrasaction(em->em.persist(objeto));
	}

	@Override
	public void update(Cronograma objeto) {
		ExecuteInsideTrasaction(em->em.merge(objeto));
	}

	@Override
	public void delete(Cronograma objeto) {
		ExecuteInsideTrasaction(em->em.remove(objeto));
	}

	@Override
	public List<Cronograma> getAllWhere(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	public Cronograma getProjeto(int id) {	
		return em.createQuery("From Cronograma where projeto_Id="+id+"",Cronograma.class).getSingleResult();
	}
}