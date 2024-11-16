<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Banking Application - Create Account</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            background-color: #e9edf0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .create-account-container {
            width: 500px;
            padding: 2em;
            background-color: white;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
        }
        .create-account-container h2 {
            color: #0056b3;
            margin-bottom: 1em;
            text-align: center;
            font-size: 1.5em;
        }
        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1em;
        }
        .form-item {
            display: flex;
            flex-direction: column;
        }
        label {
            font-weight: bold;
            font-size: 0.9em;
        }
        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="tel"],
        select {
            padding: 0.6em;
            margin-top: 0.3em;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 0.9em;
        }
        .full-width {
            grid-column: span 2;
        }
        input[type="submit"] {
            width: 100%;
            padding: 0.7em;
            margin-top: 1em;
            background-color: #0056b3;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 1em;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #004080;
        }
        .links {
            text-align: center;
            margin-top: 1em;
            font-size: 0.9em;
        }
        .links a {
            color: #0056b3;
            text-decoration: none;
        }
        .links a:hover {
            text-decoration: underline;
        }
        .error-message {
            color: red;
            font-size: 0.85em;
            margin-top: 0.5em;
            display: none;
        }
        .required-field::after {
            content: "*";
            color: red;
        }
    </style>
    <script>
        function validateForm() {
            const password = document.getElementById("password").value;
            const confirmPassword = document.getElementById("confirmPassword").value;
            if (password !== confirmPassword) {
                alert("Passwords do not match. Please try again.");
                return false;
            }
            return true;
        }

        function showError(elementId, message) {
            const errorElement = document.getElementById(elementId);
            errorElement.textContent = message;
            errorElement.style.display = "block";
            setTimeout(() => {
                errorElement.style.display = "none";
            }, 3000);
        }

        window.onload = function() {
            <% if (request.getAttribute("DuplicateEmail") != null) { %>
                showError("emailError", "<%= request.getAttribute("DuplicateEmail") %>");
            <% } %>
            <% if (request.getAttribute("DuplicatePhone") != null) { %>
                showError("phoneError", "<%= request.getAttribute("DuplicatePhone") %>");
            <% } %>
        };
    </script>
</head>
<body>
    <div class="create-account-container">
        <h2>Create Account</h2>
        <form action="register" method="post" onsubmit="return validateForm()">
            <div class="form-grid">
                <div class="form-item">
                    <label for="firstName" class="required-field">First Name:</label>
                    <input type="text" id="firstName" name="firstName" required maxlength="50">
                </div>
                <div class="form-item">
                    <label for="lastName" class="required-field">Last Name:</label>
                    <input type="text" id="lastName" name="lastName" required maxlength="50">
                </div>
                <div class="form-item">
                    <label for="gender" class="required-field">Gender:</label>
                    <select id="gender" name="gender" required>
                        <option value="" disabled selected>Select Gender</option>
                        <option value="male">Male</option>
                        <option value="female">Female</option>
                        <option value="other">Other</option>
                    </select>
                </div>
                <div class="form-item">
                    <label for="email" class="required-field">Email:</label>
                    <input type="email" id="email" name="email" required pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$">
                    <span id="emailError" class="error-message"></span>
                </div>
                <div class="form-item full-width">
                    <label for="phone" class="required-field">Phone Number:</label>
                    <input type="tel" id="phone" name="phone" required pattern="\d{10,15}" maxlength="15">
                    <span id="phoneError" class="error-message"></span>
                </div>
                <div class="form-item full-width">
                    <label for="address" class="required-field">Address:</label>
                    <input type="text" id="address" name="address" required maxlength="200">
                </div>
                <div class="form-item">
                    <label for="password" class="required-field">Password:</label>
                    <input type="password" id="password" name="password" required minlength="8">
                </div>
                <div class="form-item">
                    <label for="confirmPassword" class="required-field">Confirm Password:</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" required minlength="8">
                </div>
            </div>
            <input type="submit" value="Create Account">
        </form>
        <div class="links">
            <a href="login.jsp">Already have an account? Login</a>
        </div>
    </div>
</body>
</html>
