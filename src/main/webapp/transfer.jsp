<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="dto.AccountDto" %>
<%@ page import="dto.UserDto" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Bank Transfer Form</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4; /* Soft neutral background */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            color: #333; /* Text color for readability */
        }
        .transfer-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
            max-width: 500px;
            padding: 40px 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }
        .transfer-form {
            width: 100%;
            padding: 20px;
            text-align: center;
        }
        h2 {
            color: #2e3b4e;
            margin-bottom: 30px;
            font-size: 24px;
            font-weight: bold;
        }
        .form-group {
            margin-bottom: 20px;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }
        .form-group label {
            color: #333;
            margin-bottom: 8px;
            font-size: 14px;
        }
        .form-group input {
            width: 100%;
            padding: 12px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 16px;
            box-sizing: border-box;
        }
        .form-group input:focus {
            border-color: #2e3b4e; /* Subtle highlight on focus */
            outline: none;
        }
        .form-group button {
            width: 100%;
            padding: 12px;
            border-radius: 6px;
            border: none;
            background-color: #2e3b4e; /* Dark blue button */
            color: white;
            font-size: 16px;
            cursor: pointer;
        }
        .form-group button:hover {
            background-color: #1e2a37; /* Slightly darker shade on hover */
        }
        .link {
            margin-top: 20px;
        }
        .link a {
            color: #2e3b4e;
            text-decoration: none;
            font-weight: bold;
            font-size: 14px;
            transition: color 0.3s;
        }
        .link a:hover {
            color: #1e2a37;
        }
        .home-icon img {
            height: 1.2em;
            width: 1.2em;
            margin-right: 6px;
        }
        .error-message, .success-message {
            color: #d9534f;
            font-weight: bold;
            margin-bottom: 15px;
            font-size: 14px;
        }
        .success-message {
            color: #5bc0de; /* Light blue for success */
        }
    </style>
</head>
<body>

<div class="transfer-container">
<%
    HttpSession sessions = request.getSession();
    AccountDto acc = (AccountDto) sessions.getAttribute("Account");
    HttpSession sessions1 = request.getSession();
    UserDto user = (UserDto) sessions1.getAttribute("User_Object");
    String transfer = (String) request.getAttribute("transfer");
    if (transfer == null) { %>
    <div class="transfer-form">
        <h2>Bank Transfer</h2>
        <form action="processTransfer" method="post">
            <div class="form-group">
                <label for="accountNumber">Account Number:</label>
                <input type="text" id="accountNumber" name="accountNumber" required pattern="\d+" title="Please enter a valid account number. Only digits are allowed.">
                <% String accountnum = (String) request.getAttribute("IA");
                if (accountnum != null) { %>
                <div class="error-message"><%= accountnum %></div><% } %>
            </div>
            <div class="form-group">
                <label for="ifscCode">IFSC Code:</label>
                <input type="text" id="ifscCode" name="ifscCode" required>
                <% String ifsc = (String) request.getAttribute("IIFSC");
                if (ifsc != null) { %>
                <div class="error-message"><%= ifsc %></div><% } %>
            </div>
            <div class="form-group">
                <label for="amount">Amount:</label>
                <input type="number" id="amount" name="amount" required min="1">
                <% String bal = (String) request.getAttribute("IB");
                if (bal != null) { %>
                <div class="error-message"><%= bal %></div><% } %>
            </div>
            <div class="form-group">
                <label for="pin">PIN:</label>
                <input type="password" id="pin" name="pin" required>
                <% String pi = (String) request.getAttribute("PI");
                if (pi != null) { %>
                <div class="error-message"><%= pi %></div><% } %>
            </div>
            <div class="form-group">
                <button type="submit">Transfer</button>
            </div>
        </form>

        <div class="link">
            <a href="home.jsp">
                <span class="home-icon">
                    <img alt="Home Icon" src="home.png">
                </span> Go to Home Page
            </a>
        </div>
    </div>
<% } else { %>
    <div class="transfer-form">
        <img alt="Done_Image" src="done.gif" style="margin-bottom: 20px;">
        <h1 class="success-message">
            <%= user.getFname() + " " + user.getLname() %>, Transaction Done Successfully
        </h1>

        <div class="link">
            <a href="home.jsp">
                <span class="home-icon">
                    <img alt="Home Icon" src="home.png">
                </span> Go to Home Page
            </a>
        </div>
    </div>
<% } %>
</div>

</body>
</html>
