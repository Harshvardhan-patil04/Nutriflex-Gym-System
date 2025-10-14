<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gym Management System - Responsive Form</title>
<link rel="stylesheet" href="css/addt.css"/>
<style>

  body {
    background-image: url('images/addtrain.jpg'); /* Replace with your image path */
    background-size: cover;
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-position: center;
    color: white;
}
 .nav-links li a:hover {
            color: yellow;
            transition: color 0.3s ease-in-out;
        }
        
        
        .form-container {
    background: rgba( 245, 245,245, 0.2); /* Neon Transparent */
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0, 255, 255, 0.5);
    max-width: 400px;
    margin: auto;
    text-align: center;
}

.input-group {
    margin-bottom: 15px;
    text-align: left;
}

.input-group label {
    font-weight: bold;
    display: block;
    margin-bottom: 5px;
    color: #00ffff; /* Neon Text */
}

.input-group input {
    width: 100%;
    padding: 10px;
    border-radius: 5px;
    border: 1px solid #00ffff;
    background: rgba(0, 0, 0, 0.5);
    color: white;
    transition: all 0.3s ease-in-out;
}

.input-group input:focus {
    border-color: #00ffff;
    box-shadow: 0px 0px 15px rgba(0, 255, 255, 0.8);
    outline: none;
}

.submit-btn {
    width: 100%;
    padding: 10px;
    background-color: #00ffff;
    color: black;
    border: none;
    border-radius: 5px;
    font-weight: bold;
    cursor: pointer;
    transition: 0.3s;
}

.submit-btn:hover {
    background-color: #008080;
    color: white;
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
             <li style="text-transform: uppercase;"><a href="logout"><%=session.getAttribute("name")%>-Logout</a></li> 
        </ul>
    </nav>
</header>

<main>
    <div class="form-container">
        <h2>Trainer Registration Form</h2>
        <form action="AddTrainer" method="POST" class="trainer-form">
            
            <div class="input-group">
                <label for="firstname">First Name:</label>
                <input type="text" id="firstname" name="firstname" placeholder="First Name" required>
            </div>

            <div class="input-group">
                <label for="lastname">Last Name:</label>
                <input type="text" id="lastname" name="lastname" placeholder="Last Name" required>
            </div>

            <div class="input-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" placeholder="Email" required>
            </div>

            <div class="input-group">
                <label for="mobile">Mobile:</label>
                <input type="text" id="mobile" name="mobile" pattern="[0-9]{10}" placeholder="Mobile No" required>
            </div>

            <div class="input-group">
                <label for="experience">Experience (in years):</label>
                <input type="number" id="experience" name="experience" min="0" placeholder="Exp" required>
            </div>

            <div class="input-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" placeholder="Password" required>
            </div>

            <div class="button-group">
                <input type="submit" value="Register" class="submit-btn">
            </div>
        </form>
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

</body>
</html>
