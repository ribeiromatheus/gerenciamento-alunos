package dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import model.Endereco;

public class DaoEndereco {
	private EntityManagerFactory emf;
	private EntityManager em;

	public DaoEndereco() {
		emf = Persistence.createEntityManagerFactory("banco-hibernate");
		em = emf.createEntityManager();
	}

	// Insere um registro no banco de dados.
	public void insert(Endereco endereco) {
		em.getTransaction().begin();
		em.merge(endereco);
		em.getTransaction().commit();
		em.close();
		emf.close();
	}
}