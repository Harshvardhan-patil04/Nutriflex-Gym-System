<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Supplement" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <title>Fish Oil Products</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            padding: 40px;
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
        }

        .products {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        .product-card {
            background-color: white;
            border-radius: 12px;
            padding: 20px;
            width: 250px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            text-align: center;
            transition: 0.3s ease-in-out;
        }

        .product-card:hover {
            transform: scale(1.03);
        }

        .product-card img {
            max-width: 100%;
            height: 180px;
            object-fit: contain;
            margin-bottom: 15px;
        }

        .product-name {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .product-price {
            color: green;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .product-desc {
            font-size: 14px;
            color: #555;
            margin-bottom: 15px;
        }

        .buy-btn {
            padding: 10px 20px;
            background-color: #28a745;
            border: none;
            color: white;
            border-radius: 5px;
            cursor: pointer;
        }

        .buy-btn:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<h1>Fish Oil Products</h1>

<div class="products">
    <%
        List<Supplement> products = (List<Supplement>) request.getAttribute("fishOilProducts");
        if (products == null) {
            products = new ArrayList<>();
            products.add(new Supplement("Optimum Nutrition Fish Oil", 899.0, "300mg Omega-3 fatty acids per serving", "images/fish1.JPG"));
            products.add(new Supplement("MuscleBlaze Fish Oil", 749.0, "Triple strength, supports heart and joints", "images/fish2.PNG"));
            products.add(new Supplement("TrueBasics Omega-3", 999.0, "High EPA & DHA for brain & heart", "images/fish3.JPG"));
        }

        for (Supplement s : products) {
    %>
    <div class="product-card">
        <img src="<%= s.getImage() %>" alt="<%= s.getName() %>">
        <div class="product-name"><%= s.getName() %></div>
        <div class="product-price">₹ <%= s.getPrice() %></div>
        <div class="product-desc"><%= s.getDescription() %></div>

        <form action="dummyPayment.jsp" method="POST">
            <input type="hidden" name="product" value="<%= s.getName() %>">
            <input type="hidden" name="amount" value="<%= s.getPrice() %>">
            <button type="submit" class="buy-btn">Buy Now</button>
        </form>
    </div>
    <%
        }
    %>
</div>

</body>
</html>
