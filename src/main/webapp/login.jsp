<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Bright Purse Bank</title>
    <link rel="icon" href="bg.png" type="image/png">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            height: 100vh;
            background: linear-gradient(to bottom, #f0f2f5, #e5e8eb);
            overflow: hidden;
            position: relative;
        }

        /* Spacer Div for Marquee */
        .spacer-div {
            width: 100vw;
            height: 10vh;
            background-color: #fafafa;
            position: absolute;
            top: 0;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 2vw;
            z-index: 2;
        }

		    .spacer-image-left {
		    height: 8vh;
		    width: auto;
		}

		.spacer-image-right {
		margin-top:-11vh;
		    max-height: 20vh; /* Increase the max height */
		    width: auto;
		    object-fit: contain; /* Ensure the aspect ratio remains consistent */
		}
        /* Marquee Container */
        .marquee-container {
            overflow: hidden;
            white-space: nowrap;
            background-color: #f5f5dc;
            color: #5a5a5a;
            padding: 1vh 0;
            width: 100vw;
            position: absolute;
            top: 10vh;
            text-align: center;
            font-size: 1.6vh;
            z-index: 1;
        }

        .marquee-text {
            display: inline-block;
            padding-left: 100vw;
            animation: slide 30s linear infinite;
        }

        @keyframes slide {
            0% { transform: translateX(0); }
            100% { transform: translateX(-100vw); }
        }

        #bgvideo {
            position: absolute;
            top: 10vh;
            width: 100vw;
            height: 90vh;
            z-index: 1;
        }

        .back-video {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .form-container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 3vh;
            border-radius: 1vh;
            box-shadow: 0 0.4vh 0.8vh rgba(0, 0, 0, 0.2);
            width: 30vw;
            height: 40vh;
            margin-top: 25vh;
            margin-left:55vw;
            z-index: 3;
            transform: scale(0.95);
            opacity: 0;
            animation: fadeIn 1s forwards;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.9); }
            to { opacity: 1; transform: scale(1); }
        }

        h2 {
            text-align: center;
            margin-bottom: 2vh;
            color: #333;
            opacity: 0;
            animation: slideIn 0.8s forwards;
            animation-delay: 0.3s;
        }

        .input-group {
            margin-bottom: 1.5vh;
            opacity: 0;
            animation: slideIn 0.8s forwards;
            animation-delay: 0.4s;
        }

        label {
            display: block;
            font-size: 1.4vh;
            color: #333;
            margin-bottom: 0.5vh;
        }

        input {
            width: 100%;
            padding: 1vh;
            border: 0.1vh solid #ccc;
            border-radius: 0.5vh;
            font-size: 1.6vh;
            color: #333;
        }

        input:focus {
            outline: none;
            border-color: #007bff;
        }

        .error-message {
            color: red;
            font-size: 1.2vh;
            margin-top: 0.5vh;
            display: none;
        }

        button {
            width: 100%;
            padding: 1.2vh;
            background-color: #007bff;
            border: none;
            border-radius: 0.5vh;
            color: white;
            font-size: 1.6vh;
            cursor: pointer;
            opacity: 0;
            animation: fadeInButton 1s forwards;
            animation-delay: 0.6s;
        }

        button:hover {
            background-color: #0056b3;
            transition: background-color 0.3s;
        }

        .forgot-password {
            text-align: right;
            margin-bottom: 2vh;
            font-size: 1.4vh;
        }

        .forgot-password a, .create-account a {
            color: #007bff;
            text-decoration: none;
        }

        .forgot-password a:hover, .create-account a:hover {
            text-decoration: underline;
        }

        .create-account {
            text-align: center;
            font-size: 1.4vh;
            margin-top: 1.5vh;
        }

        @keyframes slideIn {
            from { opacity: 0; transform: translateX(-1vh); }
            to { opacity: 1; transform: translateX(0); }
        }

        @keyframes fadeInButton {
            from { opacity: 0; transform: translateY(1vh); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
<% 
    String invalid_Email = (String) request.getAttribute("msg1");
    String invalid_Password = (String) request.getAttribute("msg2");
%>
    <div class="spacer-div">
        <img src="images/logo.png" alt="Logo" class="spacer-image-left">
        <img src="images/r_image.png" alt="Additional Image" class="spacer-image-right">
    </div>

    <div class="marquee-container">
        <span class="marquee-text">
            1. Use Strong, Unique Passwords | 2. Change Password Regularly | 3. Avoid Using Public Wi-Fi for Transactions |
            4. Beware of Phishing Emails and Messages | 5. Regularly Monitor Account for Unusual Activity |
            6. Keep Operating System and Anti-Virus Updated | 7. Always Log Out after Banking Session
        </span>
    </div>

    <div id="bgvideo">
        <video autoplay muted loop playsinline class="back-video">
            <source src="videos/bg_video1.mp4" type="video/mp4">
        </video>
    </div>

    <div class="form-container">
        <form action="login" method="post">
            <h2>Login</h2>
            <div class="input-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Enter your email" required>
                <!-- Display email error message if present -->
                <span id="emailError" class="error-message" style="<%if(invalid_Email!=null){%>display: block;<%} %>">
                    <%if(invalid_Email!=null){%><%=invalid_Email%><%} %>
                </span>
            </div>
            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
                <!-- Display password error message if present -->
                <span id="passwordError" class="error-message" style="<%if(invalid_Password!=null){%>display: block;<%} %>">
                    <%if(invalid_Password!=null){%><%=invalid_Password%><%} %>
                </span>
            </div>
            <div class="forgot-password">
                <a href="forgot.jsp">Forgot Password?</a>
            </div>
            <button type="submit">Login</button>
            <div class="create-account">
                <p>Not registered? <a href="registration.jsp">Register</a></p>
            </div>
        </form>
    </div>
</body>
</html>