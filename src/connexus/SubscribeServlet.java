package connexus;
import static connexus.OfyService.ofy;
import java.io.IOException;
import javax.servlet.http.*;
import connexus.Scribe;

import java.util.*;

@SuppressWarnings("serial")
public class SubscribeServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		Scribe s = new Scribe(req.getParameter("streamID"),req.getParameter("userEmail"));
		List<Scribe> th = new ArrayList<Scribe>(OfyService.ofy().load().type(Scribe.class).list());
		Collections.sort(th);
		System.out.println(th.size());
		int i = 0;
		for (Scribe t : th){
			if (s.streamID.equals(t.streamID)){
				i = 1;
			}
		}
		if (i == 0){
		ofy().save().entity(s).now();
		System.out.println("Subscribe succeed");
		resp.sendRedirect("/View.jsp");
		}
		else {
		resp.sendRedirect("/View.jsp");
		}
	}
}