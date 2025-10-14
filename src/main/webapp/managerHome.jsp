<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.gym.database.DBConn, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trainer Info</title>
    <link rel="stylesheet" href="css/mhome.css"/>
    <style>
        body {
            background-image: url('images/candibg.png');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            color: white;
            font-family: Arial, sans-serif;
            transition: background 0.5s ease-in-out;
        }

        .card-body {
            background: rgba(0, 0, 0, 0.7);
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(255, 255, 255, 0.2);
            transition: transform 0.3s ease-in-out;
        }

        .card-body:hover {
            transform: scale(1.05);
        }

        .nav-links li a:hover {
            color: yellow;
            transition: color 0.3s ease-in-out;
        }

        .list-group-item {
            background: transparent;
            border: none;
            color: white;
        }

        .footer-container {
            background: rgba(0, 0, 0, 0.8);
            padding: 20px;
            text-align: center;
        }

       /* Sliding Effects */
        .box {
            width: 45%;
            padding: 20px;
            background: rgba(0,0,0,0.7);
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(255,255,255,0.2);
            color: white;
            transform: scaleX(0);
            transfor-origin: center;
            
           
            transition:  transform 1s ease-out;
        }

        /* Box 1 (Trainer Info) - Slide from Left */
        .box1 {
            transform-origin: left;
        }

        /* Box 2 (Membership Plans) - Slide from Right */
        .box2 {
            transform-origin: right;
        }

        /* When visible, move to normal position */
        .box.show {
            
            transform: scaleX(1);
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
        <div class="navbar-title">
            
        </div>
        <ul class="nav-links">
            <li><a href="managerHome.jsp">Home</a></li>
            <li><a href="addtrainer.jsp">Add Trainer</a></li>
            <li><a href="addplans.jsp">Add Plans</a></li>
            <li style="text-transform: uppercase;"><a href="logout"><%= session.getAttribute("name") %>-Logout</a></li> 
        </ul>
    </nav>
</header>

<main>
        <div class="main-container">
            <div class="box box1">
                <h2>Trainer Info</h2>
                <section class="container">
                    <div class="row">
                        <% try (Connection con = DBConn.conn();
                              Statement st = con.createStatement();
                              ResultSet rs = st.executeQuery("SELECT * FROM trainer")) {
                            while (rs.next()) { %>
                                <div class="card-body">
                                    <ul class="list-group">
                                        <li class="list-group-item"><b>ID:</b> <%= rs.getInt(1) %></li>
                                        <li class="list-group-item"><b>First Name:</b> <%= rs.getString(2) %></li>
                                        <li class="list-group-item"><b>Last Name:</b> <%= rs.getString(3) %></li>
                                        <li class="list-group-item"><b>Email:</b> <%= rs.getString(4) %></li>
                                        <li class="list-group-item"><b>Mobile:</b> <%= rs.getString(5) %></li>
                                        <li class="list-group-item"><b>Experience:</b> <%= rs.getInt(6) %> years</li>
                                    </ul>
                                    <div class="card-body">
                                        <a href="DeleteTrainer.jsp?id=<%= rs.getInt(1) %>" class="card-link">Delete</a>
                                    </div>
                                </div>
                        <% } } catch (Exception e) { e.printStackTrace(); } %>
                    </div>
                </section>
            </div>

            <div class="box box2">
                <h2>Membership Plans</h2>
                <section class="container">
                    <div class="row">
                        <% try (Connection con = DBConn.conn();
                              Statement st = con.createStatement();
                              ResultSet rs = st.executeQuery("SELECT * FROM plans")) {
                            while (rs.next()) { %>
                                <div class="card-body">
                                    <ul class="list-group">
                                        <li class="list-group-item"><b>ID:</b> <%= rs.getInt(1) %></li>
                                        <li class="list-group-item"><b>Plan Name:</b> <%= rs.getString(2) %></li>
                                        <li class="list-group-item"><b>Duration:</b> <%= rs.getString(3) %> Months</li>
                                        <li class="list-group-item"><b>Price:</b> <%= rs.getString(4) %></li>
                                        <li class="list-group-item"><b>Features:</b> <%= rs.getString(5) %></li>
                                    </ul>
                                    <div class="card-body">
									<a href="DeletePlan.jsp?id=<%= rs.getInt(1) %>" class="card-link">Delete</a>
                                    </div>
                                </div>
                        <% } } catch (Exception e) { e.printStackTrace(); } %>
                    </div>
                </section>
            </div>
        </div>
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
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const boxes = document.querySelectorAll(".box");

            const observer = new IntersectionObserver(entries => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.classList.add("show");
                    }
                });
            }, { threshold: 0.3 });

            boxes.forEach(box => observer.observe(box));
        });
    </script>
</body>
</html>
