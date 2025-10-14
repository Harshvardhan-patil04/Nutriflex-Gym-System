<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Us</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .header {
    background: black;
    color: white;
    text-align: center;
    padding: 15px;
    position: relative;
}

.home-btn {
    position: absolute;
    right: 20px;
    top: 50%;
    transform: translateY(-50%);
    background: yellow;
    color: black;
    text-decoration: none;
    padding: 10px 15px;
    border-radius: 5px;
    font-weight: bold;
    border: none;
    cursor: pointer;
}

.home-btn:hover {
    background: orange;
}
        

        .container {
            width: 80%;
            margin: auto;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .contact-form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .contact-form input, .contact-form textarea, .contact-form select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .contact-form button {
            background: yellow;
            border: none;
            padding: 10px;
            font-size: 16px;
            cursor: pointer;
        }

        .map-container {
            margin-top: 20px;
            text-align: center;
        }

        .footer {
            background: black;
            color: white;
            padding: 20px;
            text-align: center;
        }

        .footer a {
            color: yellow;
            text-decoration: none;
            margin: 0 10px;
        }
        
    
        
    </style>
</head>
<body>

   
   <div class="header">
    <h1 style="display: inline-block; margin: 0;">Contact Us</h1>
    <a href="index.jsp" class="home-btn">Home</a>
</div>
   

    <div class="container">
        <h2>We'd Love to Hear From You</h2>
        <form class="contact-form" action="submitContact.jsp" method="post">
        
            <select>
                <option>Select a Department</option>
                <option>Customer Support</option>
                <option>Marketing</option>
                <option>Technical Support</option>
                <option>Advertise with Nutriflex</option>
                <option>General</option>
                <option>Interested In Franchise</option>
                
            </select>
            <input type="text" placeholder="Enter Name">
            <input type="email" placeholder="Enter Email">
            <input type="text" placeholder="Enter Phone">
            <textarea placeholder="Enter Message"></textarea>
            <button type="submit">Submit</button>
        </form>
    </div>

    <div class="map-container">
         <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3304.196530028953!2d18.485900075153825!3d-34.09010547314277!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x1dcc41fb7bdb0c01%3A0x55b169fda6978c96!2sNutriFlex!5e0!3m2!1sen!2sin!4v1740042878500!5m2!1sen!2sin" 
    width="100%" height="300" style="border:0;" allowfullscreen="" loading="lazy" >
    </iframe>
    </div>

    <div class="footer">
        <p>&copy; 2025 Your Gym. All rights reserved.</p>
        <p>
            <a href="privacyPolicy.jsp">Privacy Policy</a> |
            <a href="termsConditions.jsp">Terms & Conditions</a>
            <p>Email: nutriflex@gmail.com</p>
                <p>Phone: 020-26119057</p>
        </p>
    </div>
</body>
</html>
