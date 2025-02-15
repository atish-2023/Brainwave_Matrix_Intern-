
package in.sp.backend;

import java.io.IOException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.RequestDispatcher;

@WebServlet("/atmvalidation")
public class AtmInterface extends HttpServlet {

	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {

		response.setContentType("text/html");

		try {
			System.out.println("Checking JDBC Driver...");
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println(" JDBC Driver Loaded Successfully!");

			try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/atm", "root",
					"Atish@1193")) {

				if (conn != null) {
					System.out.println("Database Connected Successfully!");
				} else {
					System.out.println("Database Connection Failed!");
				}
				String myacc = request.getParameter("accno1");
				String mypin = request.getParameter("pin1");

				
				if (myacc == null || !myacc.matches("\\d{9}")) {
					request.setAttribute("error", "Invalid account number. It must be exactly 9 digits.");
					request.getRequestDispatcher("userform.jsp").forward(request, response);
					return;
				}

				
				if (mypin == null || !mypin.matches("\\d{4,6}")) {
					request.setAttribute("error", "Invalid PIN. It must be 4 to 6 digits.");
					request.getRequestDispatcher("userform.jsp").forward(request, response);
					return;
				}

				PreparedStatement ps = conn.prepareStatement("SELECT accholder FROM userinfo WHERE accno=? AND pin=?");
				ps.setString(1, myacc);
				ps.setString(2, mypin);

				ResultSet rs = ps.executeQuery();

				if (rs.next()) {
					HttpSession session = request.getSession();
					session.setAttribute("session_name", rs.getString("accholder"));

					System.out.println("Login successful! Redirecting to profile.jsp");
					response.sendRedirect("profile.jsp"); 
				} else {
					System.out.println("Login failed: Invalid credentials.");
					request.setAttribute("error", "Account number and PIN didn't match.");
					request.getRequestDispatcher("userform.jsp").forward(request, response);
				}

				rs.close();
				ps.close();
			}

		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
		}

	}
}
