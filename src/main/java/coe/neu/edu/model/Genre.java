package coe.neu.edu.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="Genre")
public class Genre implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="Genre_Id", unique=true, nullable=false)
	private long GenreId;
	
	@Column(name="Genre", nullable=false, unique=true, length=100)
	private String name;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="genre", cascade=CascadeType.ALL)
	private List<Music> product = new ArrayList<Music>();

	public long getGenreId() {
		return GenreId;
	}

	public void setGenreId(long genreId) {
		GenreId = genreId;
	}

	public List<Music> getProduct() {
		return product;
	}

	public void setProduct(List<Music> product) {
		this.product = product;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return name;
	}
	
	
	
	
}
