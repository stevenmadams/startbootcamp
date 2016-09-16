package test;

import static org.junit.Assert.assertEquals;

import java.text.ParseException;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Resource;

public class ResourceTest {
	 private EntityManagerFactory emf;
	    private EntityManager em;

	    @Before
	    public void setUp() throws Exception {
	        emf = Persistence.
	            createEntityManagerFactory("BootPrepJPA");
	        em = emf.createEntityManager();
	    }

	    @Test
	    public void test() throws ParseException {
	    	Resource resource = em.find(Resource.class, 1);
	        assertEquals(1, resource.getId());
	        assertEquals("Veribet", resource.getName());
	        
	       
	        
	        
	   
	     
	    }
	 

	    @After
	    public void tearDown() throws Exception {
	        em.close();
	        emf.close();
	    }

}
