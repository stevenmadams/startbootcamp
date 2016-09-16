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
	public User updateUser(User user, int id);
}
