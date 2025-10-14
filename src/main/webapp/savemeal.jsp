<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%
    // Get current user's username from session
    String username = (String) session.getAttribute("username");

    // Get meal data from form
    String breakfast = request.getParameter("breakfast");
    String lunch = request.getParameter("lunch");
    String dinner = request.getParameter("dinner");
    String snacks = request.getParameter("snacks");

    if (username != null && breakfast != null && lunch != null && dinner != null && snacks != null) {
        try {
            // Load JDBC driver and connect to MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gym", "root", "root");

            // Insert data into mealplan table
            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO mealplan (username, breakfast, lunch, dinner, snacks, date) VALUES (?, ?, ?, ?, ?, CURDATE())"
            );
            ps.setString(1, username);
            ps.setString(2, breakfast);
            ps.setString(3, lunch);
            ps.setString(4, dinner);
            ps.setString(5, snacks);
            ps.executeUpdate();

            conn.close();

            // Redirect or show success
            response.sendRedirect("mealplanner.jsp?success=true");
        } catch (Exception e) {
            out.println("<p style='color:red;'>Error saving meal plan: " + e.getMessage() + "</p>");
        }
    } else {
        out.println("<p style='color:red;'>Missing data. Please make sure all fields are filled.</p>");
    }
%>
