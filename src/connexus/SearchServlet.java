package connexus;
import java.io.IOException;
import javax.servlet.http.*;
import java.util.List;
import connexus.OfyService;

@SuppressWarnings("serial")
public class SearchServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		String keyWords = req.getParameter("keyWords");
		resp.sendRedirect("/SearchResult.jsp?kw="+keyWords);
	    }
}
