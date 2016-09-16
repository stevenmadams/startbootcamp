//package test;
//
//import static org.junit.Assert.assertEquals;
//
//import java.text.ParseException;
//
//import javax.persistence.EntityManager;
//import javax.persistence.EntityManagerFactory;
//import javax.persistence.Persistence;
//
//import org.junit.After;
//import org.junit.Before;
//import org.junit.Test;
//
//import entities.UserResource;
//import entities.UserResourceKey;
//
//public class UserResourceTest {
//
//	EntityManagerFactory emf;
//	EntityManager em;
//
//	@Before
//	public void setUp() throws Exception {
//		emf = Persistence.createEntityManagerFactory("BootPrepJPA");
//	    em = emf.createEntityManager();
//	}
//
//	@After
//	public void tearDown() throws Exception {
//		em.close();
//		emf.close();
//	}
//
//	@Test
//	public void test() throws ParseException {
//		UserResourceKey key = new UserResourceKey(1, 1);
//		UserResource ur = em.find(UserResource.class, key);
//		assertEquals(5, ur.getRating());
//	}
//}
