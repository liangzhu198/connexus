package connexus;

import java.util.Date;
import com.googlecode.objectify.ObjectifyService;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.google.common.base.Joiner;
import com.googlecode.objectify.ObjectifyFactory;

@Entity
public class Scribe implements Comparable<Scribe> {

	static {
		 ObjectifyService.register(Scribe.class);
	}
	// id is set by the datastore for us
	@Id
	public Long id;
	public String userName;
	public String streamID;
	public Date createDate;
  
	// TODO: figure out why this is needed
	@SuppressWarnings("unused")
	private Scribe() {
	}
	
	@Override
	public String toString() {
		Joiner joiner = Joiner.on(":");
		return joiner.join(id.toString(), userName, streamID.toString());
 	}

	public Scribe(String streamID, String userName) {
		this.streamID = streamID;
		this.userName = userName;
		this.createDate = new Date();
	}

	@Override
	public int compareTo(Scribe other) {
		if (createDate.after(other.createDate)) {
			return 1;
		} else if (createDate.before(other.createDate)) {
			return -1;
		}
		return 0;
	}
}