<%-- 
    Document   : productManagement
    Created on : Oct 13, 2023, 10:31:00 AM
    Author     : namti
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>s
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>PRODUCT MANNAGEMENTT</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="/css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="/css/style.css" rel="stylesheet">
        <link href="/css_shop/style.css" rel="stylesheet">
    </head>

    <style>
        .product-container {
            display: flex;
            align-items: center;
        }
        .product-title {
            flex: 1;
            margin-right: 10px;
        }
        .product-button{
            border-radius: 8px;
            width: 140px;
            height: 45px;
            margin-bottom: 15px;
            background-color: #51b1ff;
            transition: transform 0.2s;
            border: none;
        }
        .product-button:hover{
            transform: scale(0.98);
        }
        .product-button:active{
            transform: scale(0.95);
        }
        .product-button-word{
            color: white;
        }
        .product-button-word:hover{
            text-decoration: none;
            color: white;
        }
        .view-detail{
            cursor: pointer;
        }
        .img-display {
            text-align: center; /* Căn giữa nội dung */
            padding: 15px; /* Khoảng cách 5px ở mỗi bên */
            margin-bottom: 50px;
        }
        .img-display img {
            max-width: 100%; /* Đảm bảo hình ảnh không vượt quá khung chứa */
            height: auto; /* Giữ tỷ lệ khung hình ban đầu */
        }
        .button-container {
            margin-top: 30px;
        }

        .custom-button {
            background-color: #51b1ff; /* Màu nền xanh dương */
            color: #ffffff; /* Màu chữ trắng */
            border: none;
            border-radius: 15px; /* Độ tròn 15px */
            width: 95px; /* Độ rộng 100px */
            height: 40px; /* Độ cao 50px */
            margin-right: 30px; /* Khoảng cách 30px giữa các nút */
            transition: transform 0.2s;
        }
        .custom-button:hover {
            transform: scale(0.95); /* Khi trỏ chuột vào, thu nhỏ nút về kích thước 95% */
        }

        .button-footer {
            margin-top: 30px;
            display: flex;
            justify-content: space-between;
        }

        .button-footer-1 {
            background-color: #007bff; /* Màu nền xanh dương */
            color: #ffffff; /* Màu chữ trắng */
            border: none;
            width: calc(50% - 15px); /* Độ rộng 50% của khung, với 15px margin giữa nút */
            height: 50px; /* Độ cao 50px */
            transition: transform 0.2s; /* Thêm hiệu ứng transform trong 0.2 giây */
        }

        .button-footer-1:hover {
            transform: scale(0.95); /* Khi trỏ chuột vào, thu nhỏ nút về kích thước 95% */
        }

        /* Tùy chỉnh văn bản nút khi được chỉnh sửa */
        #button1:focus {
            outline: none; /* Loại bỏ border xung quanh nút khi bấm vào */
            background-color: #ff6600; /* Màu nền khi nút được chỉnh sửa */
        }

        #button2:focus {
            outline: none; /* Loại bỏ border xung quanh nút khi bấm vào */
            background-color: #ff6600; /* Màu nền khi nút được chỉnh sửa */
        }
        .footer .content {
            display: none;
            margin-left: 15px;
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

    <body>
        <div class="container-xxl position-relative bg-white d-flex p-0">
            <!-- Sidebar Start -->
            <div class="sidebar pe-4 pb-3">
                <nav class="navbar bg-light navbar-light">
                    <a href="/homeManagement" class="navbar-brand mx-4 mb-3">
                        <h3 class="text-primary"></i>HOME</h3>
                    </a>
                    <div class="d-flex align-items-center ms-4 mb-4">
                        <div class="position-relative">
                            <i class="fas fa-user-tie fa-lg"></i>
                            <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                        </div>
                        <div class="ms-3">
                            <h6 class="mb-0">
                                <c:choose>
                                    <c:when test="${role_id == 1}">
                                        ADMIN
                                    </c:when>
                                    <c:when test="${role_id == 2}">
                                        STAFF
                                    </c:when>
                                </c:choose>
                            </h6>
                        </div>
                    </div>
                    <div class="navbar-nav w-100">
                        <a href="/homeManagement" class="nav-item nav-link active"><i class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>Manager</a>
                            <div class="dropdown-menu bg-transparent border-0">
                                <a href="/homeManagement/productManagement" class="dropdown-item">Product</a>
                                <a href="/homeManagement/brandManagement" class="dropdown-item">Brand</a>
                                <a href="/homeManagement/categoryManagement" class="dropdown-item">Category</a>
                                <a href="/homeManagement/customerManagement" class="dropdown-item">Customer</a>
                                <a href="/homeManagement/staffManagement" class="dropdown-item">Staff</a>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Sidebar End -->


        <!-- Content Start -->
        <div class="content">
            <!-- Navbar Start -->
            <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
                <a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
                    <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
                </a>
                <a href="#" class="sidebar-toggler flex-shrink-0">
                    <i class="fa fa-bars"></i>
                </a>
                <form class="d-none d-md-flex ms-4">
                    <input class="form-control border-0" type="search" placeholder="Search">
                </form>
                <div class="navbar-nav align-items-center ms-auto">

                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                            <i class="fas fa-user-tie fa-lg"></i>
                            <span class="d-none d-lg-inline-flex">${username}</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                            <a href="/account/managerProfile" class="dropdown-item">My Profile</a>
                            <a href="/user/logout" class="dropdown-item">Log Out</a>
                        </div>
                    </div>
                </div>
            </nav>
            <!-- Navbar End -->


            <!-- Table Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="col-12">
                        <div class="bg-light rounded h-100 p-4">
                            <h6 class="mb-4 product-title" style="font-weight: bold;">PRODUCT DETAIL MANAGEMENT</h6>

                            <div class="product-image-and-content">
                                <!-- Ảnh (Bên trái) -->
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

                                <!-- Nội dung (Bên phải) -->
                                <div class="product-content" style="float: left; width: calc(50% - 75px); margin-left: 75px;">
                                    <c:set var="discountPrice" value="${listProduct.product_price-((listProduct.discount/100) * listProduct.product_price)}"/>
                                    <fmt:formatNumber value="${discountPrice}" type="number" pattern="0.00" var="formattedPrice" />
                                    <h2 class="product-title" style="font-weight: bold;">${listProduct.product_name}</h2>
                                    <div class="product-price">
                                        Price: $${listProduct.product_price}
                                        <br>
                                        Price after sale ${listProduct.discount}%: $${formattedPrice}
                                    </div>

                                    <div class="product-detail">
                                        <h2><p>Detail</p></h2>
                                        <ul>
                                            <li>Available: <span> "${listProduct.product_quantity}" products remaining </span></li>
                                            <li>Category: <span> "${listCate.category_name}" </span></li>
                                            <li>Brand:<span> "${listBrand.brand_name}" </span></li>
                                        </ul>
                                    </div>
                                    <button class="product-button float-end" name="btnDeleteProduct">
                                        <a href="/homeManagement/deleteProduct?productId=${listProduct.product_id}" class="product-button-word">Delete</a>
                                    </button>
                                    <button class="product-button float-end">
                                        <a href="/homeManagement/productManagement/editProduct" class="product-button-word">Edit product</a>
                                    </button>
                                </div> 
                            </div>

                        </div>

                    </div>
                </div>
                <div class="footer">
                    <div class="button-footer">
                        <button class="button-footer-1" id="button1">Description</button>
                        <button class="button-footer-1" id="button2">Specification</button>
                    </div>

                    <!-- Bổ sung id cho nút Edit và Close trong description-content -->
                    <div class="content" id="description-content">
                        <h2>Description</h2>
                        <p contentEditable="false">${listProduct.product_description}</p>
                    </div>

                    <!-- Bổ sung id cho nút Edit và Close trong manufacturer-content -->
                    <div class="content" id="manufacturer-content">
                        <h2>Specification</h2>
                        <div class="vertical-table">
                            <c:forEach items="${listSpec}" var="spec">
                                <div>
                                    <span><b>CPU</b></span>
                                    <p>${spec.cpu}</p>
                                </div>
                                <div>
                                    <span><b>GPU</b></span>
                                    <p>${spec.gpu}</p>
                                </div>
                                <div>
                                    <span><b>RAM</b></span>
                                    <p>${spec.ram}</p>
                                </div>
                                <div>
                                    <span><b>Storage</b></span>
                                    <p>${spec.storage}</p>
                                </div>
                                <div>
                                    <span><b>Screen</b></span>
                                    <p>${spec.screen}</p>
                                </div>
                                <div>
                                    <span><b>Pin</b></span>
                                    <p>${spec.pin}</p>
                                </div>
                                <div>
                                    <span><b>Weight</b></span>
                                    <p>${spec.weight}</p>
                                </div>
                                <div>
                                    <span><b>OS</b></span>
                                    <p>${spec.os}</p>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Lắng nghe sự kiện khi nút "Description" được bấm
        document.getElementById("button1").addEventListener("click", function () {
            document.getElementById("description-content").style.display = "block";
            document.getElementById("manufacturer-content").style.display = "none";
        });

        // Lắng nghe sự kiện khi nút "Manufacturer" được bấm
        document.getElementById("button2").addEventListener("click", function () {
            document.getElementById("manufacturer-content").style.display = "block";
            document.getElementById("description-content").style.display = "none";
        });

        // Lắng nghe sự kiện khi nút "Edit" trong description-content được bấm
        document.getElementById("edit-description").addEventListener("click", function () {
            var descriptionContent = document.getElementById("description-content");
            var descriptionText = descriptionContent.querySelector("p");
            var editButton = document.getElementById("edit-description");

            if (descriptionText.contentEditable === "false") {
                descriptionText.contentEditable = "true";
                editButton.textContent = "Done";
            } else {
                descriptionText.contentEditable = "false";
                editButton.textContent = "Edit";

                // Lưu nội dung đã chỉnh sửa (có thể lưu vào cơ sở dữ liệu hoặc biến khác)
                var editedText = descriptionText.textContent;
                console.log("Edited Text: " + editedText);
            }
        });

        // Tương tự cho manufacturer-content
        document.getElementById("edit-manufacturer").addEventListener("click", function () {
            var manufacturerContent = document.getElementById("manufacturer-content");
            var manufacturerText = manufacturerContent.querySelector("p");
            var editButton = document.getElementById("edit-manufacturer");

            if (manufacturerText.contentEditable === "false") {
                manufacturerText.contentEditable = "true";
                editButton.textContent = "Done";
            } else {
                manufacturerText.contentEditable = "false";
                editButton.textContent = "Edit";

                // Lưu nội dung đã chỉnh sửa (có thể lưu vào cơ sở dữ liệu hoặc biến khác)
                var editedText = manufacturerText.textContent;
                console.log("Edited Text: " + editedText);
            }
        });


        // Lắng nghe sự kiện khi nút "Close" trong description-content được bấm
        document.getElementById("close-description").addEventListener("click", function () {
            document.getElementById("description-content").style.display = "none";
        });

        // Lắng nghe sự kiện khi nút "Close" trong manufacturer-content được bấm
        document.getElementById("close-manufacturer").addEventListener("click", function () {
            document.getElementById("manufacturer-content").style.display = "none";
        });
    </script>



    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
</div>

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="/lib/chart/chart.min.js"></script>
<script src="/lib/easing/easing.min.js"></script>
<script src="/lib/waypoints/waypoints.min.js"></script>
<script src="/lib/owlcarousel/owl.carousel.min.js"></script>
<script src="/lib/tempusdominus/js/moment.min.js"></script>
<script src="/lib/tempusdominus/js/moment-timezone.min.js"></script>
<script src="/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

<!-- Template Javascript -->
<script src="/js/main.js"></script>
<script>
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
</body>

</html>