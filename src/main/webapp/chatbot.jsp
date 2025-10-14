<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ChatBot</title>
    <link rel="stylesheet" href="css/chat.css"/>
    <style>
        body {
            background-image: url('images/back1.gif'); /* Replace with your image path */
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            color: white;
        }

        .chat-container {
            width: 60%;
            margin: 0 auto;
            text-align: center;
        }

        .chat-box {
            height: 400px;
            overflow-y: scroll;
            border: 1px solid #ccc;
            padding: 10px;
            background-color: rgba(0, 0, 0, 0.7);
            color: white;
            margin-bottom: 10px;
            text-align: left;
        }

        .user-message {
            text-align: left;
            background-color: #4CAF50;
            color: white;
            padding: 5px 10px;
            margin-bottom: 10px;
            border-radius: 10px;
        }

        .bot-message {
            text-align: left;
            background-color: #333;
            color: white;
            padding: 5px 10px;
            margin-bottom: 10px;
            border-radius: 10px;
        }

        .input-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 10px;
        }

        .user-input {
            width: 80%;
            padding: 10px;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .send-btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            font-size: 16px;
            border: none;
            cursor: pointer;
            margin-left: 10px;
            border-radius: 5px;
        }

        .clear-btn {
            background-color: red;
            color: white;
            padding: 10px;
            font-size: 16px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            margin-top: 10px;
        }

        .clear-container {
            text-align: center;
            margin-top: 10px;
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
            <li><a href="chatbot.jsp">ChatBot</a></li>
            <li><a href="messages.jsp">Notifications</a></li>
            <li style="text-transform: uppercase;"><a href="logout"><%=session.getAttribute("firstname")%>-Logout</a></li> 
        </ul>
    </nav>
</header>

<main>
    <div class="chat-container">
        <h2 style="text-align: center; color:black;">ChatBot</h2>
        <div class="chat-box" id="chatBox">
            <!-- Chat messages will be displayed here -->
        </div>

        <div class="input-container">
            <input type="text" class="user-input" placeholder="Ask a question..." required />
            <button class="send-btn">Send</button>
        </div>

        <div class="clear-container">
            <button class="clear-btn" onclick="clearChat()">Clear Chat</button>
        </div>
    </div>
</main>

<footer>
    <div class="footer-container">
        <div class="footer-section">
            <h3>Quick Links</h3>
            <ul>
                <li><a href="Uhome.jsp">Home</a></li>
                <li><a href="services.jsp">Services</a></li>
                <li><a href="contact.jsp">Contact</a></li>
            </ul>
        </div>

        <div class="footer-section">
            <h3>Contact Us</h3>
            <p>Email: example@example.com</p>
            <p>Phone: 123-456-7890</p>
        </div>

        <div class="footer-section">
            <h3>Follow Us</h3>
            <ul class="social-media">
                <li><a href="https://www.facebook.com/share/1A4uftLCpp/?mibextid=wwXIfr"><img src="images/facebook.jpeg" alt="Facebook"></a></li>
                <li><a href="https://x.com/nutriflexgym?s=21"><img src="images/twitter.jpeg" alt="Twitter"></a></li>
                <li><a href="https://www.instagram.com/nutriflex_gym?igsh=OXlhdzNmZWk1ejI0&utm_source=qr"><img src="images/insta.jpeg" alt="Instagram"></a></li>
            </ul>
        </div>
    </div>
</footer>

<script>
// Function to send user message to Rasa API and display response
function sendMessage() {
    let userInput = document.querySelector(".user-input");
    let chatBox = document.getElementById("chatBox");

    if (userInput.value.trim() === "") return;

    // Append user message
    chatBox.innerHTML += "<div class='user-message'><b>You:</b> " + userInput.value + "</div>";

    // Generate unique sender ID (for session management)
    const sender = "user_" + Date.now(); // Unique sender ID based on timestamp

    // Send user message to Rasa
    fetch("http://localhost:5005/webhooks/rest/webhook", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ sender: sender, message: userInput.value })
    })
    .then(response => response.json())
    .then(data => {
        let botMessage = "";
        data.forEach(msg => {
            botMessage += "<div class='bot-message'><b>Bot:</b> " + msg.text + "</div>";
        });

        // Append bot message
        chatBox.innerHTML += botMessage;

        // Scroll to latest message
        chatBox.scrollTop = chatBox.scrollHeight;

        // Clear user input field
        userInput.value = "";
    })
    .catch(error => {
        console.error("Error:", error);
        chatBox.innerHTML += "<div class='bot-message'><b>Bot:</b> Sorry, something went wrong. Please try again later.</div>";
        chatBox.scrollTop = chatBox.scrollHeight;
    });
}

// Function to clear the chat
function clearChat() {
    document.getElementById("chatBox").innerHTML = "";
}

// Attach sendMessage to button click
document.querySelector(".send-btn").addEventListener("click", function(event) {
    event.preventDefault(); // Prevent form submission
    sendMessage();
});

// Send message when pressing Enter key
document.querySelector(".user-input").addEventListener("keypress", function(event) {
    if (event.key === "Enter") {
        event.preventDefault();
        sendMessage();
    }
});
</script>

</body>
</html>
