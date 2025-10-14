<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

    #hero {
        display: flex;
        justify-content: center;
        align-items: center;
        text-align: center;
        height: 100vh;
        background: url('images/gymbc.gif') no-repeat center center/cover;
        position: relative;
    }
    .hero-overlay {
        background: rgba(0, 0, 0, 0.6);
        padding: 50px;
        border-radius: 10px;
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
    #founders {
        text-align: center;
        margin-top: 50px;
        padding: 40px;
        background: rgba(0, 0, 0, 0.8);
        border-radius: 10px;
    }
    .founder-img {
        width: 200px;
        height: 200px;
        object-fit: cover;
        border-radius: 50%;
        margin-top: 20px;
    }
    .workout-section {
        text-align: center;
        margin-top: 10px;
        padding: 40px;
    }
    .workout-container {
        display: flex;
        margin-top: 30px;
        flex-wrap: wrap;
        justify-content: center;
        gap: 20px;
    }
    .workout-card {
        background: rgba(0, 0, 0, 0.8);
        padding: 15px;
        border-radius: 8px;
        text-align: center;
        width: 250px;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }
    .workout-card img {
        width: 100%;
        height: 150px;
        object-fit: cover;
        border-radius: 5px;
    }
    .workout-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 10px 20px rgba(255, 255, 255, 0.3);
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
                <li class="nav-item"><a class="nav-link" href="Workouts.jsp"> Workouts </a></li>
                <li class="nav-item"><a class="nav-link" href="login.jsp"> Diet Plans </a></li>
                <li class="nav-item"><a class="nav-link" href="UserRegister.jsp"> Sign Up </a></li>
                <li class="nav-item"><a class="nav-link" href="login.jsp"> Sign In </a></li>
            </ul>
        </div>
    </nav>
</header>

<section class="workout-section">
    <h2>Chest Workouts</h2>
    <div class="workout-container">
        <div class="workout-card">
            <img src="images/bench.gif" alt="Biceps Workout">
            <h4>Bench Press</h4>
            <p>Targets Our Overall Chest Muscles</p>
        </div>
        <div class="workout-card">
            <img src="images/pushups.gif" alt="Chest Workout">
            <h4>Push ups</h4>
            <p>Build your chest with Pushups and overall body.</p>
        </div>
        <div class="workout-card">
            <img src="images/chest3.gif" alt="Abs Workout">
            <h4>Cable Extensions</h4>
            <p>Get toned abs with crunches, leg raises, and planks.</p>
        </div>
        <div class="workout-card">
            <img src="images/chest.jpg" alt="Legs Workout">
            <h4>Dumbell Press</h4>
            <p>Strengthen your lower body with squats, lunges, and deadlifts.</p>
        </div>
    </div>
</section>

<section class="workout-section">
    <h2>Arms Workout</h2>
    <div class="workout-container">
        <div class="workout-card">
            <img src="images/bicep1.gif" alt="Biceps Workout">
            <h4>Hammer Curls</h4>
            <p>Targets overall Bicep and arm muscle</p>
        </div>
        <div class="workout-card">
            <img src="images/bicep2.gif" alt="Chest Workout">
            <h4>Barbell Curls</h4>
            <p>Build your Biceps using Bar weights.</p>
        </div>
        <div class="workout-card">
            <img src="images/shoulder1.gif" alt="Abs Workout">
            <h4>Lateral Raises</h4>
            <p>Get toned Shoulders using Dumbells.</p>
        </div>
        <div class="workout-card">
            <img src="images/tricep.gif" alt="Legs Workout">
            <h4>Triceps</h4>
            <p>Strengthen your Tricep muscles providing strech.</p>
        </div>
    </div>
</section>

<section class="workout-section">
    <h2>Back Workout</h2>
    <div class="workout-container">
        <div class="workout-card">
            <img src="images/arms.webp" alt="Biceps Workout">
            <h4>Pull Ups</h4>
            <p>Strengthen your arms with curls, hammer curls, and chin-ups.</p>
        </div>
        <div class="workout-card">
            <img src="images/back1.gif" alt="Chest Workout">
            <h4>Latpull Row</h4>
            <p>Build your chest with bench presses, push-ups, and dips.</p>
        </div>
        <div class="workout-card">
            <img src="images/shoulder.webp" alt="Abs Workout">
            <h4>Latpull Down</h4>
            <p>Get toned abs with crunches, leg raises, and planks.</p>
        </div>
        <div class="workout-card">
            <img src="images/shoulder2.gif" alt="Legs Workout">
            <h4>Shrugs</h4>
            <p>Strengthen your lower body with squats, lunges, and deadlifts.</p>
        </div>
    </div>
</section>

<section class="workout-section">
    <h2>Leg Workouts</h2>
    <div class="workout-container">
        <div class="workout-card">
            <img src="images/calves.avif" alt="Biceps Workout">
            <h4>Calves</h4>
            <p>Strengthen your arms with curls, hammer curls, and chin-ups.</p>
        </div>
        <div class="workout-card">
            <img src="images/leg.webp" alt="Chest Workout">
            <h4>Leg Press</h4>
            <p>Build your chest with bench presses, push-ups, and dips.</p>
        </div>
        <div class="workout-card">
            <img src="images/legday.webp" alt="Abs Workout">
            <h4>Lunges</h4>
            <p>Get toned abs with crunches, leg raises, and planks.</p>
        </div>
        <div class="workout-card">
            <img src="images/leg1.gif" alt="Legs Workout">
            <h4>Squats</h4>
            <p>Strengthen your lower body with squats, lunges, and deadlifts.</p>
        </div>
    </div>
</section>
<footer>
    <div class="footer-container">
        <div class="footer-section">
            <h3>Quick Links</h3>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="#">Services</a></li>
                <li><a href="contact.jsp">Contact</a></li>
            </ul>
        </div>
        <div class="footer-section">
            <h3>Contact Us</h3>
            <p>Email: nutriflex007@gmail.com</p>
            <p>Phone: +91 96239 37162</p>
        </div>
    </div>
</footer>
</body>
</html>