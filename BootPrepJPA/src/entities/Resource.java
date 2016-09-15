package entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

@Entity
	public class Resource {
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		@OneToMany
		@JoinColumn(name="resource_id")
		private int id;
		private String name;
		private String description;
		private String url;
		private String video;
		private String photo;
		
		
		
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

//ADD AND REMOVE METHODS---------------------------------------------------
}
