package dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import model.Turma;

public class DaoTurma {

	private EntityManagerFactory emf;
	private EntityManager em;

	public DaoTurma() {
		emf = Persistence.createEntityManagerFactory("banco-hibernate");
		em = emf.createEntityManager();
	}

	public void insert(Turma turma) {
		em.getTransaction().begin();
		em.persist(turma);
		em.getTransaction().commit();
		em.close();
		emf.close();
	}

	public void update(Turma turma) {
		em.getTransaction().begin();
		Turma t = em.find(Turma.class, turma.getIdTurma());
		t.setNomeTurma(turma.getNomeTurma());
		t.setAnoTurma(turma.getAnoTurma());
		em.persist(t);
		em.getTransaction().commit();
		em.close();
		emf.close();
	}

	public void delete(int id) {
		em.getTransaction().begin();
		Turma t = em.find(Turma.class, id);
		em.remove(t);
		em.getTransaction().commit();
		em.close();
		emf.close();
	}

	public List<Turma> select() {
		String sql = "FROM Turma";
		Query query = em.createQuery(sql);
		ArrayList<Turma> listaTurma = (ArrayList<Turma>) query.getResultList();
		return listaTurma;
	}

	public List<Turma> selectNome(String nomeTurma) {
		String sql = "FROM Turma WHERE nomeTurma LIKE :nomePesquisa";
		Query query = em.createQuery(sql);
		query.setParameter("nomePesquisa", "%" + nomeTurma + "%");
		ArrayList<Turma> listaTurma = (ArrayList<Turma>) query.getResultList();
		return listaTurma;
	}

	public List<Turma> selectId(int id) {
		Turma a = em.find(Turma.class, id);
		ArrayList<Turma> listaTurma = new ArrayList<Turma>();
		listaTurma.add(a);
		return listaTurma;

	}

}
