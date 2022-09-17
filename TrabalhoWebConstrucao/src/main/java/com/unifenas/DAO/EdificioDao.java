package com.unifenas.DAO;

import java.util.List;
import java.util.function.Consumer;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import com.unifenas.dominio.Edificio;


public class EdificioDao implements Dao<Edificio> {
	private EntityManager em;
    
    public EdificioDao(){
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
	public Edificio get(int id) {
		return em.find(Edificio.class,id);
	}
    
	@Override
	public List<Edificio> getAll() {
		return em.createQuery("From Edificio",Edificio.class).getResultList();
	}
	
	@Override
	public void save(Edificio objeto) {
		ExecuteInsideTrasaction(em->em.persist(objeto));
	}

	@Override
	public void update(Edificio objeto) {
		ExecuteInsideTrasaction(em->em.merge(objeto));	
	}

	@Override
	public void delete(Edificio objeto) {
		ExecuteInsideTrasaction(em->em.remove(objeto));	
	}

	@Override
	public List<Edificio> getAllWhere(int id) {
		
		return em.createQuery("From Edificio Where usuario_id="+id,Edificio.class).getResultList();
	}
}