# 🛡️ Self Monitoring System for Detecting Internal Attacks

A security-focused Java-based web application designed to monitor user sessions and detect suspicious or unauthorized internal activities within a system. This system provides early warnings for potential insider threats by analyzing user behavior in real-time.

## 🚀 Features

- 🔐 **Session Monitoring**: Tracks user login, logout, and session duration.
- 📊 **Behavior Analysis**: Detects unusual patterns and flags suspicious actions.
- 📍 **Internal Threat Detection**: Focuses on internal attacks rather than external breaches.
- 📧 **Alert System**: Sends notifications or flags admins on detecting threats.
- 🖥️ **Web-based Dashboard**: Admin dashboard for viewing logs and threat alerts.

## 🛠️ Technologies Used

- **Java** (Core + Servlet/JSP)
- **HTML/CSS** for frontend UI
- **MySQL** for database management
- **Apache Tomcat** as the web server

## 📁 Project Structure

SelfMonitoringSystem/ │ ├── src/ │ ├── servlets/ │ └── utils/ │ ├── web/ │ ├── index.jsp │ ├── login.jsp │ ├── dashboard.jsp │ └── styles.css │ ├── WEB-INF/ │ └── web.xml │ └── README.md


## ⚙️ Setup Instructions

1. **Clone the Repository**  
   ```bash
   git clone https://github.com/vaibhavkhatik/SelfMonitoringSystem.git
Import the project into your IDE (e.g., Eclipse) as a Dynamic Web Project.

Configure Tomcat server and MySQL database.

Create the database using the database.sql script provided in the repo.

Run the project on Tomcat and access it via http://localhost:8080/SelfMonitoringSystem.

✍️ Author
Vaibhav Khatik
Feel free to connect or contribute!

📃 License
This project is licensed under the MIT License - see the LICENSE file for details.

