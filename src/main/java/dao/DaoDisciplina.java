package dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import model.Disciplina;

public class DaoDisciplina {

	private EntityManagerFactory emf;
	private EntityManager em;

	public DaoDisciplina() {
		emf = Persistence.createEntityManagerFactory("banco-hibernate");
		em = emf.createEntityManager();
	}

	public void insert(Disciplina disciplina) {
		em.getTransaction().begin();
		em.persist(disciplina);
		em.getTransaction().commit();
		em.close();
		emf.close();
	}

	public void update(Disciplina disciplina) {
		em.getTransaction().begin();
		Disciplina a = em.find(Disciplina.class, disciplina.getIdDisciplina());
		a.setNomeDisciplina(disciplina.getNomeDisciplina());
		a.setCargaHoraria(disciplina.getCargaHoraria());
		em.persist(a);
		em.getTransaction().commit();
		em.close();
		emf.close();

	}

	public void delete(int id) {
		em.getTransaction().begin();
		Disciplina a = em.find(Disciplina.class, id);
		em.remove(a);
		em.getTransaction().commit();
		em.close();
		emf.close();

	}

	public List<Disciplina> select() {
		String sql = "FROM Disciplina";
		Query query = em.createQuery(sql);
		ArrayList<Disciplina> listaDisciplina = (ArrayList<Disciplina>) query.getResultList();
		return listaDisciplina;
	}

	public List<Disciplina> selectNome(String nomeDisciplina) {
		String sql = "FROM Disciplina WHERE nomeDisciplina LIKE :nomePesquisa";
		Query query = em.createQuery(sql);
		query.setParameter("nomePesquisa", "%" + nomeDisciplina + "%");
		ArrayList<Disciplina> listaDisciplina = (ArrayList<Disciplina>) query.getResultList();
		return listaDisciplina;
	}

	public List<Disciplina> selectId(int id) {
		Disciplina a = em.find(Disciplina.class, id);
		ArrayList<Disciplina> listaDisciplina = new ArrayList<Disciplina>();
		listaDisciplina.add(a);
		return listaDisciplina;

	}

}
