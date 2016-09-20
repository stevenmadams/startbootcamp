package entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

@Entity
public class Tag {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	@OneToMany
//	@JoinColumn(name="tag_id")
	private int id;
	private String name;
	
	@ManyToMany(mappedBy="tags")
	private List<Resource> resources;
	
	@OneToMany(mappedBy="tag")
	private List<ResourceTag> tagResources;
	
	
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
	public List<Resource> getResources() {
		return resources;
	}
	public void setResources(List<Resource> resources) {
		this.resources = resources;
	}
	@Override
	public String toString() {
		return "Tag [id=" + id + ", name=" + name + ", resources=]";
	}
	public List<ResourceTag> getTagResources() {
		return tagResources;
	}
	public void setTagResources(List<ResourceTag> tagResources) {
		this.tagResources = tagResources;
	}
	
	public void addTagResource(ResourceTag tagResource) {
		if (tagResource == null) {
			tagResources = new ArrayList<>();
		}
		if (!tagResources.contains(tagResource)) {
			tagResources.add(tagResource);
			tagResource.setTag(this);
		}
	}

	public void removeTagResource(ResourceTag tagResource) {
		if (tagResources != null && tagResources.contains(tagResource)) {
			tagResources.remove(tagResource);
			tagResource.setTag(null);
		}
	}
	
	
	
}
