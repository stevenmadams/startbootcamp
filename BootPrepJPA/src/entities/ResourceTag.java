package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@IdClass(ResourceTagKey.class)
@Table(name="resource_tag")
public class ResourceTag {
	@Id
	@ManyToOne
	@JoinColumn(name="tag_id")
	private Tag tag;
	
	@Id
	@ManyToOne
	@JoinColumn(name="resource_id")
	private Resource resource;
	
	@Id
	@Column(name="user_id")
	private int user;
	
	public ResourceTag() {}
	
	public ResourceTag(Tag t, Resource r, int u) {
		tag = t;
		resource = r;
		user = u;
	}
	
	public Tag getTag() {
		return tag;
	}

	public void setTag(Tag tag) {
		this.tag = tag;
	}

	public Resource getResource() {
		return resource;
	}

	public void setResource(Resource resource) {
		this.resource = resource;
	}

	public int getUser() {
		return user;
	}

	public void setUser(int user) {
		this.user = user;
	}

	
	
	
}
