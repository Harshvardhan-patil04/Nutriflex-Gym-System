<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" href="css/login.css">
</head>
<style>
body {  
    background-image: url('images/NUTRIFLEXBG.jpg');   
    background-size: cover;  
    background-repeat: no-repeat;  
    background-attachment: fixed;  
    background-position: center;  
    color: white;  
    font-family: 'Merriweather', serif;
    
} 

header{
background-color: rgba(0, 0, 0, 0.4); /* Black with 60% transparency */
    color: white; /* Keep text fully visible */
} 
main {
        display: flex;
        justify-content: center;
        align-items: center;
		
        flex-direction: column;
    }
     .navbar-title {
        flex-grow: 1;
        text-align: center;
    }

    .navbar-title h1 {
        font-size: 2rem;
        font-family: 'Times New Roman', serif;
        color: cyan;
        margin: 0;
    }
    
    
    input[type="submit"] {
    background: linear-gradient(45deg, #c40062, #ff0066);
    border: none;
    padding: 10px 20px;
    color: white;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    border-radius: 5px;
    transition: 0.3s ease;
}

input[type="submit"]:hover {
    background: linear-gradient(45deg, #a00050, #cc0055);
}


input[type="submit"]:hover {
    background: linear-gradient(45deg, #ff758c, #ff7eb3);
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
    color: #ffccff; /* Light pink text on hover */
    text-shadow: 0px 0px 5px rgba(255, 255, 255, 0.8); /* Glowing effect */
}

 @keyframes slideIn {
            from {
                transform: translateX(-100%);
                opacity: 0;
            }
            to {
                transform: translateX(0);
                opacity: 1;
            }
        }

        h2 {
            font-size: 24px;
            font-weight: bold;
            display: inline-block;
            animation: slideIn 1s ease-in-out;
        }
    
    
    @keyframes fadeIn {
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}

body {
    background-image: url('images/NUTRIFLEXBG.jpg'); /* Keep background unchanged */
    background-size: cover;
    background-position: center;
}

p, h1, h2, h3, h4, h5, h6, span, div, a { 
    animation: fadeIn 2s ease-in-out;
    opacity: 0; /* Hide initially */
    animation-fill-mode: forwards; /* Ensure the final opacity remains 1 */
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
   
<body>
    <header>
        <nav class="navbar">
            <div class="logo">
                <a href="#home">
                    <img src="images/mainlogo.jpeg" alt="Logo">
                </a>
            </div>
            <div class="navbar-title">
                <h2>WELCOME TO NUTRIFLEX</h2>
            </div>
            <ul class="nav-links">
                <li><a href="index.jsp">Home</a></li>
               
                <li><a href="UserRegister.jsp">SignUp</a></li>
               
                
            </ul>
        </nav>
    </header>

    <main>
        <div class="container">
            <h2 style="color: #7b0252;">Login Form</h2>
            <form action="LoginServlet" method="post">
                <div class="form-row">
                    <label for="roll">Role:</label>
                    <select id="roll" name="roll" required>
                        <option value="" disabled selected>What is your Role....?</option>
                        <option value="admin">Admin</option>
                        <option value="user">User</option>
                        <option value="manager">Manager</option>
                        <option value="trainer">Trainer</option>
                        
                    </select>
                </div>
                <div class="form-row">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" placeholder="Username" required>
                </div>
                <div class="form-row">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" placeholder="Password" required>
                </div>
                <div class="form-row">
                    <input type="submit" value="Login">
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

