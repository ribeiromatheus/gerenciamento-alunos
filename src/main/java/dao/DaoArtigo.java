package dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import model.Artigo;

public class DaoArtigo {
	private EntityManagerFactory emf;
	private EntityManager em;

	public DaoArtigo() {
		emf = Persistence.createEntityManagerFactory("banco-hibernate");
		em = emf.createEntityManager();
	}

	// Insere um registro no banco de dados.
	public void insert(Artigo artigos) {
		em.getTransaction().begin();
		em.persist(artigos);
		em.getTransaction().commit();
		em.close();
		emf.close();
	}

	public void update(Artigo artigos) {
		em.getTransaction().begin();
		Artigo a = em.find(Artigo.class, artigos.getIdArtigo());
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
		Artigo a = em.find(Artigo.class, id);
		em.remove(a);
		em.getTransaction().commit();
		em.close();
		emf.close();
	}

	public List<Artigo> select() {
		String sql = "FROM Artigo";
		Query query = em.createQuery(sql);
		ArrayList<Artigo> listaArtigos = (ArrayList<Artigo>) query.getResultList();
		return listaArtigos;
	}

	public List<Artigo> selectNome(String nome) {
		String sql = "FROM Artigo WHERE titulo LIKE :nomePesquisa";
		Query query = em.createQuery(sql);
		query.setParameter("nomePesquisa", "%" + nome + "%");
		ArrayList<Artigo> listaArtigos = (ArrayList<Artigo>) query.getResultList();
		return listaArtigos;
	}

	public List<Artigo> selectId(int id) {
		Artigo a = em.find(Artigo.class, id);
		ArrayList<Artigo> listaArtigos = new ArrayList<Artigo>();
		listaArtigos.add(a);
		return listaArtigos;

	}

}