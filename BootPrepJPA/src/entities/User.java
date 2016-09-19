package entities;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class User {
		@Id //Maps to Primary Key
		@GeneratedValue(strategy = GenerationType.IDENTITY) // Tells Java to ignore id, use when auto-incrementing
		private int id;
		
		@OneToMany(mappedBy="user")
		private List<UserData> userDatas;
		@Column(name="first_name")
		private String firstName;
		@Column(name="last_name")
		private String lastName;
		@Column(name="username")
		private String username;
		private String password;
		@Column(name="email")
		private String email;
		@Column(name="start_date")
		@Temporal(TemporalType.DATE)
		private Date createDate;
		
		//Maybe we need or can use this?
		@ManyToMany
		@JoinTable(name="user_resource",
		  joinColumns=@JoinColumn(name="user_id"),
		  inverseJoinColumns=@JoinColumn(name="resource_id")
		)
		private List<Resource> resources;
		
		public User() {}
		
		public User(String firstName, String lastName, String username, String email, Date createDate) {
			this.firstName= firstName;
			this.lastName = lastName;
			this.username = username;
			this.email = email;
			this.createDate = createDate;
		}
		
		
		// Getters and Setters
		public int getId() {
			return id;
		}
		public String getFirstName() {
			return firstName;
		}
		public void setFirstName(String firstName) {
			this.firstName = firstName;
		}
		public String getLastName() {
			return lastName;
		}
		public void setLastName(String lastName) {
			this.lastName = lastName;
		}
		public String getUsername() {
			return username;
		}
		public void setUsername(String username) {
			this.username = username;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public Date getCreateDate() {
			return createDate;
		}
		public void setCreateDate(Date createDate) {
			this.createDate = createDate;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public List<UserData> getUserDatas() {
			return userDatas;
		}
		public void setUserDatas(List<UserData> userDatas) {
			this.userDatas = userDatas;
		}
		public List<Resource> getResources() {
			return resources;
		}
		public void setResources(List<Resource> resources) {
			this.resources = resources;
		}

		// To String	
		@Override
		public String toString() {
			return "User [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName
					+ ", username=" + username + ", email=" + email + ", createDate=" + createDate + "]";
		}
		
		
		//ADD AND REMOVE METHODS---------------------------------------------------
		// Maybe needed, maybe not?
		public void addResource(Resource resource) {
			if (resource == null) {
				resources = new ArrayList<>();
			}
			if (!resources.contains(resource)) {
				resources.add(resource);
				resource.addUser(this);
			}
		}

		public void removeResource(Resource resource) {
			if (resources != null && resources.contains(resource)) {
				resources.remove(resource);
				resource.removeUser(this);
			}
		}

		// dont think we need these...since only one UserResource per user->resource pair
//		public void addUserResource(UserResource userResource) {
//			if (userResource == null) {
//				userResources = new ArrayList<>();
//			}
//			if (!userResources.contains(userResource)) {
//				userResources.add(userResource);
//				userResource.setUser(this);
//			}
//		}
//
//		public void removeUserResource(UserResource userResource) {
//			if (userResources != null && userResources.contains(userResource)) {
//				userResources.remove(userResource);
//				userResource.setUser(null);
//			}
//		}

	
		
}
