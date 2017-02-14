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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Entity
@Table(name="Music")
public class Music implements Serializable{

		/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

		@Id
		@GeneratedValue(strategy=GenerationType.IDENTITY)
		@Column(name="Music_Id", unique=true, nullable=false)
		private int musicId;
		
		@Column(name="Music_Name", nullable=false, length=100)
		private String name;
		
		@Column(name="Supplier_Name", nullable=false, length=100)
		private String supplierName;
		
		@ManyToOne(fetch=FetchType.LAZY, cascade=CascadeType.ALL)
		@JoinColumn(name="Genre_ID", nullable=true)
		private Genre genre;
		
		@Column(name="Price", nullable=false, length=100)
		private float price;
		
		@Column(name="Quantity", nullable=false, length=100)
		private int quantity;
		
		@Column(name="Description", nullable=false, length=100)
		private String description;
		
//		private CommonsMultipartFile image;
//		private CommonsMultipartFile sampleMusic;
		
		@Column(name="ImagePath", nullable=false, length=100)
		private String imagePath;

//		public CommonsMultipartFile getSampleMusic() {
//			return sampleMusic;
//		}
//
//		public void setSampleMusic(CommonsMultipartFile sampleMusic) {
//			this.sampleMusic = sampleMusic;
//		}

		@Column(name="SamplePath", nullable=false, length=100)
		private String samplePath;
		
//		@ManyToMany(fetch=FetchType.LAZY, cascade=CascadeType.ALL, mappedBy="product")
//		private List<Supplier> supplier = new ArrayList<Supplier>();
		


		
		public String getDescription() {
			return description;
		}

		public String getSupplierName() {
			return supplierName;
		}

		public void setSupplierName(String supplierName) {
			this.supplierName = supplierName;
		}

		public String getImagePath() {
			return imagePath;
		}

		public void setImagePath(String imagePath) {
			this.imagePath = imagePath;
		}

		public String getSamplePath() {
			return samplePath;
		}

		public void setSamplePath(String samplePath) {
			this.samplePath = samplePath;
		}

		public void setDescription(String description) {
			this.description = description;
		}

		@OneToMany(fetch=FetchType.LAZY, mappedBy="music", cascade=CascadeType.ALL)
		private List<OrderItem> orderItem = new ArrayList<OrderItem>();

		public int getMusicId() {
			return musicId;
		}

		public void setMusicId(int musicId) {
			this.musicId = musicId;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public Genre getGenre() {
			return genre;
		}

		public void setGenre(Genre genre) {
			this.genre = genre;
		}

		public float getPrice() {
			return price;
		}

		public void setPrice(float price) {
			this.price = price;
		}

		public int getQuantity() {
			return quantity;
		}

		public void setQuantity(int quantity) {
			this.quantity = quantity;
		}

		public List<OrderItem> getOrderItem() {
			return orderItem;
		}

		public void setOrderItem(List<OrderItem> orderItem) {
			this.orderItem = orderItem;
		}		
}
