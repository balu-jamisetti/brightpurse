<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="dto.UserDto" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Profile</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .form-container {
            width: 100%;
            max-width: 450px;
            padding: 30px;
            background-color: #ffffff;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.1);
            border-radius: 15px;
            text-align: center;
        }
        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #495057;
        }
        input[type="text"], select {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ced4da;
            border-radius: 8px;
            font-size: 1rem;
            color: #495057;
        }
        button {
            width: 100%;
            background-color: #28a745;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 8px;
            font-size: 1.2rem;
            cursor: pointer;
            font-weight: bold;
        }
        button:hover {
            background-color: #218838;
        }
        .success-message {
            color: #28a745;
            font-size: 1.5em;
        }
        .link a {
            color: #007bff;
            text-decoration: none;
            font-size: 1.1rem;
            margin-top: 20px;
            display: inline-block;
        }
        .link a:hover {
            color: #0056b3; /* Remove underline on hover, but change color */
        }
        .home-icon {
            height: 1.5em;
            width: 1.5em;
            vertical-align: middle;
            margin-right: 8px;
        }
    </style>
</head>
<body>

<div class="form-container">
    <% 
        HttpSession sessions1 = request.getSession(); 
        UserDto user = (UserDto) sessions1.getAttribute("User_Object");
        Integer updateStatus = (Integer) request.getAttribute("updateStatus"); // Get the update status
    %>

    <% if (updateStatus != null && updateStatus > 0) { %>
        <h1 class="success-message"><%= user.getFname() + " " + user.getLname() %>, Your Details Updated Successfully</h1>
        
        <div class="link">
            <a href="home.jsp">
                <img alt="Home Icon" src="home.png" class="home-icon">
                Go to Home Page
            </a>
        </div>
    <% } else { %>
        <h2>Update Profile</h2>
        <form action="UpdateProfileServlet" method="post">
            <div class="form-group">
                <label for="firstName">First Name</label>
                <input type="text" id="firstName" name="firstName" required maxlength="50" value="<%= user.getFname() %>" aria-label="First Name">
            </div>
            
            <div class="form-group">
                <label for="lastName">Last Name</label>
                <input type="text" id="lastName" name="lastName" required maxlength="50" value="<%= user.getLname() %>" aria-label="Last Name">
            </div>

            <div class="form-group">
                <label for="gender">Gender</label>
                <select id="gender" name="gender" required aria-label="Gender">
                    <option value="" disabled>Select Gender</option>
                    <option value="male" <%= user.getGender().equals("male") ? "selected" : "" %>>Male</option>
                    <option value="female" <%= user.getGender().equals("female") ? "selected" : "" %>>Female</option>
                    <option value="other" <%= user.getGender().equals("other") ? "selected" : "" %>>Other</option>
                </select>
            </div>
            
            <div class="form-group">
                <label for="address">Address</label>
                <input type="text" id="address" name="address" required maxlength="200" value="<%= user.getAddress() %>" aria-label="Address">
            </div>

            <button type="submit">Update Profile</button>
        </form>
        <div class="link">
            <a href="home.jsp">
                <img alt="Home Icon" src="home.png" class="home-icon">
                Go to Home Page
            </a>
        </div>
    <% } %>
</div>

</body>
</html>
