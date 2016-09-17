package dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import entities.Resource;
import entities.User;
import entities.UserResource;
import entities.UserResourceKey;

@Transactional
public class BootPrepJPAImpl implements BootPrepDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Resource getResourceById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User getUserById(int id) {
		return em.find(User.class, id);
	}

	@Override
	public UserResource getUserResourceByKey(UserResourceKey key) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Resource> getAllResources() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<UserResource> getAllUserResourcesByUserId(int id) {
		// TODO Auto-generated method stub
		List<UserResource> userResources = new ArrayList<UserResource>();
		return userResources;
	}
	
	@Override
	public User login(String username, String password) {
		String query = "select u from User u where u.username = ?1";
		User user = em.createQuery(query, User.class)
				.setParameter(1, username)
				.getSingleResult();
		if (user == null) {
			return null;
		}
		if (password.equals(user.getPassword())) {
			return user;
		}
		return null;
	}

	@Override
	public User updateUser(User user, int id) {
		User current = em.find(User.class, id);
		current.setFirstName(user.getFirstName());
		current.setLastName(user.getLastName());
		current.setUsername(user.getUsername());
		current.setEmail(user.getEmail());
		current.setCreateDate(user.getCreateDate());
		return current;
	}
	
	@Override
	public void User deleteUser(User user, int id) {
		
	}
	
	@Override
	public void User createUser() {
		
	}
	
	@Override
	public void User processUser() {	
		
	}
	
}
