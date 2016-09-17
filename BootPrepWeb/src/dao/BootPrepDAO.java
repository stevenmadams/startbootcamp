package dao;

import java.util.List;

import entities.Resource;
import entities.User;
import entities.UserResource;
import entities.UserResourceKey;

public interface BootPrepDAO {
	public Resource getResourceById(int id);
	public User getUserById(int id);
	public UserResource getUserResourceByKey(UserResourceKey key);
	public List<Resource> getAllResources();
	public List<UserResource> getAllUserResourcesByUserId(int id);
	public User login(String username, String password);
	
	// User table items
	public User getUser(String login);
//	public User updateUser(User user);
	public User deleteUser(User user, int id);
	public User processUser(int id, String firstName, 
			String lastName, String Username, 
			String password, String email, 
			String createDate);
	public User createUser();
}
