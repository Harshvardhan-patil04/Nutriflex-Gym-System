<%@ page import="com.gym.database.DBConn, java.sql.*" %>
<%
    String id = request.getParameter("id");
    if (id != null) {
        try (Connection con = DBConn.conn();
             PreparedStatement ps = con.prepareStatement("DELETE FROM plans WHERE id = ?")) {
            ps.setInt(1, Integer.parseInt(id));
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    response.sendRedirect("managerHome.jsp");
%>
