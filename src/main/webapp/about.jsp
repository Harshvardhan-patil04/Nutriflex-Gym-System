<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Gym</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/home1.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #111;
            color: white;
        }



        /* About Gym */
        .about-section {
            padding: 30px;
            text-align: center;
        }

        .about-section img {
            width: 60%;
            border-radius: 5px;
            box-shadow: 0px 5px 15px rgba(255, 255, 255, 0.2);
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
        
        

/* Trainer Section */
        .trainers {
            text-align: center;
            padding: 50px;
            background-color: #222;
        }

        .trainer-card {
            text-align: center;
            padding: 20px;
            border-radius: 10px;
            background-color: #333;
            box-shadow: 0px 5px 15px rgba(255, 255, 255, 0.1);
            transition: transform 1.0s ease, box-shadow 0.8s ease;
    		opacity: 0;  /* Initially hidden */
    		transform: translateX(-50px);  /* Start off-screen */
    		transition: opacity 1.0s ease-out, transform 1.0s ease-out;
        }

        .trainer-card:hover {
            transform: scale(1.5);
        }

        .trainer-card img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            margin-bottom: 15px;
        }
        .trainer-card.active {
    opacity: 1;
    transform: translateX(0);
Â Â 		}
        
  		

        /* Gym Activities */
        .activities {
            text-align: center;
            padding: 50px;
            background-color: #111;
        }

        .activity-card {
            text-align: center;
            padding: 20px;
            border-radius: 10px;
            background-color: #222;
            box-shadow: 0px 5px 15px rgba(255, 255, 255, 0.1);
            transition: 0.3s;
        }

        .activity-card:hover {
            transform: scale(1.05);
        }

        .activity-card img {
            width: 100%;
            border-radius: 10px;
            height: 200px;
        }
    </style>
</head>
<body>
<header>
        <nav class="navbar">
            <div class="logo">
                <a href="#index.jsp">
                <img src="images/file.png" alt="Logo">   
                </a>
            </div>
            <ul class="nav-links">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="about.jsp">About</a></li>
                <li><a href="UserRegister.jsp">SignUp</a></li>
                <li><a href="login.jsp">SignIn</a></li>
            </ul>
        </nav>
    </header>
    
        
    

   

    <!-- About Gym -->
    <section class="about-section container">
        <h2>Why Choose Our Gym?</h2>
        <p>Our gym provides top-notch training facilities, personalized fitness programs, and expert trainers to help you achieve your fitness goals.</p>
        <p><b>Expert Trainers & Personalized Guidance</b>: Our certified trainers provide personalized workout plans and one-on-one coaching to help you achieve your fitness goals faster</p>
        <p><b>Variety of Fitness Programs</b>:From strength training, HIIT, Yoga, Zumba, and CrossFit to weight loss programs, we have something for everyone</p>
        <p><b>24/7 Access & Flexible Memberships</b>:Our gym is open 24/7, so you can work out whenever it fits your schedule.Plus, we offer affordable membership plans with no hidden fees</p>
        
        <img src="images/interior.jpg" alt="Gym Interior"> <!-- Replace with actual image -->
    </section>

    <!-- Trainers Section -->
    <section class="trainers container">
    
        <h2>Meet Our Trainers</h2>
        <div class="row">
            <div class="col-md-4">
                <div class="trainer-card">
                    <img src="images/Train.jpg" alt="Trainer 1">
                    <h4>John Doe</h4>
                    <p><b>Certified Strength Coach</b></p>
                    <p><b>Certificates:</b> 
                    <br>Certified Strength and Conditioning Specialist (CSCS - NSCA)</br> <br>National Academy of Sports Medicine Performance Enhancement Specialist (NASM-PES)</br><br>National Strength and Conditioning Association - Certified Personal Trainer (NSCA-CPT)</br> <br>International Sports Sciences Association (ISSA - Strength & Conditioning)</br><br>
                    </p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="trainer-card">
                    <img src="images/trainer2.jpg" alt="Trainer 2">
                    <h4>Emily Smith</h4>
                    <p>Yoga & Pilates Expert</p>
                    <p><b>Certificates:</b>
                    <br>Registered Yoga Teacher 200 (RYT-200) â€“ Beginner level (200 hours)</br><br>Registered Yoga Teacher 500 (RYT-500) â€“ Advanced level (500 hours)</br>
					<br>Sivananda Yoga Certification (Focuses on classical yoga)</br><br>ASI Pilates Certification (Body Arts and Science International)</br><br>Polestar Pilates Certification</br>
					</p>               
                </div>
            </div>
            <div class="col-md-4">
                <div class="trainer-card">
                    <img src="images/trainer3.jpg" alt="Trainer 3">
                    <h4>Michael Lee</h4>
                    <p>Personal Trainer & Nutritionist</p>
                    <p><b>Certificates:</b>
                    <br>National Academy of Sports Medicine (NASM - CPT)</br><br>International Sports Sciences Association (ISSA - CPT)</br><br>National Federation of Professional Trainers (NFPT)</br><br>Precision Nutrition Level 1 (PN1)</br>
                    <br>National Academy of Metabolic Science (NAMS)</br></p>
                </div>
            </div>
        </div>
    </section>

    <!-- Gym Activities -->
    <section class="activities container">
        <h2>Our Gym Activities</h2>
        <div class="row">
            <div class="col-md-4">
                <div class="activity-card">
                    <img src="images/weightlifting.jpg" alt="Weight Lifting">
                    <h4>Weight Lifting</h4>
                    <p>Build strength and muscle with expert weight training.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="activity-card">
                    <img src="images/cardio.jpg" alt="Cardio">
                    <h4>Cardio Workouts</h4>
                    <p>High-energy cardio sessions for endurance and weight loss.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="activity-card">
                    <img src="images/yoga.jpg" alt="Yoga">
                    <h4>Yoga & Meditation</h4>
                    <p>Relax and stretch with our professional yoga sessions.</p>
                </div>
            </div>
        </div>
    </section>
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
            
            <div class="footer-section" >
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
    const trainerCards = document.querySelectorAll(".trainer-card");

    const observer = new IntersectionObserver((entries, observer) => {
        entries.forEach((entry, index) => {
            if (entry.isIntersecting) {
                setTimeout(() => {
                    entry.target.classList.add("active");
                }, index * 200); // Stagger effect (200ms delay per card)

                observer.unobserve(entry.target);  // Stop observing after animation
            }
        });
    }, { threshold: 0.3 });

    trainerCards.forEach(card => observer.observe(card));
});
</script>
        
        
        

</body>
</html>

