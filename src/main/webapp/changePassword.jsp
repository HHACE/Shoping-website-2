<%-- 
    Document   : changePassword
    Created on : Oct 11, 2023, 11:30:20 PM
    Author     : ASUS
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>ChangePass</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-image: url("https://wallpaperaccess.com/full/3312983.jpg");
            }
            .container {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                height: 100vh;
                color: white;
            }
            .input-group {
                margin-bottom: 10px;
            }
            .input-label {
                font-weight: bold;
            }
            .input-field {
                padding: 5px;
                border-radius: 5px;
                border: none;
            }
            .submit-button {
                padding: 10px 20px;
                border-radius: 5px;
                border: none;
                background-color: #4287f5;
                color: white;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Change-Password</h1>
            <form action="changePassword" method="POST">
                <div class="input-group">
                    <input type="hidden" name="email" value="<%= session.getAttribute("email")%>">
                </div>
                <div class="input-group">
                    <label class="input-label" for="newPassword">New-password</label>
                    <input class="input-field" type="password" id="newPassword" name="newPassword" required>
                </div>
                <div class="input-group">
                    <label class="input-label" for="confirmPassword">Confirm new password:</label>
                    <input class="input-field" type="password" id="confirmPassword" name="confirmPassword" required>
                </div>
                <button class="submit-button" type="submit" name="btnReset">Change the password</button>
            </form>
        </div>
        <script>
            //code cript bat loi o day
            if ("${requestScope.loginStatus}" === "failure") {
                showErrorLogin();
            <%
                            request.setAttribute("loginStatus", null);
            %>
            }
            $(document).ready(function () {
                $('#loginform').validate({
                    rules: {
                        // Define validation rules for your form fields


                       newPassword: {
                            required: true, // Field is required
                            minlength: 6, // Minimum length of 5 characters
                            maxlength: 50, // Minimum length of 5 characters
                        },
                       confirmPassword: {
                            required: true,
                            equalTo: "#password"
                        },

                        // Add more fields and rules as needed
                    },
                    messages: {
                        // Define error messages for your form fields                        
                        newPassword: {
                            required: 'Please enter a value for this field',
                            minlength: 'Minimum length is 6 characters',
                            maxlength: 'Maximum length is 50 characters',
                        },
                        confirmPassword: {
                            required: 'Please enter a value for this field',
                            equalTo: 'Passwords do not match'
                        },
                        // Add more fields and messages as needed
                    }
                });
            });
        </script>
    </body>
</html>
