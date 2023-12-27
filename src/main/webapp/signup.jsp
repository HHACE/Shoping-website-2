<%-- 
    Document   : login
    Created on : Jun 21, 2023, 9:13:07 PM
    Author     : ASUS
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sign-Up Form</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">


        <!-- Additional CSS Files -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
              <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="/assets/css/style.css">
        <link rel="stylesheet" href="/assets/css/owl.css">
        <link rel="stylesheet" href="/assets/css/animate.css">
        <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

        <style>

            body{
                background-repeat: no-repeat;
                background-size: cover;
                background-position: center;
            }

            @media screen and (min-width: 1920px) {
                .footer {
                    position: fixed;
                    left: 0;
                    bottom: 0;
                    width: 100%;
                }
            }

            @media screen and (max-width: 16in) {
                .footer {
                    margin-top: 50px;
                }
            }
            .Not-same {
                color: red;
                font-weight: bold;
                margin-bottom: 20px;
            }


        </style>
    </head>

    <body>

        <!-- ***** Preloader Start ***** -->
        <div id="js-preloader" class="js-preloader">
            <div class="preloader-inner">
                <span class="dot"></span>
                <div class="dots">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </div>
        </div>
        <!-- ***** Preloader End ***** -->

        <!-- ***** Header Area Start ***** -->
        <header class="header-area">
            <nav class="container main-nav">

                <!-- ***** Logo Start ***** -->
                <a href="./home" class="logo">
                    <img style="object-fit: contain;" src="./assets/images/logo.png" alt="">
                </a>
                <!-- ***** Logo End ***** -->

                <!-- ***** Menu Start ***** -->
                <ul class="nav" style="align-items: center;">
                    <li class="effect"><a href="./home" >Home</a></li>
                    <li class="effect"><a href="./rental">Product list</a></li>
                    <li class="effect"><a href="./instruction">Category</a></li>

                </ul>

                <a class='menu-trigger'>
                    <span>Menu</span>
                </a>
                <!-- ***** Menu End ***** -->
            </nav>
        </header>
        <!-- ***** Header Area End ***** -->


        <div class="container-fluid" style="margin-top:70px; padding: 70px 0;">
            <div id="toast" style="z-index: 1000000;"></div>
            <div class="">
                <div class="rounded d-flex justify-content-center" style="margin-bottom: 70px;">

                    <div class="col-lg-4 col-md-6 col-sm-12 background-light" style="background-color: rgba(255, 255, 255, 0.4); border-radius: 25px;">
                        <div class="text-center">
                            <h3 style="margin-top:30px; color: #27A4F2; padding: 20px; padding-bottom: 20px; letter-spacing: 5px">SIGN-UP</h3>
                        </div>
                        <!-- *****form here ***** -->
                        <form id="loginform" method="POST" action="signup">  <!-- *****send information to signupControl here***** -->
                            <div style="padding: 20px 48px;">
                                <div class="row input-group mb-3">
                                    <span class="input-group-text" style="width: 36px; background: #27A4F2;"><i class="bi bi-person-fill text-white"></i></span>
                                    <input name="username" type="text" class="col-lg-10 col-md-10 col-sm-8 form-control" placeholder="Enter your username" value="${requestScope.username}">
                                </div>
                                <div class="row input-group mb-3">
                                    <span class="input-group-text" style="width: 36px; background: #27A4F2;"><i class="bi bi-key-fill text-white"></i></span>
                                    <input id="password" name="password" type="password" class="col-lg-10 col-md-10 col-sm-8 form-control" placeholder="Enter your password" value="${requestScope.password}">
                                </div>
                                <div class="row input-group mb-3">
                                    <span id="repassword" class="input-group-text" style="width: 36px; background: #27A4F2;"><i class="bi bi-key-fill text-white"></i></span>
                                    <input name="repassword" type="password" class="col-lg-10 col-md-10 col-sm-8 form-control" placeholder="Re-enter your password"value="${requestScope.repassword}">
                                </div>
                                <div class="row input-group mb-3">
                                    <span class="input-group-text" style="width: 36px; background: #27A4F2;"><i class="bi bi-envelope-fill text-white"></i></span>
                                    <input name="email" type="email" class="col-lg-10 col-md-10 col-sm-8 form-control" placeholder="Enter your email"  value="${requestScope.email}">
                                </div>
                                <div class="row input-group mb-3">
                                    <span class="input-group-text" style="width: 36px; background: #27A4F2;"><i class="bi bi-person-plus-fill text-white mr-auto"></i></span>
                                    <input name="fullname" type="text" class="col-lg-10 col-md-10 col-sm-8 form-control" placeholder="Enter your fullname" value="${requestScope.fullname}">
                                </div>
                                <div class="row input-group mb-3">
                                    <span class="input-group-text" style="width: 36px; background: #27A4F2;"><i class="bi bi-telephone-fill text-white"></i></span>
                                    <input name="phone" type="text" class="col-lg-10 col-md-10 col-sm-8 form-control" placeholder="Enter your phone number" value="${requestScope.phone}">
                                </div>
                                <div class="row">
                                    <div class="form-check" style="flex: 1;">
                                        <span class="checkbox">
                                            <input type="checkbox" id="check">
                                            <label for="check">Remember me</label>
                                        </span>
                                    </div>

                                    <div class="form-check" style="flex: 1;">
                                        <a href="/user/forgotPassword" style="cursor: pointer; color: #27A4F2; font-size: 14px">Forgot password ?</a>
                                    </div>

                                    <div class="form-check" style="flex: 1;">
                                        <input type="checkbox" id="agree">
                                        <label for="agree">
                                            I agree to all the terms and conditions of the store.
                                        </label>
                                        <a href="terms.jsp" style="color:#27A4F2; cursor: pointer; font-size: 15px; margin-left: 5px;">
                                            View terms
                                        </a>
                                    </div>

                                    <p class="Not-same">${signupError}</p>
                                </div>

                                <div class="login-button" style="margin: 25px 48px;">
                                    <button class="w-50 mx-auto btn btn-primary text-center mt-2" style="display: flex; justify-content: center; background: #27A4F2; border: none; padding: 10px" type="submit" name="btnSignUp">
                                        Sign up
                                    </button>
                                </div>

                                <p class="text-center" style="color: #000; margin: 20px 48px;">
                                    Already have an account?
                                    <a href="/user/login" style="color:#27A4F2; cursor: pointer; font-size: 15px; margin-left: 15px">Login here</a>
                                </p>
                        </form>
                        <!-- Scripts -->
                        <!-- Bootstrap core JavaScript -->
                        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
                        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                        <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

                        <script src="/assets/js/isotope.js"></script>
                        <script src="/assets/js/owl-carousel.js"></script>
                        <script src="/assets/js/tabs.js"></script>
                        <script src="/assets/js/popup.js"></script>
                        <script src="/assets/js/custom.js"></script>
                        <script src="/assets/js/toast.js"></script>





                        <!--<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>-->
                        <!--<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>-->
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
                                        username: {
                                            required: true, // Field is required
                                            minlength: 6, // Minimum length of 5 characters
                                            maxlength: 20, // Minimum length of 5 characters

                                        },

                                        password: {
                                            required: true, // Field is required
                                            minlength: 6, // Minimum length of 5 characters
                                            maxlength: 50, // Minimum length of 5 characters
                                        },
                                        phone: {
                                            required: true, // Field is required
                                            minlength: 10, // Minimum length of 10 characters (assuming a valid phone number format)
                                            maxlength: 10, // Maximum length of 15 characters (assuming a valid phone number format)
                                            digits: true, // Only allow digits (numbers) in the input

                                        },
                                        email: {
                                            required: true, // Bắt buộc phải nhập giá trị
                                            pattern: /^[A-Za-z0-9._%+-]+@(gmail\.com|fpt\.edu\.vn|yahoo)$/, // Chỉ chấp nhận các địa chỉ email hợp lệ
                                        },
                                        repassword: {
                                            required: true,
                                            equalTo: "#password"
                                        },

                                        // Add more fields and rules as needed
                                    },
                                    messages: {
                                        // Define error messages for your form fields
                                        username: {
                                            required: 'Please enter a value for this field',
                                            minlength: 'Minimum length is 6 characters',
                                            maxlength: 'Maximum length is 20 characters',
                                        },
                                        password: {
                                            required: 'Please enter a value for this field',
                                            minlength: 'Minimum length is 6 characters',
                                            maxlength: 'Maximum length is 50 characters',
                                        },
                                        phone: {
                                            required: 'Please enter a value for this field',
                                            minlength: 'Minimum length is 10 characters',
                                            maxlength: 'Maximum length is 10 characters',
                                            digits: 'Please enter only digits (numbers)',
                                        },
                                        email: {
                                            required: 'Please enter a value for this field',
                                            pattern: 'Please enter a valid email address ending with @gmail.com, @fpt.edu.vn, or @yahoo',
                                        },
                                        repassword: {
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