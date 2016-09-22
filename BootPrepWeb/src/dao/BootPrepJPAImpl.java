package dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceException;
import javax.persistence.TypedQuery;
import javax.transaction.Transaction;

import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.FactoryBean;
import org.springframework.transaction.annotation.Transactional;

import entities.Resource;
import entities.ResourceTag;
import entities.ResourceTagKey;
import entities.Tag;
import entities.User;
import entities.UserData;
import entities.UserDataKey;

@Transactional
public class BootPrepJPAImpl implements BootPrepDAO {
	
	private static final int MAX_TAGS = 3;
	private static final int ADMIN_PRIVELEGE_LEVEL = 1;
	private static final int NON_ADMIN_LEVEL = 0;
	
	// line added for git
	@PersistenceContext
	private EntityManager em;

	
	
	// User methods *********************************************************
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
		String userPhoto = (user.getUserPhoto().equals("") || user.getUserPhoto() == null ) ?
						   user.setDefaultPhoto() : user.getUserPhoto();
		newUser.setUserPhoto(userPhoto);
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
		current.setUserPhoto(user.getUserPhoto());
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
	
	@Override
	public void listUsers( ){
		String queryString =
			     "SELECT s FROM Staff s WHERE s.lastName='Kong'";
			List<User> results = em.createQuery(queryString, User.class)
			           .getResultList();
	}

	// Return 0 if both valid. 
	// 1 if username invalid
	// 2 if email invalid
	// -1 if both invalid
	@Override
	public int validUsernameAndEmail(User user) {
		String sql = "SELECT u FROM User u WHERE u.username = ?1 OR u.email = ?2";
		List<User> found = em.createQuery(sql, User.class)
				      .setParameter(1, user.getUsername())
				      .setParameter(2, user.getEmail())
				      .getResultList();
		if (found.size() > 1) {
			return -1;
		}
		if (found.size() == 0) {
			return 0;
		}
		if (found.get(0).getEmail().equals(user.getEmail())) {
			return 2;
		} else if (found.get(0).getUsername().equals(user.getUsername())) {
			return 1;
		}
		return 0;
	}
	// Resource methods *********************************************************
	@Override
	public Resource getResourceById(int id) {
		return em.find(Resource.class, id);
	}
	
	@Override
	public double averageRating(int resourceId) {
		String sql = "SELECT AVG(ud.rating) FROM UserData ud "
				   + "WHERE ud.resource.id = ?1";
		Double avg = (Double)em.createQuery(sql)
						.setParameter(1, resourceId)
						.getSingleResult();
		if (avg == null) {
			avg = 0.0;
		}
		return avg;
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
	
	@Override
	public ResourceTag getResourceTag(int userId, int resourceId, int tagId) {
		return em.find(ResourceTag.class, new ResourceTagKey(resourceId, tagId, userId));
	}
	@Override
	public List<Integer> resourceTagUserIds(int userId, int resourceId) {
		String sql = "SELECT rt.tag.id FROM ResourceTag rt "
				   + "WHERE user = ?1 AND rt.resource.id = ?2 ";
		@SuppressWarnings("unchecked")
		List<Integer> results = (List<Integer>)em.createQuery(sql)
								.setParameter(1, userId)
								.setParameter(2, resourceId)
								.getResultList();
System.out.println(results);
		return results;
	}
	
	// UserData Methods  *********************************************************
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
	

	// Tag Methods *********************************************************
	
	@Override
	public Resource addTagToResource(String tagName, int userId, int resourceId) {
		Resource r = em.find(Resource.class, resourceId);
		User u = em.find(User.class, userId);
		// If user isn't associated to this resource, don't change tags
		// also, if user has already added MAX_TAGS, don't add
		if (!validAddition(r, u)) {
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
	
	@Override
	public Resource removeTagFromResource(int userId, int resourceId, int tagId) {
		ResourceTag rt = 
				em.find(ResourceTag.class, new ResourceTagKey(resourceId, tagId, userId));
		Resource r = null;
		if (rt != null ) {
			r = rt.getResource();
			em.remove(rt);
		}
		r = em.find(Resource.class, resourceId);
		return r;
	}

	private boolean validAddition(Resource r, User u) {
		if (!r.getUsers().contains(u)) {
			return false;
		}
		String sql = "SELECT rt FROM ResourceTag rt "
				   + "WHERE user = ?1 AND rt.resource.id = ?2 ";
		List<ResourceTag> results = em.createQuery(sql, ResourceTag.class)
				.setParameter(1, u.getId())
				.setParameter(2, r.getId())
				.getResultList();
		return results.size() < MAX_TAGS;
	}

	private Tag uniqueTag(String tagName){
		String sql = "select t from Tag t where t.name = ?1";
		Tag tag = null;
		try {
			// if tag is found, return it
			tag = em.createQuery(sql, Tag.class)
					.setParameter(1, tagName)
					.getSingleResult();
		} catch (NoResultException nre) {
			Tag createTag = new Tag();
			createTag.setName(tagName);
			em.persist(createTag);
			tag = createTag;
		}
		return tag;
	}
	
	
	
	
	// Authentication Methods *********************************************************
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
	public User getUser() {
		// TODO Auto-generated method stub
		return null;
	}

	// ADMIN METHODS
	@Override
	public List<User> getAllUsers() {
		String sql = "select u from User u";
		List<User> users = em.createQuery(sql, User.class)
						   .getResultList();
		return users;
	}

	public Tag deleteTagFromResource(int resourceId, int tagId) { 
		String sql = "SELECT rt FROM ResourceTag rt "
				   + "WHERE rt.tag.id = ?1 AND rt.resource.id = ?2";
		ResourceTag rt = em.createQuery(sql, ResourceTag.class)
						   .setParameter(1, tagId)
						   .setParameter(2, resourceId)
						   .getSingleResult();
		em.remove(rt);
		return rt.getTag();
	}
	
	public User makeAdmin(int userId) {
		User u = em.find(User.class, userId);
		u.setPrivelege(ADMIN_PRIVELEGE_LEVEL);
		return u;
	}
	
	public User removeAdmin(int userId) {
		User u = em.find(User.class, userId);
		u.setPrivelege(NON_ADMIN_LEVEL);
		return null;
	}
	
	public Tag deleteTagFromDb(int tagId) {
		String sql = "SELECT rt FROM ResourceTag rt "
				   + "WHERE rt.tag.id = ?1";
		Tag t = em.find(Tag.class, tagId);
		List<ResourceTag> rts = em.createQuery(sql, ResourceTag.class)
							   .setParameter(1, tagId)
							   .getResultList();
		// Remove each ResourceTag association first.
		for (ResourceTag rt : rts) {
			em.remove(rt);
		}
		// Finally can remove the Tag iteslf from DB
		em.remove(t);
		return t;
	}
	
	public Resource deleteResource(int resourceId) {
		Resource r = em.find(Resource.class, resourceId);
		em.remove(r);
		return r;
	}
	
	public List<Tag> getAllTags() {
		String sql = "SELECT t FROM Tag t";
		List<Tag> tags = em.createQuery(sql, Tag.class)
						   .getResultList();
		return tags;
	}
	
}
