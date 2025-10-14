<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="java.sql.*, java.util.*, java.net.*, java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Home - Feedback</title>
<link rel="stylesheet" href="css/hedfoot.css">
<style>
    body {
        background-color: #111;
        color: white;
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
    }
    header, footer {
        background-color: black;
        padding: 15px 0;
        text-align: center;
    }
    .logo img {
        height: 70px;
    }
    .nav-links {
        list-style: none;
        padding: 0;
    }
    .nav-links li {
        display: inline;
        margin: 0 15px;
    }
    .nav-links a {
        color: white;
        text-decoration: none;
        font-size: 16px;
    }
    .feedback-container {
        max-width: 800px;
        margin: 50px auto;
        background: #222;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(255, 255, 255, 0.1);
    }
    .feedback-item {
        background: #333;
        padding: 15px;
        margin-bottom: 15px;
        border-radius: 10px;
        box-shadow: 0 0 5px rgba(255, 255, 255, 0.1);
    }
    .positive { border-left: 5px solid green; }
    .negative { border-left: 5px solid red; }
    .neutral { border-left: 5px solid gray; }
    .footer-container {
        display: flex;
        justify-content: space-around;
        flex-wrap: wrap;
        color: white;
        padding: 20px;
    }
    .footer-section {
        margin-bottom: 10px;
    }
    .social-media img {
        height: 30px;
        margin: 5px;
    }
</style>
</head>
<body>

<header>
    <div class="logo">
        <a href="#home">
            <img src="images/file.png" alt="Logo">
        </a>
    </div>
    <ul class="nav-links">
        <li><a href="AdminHome.jsp">Home</a></li>
        <li><a href="trainers.jsp">Trainers</a></li>
        <li><a href="users.jsp">Users</a></li>
        <li><a href="candidate.jsp">Candidates</a></li>
        <li><a href="logout"><%= session.getAttribute("name") %> - Logout</a></li>
    </ul>
</header>

<div class="feedback-container">
    <h2 style="text-align:center;">User Reviews & Sentiment Analysis</h2>
    <div class="feedback-list">
        <% 
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/feedback?useSSL=false", "root", "");

            String sql = "SELECT name, rating, message FROM feedbacks ORDER BY id DESC LIMIT 5";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            List<String> positiveWords = Arrays.asList("good", "great", "excellent", "amazing", "happy", "love");
            List<String> negativeWords = Arrays.asList("bad", "terrible", "worst", "poor", "sad", "hate");

            while (rs.next()) {
                String username = rs.getString("name");
                int rating = rs.getInt("rating");
                String message = rs.getString("message");

                String sentiment = "neutral"; // default
                try {
                    String apiUrl = "http://localhost:5000/sentiment";
                    String jsonInput = "{\"message\":\"" + message.replace("\"", "\\\"") + "\"}";

                    URL url = new URL(apiUrl);
                    HttpURLConnection connSent = (HttpURLConnection) url.openConnection();
                    connSent.setRequestMethod("POST");
                    connSent.setRequestProperty("Content-Type", "application/json");
                    connSent.setDoOutput(true);

                    OutputStream os = connSent.getOutputStream();
                    os.write(jsonInput.getBytes("UTF-8"));
                    os.close();

                    BufferedReader br = new BufferedReader(new InputStreamReader(connSent.getInputStream()));
                    String output, responseText = "";
                    while ((output = br.readLine()) != null) {
                        responseText += output;
                    }
                    br.close();
                    connSent.disconnect();

                    // Extract sentiment
                    if (responseText.contains("Positive")) {
                        sentiment = "positive";
                    } else if (responseText.contains("Negative")) {
                        sentiment = "negative";
                    } else {
                        sentiment = "neutral";
                    }
                } catch (Exception e) {
                    sentiment = "neutral"; // fallback
                }
            %>
                <div class="feedback-item <%= sentiment %>">
                    <h4><%= (username != null && !username.isEmpty()) ? username : "Anonymous" %></h4>
                    <p>Rating: <%= "★".repeat(rating) + "☆".repeat(5 - rating) %></p>
                    <p><%= message %></p>
                    <p>Sentiment: <%= sentiment.toUpperCase() %></p>
                </div>
            <%
            }

        } catch (SQLException e) { 
        %>
            <p style="color: red; text-align:center;">⚠️ Error fetching feedbacks: <%= e.getMessage() %></p>
        <% 
        } finally {
            try { if (rs != null) rs.close(); } catch (SQLException ignored) {}
            try { if (stmt != null) stmt.close(); } catch (SQLException ignored) {}
            try { if (conn != null) conn.close(); } catch (SQLException ignored) {}
        }
        %>
    </div>
</div>

<footer>
    <div class="footer-container">
        <div class="footer-section">
            <h3>Quick Links</h3>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="services.jsp">Services</a></li>
                <li><a href="contact.jsp">Contact</a></li>
            </ul>
        </div>
        <div class="footer-section">
            <h3>Contact Us</h3>
            <p>Email: example@example.com</p>
            <p>Phone: 123-456-7890</p>
        </div>
        <div class="footer-section">
            <h3>Follow Us</h3>
            <ul class="social-media">
                <li><a href="https://www.facebook.com/share/1A4uftLCpp/?mibextid=wwXIfr"><img src="images/facebook.jpeg" alt="Facebook"></a></li>
                <li><a href="https://x.com/nutriflexgym?s=21"><img src="images/twitter.jpg" alt="Twitter"></a></li>
                <li><a href="https://www.instagram.com/nutriflex_gym?igsh=OXlhdzNmZWk1ejI0&utm_source=qr"><img src="images/insta.jpg" alt="Instagram"></a></li>
            </ul>
        </div>
    </div>
</footer>

</body>
</html>