package test;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import entities.Resource;
import entities.ResourceTag;
import entities.ResourceTagKey;
import entities.Tag;

public class UserTestMain {
	public static void main(String[] args) {
		EntityManagerFactory emf;
		EntityManager em;
		emf = Persistence.createEntityManagerFactory("BootPrepJPA");
		em = emf.createEntityManager();
		
//		em.getTransaction().begin();
	
//		Resource r2 = em.find(Resource.class, 3);
//		Tag t = em.find(Tag.class, 1);
//		UserResourceKey key = new UserResourceKey(1, 1);
//		User u = em.find(User.class, 1);
//		u.addResource(r2);
		
//		List<Resource> res = u.getResources();
//		for (Resource resource : res) {
//			System.out.println("ID: " + resource.getId() + " Name: " + resource.getName());
//		}
//		UserResourceKey key = new UserResourceKey(u.getId(), r2.getId());
//		UserResource ur = em.find(UserResource.class, key);
//		System.out.println( "UserID: " + ur.getUser().getId() + 
//							"Resource ID: " + ur.getResource().getId() +
//							"\nNotes: " + ur.getNotes());
		ResourceTagKey rtk = new ResourceTagKey(1, 1, 1);
		ResourceTag rt = em.find(ResourceTag.class, rtk);
		Resource r = em.find(Resource.class, 1);
		System.out.println(r.getName());
		Tag t = em.find(Tag.class, 1);
		System.out.println(t.getName());
		
		System.out.println(rt.getResource().getName());
		System.out.println(rt.getUser());
//		r.addResourceTag(rt);
		for (Tag tag : r.getTags()) {
			System.out.println(tag.getName());
		}
		em.getTransaction().begin();
		Tag t2 = em.find(Tag.class, 2);
		
		ResourceTag rt2 = new ResourceTag();
		rt2.setResource(r);
		rt2.setTag(t2);
		rt2.setUser(1);
		System.out.println("list tags: " + r.getTags());
//		em.persist(rt2);
//		em.getTransaction().commit();
//		System.out.println(r.getResourceTags());
	}
}
