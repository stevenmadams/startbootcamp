package test;

import static org.junit.Assert.assertEquals;

import java.text.ParseException;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.User;

public class UserTest {
	private EntityManagerFactory emf;
	private EntityManager em;

	@Before
	public void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("BootPrepJPA");
		em = emf.createEntityManager();
	}

	@Test
	public void test() throws ParseException {
		User user = em.find(User.class, 1);
		assertEquals("Amanda", user.getFirstName());
		assertEquals("Price", user.getLastName());
		assertEquals("aprice2@multiply.com", user.getEmail());
		assertEquals(3, user.getUsername());
		
		
	}

	@After
	public void tearDown() throws Exception {
		em.close();
		emf.close();
	}

}
