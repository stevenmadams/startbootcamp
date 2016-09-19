package dao;

import java.util.List;

import entities.Resource;
import entities.User;
import entities.UserData;
import entities.UserDataKey;

public interface BootPrepDAO {
	// Auth
	public User login(String username, String password);
	
	// User stuff
	public User getUserById(int id);
	public User updateUser(User user, int id);
	public User createUser(User user);
	
	// Resources
	public Resource getResourceById(int id);
	public void addResourceToUser(int userId, int resourceId);
	public User removeResourceFromUser(int userId, int resourceId);
	public List<Resource> getAllResources();
	public List<Resource> getAllResourcesById(int id);
	public Resource createResource(Resource r);
	
	
	// UserResource
	public UserData getUserDataByKey(UserDataKey key);
	public UserData updateUserData(UserDataKey key, UserData data);
	public UserData createUserData();
}
