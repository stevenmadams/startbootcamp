//package test;
//
//import static org.junit.Assert.assertEquals;
//
//import java.text.ParseException;
//import java.text.SimpleDateFormat;
//import java.util.Date;
//
//import javax.persistence.EntityManager;
//import javax.persistence.EntityManagerFactory;
//import javax.persistence.Persistence;
//
//import org.junit.After;
//import org.junit.Before;
//import org.junit.Test;
//
//import entities.User;
//
//public class UserTest {
//	private EntityManagerFactory emf;
//	private EntityManager em;
//
//	@Before
//	public void setUp() throws Exception {
//		emf = Persistence.createEntityManagerFactory("BootPrepJPA");
//		em = emf.createEntityManager();
//	}
//
//	@Test
//	public void test() throws ParseException {
//		User user = em.find(User.class, 1);
//		assertEquals("Mary", user.getFirstName());
//		assertEquals("Smith", user.getLastName());
//		assertEquals("MARY.SMITH@sdvidcustomer.org", user.getEmail());
//		//assertEquals(5, user.getUsername());
//		
//		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
//		Date createDate = formatter.parse("2014-05-25");
//		assertEquals(createDate, user.getCreateDate());
//		
//	}
//
//	@After
//	public void tearDown() throws Exception {
//		em.close();
//		emf.close();
//	}
//
//}
