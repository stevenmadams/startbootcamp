package test;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import entities.Resource;
import entities.User;
import entities.UserResource;
import entities.UserResourceKey;

public class UserTestMain {
	public static void main(String[] args) {
		EntityManagerFactory emf;
		EntityManager em;
		emf = Persistence.createEntityManagerFactory("BootPrepJPA");
		em = emf.createEntityManager();
		
		Resource r = em.find(Resource.class, 10);
		Resource r2 = em.find(Resource.class, 1);
//		Tag t = em.find(Tag.class, 1);
//		UserResourceKey key = new UserResourceKey(1, 1);
//		em.getTransaction().begin();
//		em.getTransaction().commit();
		User u = em.find(User.class, 1);
		u.addResource(r2);
		List<Resource> res = u.getResources();
		for (Resource resource : res) {
			System.out.println("ID: " + resource.getId() + " Name: " + resource.getName());
		}
		UserResourceKey key = new UserResourceKey(u.getId(), r2.getId());
		UserResource ur = em.find(UserResource.class, key);
		System.out.println( "UserID: " + ur.getUser().getId() + 
							"Resource ID: " + ur.getResource().getId() +
							"\nNotes: " + ur.getNotes());
		
	}
}
