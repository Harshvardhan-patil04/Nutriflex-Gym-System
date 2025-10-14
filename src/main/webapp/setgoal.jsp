<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Set Your Fitness Goal</title>
    <style>
        body {
    font-family: 'Segoe UI', sans-serif;
    background: linear-gradient(-45deg, #ffecd2, #fcb69f, #d9a7c7, #fffcdc);
    background-size: 400% 400%;
    animation: gradientBG 15s ease infinite;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}

@keyframes gradientBG {
    0% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
}

.goal-form-container {
    background-color: rgba(255, 255, 255, 0.96);
    padding: 40px 30px;
    border-radius: 8px; /* Rectangular look */
    box-shadow: 0 12px 30px rgba(0, 0, 0, 0.12);
    width: 440px;
    animation: bounceIn 0.8s ease;
    backdrop-filter: blur(10px);
}

@keyframes bounceIn {
    0% { transform: scale(0.95); opacity: 0; }
    50% { transform: scale(1.02); opacity: 0.7; }
    100% { transform: scale(1); opacity: 1; }
}

h2 {
    text-align: center;
    color: #2d3436;
    margin-bottom: 25px;
    font-size: 26px;
    font-weight: 700;
    text-shadow: 1px 1px 1px #fff;
}

label {
    display: block;
    margin-top: 15px;
    color: #2c3e50;
    font-weight: 600;
    font-size: 14px;
}

input[type="text"],
input[type="number"],
input[type="date"],
textarea {
    width: 100%;
    padding: 12px 14px;
    margin-top: 5px;
    border: 2px solid #dfe6e9;
    border-radius: 6px; /* Less rounded */
    font-size: 14px;
    background-color: #f9fbfc;
    transition: all 0.3s ease;
}

input[type="text"]:focus,
input[type="number"]:focus,
input[type="date"]:focus,
textarea:focus {
    border-color: #74b9ff;
    background-color: #fff;
    box-shadow: 0 0 5px rgba(116, 185, 255, 0.5);
    outline: none;
}

textarea {
    resize: vertical;
    min-height: 80px;
}

input[type="submit"] {
    margin-top: 30px;
    width: 100%;
    padding: 14px;
    background: linear-gradient(to right, #00b894, #00cec9);
    color: white;
    font-size: 16px;
    font-weight: bold;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    transition: transform 0.2s ease, box-shadow 0.3s ease;
    box-shadow: 0 6px 15px rgba(0, 206, 201, 0.4);
}

input[type="submit"]:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 20px rgba(0, 206, 201, 0.6);
}
        
        
    </style>
</head>
<body>

<div class="goal-form-container">
    <h2>🎯 Set Your Fitness Goal</h2>
    <form action="saveGoal.jsp" method="post">
        <label>Goal Title:</label>
        <input type="text" name="goal_title" required>

        <label>Target Weight (kg):</label>
        <input type="number" step="0.1" name="target_weight" required>

        <label>Current Weight (kg):</label>
        <input type="number" step="0.1" name="current_weight" required>

        <label>Start Date:</label>
        <input type="date" name="start_date" required>

        <label>End Date:</label>
        <input type="date" name="end_date" required>

        <label>Progress Note (optional):</label>
        <textarea name="progress_note"></textarea>

        <input type="submit" value="Set Goal">
    </form>
</div>

</body>
</html>
