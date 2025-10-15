# 🏋️‍♂️ NutriFlex Gym Management System

**NutriFlex** is a comprehensive gym management platform designed to streamline fitness operations, trainer management, workout tracking, and diet planning.  
It provides an interactive user experience with real-time updates, personalized workout plans, and chatbot integration for user support.

---

## 🚀 Project Overview

The **NutriFlex Gym System** aims to digitalize gym operations by managing user memberships, workout schedules, diet plans, and trainer details efficiently.  
The system allows members to track their progress, book sessions, get personalized diet advice, and communicate with the gym chatbot for quick assistance.

---

## 🎯 Features

### 🧍 User Features
- Secure login and registration  
- Profile management (personal info, BMI, health goals)  
- Personalized **workout** and **diet** plans  
- View available **trainers and classes**  
- Track **attendance and workout history**  
- Real-time chatbot assistance using **Rasa AI**

### 🏋️ Trainer/Admin Features
- Manage members and trainers  
- Add/update workout and diet plans  
- View attendance and performance analytics  
- Approve membership plans and payments  
- Generate reports

### 💬 Chatbot Integration
- Integrated **Rasa chatbot** for real-time guidance  
- Provides workout and diet recommendations  
- Calculates **BMI** and tracks health metrics  
- Books training sessions and displays schedules  
- Sends motivational quotes and gym updates

---

## 🧠 Tech Stack

### 🖥️ Frontend
- HTML, CSS, JavaScript  
- Bootstrap for responsive design  

### ⚙️ Backend
- Java (JSP/Servlet)  

### 🗄️ Database
- MySQL for storing user, trainer, and workout data

### 🤖 Chatbot
- **Rasa Framework** integrated for intelligent conversation handling


## 🧩 System Modules

| Module | Description |
|--------|-------------|
| **Login & Authentication** | Secure access for users and admins |
| **Dashboard** | Overview of user activities and gym insights |
| **Workout Management** | Add, view, and manage workouts |
| **Diet Management** | Personalized meal plans based on user goals |
| **Membership Plans** | View, subscribe, and manage gym plans |
| **Trainer Management** | Trainer details and availability |
| **Chatbot Support** | Rasa chatbot for automated guidance |
| **Reports & Analytics** | View attendance, performance, and growth trends |

---

## ⚙️ Installation Guide

### 1. Clone the Repository

git clone https://github.com/harshvardhan-patil04/NutriFlex-Gym-System.git
cd NutriFlex-Gym-System
2. Install Dependencies

🔹 For Python (Flask)
pip install -r requirements.txt

🔹 For Node.js
npm install

🔹 For Rasa Chatbot
pip install rasa
rasa train

3. Configure Database

Import the provided SQL file (nutriflex.sql) into MySQL

4. Run the Application
Flask:
python app.py

Rasa Chatbot:
rasa run actions
rasa run

5. Open in Browser
http://localhost:5000

📊 Database Structure
Table	              Description
users	              Stores user login and profile details
trainers	          Trainer information and availability
workouts	          Workout plans with difficulty levels
diets	              Personalized meal plans
attendance	        User attendance logs
membership_plans	  Available gym plans


🧩 Rasa Chatbot Features

Intent Recognition: Understands user queries (diet, workouts, schedule, etc.)
Custom Actions: Calculates BMI, books classes, provides tips
Database Integration: Retrieves trainer and plan details dynamically
Fallback Handling: Provides helpful suggestions for unknown inputs

📱 Future Enhancements

Integration with wearable fitness trackers
AI-based injury detection and recovery plans
Payment gateway integration
Push notifications for reminders and gym events
Live chat support with trainers
