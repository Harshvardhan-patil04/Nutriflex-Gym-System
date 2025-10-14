<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Supplement Store</title>
    <link rel="stylesheet" href="css/store.css">
    <style>
        html, body {
    height: 100%;
    margin: 0;
    padding: 0;
}

body {
    background: url('images/supplement.jpg') no-repeat center center/cover;
    background-attachment: fixed;
    background-size: cover;
    font-family: Arial, sans-serif;
    color: black;
}
        
        .store-container {
            max-width: 1200px;
            margin: auto;
            padding: 40px 20px;
        }
        h1 {
            text-align: center;
            margin-bottom: 40px;
        }
        .products {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px;
        }
.product-card {
    background: #1f1f1f;
    width: 300px;
    border-radius: 16px;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.6);
    overflow: hidden;
    text-align: center;
    transition: transform 0.4s ease, box-shadow 0.4s ease;
    margin: 20px;
    border: 1px solid #333;
    position: relative;
}

.product-card:hover {
    transform: translateY(-12px) scale(1.02);
    box-shadow: 0 0 25px rgba(255, 193, 7, 0.5), 0 0 50px rgba(255, 193, 7, 0.2);
}

.product-card img {
    width: 100%;
    height: 220px;
    object-fit: cover;
    border-bottom: 2px solid #292929;
    transition: transform 0.4s ease;
}

.product-card:hover img {
    transform: scale(1.05);
}

.product-card h3 {
    font-size: 1.3rem;
    margin: 15px 0 10px;
    color: #ffc107;
}

.product-card p {
    font-size: 0.95rem;
    padding: 0 15px;
    color: #ccc;
}

.product-card .price {
    font-size: 1.1rem;
    font-weight: bold;
    margin: 10px 0;
    color: #fff;
}

.supplement-section .product-card .btn {
    display: inline-block;
    background: #333;
    color: #ffc107;
    padding: 10px 16px;
    border-radius: 8px;
    margin: 15px 0 20px;
    text-decoration: none;
    font-weight: bold;
    transition: all 0.3s ease;
    cursor: pointer;
    border: 1px solid #555;
    box-shadow: 0 0 6px rgba(255, 193, 7, 0.3);
    position: relative;
    overflow: hidden;
}

.supplement-section .product-card .btn::after {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: rgba(255, 193, 7, 0.15);
    transition: left 0.4s ease-in-out;
}

.supplement-section .product-card .btn:hover::after {
    left: 100%;
}

.supplement-section .product-card .btn:hover {
    background: #444;
    color: #fff;
    box-shadow: 0 0 12px rgba(255, 193, 7, 0.6);
}




        
        footer {
            text-align: center;
            padding: 20px;
            background-color: #222;
            color: white;
            margin-top: 50px;
        }
    </style>
</head>
<body>

<div class="store-container">
    <h1>Supplementary Products</h1>
    <div class="products">
    

        <!-- Product 1 -->
        <!-- View More Button -->


<!-- Product Card -->
<div class="product-card">
    <img src="images/whey.JPG" alt="Whey Protein">
    <h3>Optimum Nutrition (ON) Gold Standard 100% Whey Protein Powder</h3>
    <p>5 lbs, 2.27 kg (Double Rich Chocolate), Primary Source Isolate, For Men and Women</p>
    <div class="price">₹2,499</div>
    <form action="dummyPayment.jsp" method="POST">
        <input type="hidden" name="product" value="Whey Protein">
        <input type="hidden" name="amount" value="2499">
        <button type="submit" class="buy-btn">Buy Now</button>
    </form>
    <a href="wheyProducts.jsp">View More Whey Products</a>
</div>
        

        <!-- Product 2 -->
        <div class="product-card">
            <img src="images/creatine.jpg" alt="Creatine">
            <h3>MuscleBlaze Creatine Monohydrate CreAMP</h3>
            <p>250 g (0.55 lb), Citrus Blast. Improves strength and performance.</p>
            <div class="price">₹999</div>
            <form action="dummyPayment.jsp" method="POST">
                <input type="hidden" name="product" value="Creatine">
                <input type="hidden" name="amount" value="999">
                <button type="submit" class="buy-btn">Buy Now</button>
            </form>
            <a href="creatineProducts.jsp">View More Creatine Products</a>
            
        </div>
        
        <!-- Product 3 -->
        <div class="product-card">
            <img src="images/fishoil.jpg" alt="FishOil">
            <h3>YouWeFit Omega-3 Fish Oil (30 Capsules)</h3>
            <p>1250mg Triple Strength Fish Oil Softgel Capsules (540mg EPA & 360mg DHA) | No Fishy Burps | For Joint & Heart Health, 80 grams</p>
            <div class="price">₹499</div>
            <form action="dummyPayment.jsp" method="POST">
                <input type="hidden" name="product" value="Fish-Oil">
                <input type="hidden" name="amount" value="499">
                <button type="submit" class="buy-btn">Buy Now</button>
            </form>
            <a href="fishOilProducts.jsp">View More Fish Oil Products</a>
            
        </div>
        
        
        <div class="product-card">
            <img src="images/preworkout.jpg" alt="Pre-Workout">
            <h3>MuscleBlaze Pre Workout Wrathx</h3>
            <p>Get energized before your training with our advanced formula and Creapure,Nitroblaze & Bioperine (Fruit Fury,340 G,20 Servings),Powder,1 Count </p>
            <div class="price">₹1,299</div>
          <form action="dummyPayment.jsp" method="POST">
                <input type="hidden" name="product" value="Pre-Workout">
                <input type="hidden" name="amount" value="1299">
                <button type="submit" class="buy-btn">Buy Now</button>
            </form>
            <a href="preWorkoutProducts.jsp">View More Pre-Workout Products</a>
        </div>
        

        <!-- Add more products as needed -->

    </div>
</div>
<footer>
        <p>&copy; 2025 NutriFlex Gym. All rights reserved.</p>
    </footer>
</body>
</html>
