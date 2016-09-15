package entities;


import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class User {
		@Id //Maps to Primary Key
		@GeneratedValue(strategy = GenerationType.IDENTITY) // Tells Java to ignore id, use when auto-incrementing
		@OneToMany(mappedBy="language")
		private int id;
		private List<User> users;
		@Column(name="first_name")
		private String firstName;
		@Column(name="last_name")
		private String lastName;
		@Column(name="username")
		private String username;
		@Column(name="email")
		private String email;
		@JoinColumn(name="start_date")
		@Temporal(TemporalType.DATE)
		private Date  createDate;
		
		
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
		public int getId() {
			return id;
		}
		@Override
		public String toString() {
			return "User [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", username=" + username
					+ ", email=" + email + ", createDate=" + createDate + "]";
		}
	
		
	 

	

	
		
}
