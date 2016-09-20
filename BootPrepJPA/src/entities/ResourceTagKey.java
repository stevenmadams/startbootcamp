package entities;

import java.io.Serializable;
import java.util.Objects;

public class ResourceTagKey implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int resource;
	private int tag;
	private int user;

	public ResourceTagKey() {}
	
	public ResourceTagKey(int resource, int tag, int user) {
		this.resource = resource;
		this.tag = tag;
		this.user = user;
	}

	public int getResourceId() {
		return resource;
	}

	public void setResource(int resource) {
		this.resource = resource;
	}

	public int getTag() {
		return tag;
	}

	public void setTag(int tag) {
		this.tag = tag;
	}

	public int getUser() {
		return user;
	}

	public void setUser(int user) {
		this.user = user;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
    public int hashCode() {
        return Objects.hash(getTag(), getResourceId());
    }

	@Override
	public boolean equals(Object obj) {
		return super.equals(obj);
	}
	
	
	
}
