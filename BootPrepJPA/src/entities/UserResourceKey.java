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
	
	public UserResourceKey() {}
	
	
	public UserResourceKey(int user, int resource) {
		this.user = user;
		this.resource = resource;
	}

	public int getUser() {
		return user;
	}


	public void setUser(int user) {
		this.user = user;
	}


	public int getResource() {
		return resource;
	}


	public void setResource(int resource) {
		this.resource = resource;
	}


	@Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof UserResourceKey)) return false;
        UserResourceKey that = (UserResourceKey) o;
        return Objects.equals(getUser(), that.getUser()) &&
                Objects.equals(getResource(), that.getResource());
    }
	@Override
    public int hashCode() {
        return Objects.hash(getUser(), getResource());
    }
	@Override
	public String toString() {
		return "UserResourceKey [user=" + user + ", resource=" + resource + "]";
	}
	
	
}
