package entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
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
		
		@ManyToMany
		@JoinTable(name="resource_tag",
				joinColumns=@JoinColumn(name="resource_id"),
				inverseJoinColumns=@JoinColumn(name="tag_id"))
		private List<Tag> tags;
		
		@OneToMany(mappedBy="resource")
		private List<UserResource> userResources;
		
		@ManyToMany(mappedBy="resources")
		private List<User> users;
		
		
		
//GET AND SET---------------------------------------------------

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
		public List<UserResource> getUserResources() {
			return userResources;
		}
		public void setUserResources(List<UserResource> userResources) {
			this.userResources = userResources;
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
		
		
		@Override
		public String toString() {
			return "Resource [id=" + id + ", name=" + name + ", description=" + description + ", url=" + url
					+ ", video=" + video + ", photo=" + photo +"]";
		}
		
		
		


}
