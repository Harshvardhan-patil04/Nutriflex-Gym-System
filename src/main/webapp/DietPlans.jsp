<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Diet Plans | NutriFlex</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/home1.css">
<style>
    body {
        background-color: #111;
        color: white;
        font-family: Times New Roman, serif;
    }
    .diet-section {
        text-align: center;
        margin-top: 20px;
        padding: 40px;
    }
    .diet-container {
        display: flex;
        justify-content: center;
        flex-wrap: wrap;
        gap: 20px;
        margin-top: 30px;
    }
    .diet-card {
        background: rgba(0, 0, 0, 0.8);
        padding: 15px;
        border-radius: 8px;
        text-align: center;
        width: 250px;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }
    .diet-card img {
        width: 100%;
        height: 150px;
        object-fit: cover;
        border-radius: 5px;
    }
    .diet-card:hover {
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


<section class="diet-section">
    <h2>Weight Loss</h2>
    <div class="diet-container">
        <div class="diet-card">
            <img src="images/diet1.jpg" alt="Weight Loss">
            <h4>Low Calorie Fruit Salad</h4>
            <p>Low-calorie diet with balanced macros to help reduce weight effectively.</p>
        </div>
        <div class="diet-card">
            <img src="images/diet7.jpg" alt="Muscle Build">
            <h4>Fruits & Vegetables</h4>
            <p>High-protein diet plan to support muscle growth and strength.</p>
        </div>
        <div class="diet-card">
            <img src="images/diet2.jpg" alt="Veg Diet">
            <h4>Dal Rice</h4>
            <p>Plant-based nutrition for a healthy and balanced diet.</p>
        </div>
        <div class="diet-card">
            <img src="images/diet1.jpg" alt="Non-Veg Diet">
            <h4>Mix-Fruit</h4>
            <p>Protein-rich diet with lean meats, eggs, and seafood.</p>
        </div>
    </div>
</section>

<section class="diet-section">
    <h2>Muscle Build</h2>
    <div class="diet-container">
        <div class="diet-card">
            <img src="images/diet3.jpg" alt="Weight Loss">
            <h4>Weight Loss</h4>
            <p>Low-calorie diet with balanced macros to help reduce weight effectively.</p>
        </div>
        <div class="diet-card">
            <img src="images/diet4.jpg" alt="Muscle Build">
            <h4>Muscle Build</h4>
            <p>High-protein diet plan to support muscle growth and strength.</p>
        </div>
        <div class="diet-card">
            <img src="images/diet5.jpg" alt="Veg Diet">
            <h4>Veg Diet</h4>
            <p>Plant-based nutrition for a healthy and balanced diet.</p>
        </div>
        <div class="diet-card">
            <img src="images/diet6.jpg" alt="Non-Veg Diet">
            <h4>Non-Veg Diet</h4>
            <p>Protein-rich diet with lean meats, eggs, and seafood.</p>
        </div>
    </div>
</section>

<section class="diet-section">
    <h2>Vegan Choices</h2>
    <div class="diet-container">
        <div class="diet-card">
            <img src="images/diet3.jpg" alt="Weight Loss">
            <h4>Weight Loss</h4>
            <p>Low-calorie diet with balanced macros to help reduce weight effectively.</p>
        </div>
        <div class="diet-card">
            <img src="images/diet4.jpg" alt="Muscle Build">
            <h4>Muscle Build</h4>
            <p>High-protein diet plan to support muscle growth and strength.</p>
        </div>
        <div class="diet-card">
            <img src="images/diet5.jpg" alt="Veg Diet">
            <h4>Veg Diet</h4>
            <p>Plant-based nutrition for a healthy and balanced diet.</p>
        </div>
        <div class="diet-card">
            <img src="images/diet6.jpg" alt="Non-Veg Diet">
            <h4>Non-Veg Diet</h4>
            <p>Protein-rich diet with lean meats, eggs, and seafood.</p>
        </div>
    </div>
</section>

<section class="diet-section">
    <h2>Non Veg </h2>
    <div class="diet-container">
        <div class="diet-card">
            <img src="images/diet3.jpg" alt="Weight Loss">
            <h4>Weight Loss</h4>
            <p>Low-calorie diet with balanced macros to help reduce weight effectively.</p>
        </div>
        <div class="diet-card">
            <img src="images/diet4.jpg" alt="Muscle Build">
            <h4>Muscle Build</h4>
            <p>High-protein diet plan to support muscle growth and strength.</p>
        </div>
        <div class="diet-card">
            <img src="images/diet5.jpg" alt="Veg Diet">
            <h4>Veg Diet</h4>
            <p>Plant-based nutrition for a healthy and balanced diet.</p>
        </div>
        <div class="diet-card">
            <img src="images/diet6.jpg" alt="Non-Veg Diet">
            <h4>Non-Veg Diet</h4>
            <p>Protein-rich diet with lean meats, eggs, and seafood.</p>
        </div>
    </div>
</section>

<footer>
    <div class="footer-container">
        <div class="footer-section">
            <h3>Quick Links</h3>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="workouts.jsp">Workouts</a></li>
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
</body>
</html>
