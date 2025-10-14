<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NutriFlex | Home</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/home1.css">
<style>
    body {
        background-color: #111;
        color: white;
        font-family: Times New Roman, serif;
    }
    .logo img {
        height: 80px;
        width: auto;
    }
    .navbar {
        background: rgba(0, 0, 0, 0.8);
        padding: px;
        font-size: 20px;
    }
    
    #hero {
        display: flex;
        justify-content: center;
        align-items: center;
        text-align: center;
        height: 100vh;
        background: url('images/gymbc.jpg') no-repeat center center/cover;
        position: relative;
    }
    .hero-overlay {
        
        
        margin-top: 450px;
    }
    .cards-container {
        display: flex;
        justify-content: center;
        flex-wrap: wrap;
        gap: 20px;
        margin-top: 30px;
    }
    .card {
        background: rgba(0, 0, 0, 0.8);
        padding: 15px;
        border-radius: 8px;
        text-align: center;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        width: 250px;
    }
    .card img {
        width: 100%;
        height: 150px;
        object-fit: cover;
        border-radius: 5px;
    }
    .card:hover {
        transform: translateY(-10px);
        box-shadow: 0 10px 20px rgba(255, 255, 255, 0.3);
    }
    .footer-container {
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap;
        padding: 20px;
        background: rgba(0, 0, 0, 0.8);
    }
    .social-icons img {
        width: 30px;
        margin-right: 10px;
        
    }
    .map-container {
    display: flex;
    justify-content: center;
    align-items: center;
    margin: 20px 0;
}

iframe {
    width: 90%; /* Makes it responsive */
    max-width: 500px; /* Limits max width */
    height: 300px;
    border-radius: 10px; /* Adds rounded corners */
    box-shadow: 0px 4px 8px rgba(255, 255, 255, 0.2); /* Light shadow */
}
    
    
    
    
    #founders {
    text-align: center;
    padding: 50px 20px;
    background-color: #000; /* Black background */
    color: #fff; /* White text */
}

.founders-container {
    display: flex;
    justify-content: center; /* Centers both images */
    align-items: center;
    gap: 50px; /* Adds space between founders */
    flex-wrap: wrap; /* Ensures responsiveness on smaller screens */
}

.founder {
    text-align: center;
    width: 300px; /* Set width to keep items aligned */
}

.founder-img {
    width: 250px;
    height: 250px;
    border-radius: 50%; /* Circular image */
    object-fit: cover;
    border: 3px solid #ffcc00; /* Yellow border for style */
    box-shadow: 0px 4px 8px rgba(255, 255, 255, 0.2); /* Light shadow */
}

