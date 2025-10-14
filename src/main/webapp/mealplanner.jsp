<%@ page import="java.sql.*, java.util.*" %>
<%@ page session="true" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String prevBreakfast = "", prevLunch = "", prevDinner = "", prevSnacks = "";

    try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gym", "root", "root");
         PreparedStatement ps = conn.prepareStatement("SELECT * FROM mealplan WHERE username=? ORDER BY date DESC LIMIT 1")) {

        Class.forName("com.mysql.cj.jdbc.Driver");
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            prevBreakfast = rs.getString("breakfast");
            prevLunch = rs.getString("lunch");
            prevDinner = rs.getString("dinner");
            prevSnacks = rs.getString("snacks");
        }
    } catch (Exception e) {
        out.println("Error: " + e);
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Meal Planner</title>
    <style>
        body {
            background-color: #121212;
            color: #fff;
            font-family: sans-serif;
        }
        select, button {
            padding: 10px;
            margin: 10px 0;
            width: 100%;
        }
        .container {
            width: 60%;
            margin: auto;
        }
        h2 {
            color: #00ffe7;
        }
        .neon-label {
            color: #f8d210;
            text-shadow: 0 0 5px #f8d210, 0 0 10px #f8d210;
        }
        .btn-neon {
            background-color: #f8d210;
            border: none;
            color: black;
            padding: 10px 20px;
            margin-right: 10px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Welcome <%= username %> 👋</h2>
    <h3>Your Interactive Meal Planner</h3>

    <form method="post" action="savemeal.jsp" id="mealForm">
        <label class="neon-label" for="breakfast">Breakfast</label>
        <select name="breakfast" id="breakfast">
            <option value="Oats" <%= prevBreakfast.equals("Oats") ? "selected" : "" %>>Oats</option>
            <option value="Eggs & Bread" <%= prevBreakfast.equals("Eggs & Bread") ? "selected" : "" %>>Eggs & Bread</option>
            <option value="Smoothie" <%= prevBreakfast.equals("Smoothie") ? "selected" : "" %>>Smoothie</option>
        </select>

        <label class="neon-label" for="lunch">Lunch</label>
        <select name="lunch" id="lunch">
            <option value="Chicken & Rice" <%= prevLunch.equals("Chicken & Rice") ? "selected" : "" %>>Chicken & Rice</option>
            <option value="Paneer Salad" <%= prevLunch.equals("Paneer Salad") ? "selected" : "" %>>Paneer Salad</option>
            <option value="Dal Roti" <%= prevLunch.equals("Dal Roti") ? "selected" : "" %>>Dal Roti</option>
        </select>

        <label class="neon-label" for="dinner">Dinner</label>
        <select name="dinner" id="dinner">
            <option value="Grilled Fish" <%= prevDinner.equals("Grilled Fish") ? "selected" : "" %>>Grilled Fish</option>
            <option value="Tofu Stir Fry" <%= prevDinner.equals("Tofu Stir Fry") ? "selected" : "" %>>Tofu Stir Fry</option>
            <option value="Khichdi" <%= prevDinner.equals("Khichdi") ? "selected" : "" %>>Khichdi</option>
        </select>

        <label class="neon-label" for="snacks">Snacks</label>
        <select name="snacks" id="snacks">
            <option value="Fruits" <%= prevSnacks.equals("Fruits") ? "selected" : "" %>>Fruits</option>
            <option value="Nuts Mix" <%= prevSnacks.equals("Nuts Mix") ? "selected" : "" %>>Nuts Mix</option>
            <option value="Yogurt" <%= prevSnacks.equals("Yogurt") ? "selected" : "" %>>Yogurt</option>
        </select>

        <button type="submit" class="btn-neon">Save Meal Plan</button>
        <button type="button" class="btn-neon" onclick="generateGrocery()">Generate Grocery List</button>
    </form>

    <h4>Your Grocery List:</h4>
    <pre id="groceryList" style="background:#222; padding:10px; border-radius:10px;"></pre>
</div>

<script>
    const groceryMap = {
        "Oats": ["Oats", "Milk"],
        "Eggs & Bread": ["Eggs", "Bread"],
        "Smoothie": ["Banana", "Milk", "Berries"],
        "Chicken & Rice": ["Chicken", "Rice", "Vegetables"],
        "Paneer Salad": ["Paneer", "Lettuce", "Cucumber"],
        "Dal Roti": ["Dal", "Roti", "Rice"],
        "Grilled Fish": ["Fish", "Veggies", "Lemon"],
        "Tofu Stir Fry": ["Tofu", "Broccoli", "Garlic"],
        "Khichdi": ["Dal", "Rice", "Veggies"],
        "Fruits": ["Banana", "Apple", "Orange"],
        "Nuts Mix": ["Almonds", "Walnuts", "Raisins"],
        "Yogurt": ["Yogurt", "Honey"]
    };

    function generateGrocery() {
        const form = document.forms["mealForm"];
        let items = [];

        ["breakfast", "lunch", "dinner", "snacks"].forEach(meal => {
            const food = form[meal].value;
            if (groceryMap[food]) items.push(...groceryMap[food]);
        });

        items = [...new Set(items)]; // remove duplicates
        document.getElementById("groceryList").innerText = items.map(i => "• " + i).join("\n");
    }
</script>

</body>
</html>
