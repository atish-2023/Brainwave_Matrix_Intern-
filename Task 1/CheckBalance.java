package in.sp.backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/checkbalancemn")
public class CheckBalance extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        HttpSession session = req.getSession();
        String username = (String) session.getAttribute("session_name");
        
        if (username == null) {
            out.println("<h3 style='color:red;'>Please log in first!</h3>");
            return;
        }

        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/atm", "root", "Atish@1193");
             PreparedStatement ps = conn.prepareStatement("SELECT balance FROM userinfo WHERE accholder = ?")) {
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) 
                out.println("<h3 style='color:blue;'>Balance: ₹" + rs.getDouble("balance") + "</h3>");
            else 
                out.println("<h3 style='color:red;'>Account not found!</h3>");
        } catch (Exception e) {
            out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
        }
    }
}
