<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Our Services</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        body {
            background-image: url('images/services-bg.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            color: white;
            text-align: center;
            font-family: Arial, sans-serif;
        }

        .container {
            padding: 50px;
        }

        .search-bar {
            padding: 12px;
            width: 100%;
            max-width: 400px;
            margin: 20px auto;
            display: block;
            border: 2px solid #0ff;
            border-radius: 25px;
            outline: none;
            background: rgba(255, 255, 255, 0.8);
            font-size: 16px;
            text-align: center;
            transition: all 0.3s;
        }

        .search-bar:focus {
            border-color: yellow;
            box-shadow: 0 0 10px yellow;
        }

        .services {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        .service-card {
    background: linear-gradient(135deg, #ff6600, #ff9900); /* New gradient background */
    border: 2px solid rgba(255, 255, 255, 0.5);
    border-radius: 12px;
    padding: 20px;
    width: 250px;
    box-shadow: 0 0 15px rgba(255, 255, 255, 0.3);
    text-align: center;
    transition: all 0.3s ease-in-out;
    color: white;
}

.service-card:hover {
    transform: scale(1.05);
    box-shadow: 0 0 20px rgba(255, 255, 255, 0.7);
}
        

        .service-card img {
            width: 100%;
            height: 150px;
            border-radius: 8px;
            margin-bottom: 10px;
        }

        h2 {
            margin-bottom: 20px;
        }
        
        
        @keyframes slideIn {
    from {
        transform: translateY(50px);
        opacity: 0;
    }
    to {
        transform: translateY(0);
        opacity: 1;
    }
}

.service-card {
    background: linear-gradient(135deg, #ff6600, #ff9900);
    border: 2px solid rgba(255, 255, 255, 0.5);
    border-radius: 12px;
    padding: 20px;
    width: 250px;
    box-shadow: 0 0 15px rgba(255, 255, 255, 0.3);
    text-align: center;
    transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
    color: white;
    opacity: 0;
    animation: slideIn 0.8s ease-out forwards;
}

.service-card:nth-child(1) { animation-delay: 0.2s; }
.service-card:nth-child(2) { animation-delay: 0.4s; }
.service-card:nth-child(3) { animation-delay: 0.6s; }
.service-card:nth-child(4) { animation-delay: 0.8s; }
.service-card:nth-child(5) { animation-delay: 1s; }
.service-card:nth-child(6) { animation-delay: 1.2s; }
.service-card:nth-child(7) { animation-delay: 1.4s; }
.service-card:nth-child(8) { animation-delay: 1.6s; }

.service-card:hover {
    transform: scale(1.05) translateY(-5px);
    box-shadow: 0 0 20px rgba(255, 255, 255, 0.7);
}
        
        
        
        
        
    </style>
    <script>
        function searchServices() {
            let input = document.getElementById('search').value.toLowerCase();
            document.querySelectorAll('.service-card').forEach(card => {
                card.style.display = card.innerText.toLowerCase().includes(input) ? 'block' : 'none';
            });
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>Our Services</h2>
        <input type="text" id="search" class="search-bar" placeholder="Search services..." onkeyup="searchServices()">
        
        <div class="services">
            <div class="service-card">
                <img src="images/personal-training.jpg" alt="Personal Training">
                <p>💪 Personal Training</p>
            </div>
            <div class="service-card">
                <img src="images/strength-training.jpg" alt="Strength Training">
                <p>🏋️ Strength Training</p>
            </div>
            <div class="service-card">
                <img src="images/yoga1.jpg" alt="Yoga & Meditation">
                <p>🧘 Yoga & Meditation</p>
            </div>
            <div class="service-card">
                <img src="images/boxing.jpg" alt="Boxing & Kickboxing">
                <p>🥊 Boxing & Kickboxing</p>
            </div>
            <div class="service-card">
                <img src="images/cycling.jpg" alt="Indoor Cycling">
                <p>🚴 Indoor Cycling</p>
            </div>
            <div class="service-card">
                <img src="images/hiit.jpg" alt="HIIT Workouts">
                <p>🔥 HIIT Workouts</p>
            </div>
            <div class="service-card">
                <img src="images/zumba.jpg" alt="Zumba & Dance Classes">
                <p>🩰 Zumba & Dance Classes</p>
            </div>
            <div class="service-card">
                <img src="images/nutrition.jpg" alt="Nutrition Coaching">
                <p>🍏 Nutrition Coaching</p>
            </div>
        </div>
    </div>
</body>
</html>
