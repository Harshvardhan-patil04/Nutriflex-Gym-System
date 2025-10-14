<%@ page import="java.sql.*, com.gym.database.DBConn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Plans</title>
<link href="css/allplans.css" rel="stylesheet"/>
<style>
body {
    background-image: url('images/background3.jpg');
    background-size: cover;
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-position: center;
    color: white;
}
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Plans</title>
<link href="css/allplans.css" rel="stylesheet"/>
<style>
body {
    background-image: url('images/background3.jpg');
    background-size: cover;
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-position: center;
    color: white;
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
}

#join {
    display: none;
    background: rgba(0, 0, 0, 0.8);
    padding: 20px;
    border-radius: 10px;
    width: 50%;
    margin: 20px auto;
    box-shadow: 0 4px 8px rgba(0,0,0,0.5);
}

#join h2 {
    text-align: center;
    color: #FFA500;
    margin-bottom: 20px;
}

form label {
    display: block;
    margin-top: 10px;
    font-weight: bold;
}

form select, form input[type="text"], form input[type="date"] {
    width: 70%;
    padding: 10px;
    margin: 5px 0 15px;
    border: none;
    border-radius: 5px;
    background: #f0f0f0;
    color: black;
}

button[type="submit"], button {
    background-color: #FFA500;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background 0.3s;
    display: block;
    margin: 10px auto;
}

button[type="submit"]:hover, button:hover {
    background-color: #FF8C00;
}


</style>
</head>
<body>
<header>
    <nav class="navbar">
        <div class="logo">
            <a href="index.jsp">
                <img src="images/mainlogo.jpeg" alt="Logo">
            </a>
        </div>
        <ul class="nav-links">
            <li><a href="Uhome.jsp">Home</a></li>
            <li><a href="allplans.jsp">All Plans</a></li>
            <li><a href="myplans.jsp">My Plans</a></li>
            <li><a href="mydiet.jsp">My Diet</a></li>
            <li><a href="myworkout.jsp">My Workout</a></li>
            <li><a href="chatbot.jsp">ChatBoat</a></li>
            <li><a href="messages.jsp">Notifications</a></li>
            <li style="text-transform: uppercase;"><a href="logout"><%=session.getAttribute("firstname")%>-Logout</a></li> 
        </ul>
    </nav>
</header>
<main>
    <div id="plans" style="width: 50%; margin-left: 350px;">
        <h2 style="color: black; margin-left: 50% ">All Plans</h2>
        <section class="container">
            <div class="row">
                <% 
                    try {
                        Connection con = DBConn.conn();
                        String s = "SELECT * FROM plans";
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery(s);
                        while (rs.next()) {
                            int pid = rs.getInt(1);
                %>
                <div class="card-body">
                    <ul class="list-group">
                        <li class="list-group-item"><b>Plan Name:</b> <%= rs.getString(2) %></li>
                        <li class="list-group-item"><b>Duration:</b> <%= rs.getString(3) %> Months</li>
                        <li class="list-group-item"><b>Price:</b> <%= rs.getString(4) %></li>
                        <li class="list-group-item"><b>Features:</b> <%= rs.getString(5) %></li>
                    </ul>
                    <div class="join" onclick="showContent('join')"><a href="#">Join Now</a></div>
                </div>
                <% 
                        }
                        rs.close();
                        st.close();
                        con.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </div>
        </section>
    </div>
</main>

<!-- Join Now Section -->
<div id="join" class="content">
        <h2 style="color: orange">Admission Form</h2>
        <form id="gymForm" action="gymForm" method="post">
            <div class="form-group">
                <label for="trainer">Select Trainer</label>
                <select id="trainer" name="trainer" required>
                    <option value="" disabled selected>--Select--</option>
                    <%
                        Connection con = DBConn.conn();
                        Statement boyStmt = con.createStatement();
                        ResultSet rsplan = boyStmt.executeQuery("SELECT * FROM trainer");
                        while (rsplan.next()) {
                            String fName = rsplan.getString("fname") + " " + rsplan.getString("lname"); // Concatenate first and last name
                    %>
                    <option value="<%= fName %>"><%= fName %></option>
                    
                    <% 
                        }
                        rsplan.close();
                        boyStmt.close();
                    %>
                    <option value="chatboat">ChatBoat(for basic plan users)</option>
                </select>
            </div>
            
            <div class="form-group">
                <label for="membership">Select Membership Plan</label>
                <select id="membership" name="membership" required>
                    <option value="" disabled selected>--Select--</option>
                    <%
                        Connection conn = DBConn.conn();
                        Statement boy = conn.createStatement();
                        ResultSet rs = boy.executeQuery("SELECT * FROM plans");
                        while (rs.next()) {
                            String pName = rs.getString("pname"); 
                    %>
                    <option value="<%= pName %>"><%= pName %></option>
                    <% 
                        }
                        rs.close();
                        boy.close();
                        conn.close();
                    %>
                </select>
            </div>
            
            <div class="form-group">
                <label for="amount">Select Amount According to your plan</label>
                <select id="amount" name="amount" required>
                    <option value="" disabled selected>--Select--</option>
                    <%
                        Connection co = DBConn.conn();
                        Statement bo = co.createStatement();
                        ResultSet r = bo.executeQuery("SELECT * FROM plans");
                        while (r.next()) {
                            String price = r.getString("price"); 
                    %>
                    <option value="<%= price %>"><%= price %></option>
                    <% 
                        }
                        r.close();
                        bo.close();
                        co.close();
                    %>
                </select>
            </div>
             <label for="sdate">Start Date:</label>
            <input type="date" id="sdate" name="sdate" required>
            
            <label for="height">Your Height(in cm):</label>
            <input type="text" id="height" name="height" placeholder="Your Height" required>
            
            <label for="weight">Your Weight(in kg):</label>
            <input type="text" id="weight" name="weight" placeholder="weight" required>
            
            <label for="focus">What you want to build:</label>
            <input type="text" id="focus" name="focus" placeholder="" required>
            
            <label for="username">Your Username:</label>
            <input type="text" id="username" name="username" placeholder="Enter Your Username" required>
                
            <label for="cname">Card Name:</label>
            <input type="text" id="cname" name="cname" placeholder="Card Name" required>
                
            <label for="cno">Card No:</label>
            <input type="number" id="cno" name="cno" placeholder="Card No" required>
                
            <label for="cvv">CVV:</label>
            <input type="number" id="cvv" name="cvv" placeholder="CVV No" required>
                <br><br>
            <button type="submit">Pay</button>
        </form>
    </div>
<script>
function showContent(contentId) {
    const plansSection = document.getElementById('plans');
    const joinSection = document.getElementById('join');

    if (contentId === 'join') {
        plansSection.style.display = 'none';
        joinSection.style.display = 'block';
    } else {
        plansSection.style.display = 'block';
        joinSection.style.display = 'none';
    }
}
</script>
</body>
</html>