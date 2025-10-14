<%@ page import="java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    Connection con = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
%>
<!DOCTYPE html>
<html>
<head>
    <title>Your Fitness Goals</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
    font-family: 'Segoe UI', sans-serif;
    background: linear-gradient(to right, #f8f9fa, #dff9fb, #f6e58d);
    padding: 30px;
    min-height: 100vh;
    animation: backgroundShift 20s infinite alternate;
}

@keyframes backgroundShift {
    0% { background-position: 0% 50%; }
    100% { background-position: 100% 50%; }
}

h2 {
    text-align: center;
    color: #2c3e50;
    margin-bottom: 30px;
    font-weight: 700;
    font-size: 32px;
}

.goal-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(330px, 1fr));
    gap: 20px;
    max-width: 1200px;
    margin: auto;
}

.goal-card {
    background: rgba(255, 255, 255, 0.95);
    border-radius: 20px;
    box-shadow: 0 12px 25px rgba(0,0,0,0.15);
    padding: 30px;
    position: relative;
    transition: all 0.3s ease;
    backdrop-filter: blur(6px);
    animation: fadeIn 0.7s ease-in;
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(30px); }
    to { opacity: 1; transform: translateY(0); }
}

.goal-card:hover {
    transform: scale(1.02);
    box-shadow: 0 15px 30px rgba(0,0,0,0.2);
}

.goal-title {
    font-size: 22px;
    font-weight: bold;
    color: #2c3e50;
    margin-bottom: 15px;
    border-left: 5px solid #28a745;
    padding-left: 10px;
}

.goal-detail {
    color: #2d3436;
    margin: 8px 0;
    font-size: 15px;
    display: flex;
    align-items: center;
    gap: 6px;
}

.goal-detail::before {
    content: '•';
    color: #28a745;
    font-size: 20px;
}

.note {
    margin-top: 12px;
    font-style: italic;
    color: #6c757d;
    border-left: 3px solid #3498db;
    padding-left: 10px;
    font-size: 14px;
}

.progress {
    background-color: #e0e0e0;
    height: 20px;
    border-radius: 10px;
    overflow: hidden;
    margin-top: 15px;
}

.progress-bar {
    height: 100%;
    line-height: 20px;
    text-align: center;
    color: white;
    font-size: 13px;
    font-weight: bold;
    background: linear-gradient(to right, #00b894, #55efc4);
    animation: progressAnim 1s ease-in-out;
    transition: width 0.5s ease;
}

@keyframes progressAnim {
    from { width: 0; }
    to { width: 100%; }
}

.badge {
    position: absolute;
    top: 15px;
    right: 15px;
    padding: 5px 12px;
    font-size: 12px;
    border-radius: 20px;
    font-weight: 600;
    color: white;
    box-shadow: 0 0 10px rgba(0,0,0,0.2);
}

.badge.complete {
    background: linear-gradient(to right, #27ae60, #2ecc71);
}

.badge.overdue {
    background: linear-gradient(to right, #e74c3c, #ff6b6b);
}

.goal-actions {
    margin-bottom: 15px;
}

.goal-actions a.btn {
    margin-right: 8px;
    margin-bottom: 10px;
    transition: all 0.3s ease;
    font-weight: 500;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
}

.goal-actions a.btn:hover {
    box-shadow: 0 0 12px rgba(0, 0, 0, 0.2);
    transform: translateY(-2px);
}

.empty {
    text-align: center;
    font-size: 18px;
    color: #636e72;
    margin-top: 80px;
    animation: fadeIn 1s ease-in-out;
}
        
    </style>
</head>
<body>

<h2>📈 Your Personal Fitness Goals</h2>

<div class="goal-container">
<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gym", "root", "");
        stmt = con.prepareStatement("SELECT * FROM goals WHERE username=?");
        stmt.setString(1, username);
        rs = stmt.executeQuery();

        boolean hasGoals = false;
        while (rs.next()) {
            hasGoals = true;

            double initial = rs.getDouble("initial_weight");
            double current = rs.getDouble("current_weight");
            double target = rs.getDouble("target_weight");

            double progressPercent = 0.0;
            if (initial != target) {
                progressPercent = ((initial - current) / (initial - target)) * 100;
            }
            if (progressPercent > 100) progressPercent = 100;
            if (progressPercent < 0) progressPercent = 0;

            java.sql.Date endDate = rs.getDate("end_date");
            java.sql.Date today = new java.sql.Date(System.currentTimeMillis());
            boolean overdue = endDate.before(today) && progressPercent < 100;
            boolean completed = progressPercent >= 100;
%>
    <div class="goal-card">
        <% if (overdue) { %>
            <div class="badge overdue">⏰ Overdue</div>
        <% } else if (completed) { %>
            <div class="badge complete">✅ Completed</div>
        <% } %>

        <div class="goal-actions">
            <a href="editGoal.jsp?id=<%= rs.getInt("id") %>" class="btn btn-warning btn-sm">✏️ Edit</a>
            <a href="deleteGoal.jsp?id=<%= rs.getInt("id") %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this goal?');">🗑️ Delete</a>
        </div>

        <div class="goal-title">🎯 <%= rs.getString("goal_title") %></div>
        <div class="goal-detail">📍 Target Weight: <strong><%= target %> kg</strong></div>
        <div class="goal-detail">⚖️ Current Weight: <%= current %> kg</div>
        <div class="goal-detail">📅 Start: <%= rs.getString("start_date") %></div>
        <div class="goal-detail">🏁 End: <%= rs.getString("end_date") %></div>

        <div class="progress">
            <div class="progress-bar" role="progressbar"
                style="width: <%= progressPercent %>%" 
                aria-valuenow="<%= (int) progressPercent %>" aria-valuemin="0" aria-valuemax="100">
                <%= String.format("%.1f", progressPercent) %>%
            </div>
        </div>

        <% if (rs.getString("progress_note") != null && !rs.getString("progress_note").trim().isEmpty()) { %>
            <div class="note">📝 "<%= rs.getString("progress_note") %>"</div>
        <% } %>
    </div>
<%
        }

        if (!hasGoals) {
%>
    <div class="empty">You haven't set any goals yet. Start your journey now! 💪</div>
<%
        }

    } catch (Exception e) {
%>
    <div class="empty">Error loading goals: <%= e.getMessage() %></div>
<%
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (stmt != null) stmt.close(); } catch (Exception e) {}
        try { if (con != null) con.close(); } catch (Exception e) {}
    }
%>
</div>

</body>
</html>
