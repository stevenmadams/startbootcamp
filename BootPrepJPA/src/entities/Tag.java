package entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

@Entity
public class Tag {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@OneToMany
	@JoinColumn(name="tag_id")
	private int id;
	private String name;
	
	
	//GET AND SET---------------------------------------------------
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getId() {
		return id;
	}
	
	
	
}
