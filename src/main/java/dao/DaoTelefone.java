package dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import model.Aluno;
import model.Telefone;

public class DaoTelefone {
	private EntityManagerFactory emf;
	private EntityManager em;

	public DaoTelefone() {
		emf = Persistence.createEntityManagerFactory("banco-hibernate");
		em = emf.createEntityManager();
	}

	// Insere um registro no banco de dados.
	public void insert(Telefone telefone) {
		em.getTransaction().begin();
		em.merge(telefone);
		em.getTransaction().commit();
		em.close();
		emf.close();
	}

	public List<Telefone> select() {
		String sql = "FROM Telefone";
		Query query = em.createQuery(sql);
		ArrayList<Telefone> listaTelefones = (ArrayList<Telefone>) query.getResultList();
		return listaTelefones;
	}

}