.founder-name {
    font-size: 1.5rem;
    margin-top: 10px;
    color: #ffcc00; /* Yellow text for contrast */
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

.feedback-item {
    border: 1px solid #444;
    padding: 15px;
    margin-bottom: 15px;
    background: #222;  /* Darker background for contrast */
    color: white;
    border-radius: 10px;
    font-family: Arial, sans-serif;
    box-shadow: 0px 4px 8px rgba(255, 255, 255, 0.1);
}

.feedback-item h4 {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 5px;
    text-color:black;
}

.feedback-item p {
    font-size: 16px;
    margin: 5px 0;
}

/* Star styling */
.rating-stars {
    font-size: 20px;
    color: gold;
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
    <nav class="navbar navbar-expand-lg">
        <a class="navbar-brand" href="index.jsp">
            <img src="images/mainlogo.jpeg" alt="NutriFlex Logo" class="logo" height=120px>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <h1>NUTRIFLEX</h1>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="nav-links ml-auto">
                <li class="nav-item"><a class="nav-link" href="index.jsp" > Home </a></li>
                <li class="nav-item"><a class="nav-link" href="about.jsp"> About </a></li>
               
                <li class="nav-item"><a class="nav-link" href="UserRegister.jsp"> Sign Up </a></li>
                <li class="nav-item"><a class="nav-link" href="login.jsp"> Sign In </a></li>
                <li class="nav-item"><a class="nav-link" href="supplements.jsp" > Supplement Store </a></li>
            </ul>
        </div>
    </nav>
</header>

<main>
    <section id="hero">
        <div class="hero-overlay">
            <br><br><h1>Welcome to <span class="highlight">NutriFlex</span></h1>
            <p>Your ultimate health and fitness companion</p>
            <a href="about.jsp#features" class="btn btn-primary">Explore</a>
        </div>
    </section>

    <h2 class="section-title" style="text-align: center; margin-top: 30px;">Our Features</h2>
    <div class="cards-container">
        <div class="card"><img src="images/bodu.gif" alt="Daily Workout Plan"><h3>Daily Workout Plan</h3></div>
        <div class="card"><img src="images/back1.gif" alt="Best Gym Services"><h3>Best Gym Services</h3></div>
        <div class="card"><img src="images/diet3.jpg" alt="Daily Diet Plan"><h3>Daily Diet Plan</h3></div>
        <div class="card"><img src="images/pr.jpg" alt="Healthy Diet Plan"><h3>Healthy Diet Plan</h3></div>
        <div class="card"><img src="images/machine.jpg" alt="Yoga and Meditation"><h3>Modern Equipments</h3></div>
        <div class="card"><img src="images/collage3.png" alt="Nutrition Consultation"><h3>Positive Ambience</h3></div>
        <div class="card"><img src="images/chatboat.jpeg" alt="Supplement Advice"><h3>AI powered Chatbot</h3></div>
        <div class="card"><img src="images/trainer1.jpg" alt="Personal Trainer"><h3>Personal Trainer</h3></div>
    </div>

    <section id="gallery" style="text-align: center; margin-top: 50px;">
        <h2>Gym Pictures</h2>
        <img src="images/background3.jpg" width="350">
        <img src="images/background3.jpg" width="350">
        <img src="images/gym1.jpg" width="350">
    </section>

    <section id="map" style="text-align: center; margin-top: 50px;">
    <h2>Our Location</h2>
    <div class="map-container">
    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3304.196530028953!2d18.485900075153825!3d-34.09010547314277!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x1dcc41fb7bdb0c01%3A0x55b169fda6978c96!2sNutriFlex!5e0!3m2!1sen!2sin!4v1740042878500!5m2!1sen!2sin" 
    width="500" height="300" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade">
    </iframe>
    </div>
</section>


<section id="feedback" style="text-align: center; margin-top: 50px;">
    <h2>Feedback</h2>
    <p>We value your feedback! Please rate your experience and share your thoughts.</p>
    
    <!-- Feedback Submission Form -->
    <form action="submitFeedback.jsp" method="post" class="feedback-form">
        <div class="rating">
            <input type="radio" id="star5" name="rating" value="5"><label for="star5" class="star">★</label>
            <input type="radio" id="star4" name="rating" value="4"><label for="star4" class="star">★</label>
            <input type="radio" id="star3" name="rating" value="3"><label for="star3" class="star">★</label>
            <input type="radio" id="star2" name="rating" value="2"><label for="star2" class="star">★</label>
            <input type="radio" id="star1" name="rating" value="1"><label for="star1" class="star">★</label>
        </div>
        <textarea name="feedbacks" placeholder="Write your feedback here..." rows="4" cols="50" required></textarea><br>
        <input type="text" name="name" placeholder="Your Name (Optional)" class="input-field"><br>
        <input type="email" name="email" placeholder="Your Email (Optional)" class="input-field"><br>
        <button type="submit" class="btn btn-primary">Submit Feedback</button>
    </form>

</section>




    
    
    

    <section id="founders">
    <h2>Meet Our Founders</h2>
    <p>NutriFlex and Team</p>
    <div class="founders-container">
        <div class="founder">
            <img src="images/cbum.jpg" alt="Founder Christopher Adam Bumstead" class="founder-img">
            <p class="founder-name">Christopher Adam Bumstead</p>
        </div>
        <div class="founder">
            <img src="images/arnold.jpg" alt="Founder Arnold Schwarzenegger" class="founder-img">
            <p class="founder-name">Arnold Alois Schwarzenegger</p>
        </div>
    </div>
</section>
    
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
    </div>
</footer>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
</body>
</html>

