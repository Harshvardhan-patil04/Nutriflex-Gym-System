<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String product = request.getParameter("product");
    String amount = request.getParameter("amount");
    
    String email = request.getParameter("email");
    String contact = request.getParameter("contact");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment Success</title>
    <style>
        html, body {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
            font-family: Arial, sans-serif;
            background: #e0ffe0;
        }

        .content {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px;
        }

        .msg-box {
            background: white;
            padding: 40px;
            max-width: 500px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            text-align: center;
            animation: popUp 0.8s ease-out;
            position: relative;
        }

        h2 {
            color: green;
            font-size: 28px;
        }

        footer {
            text-align: center;
            padding: 20px;
            background-color: #222;
            color: white;
        }

        @keyframes popUp {
            0% {
                transform: scale(0.5);
                opacity: 0;
            }
            100% {
                transform: scale(1);
                opacity: 1;
            }
        }
    </style>
</head>
<body>

<div class="content">
    <div class="msg-box">
        <h2>🎉 Payment Successful!</h2>
        <p>You have successfully purchased <b><%= product %></b></p>
        <p>Amount Paid: ₹<%= amount %></p>
        <a href="supplements.jsp">Go Back to Store</a>
    </div>
</div>



<!-- Confetti JS for celebration effect -->
<script src="https://cdn.jsdelivr.net/npm/canvas-confetti@1.6.0/dist/confetti.browser.min.js"></script>
<script>
    // Celebration animation
    const duration = 3 * 1000;
    const animationEnd = Date.now() + duration;
    const defaults = { startVelocity: 30, spread: 360, ticks: 60, zIndex: 999 };

    function randomInRange(min, max) {
        return Math.random() * (max - min) + min;
    }

    const interval = setInterval(function() {
        const timeLeft = animationEnd - Date.now();

        if (timeLeft <= 0) {
            return clearInterval(interval);
        }

        confetti(Object.assign({}, defaults, {
            particleCount: 60,
            origin: {
                x: randomInRange(0.1, 0.9),
                y: Math.random() - 0.2
            }
        }));
    }, 250);
</script>

</body>
</html>
