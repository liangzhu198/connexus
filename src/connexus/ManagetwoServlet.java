package connexus;
import static connexus.OfyService.ofy;

import connexus.Stream;
import java.util.Collections;
import java.io.IOException;
import javax.servlet.http.*;
import java.util.List;
import java.util.*;

@SuppressWarnings("serial")
public class ManagetwoServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		
	     resp.sendRedirect("/Error.jsp");

	}
}