<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username = (String) session.getAttribute("username");
    String heightStr = request.getParameter("height");
    String weightStr = request.getParameter("weight");

    double height = 0, weight = 0, bmi = 0;
    String healthCondition = "", dietPlan = "", workoutPlan = "";

    if (username == null) {
        response.sendRedirect("login.jsp");
    }

    boolean showResult = false;

    if (heightStr != null && weightStr != null) {
        try {
            height = Double.parseDouble(heightStr);
            weight = Double.parseDouble(weightStr);

            double heightInMeters = height / 100.0;
            bmi = weight / (heightInMeters * heightInMeters);

            if (bmi < 18.5) healthCondition = "Underweight";
            else if (bmi < 24.9) healthCondition = "Normal";
            else if (bmi < 29.9) healthCondition = "Overweight";
            else healthCondition = "Obese";

            showResult = true;

            // Database Connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gym", "root", "");

            // Fetch Diet Plan
            PreparedStatement dietStmt = con.prepareStatement("SELECT day, date, meal, calories FROM diet WHERE username = ?");
            dietStmt.setString(1, username);
            ResultSet dietRs = dietStmt.executeQuery();
            StringBuilder dietBuilder = new StringBuilder();
            while (dietRs.next()) {
                dietBuilder.append("📅 Day: ").append(dietRs.getString("day"))
                           .append(" | Date: ").append(dietRs.getString("date"))
                           .append("<br>🍽️ Meal: ").append(dietRs.getString("meal"))
                           .append(" | 🔥 Calories: ").append(dietRs.getString("calories"))
                           .append("<br><br>");
            }
            dietPlan = dietBuilder.toString().isEmpty() ? "No diet plan assigned." : dietBuilder.toString();

            // Fetch Workout Plan
            PreparedStatement workoutStmt = con.prepareStatement("SELECT day, date, excer, dura, note FROM workout WHERE username = ?");
            workoutStmt.setString(1, username);
            ResultSet workoutRs = workoutStmt.executeQuery();
            StringBuilder workoutBuilder = new StringBuilder();
            while (workoutRs.next()) {
                workoutBuilder.append("📅 Day: ").append(workoutRs.getString("day"))
                              .append(" | Date: ").append(workoutRs.getString("date"))
                              .append("<br>🏋️ Exercise: ").append(workoutRs.getString("excer"))
                              .append(" | ⏱️ Duration: ").append(workoutRs.getString("dura"))
                              .append("<br>📝 Note: ").append(workoutRs.getString("note"))
                              .append("<br><br>");
            }
            workoutPlan = workoutBuilder.toString().isEmpty() ? "No workout plan assigned." : workoutBuilder.toString();

            con.close();
        } catch (Exception e) {
            java.io.StringWriter sw = new java.io.StringWriter();
            java.io.PrintWriter pw = new java.io.PrintWriter(sw);
            e.printStackTrace(pw);
            out.println("<pre style='color:red; background:#ffecec; padding:10px; border:1px solid #ffcccc;'>" + sw.toString() + "</pre>");
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>User Health Report</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #dceeff, #e2f5e9);
            margin: 0;
            padding: 40px 0;
        }

        .report-container {
            max-width: 750px;
            margin: auto;
            background: #ffffff;
            border-radius: 16px;
            padding: 35px;
            box-shadow: 0px 8px 24px rgba(0, 0, 0, 0.15);
            animation: fadeIn 0.6s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
        }

        .form-group, .section {
            margin-bottom: 20px;
        }

        label {
            font-weight: 600;
            display: block;
            margin-bottom: 5px;
            color: #444;
        }

        input[type="number"] {
            padding: 10px;
            width: 100%;
            border-radius: 8px;
            border: 1px solid #ccc;
            box-sizing: border-box;
            font-size: 15px;
        }

        .value {
            background: #f9f9f9;
            padding: 15px;
            border-radius: 8px;
            font-size: 15px;
            line-height: 1.6;
            border-left: 4px solid #007BFF;
        }

        input[type="submit"] {
            background: #007BFF;
            color: #fff;
            font-weight: 600;
            padding: 12px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background 0.3s;
            display: block;
            width: 100%;
        }

        input[type="submit"]:hover {
            background: #0056b3;
        }

        hr {
            border: 0;
            border-top: 1px solid #eaeaea;
            margin: 30px 0;
        }
    </style>
</head>
<body>
<div class="report-container">
    <h2>🧾 User Health Report</h2>

    <form method="get" action="userreport.jsp">
        <div class="form-group">
            <label for="height">Enter Height (in cm):</label>
            <input type="number" name="height" id="height" step="0.1" required>
        </div>
        <div class="form-group">
            <label for="weight">Enter Weight (in kg):</label>
            <input type="number" name="weight" id="weight" step="0.1" required>
        </div>
        <input type="submit" value="Generate Report">
    </form>

    <% if (showResult) { %>
    <hr>
    <div class="section">
        <label>Height (cm):</label>
        <div class="value"><%= height %></div>
    </div>
    <div class="section">
        <label>Weight (kg):</label>
        <div class="value"><%= weight %></div>
    </div>
    <div class="section">
        <label>BMI:</label>
        <div class="value"><%= String.format("%.2f", bmi) %></div>
    </div>
    <div class="section">
        <label>Health Condition:</label>
        <div class="value"><%= healthCondition %></div>
    </div>
    <div class="section">
        <label>Diet Plan:</label>
        <div class="value"><%= dietPlan %></div>
    </div>
        <div class="section">
        <label>Workout Plan:</label>
        <div class="value"><%= workoutPlan %></div>
    </div>

    <div class="section">
        <form method="get" action="downloadReport.jsp" target="_blank">
            <input type="hidden" name="height" value="<%= height %>">
            <input type="hidden" name="weight" value="<%= weight %>">
            <input type="submit" value="📥 Download Report as PDF">
        </form>
    </div>
<% } %>
    
</body>
</html>
