package dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import model.ArtigosAcademicos;

public class DaoArtigosAcademicos {
	private EntityManagerFactory emf;
	private EntityManager em;

	public DaoArtigosAcademicos() {
		emf = Persistence.createEntityManagerFactory("banco-hibernate");
		em = emf.createEntityManager();
	}

	// Insere um registro no banco de dados.
	public void insert(ArtigosAcademicos artigos) {
		em.getTransaction().begin();
		em.persist(artigos);
		em.getTransaction().commit();
		em.close();
		emf.close();
	}

	public void update(ArtigosAcademicos artigos) {
		em.getTransaction().begin();
		ArtigosAcademicos a = em.find(ArtigosAcademicos.class, artigos.getIdArtigo());
		a.setTitulo(artigos.getTitulo());
		a.setDataPublicacao(artigos.getDataPublicacao());
		a.setRevista(artigos.getRevista());
		a.setNumeroPaginas(artigos.getNumeroPaginas());
		em.persist(a);
		em.getTransaction().commit();
		em.close();
		emf.close();
	}

	public void delete(int id) {
		em.getTransaction().begin();
		ArtigosAcademicos a = em.find(ArtigosAcademicos.class, id);
		em.remove(a);
		em.getTransaction().commit();
		em.close();
		emf.close();
	}

	public List<ArtigosAcademicos> select() {
		String sql = "FROM ArtigosAcademicos";
		Query query = em.createQuery(sql);
		ArrayList<ArtigosAcademicos> listaArtigos = (ArrayList<ArtigosAcademicos>) query.getResultList();
		return listaArtigos;
	}

	public List<ArtigosAcademicos> selectNome(String nome) {
		String sql = "FROM artigosacademicos WHERE titulo LIKE :nomePesquisa";
		Query query = em.createQuery(sql);
		query.setParameter("nomePesquisa", "%" + nome + "%");
		ArrayList<ArtigosAcademicos> listaArtigos = (ArrayList<ArtigosAcademicos>) query.getResultList();
		return listaArtigos;
	}

	public List<ArtigosAcademicos> selectId(int id) {
		ArtigosAcademicos a = em.find(ArtigosAcademicos.class, id);
		ArrayList<ArtigosAcademicos> listaArtigos = new ArrayList<ArtigosAcademicos>();
		listaArtigos.add(a);
		return listaArtigos;

	}

}