<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="dto.UserDto" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            color: #333;
        }

        .profile-card {
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            width: 480px;
            padding: 40px;
            text-align: center;
            transition: transform 0.3s ease;
            animation: fadeIn 1s ease-in-out;
        }

        .profile-card:hover {
            transform: translateY(-10px);
        }

        .profile-header {
            font-size: 2.5em;
            font-weight: 600;
            color: #2d3e50;
            margin-bottom: 30px;
        }

        .profile-info {
            margin: 20px 0;
            font-size: 1.1em;
            color: #6c757d;
            text-align: left;
        }

        .profile-info span {
            font-weight: 600;
            color: #2d3e50;
        }

        .link {
            margin-top: 30px;
        }

        .link a {
            text-decoration: none;
            font-weight: 600;
            color: #ffffff;
            background-color: #28a745;
            padding: 12px 24px;
            border-radius: 30px;
            transition: background-color 0.3s ease, transform 0.2s ease;
            display: inline-flex;
            align-items: center;
        }

        .link a:hover {
            background-color: #218838;
            transform: scale(1.05);
        }

        .home-icon {
            margin-right: 10px;
            font-size: 1.3em;
        }

        /* Animations */
        @keyframes fadeIn {
            0% {
                opacity: 0;
                transform: translateY(-30px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeInText {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }
    </style>
</head>
<body>
    <%
        HttpSession sessions = request.getSession();
        UserDto user = (UserDto) sessions.getAttribute("User_Object");
    %>
    <div class="profile-card">
    <div class="profile-header">User Profile</div>
    <div class="profile-info">
        <span>First Name:</span> <%= user.getFname() %>
    </div>
    <div class="profile-info">
        <span>Last Name:</span> <%= user.getLname() %>
    </div>
    <div class="profile-info">
        <span>Gender:</span> <%= user.getGender() %>
    </div>
    <div class="profile-info">
        <span>Address:</span> <%= user.getAddress() %>
    </div>
    <div class="link">
        <a href="home.jsp">
            <span class="home-icon">🏠</span> Go to Home Page
        </a>
    </div>
    </div>
</body>
</html>
