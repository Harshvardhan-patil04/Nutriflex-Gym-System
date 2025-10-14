<%@ page import="java.sql.*" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String goalTitle = request.getParameter("goal_title");
    double targetWeight = Double.parseDouble(request.getParameter("target_weight"));
    double currentWeight = Double.parseDouble(request.getParameter("current_weight"));
    double initialWeight = currentWeight; // Store initial weight at the time of goal creation
    String startDate = request.getParameter("start_date");
    String endDate = request.getParameter("end_date");
    String progressNote = request.getParameter("progress_note");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gym", "root", "");

        PreparedStatement stmt = con.prepareStatement(
            "INSERT INTO goals (username, goal_title, target_weight, current_weight, initial_weight, start_date, end_date, progress_note) VALUES (?, ?, ?, ?, ?, ?, ?, ?)"
        );
        stmt.setString(1, username);
        stmt.setString(2, goalTitle);
        stmt.setDouble(3, targetWeight);
        stmt.setDouble(4, currentWeight);
        stmt.setDouble(5, initialWeight);
        stmt.setString(6, startDate);
        stmt.setString(7, endDate);
        stmt.setString(8, progressNote);

        int i = stmt.executeUpdate();

        con.close();

        if (i > 0) {
%>
            <script>
                alert("Goal has been saved successfully!");
                window.location.href = "viewGoals.jsp";
            </script>
<%
        } else {
%>
            <script>
                alert("Failed to save goal.");
                window.history.back();
            </script>
<%
        }
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    }
%>
