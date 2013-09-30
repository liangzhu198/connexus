package connexus;
import static connexus.OfyService.ofy;
import java.io.IOException;
import javax.servlet.http.*;

import java.util.*;

@SuppressWarnings("serial")
public class CreateServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		Stream s = new Stream(req.getParameter("streamName"),req.getParameter("tags"), req.getParameter("url"), req.getParameter("useremail"));
		List<Stream> th = new ArrayList<Stream>(OfyService.ofy().load().type(Stream.class).list());
		Collections.sort(th);
		int i = 0;
		for (Stream t : th){
			if (s.name.equals(t.name)){
				i = 1;
			}
		}
		if (i == 0){
		ofy().save().entity(s).now();
		resp.sendRedirect("/View.jsp");
		}
		else {
		resp.sendRedirect("/Error.jsp");
		}
	}
}