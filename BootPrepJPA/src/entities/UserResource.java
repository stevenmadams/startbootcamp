package entities;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@IdClass(UserResourceKey.class)
@Table(name="user_resource")
public class UserResource {
	@Id
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	@Id
	@ManyToOne
	@JoinColumn(name="resource_id")
	private Resource resource;
	
	private String notes;
	private boolean completed;
	private int rating;
	
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Resource getResource() {
		return resource;
	}
	public void setResource(Resource resource) {
		this.resource = resource;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	public boolean isCompleted() {
		return completed;
	}
	public void setCompleted(boolean completed) {
		this.completed = completed;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	@Override
	public String toString() {
		return "UserResource [user=" + user + ", resource=" + resource + ", notes=" + notes + ", completed="
				+ completed + ", rating=" + rating + "]";
	}
	
	
	
}
