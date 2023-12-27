<%-- 
    Document   : login
    Created on : Jun 21, 2023, 9:13:07 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Form</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">


        <!-- Additional CSS Files -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
              <link rel="stylesheet" href="/assets/css/fontawesome.css">
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
                    margin-top: 70px;
                }
            }
            .Not-same {
                color: red;
                font-weight: bold;
                margin-bottom: 20px;
            }
            /* Lớp cho pop-up */
            .popup {
                position: fixed;
                left: 50%;
                top: 50%;
                transform: translate(-50%, -50%);
                background-color: #ffffff;
                padding: 20px;
                width: 300px;
                border: 1px solid #cccccc;
                box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
            }

            /* Lớp che phủ nền */
            .overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                z-index: 9999;
                opacity: 0;
                visibility: hidden;
                transition: opacity 0.3s ease;
            }
            .popup {
                background-color: #e3f2fd;
                padding: 20px;
                border: 2px solid #2196f3;
                border-radius: 5px;
                text-align: center;
                animation: blink-animation 1s infinite;
            }

            @keyframes blink-animation {
                0% {
                    box-shadow: 0 0 5px rgba(33, 150, 243, 0.7);
                }
                50% {
                    box-shadow: 0 0 20px rgba(33, 150, 243, 0.7);
                }
                100% {
                    box-shadow: 0 0 5px rgba(33, 150, 243, 0.7);
                }
            }

            #closeButton {
                background-color: #2196f3;
                color: #000000;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                cursor: pointer;
                font-size: 12px; /* Thu nhỏ chữ "OK" */
                font-weight: bold; /* Tô đậm chữ "OK" */
                margin-top: 15px;
            }

            .popup h3 {
                font-weight: bold; /* Tô đậm chữ "Sign up successfully!" */
            }

            .popup p {
                font-weight: bold; /* Tô đậm chữ "login" */
            }
            #closeButton:hover {
                color: #ffffff; /* Thay đổi màu chữ thành trắng khi hover */
            }


        </style>
    </head>

    <body>

        <!-- ***** Header Area Start ***** -->
        <header class="header-area">
            <nav class="container main-nav">

                <!-- ***** Logo Start ***** -->
                <a href="/home" class="logo">
                    <img style="object-fit: contain;" src="./assets/images/logo.png" alt="">
                </a>
                <!-- ***** Logo End ***** -->

                <!-- ***** Menu Start ***** -->
                <ul class="nav" style="align-items: center;">
                    <li class="effect"><a href="/home" >Home</a></li>
                    <li class="effect"><a href="/product/productList">Product list</a></li>
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
                            <h3 style="margin-top:30px; color: #27A4F2; padding: 20px; padding-bottom: 20px; letter-spacing: 5px">LOGIN</h3>
                        </div>
                        <form id="loginform" method="POST" action="login">
                            <div style="padding: 20px 48px;">
                                <div class="row input-group mb-3">
                                    <span class="input-group-text" style="width: 36px; background: #27A4F2;"><i class="bi bi-person-plus-fill text-white mr-auto"></i></span>
                                    <input name="username" type="text" class="col-lg-10 col-md-10 col-sm-8 form-control" placeholder="Enter username">
                                </div>
                                <div class="row input-group mb-3">
                                    <span class="input-group-text" style="width: 36px; background: #27A4F2;"><i class="bi bi-key-fill text-white"></i></span>
                                    <input name="password" type="password" class="col-lg-10 col-md-10 col-sm-8 form-control" placeholder="Enter your password">
                                </div>
                                <div class="form-check">
                                    <span class="checkbox">
                                        <input type="checkbox" id="check" name="rmbMe">
                                        <label for="check">Remember me</label>
                                    </span>
                                    <a href="/user/forgotPassword"  style="cursor: pointer; color: #27A4F2; margin-left: 70px; font-size: 15px">Forgot your password?</a>
                                </div>
                                <p class="Not-same">${mess}</p>
                                <div class="login-button" style="margin-top: 25px">
                                    <button class="w-50 mx-auto btn btn-primary text-center mt-2" style="display: flex; justify-content: center; background: #27A4F2; border: none; padding: 10px" type="submit" name="btnLogin">
                                        Login
                                    </button>
                                </div>

                                <p class="text-center " style="color: #000; margin-top: 20px; margin-right: 50px">
                                    Don't have an account ?
                                    <a href="/user/register" style="color:#27A4F2; cursor: pointer; font-size: 15px; margin-top: 10px;"> Sign Up here</a>
                                </p>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>


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
            // Kiểm tra nếu có tham số "signupSuccess" trong URL
            // Kiểm tra nếu có tham số "signupSuccess" trong URL
            const urlParams = new URLSearchParams(window.location.search);
            const signupSuccess = urlParams.get('signupSuccess');

            if (signupSuccess === 'true') {
                // Tạo pop-up
                const popup = document.createElement('div');
                popup.className = 'popup';
                popup.innerHTML = `
    <p>Sign up successfully!<br/>
   Please click "OK" and then login.</p>
    <button id="closeButton">Ok</button>
  `;
// Thêm phần tử vào DOM
                // Tạo che phủ nền
                const overlay = document.createElement('div');
                overlay.className = 'overlay';

                // Thêm pop-up và che phủ nền vào body
                document.body.appendChild(overlay);
                document.body.appendChild(popup);

                // Xóa pop-up và che phủ nền khi nhấp chuột vào che phủ nền hoặc nút "Ok"
                function closePopup() {
                    overlay.classList.remove('active');
                    setTimeout(function () {
                        document.body.removeChild(overlay);
                        document.body.removeChild(popup);
                    }, 300);
                }

                overlay.addEventListener('click', closePopup);
                const closeButton = document.getElementById('closeButton');
                closeButton.addEventListener('click', closePopup);

                // Hiển thị pop-up và làm mờ màn hình
                setTimeout(function () {
                    overlay.classList.add('active');
                }, 100);
            }
            $(document).ready(function () {
                $('#loginform').validate({
                    rules: {
                        // Define validation rules for your form fields
                        username: {
                            required: true, // Field is required
                            minlength: 5, // Minimum length of 5 characters
                            maxlength: 50, // Minimum length of 5 characters
                        },
                        password: {
                            required: true, // Field is required
                            minlength: 6, // Minimum length of 5 characters
                            maxlength: 50, // Minimum length of 5 characters
                        }
                        // Add more fields and rules as needed
                    },
                    messages: {
                        // Define error messages for your form fields
                        username: {
                            required: 'Please enter username for this field!',
                            minlength: 'Minimum length is 6 characters',
                            maxlength: 'Maximum length is 50 characters',
                        },
                        password: {
                            required: 'Please enter password for this field!',
                            minlength: 'Minimum length is 6 characters',
                            maxlength: 'Maximum length is 50 characters',
                        }
                        // Add more fields and messages as needed
                    }
                });
            });
        </script>
    </body>

</html>