package in.sp.backend;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/withdrawmn")

public class WithdrawMoney extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		HttpSession session = req.getSession();
		String username = (String) session.getAttribute("session_name");
        String amountStr = req.getParameter("withdraw_amount");
        
        if (amountStr == null || amountStr.trim().isEmpty()) {
            out.println("<h3 style='color:red;'>Invalid amount!</h3>");
            return;
        }
        
        try {
            double amount = Double.parseDouble(amountStr);
            if (amount <= 0) {
                out.println("<h3 style='color:red;'>Amount must be greater than zero!</h3>");
                return;
            }

            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/atm", "root", "Atish@1193");
                 PreparedStatement ps = conn.prepareStatement("UPDATE userinfo SET balance = balance - ? WHERE accholder = ?")) {

                ps.setDouble(1, amount);
                ps.setString(2, username);

                if (ps.executeUpdate() > 0) {
                    out.println("Dear " + username + "<h3 style='color:green;'>₹" + amount + " withdraw successfully!</h3>");
                } else {
                    out.println("<h3 style='color:red;'>withdraw failed!</h3>");
                }
            }
        } catch (Exception e) {
            out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
        }
	}
	

}
