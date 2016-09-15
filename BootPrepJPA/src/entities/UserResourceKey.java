package entities;

import java.io.Serializable;
import java.util.Objects;


public class UserResourceKey implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int user;
	private int resource;
	
	
	
	
	public int getUserId() {
		return user;
	}
	public void setUserId(int userId) {
		this.user = userId;
	}
	public int getResourceId() {
		return resource;
	}
	public void setResourceId(int resourceId) {
		this.resource = resourceId;
	}

	@Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof UserResourceKey)) return false;
        UserResourceKey that = (UserResourceKey) o;
        return Objects.equals(getUserId(), that.getUserId()) &&
                Objects.equals(getResourceId(), that.getResourceId());
    }
	@Override
    public int hashCode() {
        return Objects.hash(getUserId(), getResourceId());
    }
	@Override
	public String toString() {
		return "UserResourceKey [user=" + user + ", resource=" + resource + "]";
	}
	
	
}
