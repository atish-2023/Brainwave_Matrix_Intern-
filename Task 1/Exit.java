package in.sp.backend;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/exit")
public class Exit extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false); 
        if (session != null) {
            session.invalidate(); 
        }
        resp.sendRedirect("userform.jsp"); 
    }
}
