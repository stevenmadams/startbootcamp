package test;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import entities.Resource;
import entities.User;
import entities.UserResourceKey;

public class UserTestMain {
	public static void main(String[] args) {
		EntityManagerFactory emf;
		EntityManager em;
		emf = Persistence.createEntityManagerFactory("BootPrepJPA");
		em = emf.createEntityManager();
		
		Resource r = em.find(Resource.class, 1);
//		Tag t = em.find(Tag.class, 1);
//		UserResourceKey key = new UserResourceKey(1, 1);
//		User u = em.find(User.class, 2);
		
		System.out.println(r.getUserResources().get(0).getNotes());
	}
}
