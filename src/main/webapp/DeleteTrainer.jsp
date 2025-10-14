<%@page import="com.gym.database.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.servlet.RequestDispatcher"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Delete Trainer</title>
</head>
<body>
    <%
        String tid = request.getParameter("id");  // Make sure "id" matches the query param in your link

        if (tid != null && !tid.isEmpty()) {
            try (Connection con = DBConn.conn()) {
                int id = Integer.parseInt(tid);

                String query = "DELETE FROM trainer WHERE id = ?";
                try (PreparedStatement pstmt = con.prepareStatement(query)) {
                    pstmt.setInt(1, id);
                    int rowsAffected = pstmt.executeUpdate();

                    if (rowsAffected > 0) {
                        out.println("<script>alert('Trainer Deleted Successfully');</script>");
                    } else {
                        out.println("<script>alert('Trainer Not Found');</script>");
                    }
                }
            } catch (Exception e) {
                out.println("<script>alert('Error: " + e.getMessage() + "');</script>");
                e.printStackTrace();
            }
        } else {
            out.println("<script>alert('Invalid Trainer ID');</script>");
        }

        // Redirect back to the manager home page
        RequestDispatcher rd = request.getRequestDispatcher("managerHome.jsp");
        rd.forward(request, response);
    %>
</body>
</html>
