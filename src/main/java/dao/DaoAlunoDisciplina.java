package dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import model.AlunoDisciplina;
import model.Disciplina;

public class DaoAlunoDisciplina {

	private EntityManagerFactory emf;
	private EntityManager em;

	public DaoAlunoDisciplina() {
		emf = Persistence.createEntityManagerFactory("banco-hibernate");
		em = emf.createEntityManager();
	}

	public void insert(AlunoDisciplina disciplina) {
		em.getTransaction().begin();
		em.persist(disciplina);
		em.getTransaction().commit();
		em.close();
		emf.close();
	}

	public void update(AlunoDisciplina disciplina) {
		em.getTransaction().begin();
		AlunoDisciplina a = em.find(AlunoDisciplina.class, disciplina.getId());
		a.setNota1(disciplina.getNota1());
		a.setNota2(disciplina.getNota2());
		em.persist(a);
		em.getTransaction().commit();
		em.close();
		emf.close();

	}

	public void delete(int id) {
		em.getTransaction().begin();
		AlunoDisciplina a = em.find(AlunoDisciplina.class, id);
		em.remove(a);
		em.getTransaction().commit();
		em.close();
		emf.close();

	}

}
