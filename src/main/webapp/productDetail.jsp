<%-- 
    Document   : productDetail
    Created on : Oct 23, 2023, 12:10:03 PM
    Author     : namti
--%>

<%@page import="SupportPackage.RandomProduct"%>
<%@page import="Models.Product"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Product Detail Page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="/css/open-iconic-bootstrap.min_1.css">
        <link rel="stylesheet" href="/css/animate.css">
        <link rel="stylesheet" href="/css/owl.carousel.min.css">
        <link rel="stylesheet" href="/css/owl.theme.default.min.css">
        <link rel="stylesheet" href="/css/magnific-popup.css">
        <link rel="stylesheet" href="/css/aos.css">
        <link rel="stylesheet" href="/css/ionicons.min.css">
        <link rel="stylesheet" href="/css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="/css/jquery.timepicker.css">
        <link rel="stylesheet" href="/css/flaticon.css">
        <link rel="stylesheet" href="/css/icomoon.css">
        <link rel="stylesheet" href="/css_shop/style.css">
    </head>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700;800&display=swap');

        *{
            box-sizing: border-box;
            padding: 0;
            margin: 0;
            font-family: 'Open Sans', sans-serif;
        }
        body{
            line-height: 1.5;
        }
        .back a{
            text-decoration: none; /* ẩn dấu gạch chân */
            font-size: 25px; /* cỡ chữ */
            font-weight: bold; /* in đậm */
            color: #000; /* màu chữ */
            display: flex; /* sử dụng mô hình flexbox để căn giữa phần tử */
            align-items: center; /* căn giữa phần tử theo trục dọc */
            margin-left: 10px;
        }
        .back a:hover{
            color:red;
            transition: all 0.3s ease 0s;
        }
        .back i {
            font-size: 25x; /* cỡ chữ của biểu tượng */
            margin-right: 10px; /* khoảng cách giữa biểu tượng và chữ */
        }
        .card-wrapper{
            max-width: 1100px;
            margin: 20px auto;
        }
        .img-display{
            overflow: hidden;
            height: calc(100% - 50px);
        }
        .img-display a img{
            max-width: 100%;
            max-height: 600px;
            display: block;
            transition: all 0.3s ease-in-out;
        }
        .img-display:hover img {
            transform: scale(1.1);
        }
        .product-imgs {
            height: 100%;
        }
        .product-content{
            padding: 2rem 1rem;
        }
        .product-name {
            font-size: 2rem;
            text-transform: capitalize;
            font-weight: 1000;
            text-align: center;
            position: relative;
            color: black;
            margin: 2rem 0;
        }
        .product-title{
            font-size: 2rem;
            text-transform: capitalize;
            font-weight: 700;
            position: relative;
            color: #12263a;
            margin: 2rem 0;
        }
        .product-title::after{
            content: "";
            position: absolute;
            left: 0;
            bottom: 0;
            height: 4px;
            width: 80px;
            background: #12263a;
        }
        .product-link{
            text-decoration: none;
            text-transform: uppercase;
            font-weight: 400;
            font-size: 0.9rem;
            display: inline-block;
            margin-bottom: 0.5rem;
            background: #256eff;
            color: #fff;
            padding: 0 0.3rem;
            transition: all 0.5s ease;
        }
        .product-link:hover{
            opacity: 0.9;
        }
        .product-rating{
            color: #ffc107;
        }
        .product-rating span{
            font-weight: 600;
            color: #252525;
        }
        .product-price{
            margin: 1rem 0;
            font-size: 25px;
            font-weight: 700;
        }
        .product-price span{
            font-weight: 400;
        }
        .product-detail h2{
            text-transform: capitalize;
            color: #12263a;
            padding-bottom: 0.6rem;
        }
        .product-detail p{
            font-size: 0.9rem;
            padding: 0.3rem;
            opacity: 1;
        }
        .product-detail ul{
            margin: 1rem 0;
            font-size: 0.9rem;
        }
        .product-detail ul li{
            margin: 0;
            list-style: none;
            background: url(../assets/checked.png) left center no-repeat;
            background-size: 18px;
            padding-left: 1.7rem;
            margin: 0.4rem 0;
            font-weight: 600;
            opacity: 0.9;
        }
        .product-detail ul li span{
            font-weight: 400;
        }
        .purchase-info{
            margin: 1.5rem 0;
        }
        .purchase-info input,
        .purchase-info .btn{
            border: 1.5px solid #ddd;
            border-radius: 25px;
            text-align: center;
            padding: 0.45rem 0.8rem;
            outline: 0;
            margin-right: 0.2rem;
            margin-bottom: 1rem;
        }
        .purchase-info input{
            width: 60px;
        }
        .purchase-info .btn{
            cursor: pointer;
            color: white;
        }
        .purchase-info .btn a{
            text-decoration: none;
            color:white;
        }
        .purchase-info .btn:first-of-type{
            background: black;
        }

        .purchase-info .btn:hover{
            opacity: 0.9;
        }
        .social-links{
            display: flex;
            align-items: center;
        }
        .social-links a{
            display: flex;
            align-items: center;
            justify-content: center;
            width: 32px;
            height: 32px;
            color: #000;
            border: 1px solid #000;
            margin: 0 0.2rem;
            border-radius: 50%;
            text-decoration: none;
            font-size: 0.8rem;
            transition: all 0.5s ease;
        }
        .social-links a:hover{
            background: #000;
            border-color: transparent;
            color: #fff;
        }

        .vertical-table {
            display: flex;
            flex-direction: column;
            border: 1px solid #000;
            margin: 20px;
        }

        .vertical-table div {
            display: flex;
            flex-direction: row;
            border-bottom: 1px solid #000;
        }

        .vertical-table div:last-child {
            border-bottom: none;
        }

        .vertical-table div span {
            width: 120px;
            padding: 5px;
            font-weight: bold;
        }

        .vertical-table div p {
            padding: 5px;
        }

        @media screen and (min-width: 992px){
            .card{
                display: grid;
                grid-template-columns: repeat(2, 1fr);
                grid-gap: 1.5rem;
            }
            .card-wrapper{
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .product-imgs{
                display: flex;
                flex-direction: column;
                justify-content: center;
            }
            .product-content{
                padding-top: 0;
            }
        }
        .item a{
            color:#fff;
            text-decoration: none;
        }
        footer {
            position: fixed;
            bottom: 0;
        }

        @media (max-height:800px) {
            footer {
                position: static;
            }
            header {
                padding-top: 40px;
            }
        }

        .footer {
            background:rgb(0,0,0,0.79);
            box-sizing: border-box;
            width: 100%;
            text-align: left;
            font: bold 16px sans-serif;
            padding: 50px 50px 60px 50px;
            margin-top: 80px;
        }

        .footer .footer-left, .footer .footer-center, .footer .footer-right {
            display: inline-block;
            vertical-align: top;
        }

        /* Footer left */

        .footer .footer-left {
            width: 30%;
        }

        .footer h3 {
            color: #ffffff;
            font: normal 36px 'Cookie', cursive;
            margin: 0;
        }


        .footer h3 span {
            color: #e0ac1c;
        }

        /* Footer links */

        .footer .footer-links {
            color: #ffffff;
            margin: 20px 0 12px;
        }

        .footer .footer-links a {
            display: inline-block;
            line-height: 1.8;
            text-decoration: none;
            color: inherit;
        }

        .footer .footer-company-name {
            color: #8f9296;
            font-size: 14px;
            font-weight: normal;
            margin: 0;
        }

        /* Footer Center */

        .footer .footer-center {
            width: 35%;
        }

        .footer .footer-center i {
            background-color: #33383b;
            color: #ffffff;
            font-size: 25px;
            width: 38px;
            height: 38px;
            border-radius: 50%;
            text-align: center;
            line-height: 42px;
            margin: 10px 15px;
            vertical-align: middle;
        }

        .footer .footer-center i.fa-envelope {
            font-size: 17px;
            line-height: 38px;
        }

        .footer .footer-center p {
            display: inline-block;
            color: #ffffff;
            vertical-align: middle;
            margin: 0;
        }

        .footer .footer-center p span {
            display: block;
            font-weight: normal;
            font-size: 14px;
            line-height: 2;
        }

        .footer .footer-center p a {
            color: #e0ac1c;
            text-decoration: none;
            ;
        }

        /* Footer Right */

        .footer .footer-right {
            width: 30%;
        }

        .footer .footer-company-about {
            line-height: 20px;
            color: #92999f;
            font-size: 13px;
            font-weight: normal;
            margin: 0;
        }

        .footer .footer-company-about span {
            display: block;
            color: #ffffff;
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .footer .footer-logo img {
            width: 120px;
            height: auto;
            margin-top: 30px;
        }


        .footer .footer-icons a:hover {
            background-color: #3F71EA;
        }

        .footer-links a:hover {
            color: #3F71EA;
        }

        @media (max-width: 880px) {
            .footer .footer-left, .footer .footer-center, .footer .footer-right {
                display: block;
                width: 100%;
                margin-bottom: 40px;
                text-align: center;
            }
            .footer .footer-center i {
                margin-left: 0;
            }
        }

        .product-imgs {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
        }

        .large-img {
            width: 100%; /* Điều chỉnh kích thước hình ảnh lớn */
            max-height: 400px; /* Điều chỉnh kích thước hình ảnh lớn */
        }

        .thumbnail-images {
            display: flex;
            justify-content: center;
            gap: 10px; /* Điều chỉnh khoảng cách giữa các hình ảnh nhỏ */
            overflow: auto;
        }

        .thumbnail {
            width: 60px; /* Điều chỉnh kích thước hình ảnh nhỏ */
            cursor: pointer;
        }


    </style>

    <body class="goto-here">
        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
            <div class="container">
                <a class="navbar-brand" style="margin-bottom: 10px;" href="/home"><img src="/images_shop/logo.png"></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="oi oi-menu"></span> Menu
                </button>
                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item"><a href="/home" class="nav-link" style="font-size: 18px;">Home</a></li>
                        <li class="nav-item"><a href="/product/productList" class="nav-link" style="font-size: 18px;">Product List</a></li>
                        <li class="nav-item"><a href="about.html" class="nav-link" style="font-size: 18px;">About</a></li>
                        <li class="nav-item cta cta-colored"><a href="cart.html" class="nav-link"><span><i class="fas fa-shopping-cart"></i></span>[2]</a></li>
                                        <c:choose>
                                            <c:when test="${empty sessionScope.username}">
                                <li class="nav-item"><a href="/user/login" class="nav-link" style="font-size: 18px;">Log in</a></li>
                                </c:when>
                                <c:otherwise>
                                <li class="nav-item dropdown active">
                                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                        <i class="fas fa-user"></i>
                                        <span class="d-none d-lg-inline-flex">${sessionScope.username}</span>
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="dropdown04">
                                        <a class="dropdown-item" href="/userProfile?username=${username}">My Profile</a>
                                        <a href="/user/logout" class="dropdown-item" style="">Log Out</a>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- End Header -->


        <!-- Image -->
        <div class="hero-wrap hero-bread" style="background-image: url('/images_shop/bg_6.png'); margin-top: 30px;">
            <div class="container">
                <div class="row no-gutters slider-text align-items-center justify-content-center">
                    <div class="col-md-9 ftco-animate text-center">
                        <h1 class="mb-0 bread" style="color: white;">Product Detail</h1>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Image -->

        <!-- Product detail -->
        <div class="body-form" style="margin-top: 20px; border:none;">
            <div class = "card-wrapper">

                <div class = "card" style="width: 1300px; border: none;">

                    <!-- Card Left -->
                    <div class="product-imgs">
                        <div class="product-name">${listProduct.product_name}</div>
                        <div class="img-display">
                            <img id="product-img" src="/images/${listProduct.images[0]}" class="large-img">
                        </div>
                        <div class="thumbnail-images">
                            <c:forEach items="${listProduct.images}" var="image">
                                <img src="/images/${image}" class="thumbnail">
                            </c:forEach>
                        </div>
                    </div>

                    <!-- End Cart Left -->

                    <!-- Card right -->
                    <div class = "product-content">
                        <h2 class = "product-title">${listProduct.product_name}</h2>
                        <a href = "/home" class = "product-link">Visit our store</a>

                        <c:set var="discountPrice" value="${listProduct.product_price-((listProduct.discount/100) * listProduct.product_price)}"/>
                        <fmt:formatNumber value="${discountPrice}" type="number" pattern="0.00" var="formattedPrice" />
                        <div class = "product-price">
                            <p class="price">Price: <span class="mr-2 price-dc" style="text-decoration: line-through">$${listProduct.product_price}</span><span class="price-sale" style="color: red">$${formattedPrice}</span></p>
                            <div class="sale-off-form"><span class="sale-off">Sale ${listProduct.discount}%</span></div>
                        </div>
                        <div class = "product-detail">
                            <h2>about this item: </h2>
                            <ul>
                                <li>Available:<span> ${listProduct.product_quantity}</span></li>
                                <li>Category: <span>${listCate.category_name}</span></li>
                                <li>Brand: <span>${listBrand.brand_name}</span></li>
                                <li>Shipping Area: <span>In the Vietnam</span></li>
                                <li>Shipping Fee: <span>Free</span></li>
                            </ul>
                        </div>
                        <div class="row">
                            <div class="product-details pl-md-5 ftco-animate">
                                <div class="row mt-4">
                                    <div class="w-100"></div>
                                    <div class="input-group col-md-6 d-flex mb-3">
                                        <span class="input-group-btn mr-2">
                                            <button type="button" class="quantity-left-minus btn" data-type="minus" data-field="">
                                                <i class="fas fa-minus"></i>
                                            </button>
                                        </span>
                                        <input type="text" id="quantity" name="quantity" class="quantity form-control input-number" value="1" min="1" max="${listP.product_quantity}">
                                        <span class="input-group-btn ml-2">
                                            <button type="button" class="quantity-right-plus btn" data-type="plus" data-field="">
                                                <i class="fas fa-plus"></i>
                                            </button>
                                        </span>
                                    </div>
                                    <span id="quantity-error" style="display: none; color: red;">Please fill in a valid value.</span>
                                    <span id="quantity-error" style="display: none; color: red;"></span>
                                    <div class="col-md-12">
                                        <p style="color: #000;">${listProduct.product_quantity} product available</p>
                                    </div>
                                </div>
                                <p class="buy-and-cart" style="width: 50px; height: 8px; display: inline;">
                                    <a href="cart.jsp" class="btn btn-black py-3 px-5 mr-2" style="display: inline; margin-top:50px;">Add to Cart</a>
                                    <a href="cart.jsp" class="btn btn-primary py-3 px-5" style="display: inline;">Buy now</a>
                                </p>
                            </div>
                        </div>
                    </div>
                    <!--END Cart Right -->
                </div>
            </div>

            <!-- Comment Customer -->
            <div class="row mt-5" style="margin-bottom: 50px;">
                <div class="col-md-12 nav-link-wrap">
                    <div class="nav nav-pills d-flex text-center" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                        <a class="nav-link ftco-animate active mr-lg-1" id="v-pills-1-tab" data-toggle="pill" href="#v-pills-1" role="tab" aria-controls="v-pills-1" aria-selected="true">Description</a>
                        <a class="nav-link ftco-animate mr-lg-1" id="v-pills-2-tab" data-toggle="pill" href="#v-pills-2" role="tab" aria-controls="v-pills-2" aria-selected="false">Specification</a>
                        <a class="nav-link ftco-animate mr-lg-1" id="v-pills-3-tab" data-toggle="pill" href="#v-pills-3" role="tab" aria-controls="v-pills-3" aria-selected="false">More product</a>
                    </div>
                </div>        
                <div class="col-md-12 tab-wrap">
                    <div class="tab-content bg-light" id="v-pills-tabContent">
                        <div class="tab-pane fade show active" id="v-pills-1" role="tabpanel" aria-labelledby="day-1-tab">
                            <div class="p-4">
                                <h3 class="mb-4">${listProduct.product_name}</h3>
                                <p>${listProduct.product_description}</p>
                            </div>
                        </div>

                        <div class="tab-pane fade" id="v-pills-2" role="tabpanel" aria-labelledby="v-pills-day-2-tab">
                            <div class="p-4">
                                <h3 class="mb-4">Specification</h3>
                                <div class="vertical-table">
                                    <c:forEach items="${listSpec}" var="spec">
                                        <div>
                                            <span>CPU</span>
                                            <p>${spec.cpu}</p>
                                        </div>
                                        <div>
                                            <span>GPU</span>
                                            <p>${spec.gpu}</p>
                                        </div>
                                        <div>
                                            <span>RAM</span>
                                            <p>${spec.ram}</p>
                                        </div>
                                        <div>
                                            <span>Storage</span>
                                            <p>${spec.storage}</p>
                                        </div>
                                        <div>
                                            <span>Screen</span>
                                            <p>${spec.screen}</p>
                                        </div>
                                        <div>
                                            <span>Pin</span>
                                            <p>${spec.pin}</p>
                                        </div>
                                        <div>
                                            <span>Weight</span>
                                            <p>${spec.weight}</p>
                                        </div>
                                        <div>
                                            <span>OS</span>
                                            <p>${spec.os}</p>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="v-pills-3" role="tabpanel" aria-labelledby="v-pills-day-3-tab">
                            <%
                                List<Product> productList = (List<Product>) request.getAttribute("proList"); // Lấy danh sách sản phẩm từ request
                                int numProductsToDisplay = 6;

                                List<Product> randomProducts = RandomProduct.selectRandomProducts(productList, numProductsToDisplay);
                            %>
                            <div class="container">
                                <div class="row">
                                    <c:forEach var="pro" items="<%= randomProducts%>">
                                        <c:if test="${pro.status == true}">
                                            <c:set var="discountPrice" value="${pro.product_price - ((pro.discount/100) * pro.product_price)}"/>
                                            <fmt:formatNumber value="${discountPrice}" type="number" pattern="0.00" var="formattedPrice" />
                                            <div class="col-sm-12 col-md-12 col-lg-4 ftco-animate d-flex">
                                                <div class="product d-flex flex-column">
                                                    <a href="/product/productDetail?productId=${pro.product_id}" class="img-prod">
                                                        <img class="img-fluid" src="/images/${pro.images[0]}" alt="Colorlib Template">
                                                        <div class="overlay"></div>
                                                    </a>
                                                    <div class="text py-3 pb-4 px-3">
                                                        <h3>
                                                            <a href="/product/productDetail?productId=${pro.product_id}">
                                                                ${pro.product_name}
                                                            </a>
                                                        </h3>
                                                        <div class="pricing">
                                                            <p class="price"><span class="mr-2 price-dc">$${pro.product_price}</span><span class="price-sale">$${formattedPrice}</span></p>
                                                            <div class="sale-off-form"><span class="sale-off">Sale ${pro.discount}%</span></div>
                                                        </div>
                                                        <p class="bottom-area d-flex px-3">
                                                            <a href="#" class="add-to-cart text-center py-2 mr-1">
                                                                <span>Add to cart <i class="fa-solid fa-cart-shopping"></i></span>
                                                            </a>
                                                            <a href="#" class="buy-now text-center py-2">
                                                                Buy now <span><i class="fa-solid fa-truck-ramp-box"></i></span>
                                                            </a>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Product Detail -->

            <!-- FOOTER -->
            <footer class="ftco-footer ftco-section">
                <div class="container">
                    <div class="row">
                        <div class="mouse">
                            <a href="#" class="mouse-icon">
                                <div class="mouse-wheel"><span><i class="fas fa-arrow-up"></i></span></div>
                            </a>
                        </div>
                    </div>
                    <div class="row mb-5">
                        <div class="col-md">
                            <div class="ftco-footer-widget mb-4">
                                <h2 class="ftco-heading-2">Minishop</h2>
                                <p>With the best choice for you, you can be assured of the perfection of your laptop and will never regret your purchasing decision.</p>
                                <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                                    <li class="ftco-animate"><a href="#"><span><i class="fab fa-instagram"></i></span></a></li>
                                    <li class="ftco-animate"><a href="https://www.facebook.com/profile.php?id=61552755350537&is_tour_dismissed=true"><span><i class="fab fa-facebook"></i></span></a></li>
                                    <li class="ftco-animate"><a href="#"><span><i class="fab fa-youtube"></i></span></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md">
                            <div class="ftco-footer-widget mb-4 ml-md-5">
                                <h2 class="ftco-heading-2">Menu</h2>
                                <ul class="list-unstyled">
                                    <li><a href="shop.html" class="py-2 d-block">Shop</a></li>
                                    <li><a href="about.html" class="py-2 d-block">About</a></li>
                                    <li><a href="contact.html" class="py-2 d-block">Contact Us</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="ftco-footer-widget mb-4">
                                <h2 class="ftco-heading-2">Help</h2>
                                <div class="d-flex">
                                    <ul class="list-unstyled mr-l-5 pr-l-3 mr-4">
                                        <li><a href="#" class="py-2 d-block">Shipping Information</a></li>
                                        <li><a href="#" class="py-2 d-block">Returns &amp; Exchange</a></li>
                                        <li><a href="#" class="py-2 d-block">Terms &amp; Conditions</a></li>
                                        <li><a href="#" class="py-2 d-block">Privacy Policy</a></li>
                                    </ul>
                                    <ul class="list-unstyled">
                                        <li><a href="#" class="py-2 d-block">FAQs</a></li>
                                        <li><a href="#" class="py-2 d-block">Contact</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md">
                            <div class="ftco-footer-widget mb-4">
                                <h2 class="ftco-heading-2">Have a Questions?</h2>
                                <div class="block-23 mb-3">
                                    <ul>
                                        <li><span style="margin-right: 15px;"><i class="fas fa-map-marker"></i></span><span class="text">203 Nguyen Van Cu, An Hoa, Ninh Kieu, Can Tho</span></li>
                                        <li><span style="margin-right: 15px;"><i class="fas fa-mobile-alt"></i></span><span class="text">0987 654 321</span></a></li>
                                        <li><span style="margin-right: 10px;"><i class="fas fa-envelope"></i></span><span class="text">rubicongroup2@gmail.com</span></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>

            <!-- loader -->
            <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
            <script src="/js_shop/jquery.min.js"></script>
            <script src="/js_shop/jquery-migrate-3.0.1.min.js"></script>
            <script src="/js_shop/popper.min.js"></script>
            <script src="/js_shop/bootstrap.min.js"></script>
            <script src="/js_shop/jquery.easing.1.3.js"></script>
            <script src="/js_shop/jquery.waypoints.min.js"></script>
            <script src="/js_shop/jquery.stellar.min.js"></script>
            <script src="/js_shop/owl.carousel.min.js"></script>
            <script src="/js_shop/jquery.magnific-popup.min.js"></script>
            <script src="/js_shop/aos.js"></script>
            <script src="/js_shop/jquery.animateNumber.min.js"></script>
            <script src="/js_shop/bootstrap-datepicker.js"></script>
            <script src="/js_shop/scrollax.min.js"></script>
            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
            <script src="/js_shop/google-map.js"></script>
            <script>
                var maxQuantity = ${listProduct.product_quantity};
                var currentValidValue = 1; // Giá trị ban đầu

                function isValidQuantity(quantity) {
                    return quantity >= 1 && quantity <= maxQuantity;
                }

                function showQuantityError() {
                    var quantityError = document.getElementById('quantity-error');
                    var quantityInput = document.getElementById('quantity');
                    quantityError.style.display = 'block';
                    quantityInput.classList.add('error');
                }

                function hideQuantityError() {
                    var quantityError = document.getElementById('quantity-error');
                    var quantityInput = document.getElementById('quantity');
                    quantityError.style.display = 'none';
                    quantityInput.classList.remove('error');
                }

                function updateQuantityValue(value) {
                    var quantityInput = document.getElementById('quantity');
                    quantityInput.value = value;
                    currentValidValue = value;
                }

                function formatQuantityValue(value) {
                    return parseInt(value);
                }

                document.addEventListener('DOMContentLoaded', function () {
                    var quantityInput = document.getElementById('quantity');
                    var decreaseButton = document.querySelector('.quantity-left-minus');
                    var increaseButton = document.querySelector('.quantity-right-plus');

                    decreaseButton.addEventListener('click', function () {
                        var currentValue = parseInt(quantityInput.value);
                        if (currentValue > 1) {
                            updateQuantityValue(currentValue - 1);
                            hideQuantityError();
                        }
                    });

                    increaseButton.addEventListener('click', function () {
                        var currentValue = parseInt(quantityInput.value);
                        if (currentValue < maxQuantity) {
                            updateQuantityValue(currentValue + 1);
                            hideQuantityError();
                        }
                    });

                    quantityInput.addEventListener('input', function () {
                        var quantityValue = parseInt(quantityInput.value);
                        if (isNaN(quantityValue) || !isValidQuantity(quantityValue)) {
                            showQuantityError();
                            quantityInput.value = currentValidValue;
                        } else {
                            hideQuantityError();
                            currentValidValue = formatQuantityValue(quantityValue);
                            quantityInput.value = currentValidValue;
                        }
                    });
                });
                let currentIndex = 0;
                const images = document.querySelectorAll('.thumbnail');
                const largeImage = document.querySelector('.large-img');

                function showImage(index) {
                    if (index < 0) {
                        currentIndex = images.length - 1;
                    } else if (index >= images.length) {
                        currentIndex = 0;
                    }

                    largeImage.src = images[currentIndex].src;
                }

                function nextImage() {
                    currentIndex++;
                    showImage(currentIndex);
                }

                function prevImage() {
                    currentIndex--;
                    showImage(currentIndex);
                }

                setInterval(nextImage, 3000); // Tự động chuyển hình mỗi 5 giây

                images.forEach((image, index) => {
                    image.addEventListener('click', () => {
                        currentIndex = index;
                        showImage(currentIndex);
                    });
                });
            </script>
            <script src="/js_shop/main.js"></script>
    </body>
</html>

