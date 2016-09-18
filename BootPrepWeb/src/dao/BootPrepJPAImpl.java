package dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.hibernate.Hibernate;
import org.springframework.jdbc.core.JdbcTemplate;
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
		return em.find(Resource.class, id);
	}

	@Override
	public User getUserById(int id) {
		return em.find(User.class, id);
	}

	@Override
	public UserResource getUserResourceByKey(UserResourceKey key) {
		return em.find(UserResource.class, key);
	}

	@Override
	public List<Resource> getAllResources() {
		List<Resource> resources = new ArrayList<>();
		String query = "select r from Resource r";
		resources = em.createQuery(query, Resource.class).getResultList();
		return resources;
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
	public User createUser(User user) {
		User newUser = new User();
		newUser.setFirstName(user.getFirstName());
		newUser.setLastName(user.getLastName());
		newUser.setUsername(user.getUsername());
		newUser.setPassword(user.getPassword());
		newUser.setEmail(user.getEmail());
		newUser.setCreateDate(user.getCreateDate());
		em.persist(newUser);
	    return user;
        
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
	public void addResourceToUser(int userId, int resourceId) {
		User u = em.find(User.class, userId);
		Resource r = em.find(Resource.class, resourceId);
		u.addResource(r);
	}

	@Override
	public List<Resource> getAllResourcesById(int id) {
		User u = em.find(User.class, id);
		// Had to add the following due to LazyInitializationException
		Hibernate.initialize(u.getResources());
		return u.getResources();
	}

	@Override
	public User removeResourceFromUser(int userId, int resourceId) {
		User u = em.find(User.class, userId);
		Resource r = em.find(Resource.class, resourceId);
		u.removeResource(r);
		return u;
	}
	
	
	
}
