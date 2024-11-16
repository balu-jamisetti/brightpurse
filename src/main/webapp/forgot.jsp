<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Pushpa Bank - Reset Password</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f3f4f6;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            animation: fadeIn 1.5s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .reset-password-container {
            width: 400px;
            padding: 2em;
            background-color: white;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
            text-align: center;
        }

        h2 {
            color: #a52a2a;
            font-size: 1.5em;
            margin-bottom: 1em;
        }

        label {
            font-size: 0.9em;
            color: #333;
            margin-top: 1em;
            display: block;
            text-align: left;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-top: 0.5em;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 1em;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #a52a2a;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease;
            margin-top: 1.5em;
        }

        input[type="submit"]:hover {
            background-color: #8b0000;
        }

        .error-message {
            color: red;
            font-size: 0.85em;
            margin-top: 5px;
            display: block;
        }

        .links {
            margin-top: 1em;
            font-size: 0.9em;
        }

        .links a {
            color: #a52a2a;
            text-decoration: none;
        }

        .links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="reset-password-container">
        <h2>Reset Password</h2>
        <form action="ResetPasswordServlet" method="post" onsubmit="return validateForm()">
            <label for="emailOrUsername">Email or Username:</label>
            <input type="text" id="emailOrUsername" name="email" required>
            <span class="error-message">
                <%= (request.getAttribute("Wrongemail") != null) ? request.getAttribute("Wrongemail") : "" %>
            </span>

            <label for="newPassword">New Password:</label>
            <input type="password" id="newPassword" name="newPassword" required>
            
            <label for="confirmPassword">Confirm Password:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required>
            
            <input type="submit" value="Reset Password">
        </form>
        <div class="links">
            <a href="login.jsp">Back to Login</a>
        </div>
    </div>

    <script>
        function validateForm() {
            const newPassword = document.getElementById('newPassword').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            if (newPassword !== confirmPassword) {
                alert("Passwords do not match!");
                return false;
            }
            return true;
        }
    </script>
</body>
</html>
