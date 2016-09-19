/* Can I do something like this to pass session info across multiple controllers?

package session;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;

@Component(value="sessionInfo") 
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS, value = "request")
public class SessionInfo {

	private String userId;
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserId() {
		return userId;
	}

}
*/
