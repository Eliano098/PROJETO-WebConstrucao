package com.unifenas.DAO;
import java.util.List;
import java.util.function.Consumer;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import com.unifenas.dominio.Comercial;


public class ComercialDao implements Dao<Comercial>{

private EntityManager em;
    
    public ComercialDao(){
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
	public Comercial get(int id) {	
		return em.find(Comercial.class,id);
	}

	@Override
	public List<Comercial> getAll() {
		return em.createQuery("From Comercial",Comercial.class).getResultList();
	}

	@Override
	public void save (Comercial objeto) {
		ExecuteInsideTrasaction(em->em.persist(objeto));
	}

	@Override
	public void update(Comercial objeto) {
		ExecuteInsideTrasaction(em->em.merge(objeto));
	}

	@Override
	public void delete(Comercial objeto) {
		ExecuteInsideTrasaction(em->em.remove(objeto));
	}

	@Override
	public List<Comercial> getAllWhere(int id) {
		return em.createQuery("From Comercial Where usuario_id="+id,Comercial.class).getResultList();
	}
}
