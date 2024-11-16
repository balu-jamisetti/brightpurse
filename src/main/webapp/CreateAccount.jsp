<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="dto.AccountDto" %>
<%@ page import="dto.UserDto" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account</title>
    <style>
    /* Background and body styling */
    body {
        font-family: Arial, sans-serif;
        background: linear-gradient(135deg, #5DADE2, #EBF5FB);
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        overflow: hidden;
        animation: fadeInBackground 1.5s ease-in-out;
    }

    @keyframes fadeInBackground {
        from { opacity: 0; }
        to { opacity: 1; }
    }

    /* Form container styling */
    form {
        background: #ffffff;
        padding: 1.5rem;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        width: 90%;
        max-width: 600px;
        text-align: left;
        animation: slideIn 1.5s ease-in-out;
        display: grid;
        grid-template-columns: 1fr 1fr; /* Equal columns */
        gap: 1.5rem; /* Increased gap for space between columns */
    }

    @keyframes slideIn {
        from { transform: translateY(50px); opacity: 0; }
        to { transform: translateY(0); opacity: 1; }
    }

    h1 {
        color: #3498db;
        font-size: 1.5rem;
        margin-bottom: 1rem;
        grid-column: span 2;
        text-align: center;
    }

    /* Form field styling */
    .form-section {
        display: flex;
        flex-direction: column;
    }

    label {
        color: #333;
        font-weight: bold;
        margin-bottom: 0.5rem;
    }

    /* Set width of inputs and selects to be the same */
    input[type="text"],
    input[type="number"],
    select {
        width: 100%; /* Ensures full container width */
        padding: 0.5rem;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 1rem;
        transition: border-color 0.3s;
    }

    input[type="text"]:focus,
    input[type="number"]:focus,
    select:focus {
        border-color: #3498db;
        outline: none;
    }

    /* Submit button styling */
    input[type="submit"] {
        background-color: #3498db;
        color: #fff;
        padding: 0.75rem;
        border: none;
        border-radius: 5px;
        font-size: 1rem;
        cursor: pointer;
        transition: background-color 0.3s ease;
        margin-top: 1rem;
        grid-column: span 2;
    }

    input[type="submit"]:hover {
        background-color: #2980b9;
    }

    /* Success message styling */
    .success-message {
        animation: slideToCenter 1.5s ease-in-out forwards;
        opacity: 0;
        color: #27ae60;
        grid-column: span 2;
        text-align: center;
    }

    @keyframes slideToCenter {
        from {
            transform: translateX(-100%);
            opacity: 0;
        }
        to {
            transform: translateX(0);
            opacity: 1;
        }
    }

    /* Home link styling */
    .link {
        text-align: center;
        margin-top: 1rem;
        grid-column: span 2;
    }

    .link a {
        color: #3498db;
        text-decoration: none;
        font-weight: bold;
        transition: color 0.3s ease;
        font-size: 1.2em;
    }

    .link a:hover {
        color: #2ecc71;
    }

    /* Home icon styling */
    .home-icon img {
        height: 1.5em;
        width: 1.5em;
        vertical-align: middle;
    }
</style>
</head>
<body>
<%
    HttpSession sessions = request.getSession();
    AccountDto acc = (AccountDto) sessions.getAttribute("Account");
    HttpSession sessions1 = request.getSession(); // Prevents creation of a new session if not already present
    UserDto user = (UserDto) sessions1.getAttribute("User_Object");
%>
<% String duplicate_Account = (String) request.getAttribute("Account_Exists"); %>
    <form action="AccountCreationServlet" method="post">
    <% if(acc.getAccount_Number() == 0) { %>
        <h1>Create Bank Account</h1>
        
        <!-- Account Type Dropdown -->
        <div class="form-section">
            <label for="type">Account Type:</label>
            <select id="type" name="type" required>
                <option value="" disabled selected>Select Account Type</option>
                <option value="Savings">Savings</option>
                <option value="Current">Current</option>
            </select>
        </div>

        <!-- Branch Dropdown -->
        <div class="form-section">
            <label for="branch">Branch:</label>
            <select id="branch" name="branch" required>
                <option value="" disabled selected>Select Branch</option>
                <option value="HITECH City">HITECH City</option>
                <option value="KPHB">KPHB</option>
                <option value="LB Nagar">LB Nagar</option>
            </select>
        </div>

        <!-- Aadhar Number Field -->
        <div class="form-section">
            <label for="aadhar">Aadhar Number:</label>
            <input type="number" id="aadhar" name="aadhar" maxlength="12" pattern="\d{12}" required 
                   title="Please enter exactly 12 digits for the Aadhar Number">
        </div>

        <!-- PIN Field -->
        <div class="form-section">
            <label for="pin">PIN:</label>
            <input type="number" id="pin" name="pin" required>
        </div>

        <!-- Balance Field -->
        <div class="form-section">
            <label for="balance">Balance:</label>
            <input type="number" id="balance" name="balance" required>
        </div>

        <!-- Nominee Name Field -->
        <div class="form-section">
            <label for="nominee_name">Nominee Name:</label>
            <input type="text" id="nominee_name" name="nominee_name" required>
        </div>

        <!-- Relationship with Nominee Field -->
        <div class="form-section">
            <label for="relation_with_nominee">Relationship with Nominee:</label>
            <input type="text" id="relation_with_nominee" name="relation_with_nominee" required>
        </div>

        <input type="submit" id="create" value="Create Account">
        
        <!-- Home Link -->
        <div class="link">
            <a href="home.jsp">
                <span class="home-icon">
                    🏠
                </span> Go to Home Page
            </a>
        </div>
    <% } %>
        
    <% if(acc.getAccount_Number() != 0) { %>
        <img alt="Done_Image" src="done.gif">
        <h1 class="success-message"><%= user.getFname() + " " + user.getLname() + "," %> Your Bank Account Created Successfully</h1>
        
        <!-- Home Link -->
        <div class="link">
            <a href="home.jsp">
                <span class="home-icon">
                    <img alt="" src="home.png" style="height: 1.5em; width: 1.5em; vertical-align: middle;">
                </span> Go to Home Page
            </a>
        </div>
    <% } %>
    </form>
</body>
</html>
