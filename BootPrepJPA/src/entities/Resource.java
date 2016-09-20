package entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

@Entity
	public class Resource {
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		private int id;
		private String name;
		private String description;
		private String url;
		private String video;
		private String photo;
		private String snippet;
		
	
		@ManyToMany(fetch=FetchType.EAGER)
		@JoinTable(name="resource_tag",
				joinColumns=@JoinColumn(name="resource_id"),
				inverseJoinColumns=@JoinColumn(name="tag_id"))
		private List<Tag> tags;
		
		@OneToMany(mappedBy="resource")
		private List<UserData> userDatas;
		
		@ManyToMany(mappedBy="resources")
		private List<User> users;
		
		@OneToMany(mappedBy="resource")
		private List<ResourceTag> resourceTags;
		
		public Resource() {}
		
		public Resource(String url, String name, String description) {
			this.url = url;
			this.name = name;
			this.description = description;
			setSnippet(description);
		}
		
		
//GET AND SET---------------------------------------------------
		public String getSnippet() {
			return snippet;
		}
		public void setSnippet(String description) {
			if (description.length() < 160) {
				this.snippet = description;
			}
			this.snippet = description.substring(0, 159) + "...";
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getDescription() {
			return description;
		}
		public void setDescription(String description) {
			this.description = description;
		}
		public String getUrl() {
			return url;
		}
		public void setUrl(String url) {
			this.url = url;
		}
		public String getVideo() {
			return video;
		}
		public void setVideo(String video) {
			this.video = video;
		}
		public String getPhoto() {
			return photo;
		}
		public void setPhoto(String photo) {
			this.photo = photo;
		}
		public int getId() {
			return id;
		}
		public List<Tag> getTags() {
			return tags;
		}
		public void setTags(List<Tag> tags) {
			this.tags = tags;
		}
		public List<UserData> getUserDatas() {
			return userDatas;
		}
		public void setUserDatas(List<UserData> userDatas) {
			this.userDatas = userDatas;
		}
		public List<User> getUsers() {
			return users;
		}
		public void setUsers(List<User> users) {
			this.users = users;
		}
		
		
		//ADD AND REMOVE METHODS---------------------------------------------------
		// Maybe needed, maybe not?
		public void addUser(User user) {
			if (user == null) {
				users = new ArrayList<>();
			}
			if (!users.contains(user)) {
				users.add(user);
				user.addResource(this);
			}
		}

		public void removeUser(User user) {
			if (users != null && users.contains(user)) {
				users.remove(user);
				user.removeResource(this);
			}
		}
		
		public List<ResourceTag> getResourceTags() {
			return resourceTags;
		}

		public void setResourceTags(List<ResourceTag> resourceTags) {
			this.resourceTags = resourceTags;
		}
		
		public void addResourceTag(ResourceTag resourceTag) {
			if (resourceTag == null) {
				resourceTags = new ArrayList<>();
			}
			if (!resourceTags.contains(resourceTag)) {
				resourceTags.add(resourceTag);
				resourceTag.setResource(this);
			}
		}

		public void removeResourceTag(ResourceTag resourceTag) {
			if (resourceTags != null && resourceTags.contains(resourceTag)) {
				resourceTags.remove(resourceTag);
				resourceTag.setResource(null);
			}
		}
		
		
		
		
		@Override
		public String toString() {
			return "Resource [id=" + id + ", name=" + name + ", description=" + description + ", url=" + url
					+ ", video=" + video + ", photo=" + photo +"]";
		}
		
		
		


}
