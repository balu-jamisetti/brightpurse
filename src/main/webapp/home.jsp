<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="dto.AccountDto" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>BrightPurse - Home</title>
    <style>
        /* Global Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #333;
            overflow-x: hidden;
            background: #eaeaea; /* Light grey background for a clean look */
        }

        /* Navbar Styling */
        .navbar {
            background: rgba(0, 0, 0, 0.8); /* Dark background for a professional look */
            padding: 20px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: #fff;
            position: sticky;
            top: 0;
            z-index: 1000;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            color: #ffcc00; /* Gold color for branding */
            text-shadow: 2px 2px 6px rgba(0, 0, 0, 0.2);
        }

        .nav-links {
            list-style: none;
            display: flex;
            align-items: center;
        }

        .nav-links li {
            margin: 0 15px;
        }

        .nav-links a {
            color: #fff;
            text-decoration: none;
            font-size: 16px;
            padding: 8px 16px;
            border-radius: 30px;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .nav-links a:hover {
            background-color: #ffcc00;
            color: #333;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        }

        /* Dropdown Button Styling */
        .dropbtn {
            color: #fff;
            text-decoration: none;
            font-size: 16px;
            padding: 8px 16px;
            border-radius: 30px;
            background: transparent;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .dropbtn:hover {
            background-color: #ffcc00;
            color: #333;
        }

        /* Dropdown Menu */
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: white;
            min-width: 50px;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
            z-index: 1;
            border-radius: 8px;
            overflow: hidden;
            opacity: 0;
            transform: translateY(-10px);
            transition: opacity 0.3s ease, transform 0.3s ease;
        }

        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .dropdown-content a:hover {
            background-color: #f4f4f4;
        }

        .dropdown:hover .dropdown-content {
            display: block;
            opacity: 1;
            transform: translateY(0);
        }

        /* Hero Section */
        .hero {
            color: #fff;
            text-align: center;
            padding: 80px 20px;
            background: #2c3e50; /* Dark blue background for professionalism */
            text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.5);
        }

        .hero h1 {
            font-size: 48px;
            margin-bottom: 20px;
            animation: fadeInDown 1.2s ease;
        }

        .hero p {
            font-size: 20px;
            animation: fadeInUp 1.2s ease;
        }

        /* Content Section */
        .content {
            padding: 60px 20px;
            text-align: center;
            background: rgba(255, 255, 255, 0.95); /* White background with slight transparency */
            margin: 30px auto;
            max-width: 800px;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
        }

        .content h2 {
            font-size: 36px;
            margin-bottom: 20px;
            color: #34495e;
        }

        .content p {
            font-size: 18px;
            color: #555;
            max-width: 600px;
            margin: 0 auto;
            line-height: 1.6;
        }

        /* Services Section */
        .services {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            margin: 30px auto;
            padding: 20px;
            max-width: 800px;
            flex-wrap: wrap;
        }

        .service-card {
            background: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            padding: 20px;
            margin: 10px;
            width: calc(45% - 20px);
            text-align: center;
            opacity: 0;
            transform: translateY(20px);
            animation: slideIn 0.5s forwards;
        }

        .service-card:nth-child(1) { animation-delay: 0s; }
        .service-card:nth-child(2) { animation-delay: 0.1s; }
        .service-card:nth-child(3) { animation-delay: 0.2s; }
        .service-card:nth-child(4) { animation-delay: 0.3s; }

        @keyframes slideIn {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .service-card h3 {
            margin-bottom: 10px;
            color: #3498db; /* Bank-style blue color */
            font-size: 20px;
        }

        .service-card p {
            color: #555;
            font-size: 16px;
            line-height: 1.5;
        }

        /* Footer */
        footer {
            background-color: #34495e;
            color: #fff;
            text-align: center;
            padding: 20px;
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
            position: relative;
            width: 100%;
            bottom: 0;
            margin-top: 20px;
        }

        /* Animations */
        @keyframes fadeInDown {
            0% { opacity: 0; transform: translateY(-50px); }
            100% { opacity: 1; transform: translateY(0); }
        }

        @keyframes fadeInUp {
            0% { opacity: 0; transform: translateY(50px); }
            100% { opacity: 1; transform: translateY(0); }
        }

    </style>
    <link rel="icon" href="bg.png" type="image/png"> 
</head>
<body>

<%
    HttpSession sessions = request.getSession();
    AccountDto acc = (AccountDto) sessions.getAttribute("Account");
%>
    <nav class="navbar">
        <div class="logo">BrightPurse</div>
        <ul class="nav-links">
            <% if(acc.getAccount_Number() != 0) { %>
            <li><a href="balance.jsp">Balance Enquiry</a></li>
            <li><a href="transfer.jsp">Transfer</a></li>
            <li><a href="account_profile.jsp">Account Details</a></li>
            <li><a href="delete.jsp">Delete Account</a></li>
            <% } else { %>
            <li><a href="CreateAccount.jsp">Create Account</a></li>
            <% } %>
            <li><a href="info.jsp">Customer Service</a></li>
            <li class="dropdown">
                <button class="dropbtn">More</button>
                <div class="dropdown-content">
                    <a href="user_profile.jsp">Profile</a>
                    <a href="update.jsp">Update</a>
                    <a href="logout">Logout</a>
                </div>
            </li>
        </ul>
    </nav>

    <div class="hero">
        <h1>Welcome to BrightPurse Bank</h1>
        <p>Your reliable financial partner. Manage your money easily.</p>
    </div>

    <div class="content">
        <h2>What We Offer</h2>
        <p>At BrightPurse Bank, we offer a wide range of services designed to meet your banking needs. From savings accounts to personal loans, we’re here to help you manage your finances with ease and security.</p>
    </div>

    <div class="services">
        <div class="service-card">
            <h3>Accounts</h3>
            <p>Manage your account with ease. We offer a variety of account types for individuals and businesses.</p>
        </div>
        <div class="service-card">
            <h3>Loans</h3>
            <p>Personal loans, business loans, and more to help you achieve your goals.</p>
        </div>
        <div class="service-card">
            <h3>Online Banking</h3>
            <p>Access your accounts anywhere, anytime. Transfer funds, check balances, and more with online banking.</p>
        </div>
        <div class="service-card">
            <h3>Investments</h3>
            <p>Grow your wealth with our tailored investment options and financial planning services.</p>
        </div>
    </div>

    <footer>
        <p>&copy; 2024 BrightPurse Bank. All Rights Reserved.</p>
    </footer>

</body>
</html>
