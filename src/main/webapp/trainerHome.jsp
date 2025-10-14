<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.gym.database.DBConn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trainer Plans</title>
    <link rel="stylesheet" href="css/thome.css"/>
    <style>
        body {
    background-image: url('images/candibg.png'); /* Replace with your image path */
    background-size: cover;
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-position: center;
    color: white;
    transition: background 0.5s, color 0.5s;
}
.dark-mode {
            background-image: none;
            background-color: #121212;
            color: #ddd;
        }
.navbar {
            position: sticky;
            top: 0;
            background: rgba(0, 0, 0, 0.8);
            padding: 10px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        
        .nav-links li a:hover {
            color: yellow;
            transition: color 0.3s ease-in-out;
        }
  .search-container {
    text-align: center;
    margin: 20px 0;
}

.search-bar {
    padding: 12px 20px;
    width: 100%;
    max-width: 400px;
    margin: 10px auto;
    display: block;
    border: 2px solid rgba(0, 255, 255, 0.6); /* Neon cyan border */
    border-radius: 30px;
    background: rgba(255, 255, 255, 0.9); /* Light transparent white */
    color: #000;
    font-size: 18px;
    outline: none;
    transition: all 0.3s ease-in-out;
    text-align: left;
    box-shadow: 0 0 10px rgba(0, 255, 255, 0.3);
}

.search-bar:focus {
    border-color: #0ff;
    box-shadow: 0 0 20px rgba(0, 255, 255, 0.8);
    background: white;
    transform: scale(1.05);
}

.search-bar::placeholder {
    color: rgba(0, 0, 0, 0.5);
    font-style: italic;
    font-size: 16px;
}

.search-icon {
    position: absolute;
    left: 15px;
    top: 50%;
    transform: translateY(-50%);
    color: rgba(0, 255, 255, 0.7);
    font-size: 20px;
}

.search-wrapper {
    position: relative;
    display: inline-block;
    width: 100%;
    max-width: 420px;
}

.search-wrapper input {
    padding-left: 45px; /* Space for icon */
}
        
        .dark-mode-btn {
    background-color: #0ff; /* Neon Cyan */
    color: #000;
    border: 2px solid #0ff;
    padding: 8px 15px;
    cursor: pointer;
    border-radius: 5px;
    transition: all 0.3s ease-in-out;
    font-weight: bold;
    text-transform: uppercase;
    box-shadow: 0 0 10px #0ff, 0 0 40px #0ff, 0 0 80px #0ff;
}

.dark-mode-btn:hover {
    background-color: #000;
    color: #0ff;
    border-color: #0ff;
    transform: scale(1.1);
    box-shadow: 0 0 20px #0ff, 0 0 60px #0ff, 0 0 100px #0ff;
}
        
        
       .logout-btn {
    background-color: #0ff; /* Neon Cyan */
    color: #000;
    border: 2px solid #0ff;
    padding: 8px 15px;
    cursor: pointer;
    border-radius: 5px;
    transition: all 0.3s ease-in-out;
    font-weight: bold;
    text-transform: uppercase;
    box-shadow: 0 0 10px #0ff, 0 0 40px #0ff, 0 0 80px #0ff;
}

.logout-btn:hover {
    background-color: #000;
    color: #0ff;
    border-color: #0ff;
    transform: scale(1.1);
    box-shadow: 0 0 20px #0ff, 0 0 60px #0ff, 0 0 100px #0ff;
}


.cards-container {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    justify-content: center;
    padding: 20px;
}

.card-body {
    background: rgba(50, 50, 50, 0.8); /* Semi-transparent light background */
    backdrop-filter: blur(4px); /* Glassmorphism effect */
    border-radius: 20px;
    padding: 20px;
    width: 300px;
    color: #fff; /* Ensure text is white */
    box-shadow: 0 0 15px rgba(0, 255, 255, 0.4);
    transition: transform 0.3s, box-shadow 0.3s;
}

.card-body:hover {
    transform: scale(1.05);
    box-shadow: 0 0 25px rgba(0, 255, 255, 0.7);
}

.card-body .list-group {
    list-style-type: none;
    padding: 0;
    margin: 0;
}

.card-body .list-group-item {
    background: transparent;
    border: none;
    padding: 8px 0;
    font-size: 15px;
    color: #fff; /* Ensure text is readable */
    border-bottom: 1px solid rgba(255, 255, 255, 0.2);
}

.card-body .list-group-item:last-child {
    border-bottom: none;
}

.card-body1 {
    display: flex;
    justify-content: space-around;
    margin-top: 15px;
}

.card-body1 .box {
    background-color: #0ff;
    color: #000;
    padding: 8px 12px;
    border-radius: 10px;
    cursor: pointer;
    font-weight: bold;
    transition: background 0.3s, color 0.3s, transform 0.3s;
    text-align: center;
}

.card-body1 .box:hover {
    background-color: #000;
    color: #0ff;
    transform: scale(1.1);
    box-shadow: 0 0 10px #0ff;
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
    <script>
        function showContent(type) {
            // Hide previous content
            document.querySelectorAll('.form-container').forEach(div => {
                div.style.display = 'none'; // Hide all form containers
            });
            document.querySelectorAll('.card-body').forEach(card => {
                card.style.display = 'none'; // Hide all previous cards
            });

            // Show the relevant content
            document.getElementById(type).style.display = 'block'; // Show the clicked form
        }
        function toggleDarkMode() {
            document.body.classList.toggle("dark-mode");
            let isDark = document.body.classList.contains("dark-mode");
            localStorage.setItem("darkMode", isDark ? "enabled" : "disabled");
        }
        function searchStudents() {
            let input = document.getElementById('search').value.toLowerCase();
            document.querySelectorAll('.card-body').forEach(card => {
                card.style.display = card.innerText.toLowerCase().includes(input) ? 'block' : 'none';
            });
        }
        window.onload = function() {
            if (localStorage.getItem("darkMode") === "enabled") {
                document.body.classList.add("dark-mode");
            }
        };

        function goBack() {
            // Hide all forms
            document.querySelectorAll('.form-container').forEach(div => {
                div.style.display = 'none'; // Hide all form containers
            });

            // Show all cards again
            document.querySelectorAll('.card-body').forEach(card => {
                card.style.display = 'block'; // Show all card bodies
            });
        }
    </script>
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
                <div class="search-container">
    <div class="search-wrapper">
        <i class="fas fa-search search-icon"></i> 
        
        <input type="text" id="search" class="search-bar" placeholder="Search students..." onkeyup="searchStudents()">
        
         </div>
</div>
       <button class="logout-btn" onclick="window.location.href='logout'">
            <%= session.getAttribute("fname") %> - Logout
        </button>

        <button onclick="toggleDarkMode()" class="dark-mode-btn">Toggle Dark Mode</button>
    </nav>
</header>

<main>
    <h2>Your Students</h2>
    <div class="cards-container">
        <%
            HttpSession sess = request.getSession(false);
            String fname = (String) sess.getAttribute("fname");
            String lname = (String) sess.getAttribute("lname");
            String str = fname + " " + lname;
        %>

        <%
            try {
                Connection con = DBConn.conn();
                String s = "SELECT * FROM admision WHERE trainer ='" + str + "'";
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(s);
                int count = 0;
                while (rs.next()) {
                    count++;
        %>

        <div class="card-body">
            <ul class="list-group">
                <li class="list-group-item"><b>ID:</b> <%= rs.getString(1) %></li>
                <li class="list-group-item"><b>Candidate UserName:</b> <%= rs.getString(9) %></li>
                <li class="list-group-item"><b>Trainer Name:</b> <%= rs.getString(2) %></li>
                 <li class="list-group-item"><b>Candidate Height:</b> <%= rs.getString(6) %></li>
                  <li class="list-group-item"><b>Candidate Weight:</b> <%= rs.getString(7) %></li>
                   <li class="list-group-item"><b>Candidate Preference:</b> <%= rs.getString(8) %></li>
                <li class="list-group-item"><b>Plan Name:</b> <%= rs.getString(3) %></li>
                <li class="list-group-item"><b>Start Date:</b> <%= rs.getString(5) %></li>
                <li class="list-group-item"><b>End Date:</b> <%= rs.getString(13) %></li>
            </ul>
            <div class="card-body1">
                <div class="box" onclick="showContent('workout')"><a>Workout Plan</a></div>
                <div class="box" onclick="showContent('diet')"><a>Diet Plan</a></div>
            </div>
        </div>

        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </div>

    <!-- Hidden Forms -->
    <div id="workout" class="form-container">
        <form action="WorkOut" method="post" >
            <h3 style="color: black;">Workout Form</h3>
            <label for="uname">Candidate Username:</label>
            <input type="text" id="uname" name="uname" placeholder="Enter candidate username" required>
            
            <label for="day">Day:</label>
            <input type="number" id="day" name="day" placeholder="Enter day number" required>
            
            <label for="date">Date:</label>
            <input type="date" id="date" name="date" required>
            
            <label for="exercise">Exercise:</label>
            <input type="text" id="exercise" name="exercise" placeholder="Enter exercise name" required>
            
            <label for="duration">Duration (minutes):</label>
            <input type="number" id="duration" name="duration" placeholder="Enter duration" required>
            
            <label for="note">Note:</label>
            <textarea id="note" name="note" rows="4" placeholder="Enter any additional notes..." required></textarea>

            <button type="submit">Submit Workout Plan</button>
            <button type="button" onclick="goBack()">Go Back</button> 
        </form>
    </div>

    <div id="diet" class="form-container">
        <form action="DietForm" method="post">
            <h3 style="color: black;">Diet Form</h3>
            <label for="uname">Name of Candidate:</label>
            <input type="text" id="uname" name="uname" placeholder="Enter candidate username" required>
            
            <label for="day">Day:</label>
            <input type="number" id="day" name="day" placeholder="Enter day number" required>
            
            <label for="date">Date:</label>
            <input type="date" id="date" name="date" required>
            
            <label for="meal">Meal:</label>
            <input type="text" id="meal" name="meal" placeholder="Enter meal name" required>
            
            <label for="calories">Calories:</label>
            <input type="number" id="calories" name="calories" placeholder="Enter calorie count" required>

            <button type="submit">Submit Diet Plan</button>
            <button type="button" onclick="goBack()">Go Back</button> <!-- Go Back button -->
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