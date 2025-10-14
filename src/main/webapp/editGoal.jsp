<%@ page import="java.sql.*" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int goalId = Integer.parseInt(request.getParameter("id"));
    Connection con = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    String goalTitle = "", progressNote = "";
    double targetWeight = 0, currentWeight = 0;
    String startDate = "", endDate = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gym", "root", "");
        stmt = con.prepareStatement("SELECT * FROM goals WHERE id=? AND username=?");
        stmt.setInt(1, goalId);
        stmt.setString(2, username);
        rs = stmt.executeQuery();

        if (rs.next()) {
            goalTitle = rs.getString("goal_title");
            targetWeight = rs.getDouble("target_weight");
            currentWeight = rs.getDouble("current_weight");
            startDate = rs.getString("start_date");
            endDate = rs.getString("end_date");
            progressNote = rs.getString("progress_note");
        } else {
            out.println("Goal not found.");
            return;
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
        return;
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (stmt != null) stmt.close(); } catch (Exception e) {}
        try { if (con != null) con.close(); } catch (Exception e) {}
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Goal</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body class="container mt-5">
    <h2>Edit Your Goal</h2>
    <form action="updateGoal.jsp" method="post" class="mt-4">
        <input type="hidden" name="id" value="<%= goalId %>">

        <div class="form-group">
            <label>Goal Title:</label>
            <input type="text" name="goal_title" value="<%= goalTitle %>" class="form-control" required>
        </div>

        <div class="form-group">
            <label>Target Weight (kg):</label>
            <input type="number" step="0.1" name="target_weight" value="<%= targetWeight %>" class="form-control" required>
        </div>

        <div class="form-group">
            <label>Current Weight (kg):</label>
            <input type="number" step="0.1" name="current_weight" value="<%= currentWeight %>" class="form-control" required>
        </div>

        <div class="form-group">
            <label>Start Date:</label>
            <input type="date" name="start_date" value="<%= startDate %>" class="form-control" required>
        </div>

        <div class="form-group">
            <label>End Date:</label>
            <input type="date" name="end_date" value="<%= endDate %>" class="form-control" required>
        </div>

        <div class="form-group">
            <label>Progress Note:</label>
            <textarea name="progress_note" class="form-control"><%= progressNote %></textarea>
        </div>

        <button type="submit" class="btn btn-success">Update Goal</button>
        <a href="viewGoals.jsp" class="btn btn-secondary">Cancel</a>
    </form>
</body>
</html>
