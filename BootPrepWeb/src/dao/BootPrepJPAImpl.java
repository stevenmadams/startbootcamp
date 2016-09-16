package dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

@Transactional
public class BootPrepJPAImpl implements BootPrepDAO {

	@PersistenceContext
	private EntityManager em;
	
}
