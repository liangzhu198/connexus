package connexus;
import static connexus.OfyService.ofy;

import connexus.Stream;
import java.util.Collections;
import java.io.IOException;
import javax.servlet.http.*;
import java.util.List;
import java.util.*;

@SuppressWarnings("serial")
public class ManageServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		List<Stream> th = new ArrayList<Stream>(OfyService.ofy().load().type(Stream.class).list());
		Collections.sort(th);
		String[] check = req.getParameterValues("check");


		System.out.println("Number of Streams deleted:"+(check.length-1));
		System.out.println("Stream deleted:");
		for (Stream s : th){
			int i = 0;
			for (int j=0; j < check.length; j++){
			if (s.name.equals(check[j])){
				i = 1;
			}
			}
			if (i == 1){
			System.out.println(s.name);
		    ofy().delete().entity(s);
			}
		}
	     resp.sendRedirect("/Manage.jsp");

	}
}