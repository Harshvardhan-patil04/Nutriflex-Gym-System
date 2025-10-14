<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String product = request.getParameter("product");
    String amount = request.getParameter("amount");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dummy Payment Gateway</title>
    <style>
        body {
        background: url('images/payment-bg.jpg') no-repeat center center/cover;
        font-family: 'Segoe UI', sans-serif;
        color: #fff;
        margin: 0;
        padding: 50px;
        display: flex;
        justify-content: center;
    }

    .payment-box {
        background: rgba(30, 30, 30, 0.95);
        padding: 40px 30px;
        border-radius: 20px;
        box-shadow: 0 0 30px rgba(0, 255, 200, 0.2);
        max-width: 400px;
        width: 100%;
        text-align: center;
        animation: fadeIn 0.6s ease-in-out;
    }

    .payment-box h2 {
        color: #00ffc8;
        margin-bottom: 10px;
    }

    .payment-box p {
        font-size: 18px;
        color: #ffdd57;
        margin-bottom: 25px;
    }

    .payment-box form input {
        width: 100%;
        padding: 12px;
        margin: 10px 0;
        border: none;
        border-radius: 10px;
        background: #3c3c3c;
        color: #fff;
        font-size: 15px;
        transition: all 0.3s ease;
        box-shadow: inset 0 0 5px rgba(255,255,255,0.1);
    }

    .payment-box form input:focus {
        outline: none;
        background: #4c4c4c;
        box-shadow: 0 0 8px rgba(0, 255, 200, 0.4);
    }

    .pay-btn {
        background: #00ffc8;
        color: #000;
        padding: 12px 25px;
        margin-top: 25px;
        border: none;
        border-radius: 25px;
        font-size: 16px;
        cursor: pointer;
        transition: background 0.3s ease, transform 0.2s ease;
        box-shadow: 0 0 10px rgba(0, 255, 200, 0.4);
    }

    .pay-btn:hover {
        background: #00e6b8;
        transform: scale(1.05);
        box-shadow: 0 0 15px rgba(0, 255, 200, 0.6);
    }

    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: translateY(30px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
    </style>
</head>
<body>

<div class="payment-box">
    <h2>Payment for <%= product %></h2>
    <p>Amount: ₹<%= amount %></p>

    <form action="Paymentsuccess.jsp" method="POST">
        <input type="hidden" name="product" value="<%= product %>">
        <input type="hidden" name="amount" value="<%= amount %>">

        <input type="text" name="name" placeholder="Name on Card" required>
        <input type="text" name="card" placeholder="Card Number" required>
        <input type="number" name="cvv" placeholder="CVV" required>
        <input type="email" name="email" placeholder="Email Address" required>
        <input type="tel" name="contact" placeholder="Contact Number" pattern="[0-9]{10}" required>

        <button class="pay-btn" type="submit">Pay Now</button>
    </form>
</div>

</body>
</html>
