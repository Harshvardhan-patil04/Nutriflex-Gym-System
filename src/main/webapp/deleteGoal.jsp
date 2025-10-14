<%@ page import="java.sql.*" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int id = Integer.parseInt(request.getParameter("id"));

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gym", "root", "");
        PreparedStatement stmt = con.prepareStatement("DELETE FROM goals WHERE id=? AND username=?");
        stmt.setInt(1, id);
        stmt.setString(2, username);
        stmt.executeUpdate();
        con.close();
        response.sendRedirect("viewGoals.jsp");
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
