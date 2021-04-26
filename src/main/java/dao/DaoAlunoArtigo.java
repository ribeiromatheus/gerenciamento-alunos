package dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import model.AlunoArtigo;
import model.AlunoDisciplina;
import model.Disciplina;

public class DaoAlunoArtigo {

	private EntityManagerFactory emf;
	private EntityManager em;

	public DaoAlunoArtigo() {
		emf = Persistence.createEntityManagerFactory("banco-hibernate");
		em = emf.createEntityManager();
	}

	public void insert(AlunoArtigo artigo) {
		em.getTransaction().begin();
		em.persist(artigo);
		em.getTransaction().commit();
		em.close();
		emf.close();
	}

	public void update(AlunoArtigo artigo) {
		em.getTransaction().begin();
		AlunoArtigo a = em.find(AlunoArtigo.class, artigo.getId());
		
		em.persist(a);
		em.getTransaction().commit();
		em.close();
		emf.close();

	}

	public void delete(int id) {
		em.getTransaction().begin();
		AlunoArtigo a = em.find(AlunoArtigo.class, id);
		em.remove(a);
		em.getTransaction().commit();
		em.close();
		emf.close();
	}

	public List<AlunoArtigo> select() {
		String sql = "FROM AlunoArtigo";
		Query query = em.createQuery(sql);
		ArrayList<AlunoArtigo> listaArtigo = (ArrayList<AlunoArtigo>) query.getResultList();
		return listaArtigo;
	}
}
