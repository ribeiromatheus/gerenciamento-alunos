package dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import model.Aluno;

public class DaoAluno {
	private EntityManagerFactory emf;
	private EntityManager em;

	public DaoAluno() {
		emf = Persistence.createEntityManagerFactory("banco-hibernate");
		em = emf.createEntityManager();
	}

	// Insere um registro no banco de dados.
	public void insert(Aluno aluno) {
		em.getTransaction().begin();
		em.merge(aluno);
		em.getTransaction().commit();
		em.close();
		emf.close();
	}

	public void update(Aluno aluno) {
		em.getTransaction().begin();
		Aluno a = em.find(Aluno.class, aluno.getIdaluno());
		a.setNome(aluno.getNome());
		a.setEmail(aluno.getEmail());
		em.persist(a);
		em.getTransaction().commit();
		em.close();
		emf.close();
	}

	public void delete(int id) {
		em.getTransaction().begin();
		Aluno a = em.find(Aluno.class, id);
		em.remove(a);
		em.getTransaction().commit();
		em.close();
		emf.close();
	}

	public List<Aluno> select() {
		String sql = "FROM Aluno";
		Query query = em.createQuery(sql);
		ArrayList<Aluno> listaAlunos = (ArrayList<Aluno>) query.getResultList();
		return listaAlunos;
	}

	public List<Aluno> selectNome(String nome) {
		String sql = "FROM Aluno WHERE nome LIKE :nomePesquisa";
		Query query = em.createQuery(sql);
		query.setParameter("nomePesquisa", "%" + nome + "%");
		ArrayList<Aluno> listaAlunos = (ArrayList<Aluno>) query.getResultList();
		return listaAlunos;
	}

	public List<Aluno> selectId(int id) {
		Aluno a = em.find(Aluno.class, id);
		ArrayList<Aluno> listaAlunos = new ArrayList<Aluno>();
		listaAlunos.add(a);
		return listaAlunos;

	}

}