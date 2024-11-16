<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Check Account Balance - BrightPurse</title>
    <style>
        /* Global Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* Container for Balance Check Form */
        .container {
            background-color: rgba(255, 255, 255, 0.85);
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
            animation: fadeIn 1s ease;
        }

        h2 {
            color: #333;
            font-size: 24px;
            margin-bottom: 20px;
            font-weight: 600;
        }

        label {
            color: #555;
            font-size: 14px;
            text-align: left;
            display: block;
            margin-bottom: 8px;
        }

        input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            color: #333;
            background-color: #fff;
        }

        input[type="password"]:focus {
            border-color: #0093E9;
            outline: none;
        }

        input[type="submit"] {
            background-color: #0093E9;
            color: #fff;
            padding: 12px;
            border: none;
            border-radius: 5px;
            width: 100%;
            font-size: 16px;
            cursor: pointer;
            margin-top: 15px;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0077B6;
        }

        .homepage-button {
            display: block;
            margin-top: 20px;
            text-decoration: none;
            color: #fff;
            background-color: #28a745;
            padding: 12px;
            border-radius: 5px;
            text-align: center;
            transition: background-color 0.3s ease;
        }

        .homepage-button:hover {
            background-color: #218838;
        }

        .home-icon img {
            height: 1.6em;
            width: 1.5em;
            vertical-align: middle;
            margin-right: 5px;
        }

        /* Animation for fade-in effect */
        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(50px); }
            100% { opacity: 1; transform: translateY(0); }
        }

    </style>
</head>
<body>

<% 

	String invalid_Pin = (String) request.getAttribute("Invalid_Pin");
	


	if(request.getAttribute("Balance") == null) { %>
    <div class="container">
        <h2>Check Your Balance</h2>
        <form action="Balance" method="post">
            <label for="pin">Enter PIN:</label>
            <input type="password" id="pin" name="pin" required>
            <span id="passwordError" class="error-message" style="<%if(invalid_Pin!=null){%>display: block;<%} %>">
            <%if(invalid_Pin!=null){%><%=invalid_Pin%><%} %>
            </span>
            <input type="submit" value="Check Balance">
        </form>
        <a href="home.jsp" class="homepage-button">Go to Homepage</a>
    </div>
<% } else { %>
    <div class="container">
        <h2>Your Current Balance</h2>
        <span class="home-icon">
            <img alt="Balance Icon" src="rs.png">
        </span>
        <div><%= request.getAttribute("Balance") %></div>
        <a href="home.jsp" class="homepage-button">Go to Homepage</a>
    </div>
<% } %>
	
</body>
</html>
