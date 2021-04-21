package model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Turma implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_turma")
	private int idTurma;
	private String nomeTurma;
	private String anoTurma;
	@OneToMany(mappedBy = "turma")
	private Set<Aluno> alunos = new HashSet<Aluno>();

	public Turma() {
	}

	public Set<Aluno> getAlunos() {
		return alunos;
	}

	public void setAlunos(Set<Aluno> alunos) {
		this.alunos = alunos;
	}

	public int getIdTurma() {
		return idTurma;
	}

	public void setIdTurma(int idTurma) {
		this.idTurma = idTurma;
	}

	public String getNomeTurma() {
		return nomeTurma;
	}

	public void setNomeTurma(String nomeTurma) {
		this.nomeTurma = nomeTurma;
	}

	public String getAnoTurma() {
		return anoTurma;
	}

	public void setAnoTurma(String anoTurma) {
		this.anoTurma = anoTurma;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((alunos == null) ? 0 : alunos.hashCode());
		result = prime * result + ((anoTurma == null) ? 0 : anoTurma.hashCode());
		result = prime * result + idTurma;
		result = prime * result + ((nomeTurma == null) ? 0 : nomeTurma.hashCode());
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
		Turma other = (Turma) obj;
		if (alunos == null) {
			if (other.alunos != null)
				return false;
		} else if (!alunos.equals(other.alunos))
			return false;
		if (anoTurma == null) {
			if (other.anoTurma != null)
				return false;
		} else if (!anoTurma.equals(other.anoTurma))
			return false;
		if (idTurma != other.idTurma)
			return false;
		if (nomeTurma == null) {
			if (other.nomeTurma != null)
				return false;
		} else if (!nomeTurma.equals(other.nomeTurma))
			return false;
		return true;
	}
}
