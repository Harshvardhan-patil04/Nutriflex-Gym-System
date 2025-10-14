<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.gym.database.DBConn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trainers</title>
<link rel="stylesheet" href="css/trainerlist.css"/>
<style>
   body {
    background-image: url('images/tranier.jpg'); 
    background-size: cover;
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-position: center;
    color: white;
    font-family: 'Merriweather', serif;
}

li{
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


input[type="submit"] {
    background: linear-gradient(to right, black, #333);
    color: white;
    border: none;
    padding: 10px 20px;
    font-size: 16px;
    cursor: pointer;
    transition: background 0.4s ease-in-out;
    border-radius: 5px;
}

input[type="submit"]:hover {
    background: linear-gradient(to right, red, darkred);
}
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
</head>
<body>
<header>
    <nav class="navbar">
        <div class="logo">
            <a href="#home">
                <img src="images/mainlogo.jpeg" alt="Logo">
            </a>
        </div>
        <ul class="nav-links">
            <li><a href="adhome.jsp">Home</a></li>
            <li><a href="trainers.jsp">Trainers</a></li>
            <li><a href="users.jsp">Users</a></li>
            <li><a href="candidate.jsp">Candidates</a></li>
            <li><a href="logout"><%=session.getAttribute("name")%>-Logout</a></li> 
        </ul>
    </nav>
</header>

<main> 
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Phone</th>
                <th>Email</th>
                <th>Experience</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
        <%
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                con = DBConn.conn();
                stmt = con.createStatement();
                String query = "SELECT id, fname,lname,mobile, email, exp FROM trainer";
                rs = stmt.executeQuery(query);

                while (rs.next()) {
                    int id = rs.getInt("id");
                    String fname = rs.getString("fname");
                    String lname = rs.getString("lname");
                    String email = rs.getString("email");
                    String phone = rs.getString("mobile");
                    String exp = rs.getString("exp");
        %>
        <tr>
            <td><%= id %></td>
            <td><%= fname %></td>
            <td><%= lname %></td>
            <td><%= phone %></td>
            <td><%= email %></td>
            <td><%= exp %></td>
            <td>
                <form action="DeleteTrainer.jsp" method="post">
                    <input type="hidden" name="id" value="<%= id %>">
                    <input type="submit" value="Delete" onclick="return confirm('Are you sure you want to delete this record?');">
                </form>
            </td>
        </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (con != null) try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        %>
        </tbody>
    </table>
</main>

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

