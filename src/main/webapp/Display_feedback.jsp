<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Feedback</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 20px;
        background-color: #f4f4f4;
    }
    .feedback-list {
        max-width: 600px;
        margin: auto;
        padding: 20px;
        background: white;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    .feedback-item {
        padding: 10px;
        border-bottom: 1px solid #ddd;
    }
    .feedback-item:last-child {
        border-bottom: none;
    }
    .rating {
        color: gold;
    }
</style>
</head>
<body>

<h2 style="text-align:center;">User Feedback</h2>
<div class="feedback-list">
<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/feedback", "root", "");

        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM feedbacks ORDER BY submitted_at DESC");

        while (rs.next()) {
            int rating = rs.getInt("rating");
            String name = rs.getString("name");
            String message = rs.getString("message");
%>
            <div class="feedback-item">
                <h3><%= (name != null && !name.isEmpty()) ? name : "Anonymous" %></h3>
                <p class="rating"><%= "★".repeat(rating) + "☆".repeat(5 - rating) %></p>
                <p><%= message %></p>
            </div>
<%
        }
        rs.close();
        stmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p style='color:red; text-align:center;'>Error loading feedback.</p>");
    }
%>
</div>

</body>
</html>
