<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat" %>
<%
    String heightStr = request.getParameter("height");
    String weightStr = request.getParameter("weight");

    if (heightStr != null && weightStr != null) {
        double heightCm = Double.parseDouble(heightStr);
        double weightKg = Double.parseDouble(weightStr);
        double heightM = heightCm / 100;
        double bmi = weightKg / (heightM * heightM);

        // Round to two decimal places
        DecimalFormat df = new DecimalFormat("#.##");
        bmi = Double.parseDouble(df.format(bmi));

        session.setAttribute("height", heightCm);
        session.setAttribute("weight", weightKg);
        session.setAttribute("bmi", bmi);

        // Redirect to user report page
        response.sendRedirect("userreport.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Calculate BMI</title>
    <style>
        body {
            background: #111;
            color: white;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background: #222;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px #00ffff;
        }

        h2 {
            text-align: center;
            color: #00ffff;
        }

        input[type="text"], input[type="submit"] {
            display: block;
            width: 100%;
            margin-bottom: 15px;
            padding: 10px;
            border-radius: 5px;
            border: none;
        }

        input[type="submit"] {
            background: #00ffff;
            color: #000;
            font-weight: bold;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background: #00dddd;
        }

        .note {
            margin-top: 20px;
            color: #ccc;
            font-size: 14px;
        }

        .btn-report {
            margin-top: 15px;
            background-color: #ff0066;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-report:hover {
            background-color: #c40050;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Calculate Your BMI</h2>
        <form method="post" action="CalculateBMI.jsp">
            <input type="text" name="height" placeholder="Enter height in cm" required>
            <input type="text" name="weight" placeholder="Enter weight in kg" required>
            <input type="submit" value="Calculate BMI & View Report">
        </form>

        <%
            if (session.getAttribute("bmi") != null) {
        %>
            <p class="note">Previous BMI: <%= session.getAttribute("bmi") %></p>
            <form action="userreport.jsp">
                <button class="btn-report">View Health Report</button>
            </form>
        <%
            }
        %>
    </div>
</body>
</html>
