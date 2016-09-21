package dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.hibernate.Hibernate;
import org.hibernate.exception.ConstraintViolationException;
import org.springframework.transaction.annotation.Transactional;

import entities.Resource;
import entities.ResourceTag;
import entities.Tag;
import entities.User;
import entities.UserData;
import entities.UserDataKey;

@Transactional
public class BootPrepJPAImpl implements BootPrepDAO {
	// line added for git
	@PersistenceContext
	private EntityManager em;

	
	
	// User methods
	@Override
	public User getUserById(int id) {
		return em.find(User.class, id);
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
	public User deleteUser(int id) {
		System.out.println("Deleting a user...");
		EntityManagerFactory emf =
			Persistence.createEntityManagerFactory("BootPrepJPA");
		EntityManager em = emf.createEntityManager();
	
		em.getTransaction().begin();
		
		User user = em.find(User.class, id);
		em.remove(user);
		em.getTransaction().commit();
	
		em.close();
		emf.close();
		System.out.println("at delete");
		return null;
	}


	// Resource methods
	@Override
	public Resource getResourceById(int id) {
		return em.find(Resource.class, id);
	}
	
	@Override
	public List<Resource> getAllResources() {
		List<Resource> resources = new ArrayList<>();
		String query = "select r from Resource r";
		resources = em.createQuery(query, Resource.class).getResultList();
		return resources;
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
	public List<Resource> getAllResourcesNotAdded(int userId) {
		User u = em.find(User.class, userId);
		String sql = "SELECT r FROM Resource r WHERE r NOT IN "
				   + "(SELECT ur.resource.id from UserData ur "
				   + "WHERE ur.user.id = ?1 )";
		List<Resource> results = em.createQuery(sql, Resource.class)
								.setParameter(1, userId)
								.getResultList();
		return results;
	}
	
	

	@Override
	public User removeResourceFromUser(int userId, int resourceId) {
		User u = em.find(User.class, userId);
		Resource r = em.find(Resource.class, resourceId);
		u.removeResource(r);
		return u;
	}

	@Override
	public Resource createResource(Resource r) {
		em.persist(r);	
		return r;
	}
	
	@Override
	public List<Integer> getResourceIdsForUser(int id) {
		String query = "SELECT ud.resource FROM UserData ud WHERE ud.user.id = ?1";
		List<Resource> results = em.createQuery(query, Resource.class)
								.setParameter(1, id)
								.getResultList();
		List<Integer> ids = new ArrayList<>();
		for (Resource resource : results) {
			ids.add(resource.getId());
		}
		return ids;
	}
	
	// UserData Methods
	@Override
	public UserData getUserDataByKey(UserDataKey key) {
		return em.find(UserData.class, key);
	}
	
	@Override
	public UserData updateUserData(UserDataKey key, UserData data) {
		UserData current = em.find(UserData.class, key);
		current.setCompleted(data.isCompleted());
		String notes = (data.getNotes() == null) ? current.getNotes() : data.getNotes();
		Integer rating = (data.getRating() == null) ? current.getRating() : data.getRating();
		current.setNotes(notes);
		current.setRating(rating);
		return current;
	}

	@Override
	public UserData createUserData() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	// Authentication Methods
	@Override
	public User login(String username, String password) {
		String sql = "select u from User u where u.username = ?1";
		TypedQuery<User> query = em.createQuery(sql, User.class)
				.setParameter(1, username);
		User user = null;
		try {
			user = query.getSingleResult();
		} catch (NoResultException nre) {
			user = null;
		} 

		if (user == null) {
			return null;
		}
		if (password.equals(user.getPassword())) {
			return user;
		}
		return null;
	}

	@Override
	public Resource addTagToResource(String tagName, int userId, int resourceId) {
		Resource r = em.find(Resource.class, resourceId);
		// If user isn't associated to this resource, don't change tags
		if (!resourceHasUser(r, userId)) {
			return r;
		}
		Tag tag = uniqueTag(tagName);
		ResourceTag rt = new ResourceTag();
		rt.setResource(r);
		rt.setTag(tag);
		rt.setUser(userId);
		em.persist(rt);
		return r;
	}
	
	private boolean resourceHasUser(Resource r, int userId) {
		boolean in = false;
		for (User user : r.getUsers()) {
			if (user.getId() == userId) {
				in = true;
				break;
			}
		}
		return in;
	}
	
	private List<Tag> allTags() {
		String sql = "select t from Tag t";
		List<Tag> tags = em.createQuery(sql, Tag.class).getResultList();
		return tags;
	}
	
	private Tag uniqueTag(String tagName){
		String sql = "select t from Tag t where t.name = ?1";
		Tag tag = null;
		try {
			// if tag is found, return it
System.out.println("Running query...");
			tag = em.createQuery(sql, Tag.class)
					.setParameter(1, tagName)
					.getSingleResult();
System.out.println("got tag..."+tag.getName());
		} catch (NoResultException nre) {
			Tag createTag = new Tag();
			createTag.setName(tagName);
			em.persist(createTag);
			tag = createTag;
		}
		return tag;
	}
	
}
