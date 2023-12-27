<%-- 
    Document   : editProfile_User
    Created on : Oct 20, 2023, 3:20:44 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Profile User</title>
        <link rel="stylesheet" href="/css/style.css">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
        <link rel="stylesheet" href="/css_shop/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="/css_shop/animate.css">
        <link rel="stylesheet" href="/css_shop/owl.carousel.min.css">
        <link rel="stylesheet" href="/css_shop/owl.theme.default.min.css">
        <link rel="stylesheet" href="/css_shop/magnific-popup.css">
        <link rel="stylesheet" href="/css_shop/aos.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="/css_shop/bootstrap-datepicker.css">
        <link rel="stylesheet" href="/css_shop/jquery.timepicker.css">
        <link rel="stylesheet" href="/css_shop/flaticon.css">
        <link rel="stylesheet" href="/css_shop/icomoon.css">
        <link rel="stylesheet" href="/css_shop/style.css">
    </head>

    <style>
        body{
            margin-top: 70px;
        }
        .user-avatar{
            text-align: center;
            padding: 2px;
        }
        .user-avatar img{
            max-width: 100%;
            height: auto;
            border-radius: 50px;
        }
        .user-name,
        .user-email{
            text-align: center;
            margin-top: 10px;
        }
        .text-primary{
            font-size: 25px;
        }
        .form-group label{
            color: black;
        }
        .form-group input{
            border: none;
            border-bottom: 2px solid black;
            font-size: 13px;
        }
        .form-group input:focus{
            border-bottom: 2px solid #51b1ff;
        }
        .info-about-user{
            color: black;
            font-weight: bold;
            border-bottom: 1px solid black;
        }
    </style>

    <body>    
        <div class="container">
            <div class="row gutters">
                <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
                    <div class="card h-100">
                        <div class="card-body">
                            <div class="account-settings">
                                <div class="user-profile">
                                    <div class="user-avatar">
                                        <i class="fas fa-user-circle fa-lg"></i>
                                    </div>
                                    <div>
                                        <h5 class="user-name">${listCus.username}</h5>
                                        <h6 class="user-email">${listCus.email}</h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
                    <div class="card h-100">
                        <div class="card-body">
                            <div class="row gutters">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                    <h6 class="mb-2 text-primary">Personal Details</h6>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label for="fullName">Full Name</label>
                                        <div class="info-about-user">Luon Thanh Loc</div>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label for="eMail">Username</label>
                                        <div class="info-about-user">Mr Thanh Loc</div>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label for="eMail">Email</label>
                                        <div class="info-about-user">mrThanhLoc@gmail.com</div>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label for="phone">Phone</label>
                                        <div class="info-about-user">0912345678</div>
                                    </div>
                                </div>
                            </div>
                            <div class="row gutters">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                    <h6 class="mt-3 mb-2 text-primary">Address</h6>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="form-group">
                                        <div class="info-about-user">Tran Hoang Na</div>
                                    </div>
                                </div>
                            </div>
                            <div class="row gutters">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                    <div class="text-right">
                                        <button type="button" id="submit" name="submit" class="btn btn-secondary"><a href="/home" style="color: white">Home</a></button>
                                        <button type="button" id="submit" name="submit" class="btn btn-primary"><a href=" " style="color: white">Edit</a></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
