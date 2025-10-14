<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Supplement" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <title>Creatine Products</title>
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

        .search-bar {
            text-align: center;
            margin-bottom: 30px;
        }

        .search-bar input[type="text"] {
            padding: 10px;
            width: 300px;
            border: 1px solid #ccc;
            border-radius: 20px;
        }

        .search-bar button {
            padding: 10px 20px;
            background-color: #007bff;
            border: none;
            color: white;
            border-radius: 20px;
            cursor: pointer;
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

<h1>Creatine Products</h1>



<div class="products">
    <%
        List<Supplement> products = (List<Supplement>) request.getAttribute("creatineProducts");
    if (products == null) {
        products = new ArrayList<>();
        products.add(new Supplement("MuscleTech Platinum Creatine", 1199.0, "Micronized creatine for muscle strength", "images/creatine1.JPG"));
        products.add(new Supplement("Cellucor Cor-Performance Creatine", 1399.0, "Supports strength and performance", "images/creatine2.JPG"));
        products.add(new Supplement(" Optimum Nutrition Micronized Creatine ", 1299.0, "Unflavored, 5g per serving", "images/creatine6.JPG"));
        
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
    	        <button type="submit" style="margin-top: 10px; padding: 8px 16px; background-color: green; color: white; border: none; border-radius: 5px; cursor: pointer;">Buy Now</button>
    	    </form>
    	</div>
    	<%
    	}

%>
</div>

   
    
    <%
        
    %>
</div>

</body>
</html>
