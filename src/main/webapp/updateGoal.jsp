<%@ page import="java.sql.*" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int id = Integer.parseInt(request.getParameter("id"));
    String goal_title = request.getParameter("goal_title");
    double target_weight = Double.parseDouble(request.getParameter("target_weight"));
    double current_weight = Double.parseDouble(request.getParameter("current_weight"));
    String start_date = request.getParameter("start_date");
    String end_date = request.getParameter("end_date");
    String progress_note = request.getParameter("progress_note");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gym", "root", "");
        PreparedStatement stmt = con.prepareStatement("UPDATE goals SET goal_title=?, target_weight=?, current_weight=?, start_date=?, end_date=?, progress_note=? WHERE id=? AND username=?");
        stmt.setString(1, goal_title);
        stmt.setDouble(2, target_weight);
        stmt.setDouble(3, current_weight);
        stmt.setString(4, start_date);
        stmt.setString(5, end_date);
        stmt.setString(6, progress_note);
        stmt.setInt(7, id);
        stmt.setString(8, username);

        stmt.executeUpdate();
        con.close();
        response.sendRedirect("viewGoals.jsp");
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
