package dao;

import java.util.List;

import entities.Resource;
import entities.ResourceTag;
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
	public User deleteUser(int id);
	
	// Resources
	public Resource getResourceById(int id);
	public void addResourceToUser(int userId, int resourceId);
	public User removeResourceFromUser(int userId, int resourceId);
	public List<Resource> getAllResources();
	public List<Resource> getAllResourcesById(int id);
	public Resource createResource(Resource r);
	public List<Integer> getResourceIdsForUser(int id);
	public List<Resource> getAllResourcesNotAdded(int userId);
	public double averageRating(int resourceId);
	public ResourceTag getResourceTag(int userId, int resourceId, int tagId);
	
	// Tags
	public Resource addTagToResource(String tagName, int userId, int resourceId);
	public Resource removeTagFromResource(int userId, int resourceId, int tagId);
	
	// UserResource
	public UserData getUserDataByKey(UserDataKey key);
	public UserData updateUserData(UserDataKey key, UserData data);
	public UserData createUserData();
}
