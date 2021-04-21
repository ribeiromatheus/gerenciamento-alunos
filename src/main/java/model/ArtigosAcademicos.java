package model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "artigos_academicos")
public class ArtigosAcademicos implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_artigo")
	private int idArtigo;

	private String titulo;
	private String dataPublicacao;
	private String numeroPaginas;
	private String revista;

	public ArtigosAcademicos() {

	}

	public int getIdArtigo() {
		return idArtigo;
	}

	public void setIdArtigo(int idArtigo) {
		this.idArtigo = idArtigo;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getDataPublicacao() {
		return dataPublicacao;
	}

	public void setDataPublicacao(String dataPublicacao) {
		this.dataPublicacao = dataPublicacao;
	}

	public String getNumeroPaginas() {
		return numeroPaginas;
	}

	public void setNumeroPaginas(String numeroPaginas) {
		this.numeroPaginas = numeroPaginas;
	}

	public String getRevista() {
		return revista;
	}

	public void setRevista(String revista) {
		this.revista = revista;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((dataPublicacao == null) ? 0 : dataPublicacao.hashCode());
		result = prime * result + idArtigo;
		result = prime * result + ((numeroPaginas == null) ? 0 : numeroPaginas.hashCode());
		result = prime * result + ((revista == null) ? 0 : revista.hashCode());
		result = prime * result + ((titulo == null) ? 0 : titulo.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ArtigosAcademicos other = (ArtigosAcademicos) obj;
		if (dataPublicacao == null) {
			if (other.dataPublicacao != null)
				return false;
		} else if (!dataPublicacao.equals(other.dataPublicacao))
			return false;
		if (idArtigo != other.idArtigo)
			return false;
		if (numeroPaginas == null) {
			if (other.numeroPaginas != null)
				return false;
		} else if (!numeroPaginas.equals(other.numeroPaginas))
			return false;
		if (revista == null) {
			if (other.revista != null)
				return false;
		} else if (!revista.equals(other.revista))
			return false;
		if (titulo == null) {
			if (other.titulo != null)
				return false;
		} else if (!titulo.equals(other.titulo))
			return false;
		return true;
	}

}
