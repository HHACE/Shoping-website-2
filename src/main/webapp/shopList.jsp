<%-- 
    Document   : ShopDetail
    Created on : Oct 13, 2023, 8:13:04 PM
    Author     : namti
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Shop Page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
        <link rel="stylesheet" href="/css/open-iconic-bootstrap.min_1.css">
        <link rel="stylesheet" href="/css/animate.css">
        <link rel="stylesheet" href="/css/owl.carousel.min.css">
        <link rel="stylesheet" href="/css/owl.theme.default.min.css">
        <link rel="stylesheet" href="/css/magnific-popup.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="/css/aos.css">
        <link rel="stylesheet" href="/css/ionicons.min.css">
        <link rel="stylesheet" href="/css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="/css/jquery.timepicker.css">
        <link rel="stylesheet" href="/css/flaticon.css">
        <link rel="stylesheet" href="/css/icomoon.css">
        <link rel="stylesheet" href="/css_shop/style.css">
    </head>
    <style>
        .nav-link{
            display: block;
            position: relative;
            font-size: 1.1em;
            text-decoration: none;
            font-weight: 500;
            margin-left: 40px;
        }
        .nav-link::after{
            content: '';
            position: absolute;
            width: 100%;
            height: 3px;
            background: #51b1ff;
            border-radius: 5px;
            transform: scaleX(0);
            transition: transform .5s;
        }
        .pricing .price {
            font-weight: bold;
        }
        .pricing .original-price {
            text-decoration: line-through;
        }
        .product-image {
            width: 100%;
            height: 200px; /* Đặt kích thước cố định theo chiều dài mong muốn */
            object-fit: cover;
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
        <!-- END nav -->

        <!-- Image -->
        <div class="hero-wrap hero-bread" style="background-image: url('/images_shop/bg_6.png'); margin-top: 30px;">
            <div class="container">
                <div class="row no-gutters slider-text align-items-center justify-content-center">
                    <div class="col-md-9 ftco-animate text-center">
                        <h1 class="mb-0 bread" style="color: white;">Product List</h1>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Image -->

        <section class="ftco-section bg-light">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-lg-10 order-md-last">  
                        <div class="row">
                            <c:forEach items="${productList}" var="pro">
                                <c:if test="${pro.status == true}">
                                    <c:set var="discountPrice" value="${pro.product_price - (pro.discount/100 * pro.product_price)}" />
                                    <fmt:formatNumber value="${discountPrice}" type="number" pattern="0.00" var="formattedPrice" />

                                    <div class="col-sm-12 col-md-12 col-lg-4 ftco-animate d-flex" style="max-width: 195px;">
                                        <div class="product d-flex flex-column">
                                            <a href="/product/productDetail?productId=${pro.product_id}" class="img-prod">
                                                <img class="img-fluid" src="/images/${pro.images[0]}" alt="Colorlib Template">
                                                <div class="overlay"></div>
                                            </a>
                                            <div class="text py-3 pb-4 px-3">
                                                <h3><a href="/product/productDetail?productId=${pro.product_id}">${pro.product_name}</a></h3>
                                                <div class="pricing">
                                                    <p class="price"><span class="mr-2 price-dc">$${pro.product_price}</span><span class="price-sale">$${formattedPrice}</span></p>
                                                    <div class="sale-off-form"><span class="sale-off">Sale ${pro.discount}%</span></div>
                                                </div>
                                                <p class="bottom-area d-flex px-3">
                                                    <a href="#" class="add-to-cart text-center py-2 mr-1"><span>Add to cart  <i class="fa-solid fa-cart-shopping"></i></span></a>
                                                    <a href="#" class="buy-now text-center py-2">Buy now  <span><i class="fa-solid fa-truck-ramp-box"></i></span></a>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>

                        <div class="row mt-5">
                            <div class="col text-center">
                                <div class="block-27">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 col-lg-2">
                        <div class="sidebar">
                            <div class="sidebar-box-2">
                                <h2 class="heading">Categories</h2>
                                <div class="fancy-collapse-panel">
                                    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                                        <div class="panel panel-default">
                                            <div class="panel-heading" role="tab" id="headingOne">
                                                <h4 class="panel-title">
                                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">Brand
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                                                <div class="panel-body">
                                                    <ul>
                                                        <li><a href="/product/productList">All</a></li>
                                                            <c:forEach items="${brandList}" var="brand">
                                                            <li><a href="/product/productList?brand=${brand.brand_id}">${brand.brand_name}</a></li>
                                                            </c:forEach>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading" role="tab" id="headingTwo">
                                                <h4 class="panel-title" style="display: flex">
                                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">Demand</a>
                                                </h4>
                                            </div>
                                            <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                                                <div class="panel-body">
                                                    <ul>
                                                        <li><a href="/product/productList">All</a></li>
                                                            <c:forEach items="${cateList}" var="cate">
                                                            <li><a href="/product/productList?demand=${cate.category_id}">${cate.category_name}</a></li>  
                                                            </c:forEach>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="sidebar-box-2">
                                <h2 class="heading">Price Range</h2>
                                <form method="post" class="colorlib-form-2">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="guests">Price from:</label>
                                                <div class="form-field">
                                                    <i class="icon icon-arrow-down3"></i>
                                                    <select name="people" id="minPrice" class="form-control">
                                                        <option value="100">100</option>
                                                        <option value="200">200</option>
                                                        <option value="300">300</option>
                                                        <option value="400">400</option>
                                                         <option value="500">500</option>
                                                         <option value="600">600</option>
                                                          <option value="800">800</option>
                                                        <option value="1000">1000</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="guests">Price to:</label>
                                                <div class="form-field">
                                                    <i class="icon icon-arrow-down3"></i>
                                                    <select name="people" id="maxPrice" class="form-control">
                                                        <option value="2000">2000</option>
                                                        <option value="2000">3000</option>
                                                        <option value="4000">4000</option>
                                                        <option value="6000">6000</option>
                                                        <option value="8000">8000</option>
                                                        <option value="10000">10000</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <a id="searchByPrice" class="buy-now text-center py-2" style="cursor: pointer">Search <span><i class="fas fa-search"></i></span></a>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-gallery">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-8 heading-section text-center mb-4 ftco-animate">
                        <h2 class="ftco-heading-2">RUBICON</h2>
                        <p>A store that have all you needs to pick a perfect laptop.</p>
                    </div>
                </div>
            </div>
            <div class="container-fluid px-0">
                <div class="row no-gutters">
                    <div class="col-md-4 col-lg-2 ftco-animate">
                        <a href="images/gallery-1.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(images/gallery-1.jpg);">
                            <div class="icon mb-4 d-flex align-items-center justify-content-center">
                                <span><i class="fas fa-camera"></i></span>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-4 col-lg-2 ftco-animate">
                        <a href="images/gallery-2.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(images/gallery-2.jpg);">
                            <div class="icon mb-4 d-flex align-items-center justify-content-center">
                                <span><i class="fas fa-camera"></i></span>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-4 col-lg-2 ftco-animate">
                        <a href="images/gallery-3.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(images/gallery-3.jpg);">
                            <div class="icon mb-4 d-flex align-items-center justify-content-center">
                                <span><i class="fas fa-camera"></i></span>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-4 col-lg-2 ftco-animate">
                        <a href="images/gallery-4.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(images/gallery-4.jpg);">
                            <div class="icon mb-4 d-flex align-items-center justify-content-center">
                                <span><i class="fas fa-camera"></i></span>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-4 col-lg-2 ftco-animate">
                        <a href="images/gallery-5.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(images/gallery-5.jpg);">
                            <div class="icon mb-4 d-flex align-items-center justify-content-center">
                                <span><i class="fas fa-camera"></i></span>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-4 col-lg-2 ftco-animate">
                        <a href="images/gallery-6.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(images/gallery-6.jpg);">
                            <div class="icon mb-4 d-flex align-items-center justify-content-center">
                                <span><i class="fas fa-camera"></i></span>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </section>

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
                                <li><a href="/user/logout" class="py-2 d-block">Log out</a></li>
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


        <script src="/js/jquery.min.js"></script>
        <script src="/js/jquery-migrate-3.0.1.min.js"></script>
        <script src="/js/popper.min.js"></script>
        <script src="/js/bootstrap.min.js"></script>
        <script src="/js/jquery.easing.1.3.js"></script>
        <script src="/js/jquery.waypoints.min.js"></script>
        <script src="/js/jquery.stellar.min.js"></script>
        <script src="/js/owl.carousel.min.js"></script>
        <script src="/js/jquery.magnific-popup.min.js"></script>
        <script src="/js/aos.js"></script>
        <script src="/js/jquery.animateNumber.min.js"></script>
        <script src="/js/bootstrap-datepicker.js"></script>
        <script src="/js/scrollax.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
        <script src="/js/google-map.js"></script>
        <script src="/js/main_1.js"></script>
        
        <<script>
            $('#searchByPrice').on('click', function(){
                var minPrice = $('#minPrice').val();
                var maxPrice = $('#maxPrice').val();
                
                if (minPrice!==null&&maxPrice!==null) {
                    window.location.href="/product/productList?minPrice=" + minPrice + "&maxPrice=" + maxPrice;
                }
            });
        </script>
    </body>
</html>