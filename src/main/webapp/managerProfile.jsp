<%-- 
    Document   : editProfile_User
    Created on : Oct 20, 2023, 3:20:44 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Profile Admin</title>
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

                <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
                    <div class="card h-100">
                        <div class="card-body">
                            <div class="row gutters">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                    <h6 class="mb-2 text-primary">Personal Details</h6>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label for="manager_id">Manager_id</label>
                                        <div class="info-about-user">${listM.getManager_id()}</div>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label for="fullname">Full name</label>
                                        <div class="info-about-user">${listM.getFullname()}</div>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label for="phonenumber">Phone number</label>
                                        <div class="info-about-user">${listM.getPhone_number()}</div>
                                    </div>
                                </div>

                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label for="username">Username</label>
                                        <div class="info-about-user">${listM.getUsername()}</div>
                                    </div>
                                </div>   


                            </div>
                            <div class="row gutters">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                    <div class="text-right">
                                        <button type="button" id="submit" name="submit" class="btn btn-secondary"><a href="<%=getServletContext().getContextPath()%>/homeManagement" style="color: white">Home</a></button>
                                        <a class="btn btn-primary" href="<%=getServletContext().getContextPath()%>/account/editProfileManager" style="color: white">Edit</a>
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
