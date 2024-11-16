<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BrightPurse Bank - Information</title>
    <link rel="icon" href="myLogo.png" type="image/png">
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f8f9fa;
            color: #343a40;
        }

        .container {
            background: linear-gradient(135deg, #6c5ce7, #a29bfe); /* Gradient background */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px; /* Reduced width */
            text-align: center;
            transition: transform 0.3s ease;
        }

        .container:hover {
            transform: scale(1.02);
        }

        h1 {
            color: #fff;
            margin-bottom: 8px;
            font-size: 1.6rem; /* Reduced font size */
            letter-spacing: 0.4px;
        }

        h2 {
            color: #f1f1f1;
            margin-bottom: 12px;
            font-size: 1.3rem; /* Reduced font size */
        }

        p {
            color: #f8f9fa;
            line-height: 1.4;
            margin-bottom: 10px; /* Reduced margin */
            font-size: 0.95rem; /* Smaller font size */
        }

        .contact-info {
            background-color: #fff;
            color: #343a40;
            padding: 12px;
            border-radius: 6px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-top: 15px;
            border: 1px solid #ddd;
        }

        .contact-info p {
            color: #495057;
            font-size: 0.95rem; /* Smaller font size */
        }

        .link {
            margin-top: 20px; /* Reduced margin */
        }

        .link a {
            display: inline-block;
            padding: 10px 30px; /* Smaller padding */
            background-color: #28a745;
            color: #fff;
            text-decoration: none;
            font-weight: 600;
            font-size: 1rem; /* Reduced font size */
            border-radius: 20px;
            box-shadow: 0 5px 12px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .link a:hover {
            background-color: #218838;
            transform: translateY(-2px); /* Subtle hover effect */
        }

        .link a:active {
            transform: translateY(0);
        }

        footer {
            text-align: center;
            margin-top: 15px; /* Reduced margin */
            font-size: 11px;
            color: #fff;
        }

        @media (max-width: 768px) {
            .container {
                padding: 15px;
                max-width: 90%;
            }

            h1 {
                font-size: 1.4rem;
            }

            h2 {
                font-size: 1.2rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>BrightPurse Bank</h1>

        <div class="section">
            <h2>About Us</h2>
            <p>Welcome to BrightPurse Bank, your trusted financial partner. We offer a variety of banking services to help you manage your money securely and efficiently.</p>
        </div>

        <div class="section">
            <h2>Our Services</h2>
            <p>We provide a range of services including account management, fund transfers, balance inquiries, and more to cater to your banking needs.</p>
        </div>

        <div class="section">
            <h2>Contact Information</h2>
            <div class="contact-info">
                <p>Email: balujamisetti@gmail.com</p>
                <p>Phone: 9121058755</p>
                <p>Address: Hyderabad, KPHB Road No: 3</p>
            </div>
        </div>

        <div class="link">
            <a href="home.jsp">
                <img alt="Home Icon" src="home.png" style="height: 16px; width: 16px; margin-right: 6px; vertical-align: middle;"> 
                Go to Home Page
            </a>
        </div>

        <footer>
            <p>© 2024 BrightPurse Bank. All rights reserved.</p>
        </footer>
    </div>
</body>
</html>
