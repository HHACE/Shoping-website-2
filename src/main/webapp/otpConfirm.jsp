<%-- 
    Document   : otpCf
    Created on : Oct 11, 2023, 7:03:06 PM
    Author     : ASUS
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Reset Password</title>
    </head>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url("https://wallpaperaccess.com/full/3312983.jpg");
        }
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .otp-title {
            font-weight: bold;
            text-align: center;
        }

        .otp-form {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 20px;
        }

        .otp-input-container {
            display: flex;
            gap: 5px;
            margin-top: 10px;
        }

        .otp-input-container input[type="text"] {
            width: 40px;
            height: 40px;
            text-align: center;
            border: 1px solid #999999;
            border-radius: 5px;
            font-size: 16px;
        }

        .confirm-button {
            font-size: 20px;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #0066cc;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .confirm-button:hover {
            background-color: #0052a3;
        }
    </style>
    <body>
        <h1>Enter OTP</h1>
        <form method="post" action="otp" class="otp-form">
            <div class="otp-input-container">
                <input type="text" name="characters1" maxlength="1" required>
                <input type="text" name="characters2" maxlength="1" required>
                <input type="text" name="characters3" maxlength="1" required>
                <input type="text" name="characters4" maxlength="1" required>
                <input type="text" name="characters5" maxlength="1" required>
                <input type="text" name="characters6" maxlength="1" required>
                <input type="hidden" name="sentOTP" value="<%= session.getAttribute("otp")%>">
                <input type="hidden" name="sentOTP" value="<%= session.getAttribute("email")%>">
            </div>

            <input type="submit" value="Confirm" name="btnConfirmOTP">
        </form>
        <% if (request.getParameter("error") != null && request.getParameter("error").equals("1")) { %>
        <p class="error-message">Wrong OTP. Please try again</p>
        <% }%>

    </body>
</html>