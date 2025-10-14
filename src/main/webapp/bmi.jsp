<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.sql.*" %>

<%
    Double height = null, weight = null, bmi = null;
    String message = "", categoryClass = "";

    // Get username from session
    String username = (String) session.getAttribute("username");

    if (request.getParameter("submit") != null) {
        try {
            height = Double.parseDouble(request.getParameter("height"));
            weight = Double.parseDouble(request.getParameter("weight"));
            bmi = weight / Math.pow(height / 100, 2);

            DecimalFormat df = new DecimalFormat("#.##");
            String bmiStr = df.format(bmi);

            if (bmi < 18.5) {
                message = "Your BMI is " + bmiStr + " (Underweight)";
                categoryClass = "underweight";
            } else if (bmi < 24.9) {
                message = "Your BMI is " + bmiStr + " (Normal weight)";
                categoryClass = "normal";
            } else if (bmi < 29.9) {
                message = "Your BMI is " + bmiStr + " (Overweight)";
                categoryClass = "overweight";
            } else {
                message = "Your BMI is " + bmiStr + " (Obese)";
                categoryClass = "obese";
            }

            // Save BMI to database
            if (username != null) {
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gym", "root", "your_password");

                    PreparedStatement ps = con.prepareStatement("UPDATE users SET bmi = ? WHERE username = ?");
                    ps.setDouble(1, bmi);
                    ps.setString(2, username);
                    ps.executeUpdate();

                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

        } catch (Exception e) {
            message = "❌ Please enter valid numeric values.";
            categoryClass = "error";
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Stylish BMI Calculator</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #667eea, #764ba2);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .card {
            background: white;
            padding: 40px 35px;
            border-radius: 20px;
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.15);
            width: 400px;
            text-align: center;
            animation: fadeIn 0.8s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.95); }
            to { opacity: 1; transform: scale(1); }
        }

        h2 {
            margin-bottom: 25px;
            color: #333;
        }

        input[type="text"] {
            width: 120px;
            padding: 12px;
            margin: 10px;
            border: 1px solid #ccc;
            border-radius: 10px;
            font-size: 16px;
        }

        input[type="submit"] {
            padding: 12px 25px;
            background: linear-gradient(to right, #00b09b, #96c93d);
            color: white;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            font-weight: 600;
            font-size: 16px;
            transition: transform 0.2s ease;
        }

        input[type="submit"]:hover {
            transform: scale(1.05);
            background: linear-gradient(to right, #43e97b, #38f9d7);
        }

        .result {
            margin-top: 20px;
            font-size: 18px;
            font-weight: 600;
            padding: 15px;
            border-radius: 10px;
            color: white;
        }

        .underweight {
            background-color: #ff9800;
        }

        .normal {
            background-color: #4caf50;
        }

        .overweight {
            background-color: #ff5722;
        }

        .obese {
            background-color: #e53935;
        }

        .error {
            background-color: #f44336;
        }
    </style>
</head>
<body>

<div class="card">
    <h2>🧮 BMI Calculator</h2>
    <form method="post" action="bmi.jsp">
        <input type="text" name="height" placeholder="Height (cm)" required />
        <input type="text" name="weight" placeholder="Weight (kg)" required />
        <br>
        <input type="submit" name="submit" value="Calculate BMI" />
    </form>

    <% if (!message.isEmpty()) { %>
        <div class="result <%= categoryClass %>"><%= message %></div>
    <% } %>
</div>

</body>
</html>
