<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.gym.entity.SentimentAnalyzer" %>

<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/adhome.css"/>
</head>
<style>
body {
    background-image: url('images/Adminbg.jpg'); /* Replace with your image path */
    background-size: cover;
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-position: center;
    color: white;
    font-family: 'Merriweather', serif;
    
}

button {
  background: linear-gradient(45deg, #ff5733, #ffbd33);
  color: white;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  font-size: 16px;
  transition: background 0.3s ease;
}

button:hover {
  background: linear-gradient(45deg, #c70039, #ff5733);
}


li {
    border: none;
    padding: 10px 20px;
    color: white;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    border-radius: 5px;
    transition: 0.3s ease;
}

li:hover {
    color: #fff; /* White text */
    text-shadow: 0px 0px 8px #39ff14, /* Neon Cyan Glow */
                 0px 0px 12px #39ff14, 
                 0px 0px 20px #39ff14; 
    transition: text-shadow 0.3s ease-in-out; /* Smooth transition */
}


h1 {
    position: relative;
    animation: slideIn 1.5s ease-in-out forwards;
}

@keyframes slideIn {
    from {
        left: -100%;
        opacity: 0;
    }
    to {
        left: 0;
        opacity: 1;
    }
}



hedader{
color: white;
}

.rating {
    display: flex;
    justify-content: center;
    flex-direction: row-reverse;
    gap: 5px;
    font-size: 30px;
    cursor: pointer;
}

.rating input {
    display: none;
}

.rating label {
    color: #444;
    transition: color 0.3s;
}

.rating input:checked ~ label,
.rating label:hover,
.rating label:hover ~ label {
    color: #ffcc00;
}

.feedback-form {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 10px;
}

.feedback-form textarea, .feedback-form .input-field {
    width: 80%;
    max-width: 500px;
    padding: 10px;
    border: 1px solid #ffcc00;
    border-radius: 5px;
    background: #222;
    color: white;
}

.feedback-form button {
    background-color: #ffcc00;
    color: black;
    padding: 10px 20px;
    border: none;
    cursor: pointer;
    transition: 0.3s;
}

.feedback-form button:hover {
    background-color: #ffaa00;
}
#feedback {
    background: #111;  /* Dark background */
    color: white;  /* White text */
    padding: 30px;
    border-radius: 10px;
}

/* Feedback Section */
.feedback-list {
    width: 60%;
    margin: auto;
    background: rgba(34, 34, 34, 0.7); /* Adjusted opacity */
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 4px 10px rgba(255, 255, 255, 0.2);
}

/* Individual Feedback Items */
.feedback-item {
    border: 1px solid #555;
    padding: 20px;
    margin-bottom: 15px;
    background: linear-gradient(45deg, #222, #333);
    color: white;
    border-radius: 10px;
    font-family: Arial, sans-serif;
    box-shadow: 0px 4px 8px rgba(255, 255, 255, 0.1);
    transition: transform 0.3s, box-shadow 0.3s;
}

.feedback-item:hover {
    transform: scale(1.05);
    box-shadow: 0px 4px 15px rgba(255, 255, 255, 0.3);
}

.feedback-item h4 {
    font-size: 20px;
    font-weight: bold;
    margin-bottom: 10px;
    color: #ffcc00;
}

.feedback-item p {
    font-size: 16px;
    margin: 5px 0;
}

.rating-stars {
    font-size: 22px;
    color: gold;
    text-shadow: 0px 0px 8px gold;
}



.positive { border-left: 5px solid green; }
    .negative { border-left: 5px solid red; }
    .neutral { border-left: 5px solid gray; }



footer {
    background: linear-gradient(45deg, #111, #222); /* Dark gradient background */
    color: white;
    padding: 20px 0;
    text-align: center;
    box-shadow: 0px -4px 10px rgba(255, 255, 255, 0.1); /* Soft glow effect */
    border-top: 2px solid #00ffff; /* Neon cyan top border */
    font-family: 'Merriweather', serif;
    position: relative;
}

/* Glowing Effect */
footer:hover {
    box-shadow: 0px -4px 15px rgba(0, 255, 255, 0.5); /* Neon cyan glow */
    transition: 0.5s ease-in-out;
}

/* Footer Links Styling */
footer a {
    color: white;
    text-decoration: none;
    transition: color 0.3s, text-shadow 0.3s;
}

/* Neon Hover Effect for Links */
footer a:hover {
    color: #00ffff; /* Neon cyan */
    text-shadow: 0px 0px 8px #00ffff, 0px 0px 12px #00ffff;
}

/* Social Media Icons */
.social-media img {
    width: 30px;
    height: 30px;
    margin: 5px;
    transition: transform 0.3s ease-in-out;
}

.social-media img:hover {
    transform: scale(1.2); /* Enlarge on hover */
    filter: drop-shadow(0px 0px 10px #00ffff); /* Neon glow effect */
}





</style>
<body>
<header>
    <nav class="navbar">
        <div class="logo">
            <a href="#home">
                <img src="images/mainlogo.jpeg" alt="Logo">
            </a>
        </div>
        <ul class="nav-links">
            <li><a href="adhome.jsp">Home</a></li1>
            
            <li style="text-transform: uppercase;"><a href="logout"><%=session.getAttribute("name")%>-Logout</a></li1> 
        </ul>
    </nav>
</header>

<main style="height: auto;">
    <div class="image-content">
        <h1>Admin's Desk</h1>
    </div>
    <div class="cards-container">
        <div class="card">
            <img src="images/tranier.jpg" alt="Card 1 Image">
            <h2><button class="styled-button"><a href="trainers.jsp">Trainers</a></button></h2>
        </div>
        <div class="card">
            <img src="images/candi.jpg" alt="Card 2 Image">
            <h2><button class="styled-button"><a href="candidate.jsp">Candidates</a></button></h2>
            
        </div>
         <div class="card">
            <img src="images/user.webp" alt="Card 2 Image">
            <h2><button class="styled-button"><a href="users.jsp">Users</a></button></h2>
            
        </div>
    </div>
</main>

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

                String sentiment = "neutral";
                String lowerMessage = message.toLowerCase();
                for (String word : positiveWords) {
                    if (lowerMessage.contains(word)) {
                        sentiment = "positive";
                        break;
                    }
                }
                for (String word : negativeWords) {
                    if (lowerMessage.contains(word)) {
                        sentiment = "negative";
                        break;
                    }
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
            <p>Email: nutriflex@gmail.com</p>
            <p>Phone: 020-26119057</p>
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

