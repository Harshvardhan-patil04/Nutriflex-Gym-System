<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Home</title>
    <link rel="stylesheet" href="css/uhome.css">
    <style>
        /* General Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Times New Roman', Times, serif;
        }

        body {
            background: url('images/NUTRIFLEXBG.jpg') no-repeat center center fixed;
            background-size: cover;
            color: white;
        }

        /* Navbar */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 5%;
            background: rgba(0, 0, 0, 0.8);
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .logo img {
            height: 80px;
        }

        .nav-links {
            list-style: none;
            display: flex;
        }

        .nav-links li {
            margin: 0 15px;
        }

        .nav-links a {
            text-decoration: none;
            color: white;
            font-weight: bold;
            transition: 0.3s ease-in-out;
        }

        .nav-links a:hover {
            color: yellow;
            transform: scale(1.1);
        }

        /* Welcome Message */
        .navbar-title {
            text-align: center;
            margin-top: 60px;
            font-size: 28px;
            animation: fadeIn 4s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Dashboard */
        .dashboard {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            margin: 40px 5%;
            text-align: center;
        }

        .dashboard-box {
            background: rgba(0, 0, 0, 0.7);
            padding: 20px;
            border-radius: 10px;
            width: 30%;
            transition: 0.3s;
            box-shadow: 0 4px 8px rgba(255, 255, 255, 0.2);
        }

        .dashboard-box:hover {
            transform: scale(1.05);
        }

        .progress-container {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            border: 6px solid yellow;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            font-weight: bold;
            margin: auto;
        }

        .btn {
            display: inline-block;
            background: yellow;
            color: black;
            padding: 8px 12px;
            border-radius: 5px;
            text-decoration: none;
            margin-top: 10px;
            font-weight: bold;
        }

        .btn:hover {
            background: orange;
        }

        /* Footer */
        footer {
            background: rgba(0, 0, 0, 0.8);
            text-align: center;
            padding: 20px;
            margin-top: 80px;
        }
    </style>
</head>
<body>

<header>
    <nav class="navbar">
        <div class="logo">
            <a href="index.jsp">
                <img src="images/mainlogo.jpeg" alt="Logo">
            </a>
        </div>
        <ul class="nav-links">
            
            <li><a href="allplans.jsp">All Plans</a></li>
            <li><a href="myplans.jsp">My Plans</a></li>
            <li><a href="mydiet.jsp">My Diet</a></li>
            <li><a href="myworkout.jsp">My Workout</a></li>
            <li><a href="chatbot.jsp">ChatBot</a></li>
            <li><a href="messages.jsp">Notifications</a></li>
            <li><a href="userreport.jsp">BMI & Report</a></li>
            <li><a href="setgoal.jsp">Goal Setting</a></li>
            <li style="text-transform: uppercase;">
                <a href="logout"><%= session.getAttribute("firstname") %> - Logout</a>
            </li> 
        </ul>
    </nav>
</header>

<main>
    <div class="navbar-title">
        <h1>Welcome, <%= session.getAttribute("firstname") %>!</h1>
        <p>Track your fitness journey and stay on top of your goals.</p>
    </div>

    

        <!-- Diet Plan -->
        <div class="dashboard-box">
            <h3>Diet Plan</h3>
            <p>Follow your personalized meal plan for best results.</p>
            <a href="mydiet.jsp" class="btn">View Diet</a>
        </div>

        <!-- Today's Workout -->
        <div class="dashboard-box">
            <h3>Today's Workout</h3>
            <p>Chest & Triceps | 60 mins</p>
            <a href="myworkout.jsp" class="btn">Start Workout</a>
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
            <p>Email: nutiflex@gmail.com</p>
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
// Simulated Workout Progress
document.getElementById("workout-progress").innerText = "80%";
</script>

</body>
</html>

