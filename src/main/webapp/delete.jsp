<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="dto.AccountDto" %>
<%@ page import="dto.UserDto" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Banking Application - Delete Account</title>
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

        .delete-account-container {
            width: 400px;
            padding: 30px;
            background-color: rgba(255, 255, 255, 0.85);
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            text-align: center;
            animation: fadeIn 1s ease-in-out;
        }

        .delete-account-container h2 {
            margin-bottom: 20px;
            color: #e63946;
            font-size: 1.8rem;
            font-weight: 600;
        }

        .delete-account-container input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 15px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
        }

        .delete-account-container input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #ff4d4d;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 15px;
            font-size: 1.1rem;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .delete-account-container input[type="submit"]:hover {
            background-color: #e63939;
            transform: scale(1.05);
        }

        .delete-account-container .links {
            margin-top: 20px;
        }

        .delete-account-container .links a {
            color: #4CAF50;
            text-decoration: none;
            font-size: 1rem;
            font-weight: 600;
        }

        .delete-account-container .links a:hover {
            text-decoration: none;
            color: #218838;
        }

        .warning {
            color: #e63946;
            font-weight: bold;
            margin-top: 15px;
        }

        .success-message-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            animation: slideIn 2s ease forwards;
        }

        .success-message {
            font-size: 1.2rem;
            color: #28a745;
            text-align: center;
            opacity: 0;
            animation: fadeInText 2s ease forwards;
        }

        @keyframes fadeIn {
            from { transform: translateY(30px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        @keyframes slideIn {
            from { transform: translateY(100px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        @keyframes fadeInText {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        .error-message {
            color: red;
            font-size: 1.2vh;
            margin-top: 0.5vh;
            display: none;
        }
        .input-group {
            margin-bottom: 1.5vh;
            opacity: 0;
            animation: slideIn 0.8s forwards;
            animation-delay: 0.4s;
        }
    </style>
</head>
<body>
<%
    HttpSession sessions = request.getSession();
    AccountDto acc = (AccountDto) sessions.getAttribute("Account");
    HttpSession sessions1 = request.getSession();
    UserDto user = (UserDto) sessions1.getAttribute("User_Object");
%>
<% String pin = (String) request.getAttribute("Account_Delete_Pin");%>
<div class="delete-account-container">
    <% if (acc.getAccount_Number() != 0) { %>
        <h2>Delete Account</h2>
        <form action="delete" method="post">
         <div class="input-group">
            <label for="pin">PIN:</label>
            <input type="password" id="pin" name="pin" required>
            
            <span id="passwordError" class="error-message" style="<%if(pin!=null){%>display: block;<%} %>">
                    <%if(pin!=null){%><%=pin%><%} %>
            </span>
          </div>
            <label for="confirm_pin">Confirm PIN:</label>
            <input type="password" id="confirm_pin" name="confirm_pin" required>

            <p class="warning">Warning: This action is irreversible!</p>

            <input type="submit" value="Delete Account">
            <br>
            <% String balance = (String) request.getAttribute("Amount_Is_There");%>
            
                
               
                <span id="passwordError" class="error-message" style="<%if(balance!=null){%>display: block;<%} %>">
                    <%if(balance!=null){%><%=balance%>
                    <a href="transfer.jsp">Transfer Funds</a>
                    <%} %>
                </span>
            <div class="links">
                <a href="home.jsp">
                    <span class="home-icon">
                        <img src="home.png" alt="Home Icon" style="height: 1.5em; width: 1.5em; vertical-align: middle;">
                    </span> Go to Home Page
                </a>
            </div>
        </form>
    <% } else { %>
        <div class="success-message-container">
            <div class="success-message">
                <img src="done.gif" alt="Done Image" style="display: block; margin: 0 auto;">
                <h1><%= user.getFname() + " " + user.getLname() %>, Your Bank Account Deleted Successfully</h1>
                <div class="links">
                    <a href="home.jsp">
                        <span class="home-icon">
                            <img src="home.png" alt="Home Icon" style="height: 1.5em; width: 1.5em; vertical-align: middle;">
                        </span> Go to Home Page
                    </a>
                </div>
            </div>
        </div>
    <% } %>
</div>

</body>
</html>
