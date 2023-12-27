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
        <title>EDIT PRODUCT PAGE</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <!-- Additional CSS Files -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap">
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
            .add-new-brand:hover{
                background: #59b5f0;
            }
        </style>
    </head>

    <body>
        <div class="container-fluid" style="margin-top: 15px; padding: 70px 0;">
            <div id="toast" style="z-index: 1000000;"></div>
            <div class="">
                <div class="rounded d-flex justify-content-center" style="margin-bottom: 70px;">
                    <div class="col-lg-4 col-md-6 col-sm-12 background-light" style="background-color: rgba(255, 255, 255, 0.4); border-radius: 25px;">
                        <div class="text-center">
                            <h3 style="margin-top:30px; color: #27A4F2; padding: 20px; padding-bottom: 20px; letter-spacing: 5px">EDIT PRODUCT</h3>
                        </div>
                        <form id="add-form" method="post" action="managerController">
                            <div style="padding: 20px 48px;">
                                <div class="row input-group mb-3">
                                    <label>Product ID:</label>
                                    <input name="product_id" type="text" class="col-lg-10 col-md-10 col-sm-8 form-control" style="font-size: 13px" placeholder="Enter product id">
                                </div>

                                <div class="row input-group mb-3">
                                    <label>Name Of Product:</label>
                                    <input name="product_name" type="text" class="col-lg-10 col-md-10 col-sm-8 form-control" style="font-size: 13px" placeholder="Enter brand name">
                                </div>

                                <div class="row input-group mb-3">
                                    <label>Description:</label>
                                    <textarea style="font-size: 13px;" class="form-control validate" name="product_description" rows="3" placeholder="Enter product details" required></textarea>                                
                                </div>

                                <div class="row input-group mb-3 quantity-input">
                                    <label>Quantity:</label>
                                    <div class="quantity-input">
                                        <button type="button" class="quantity-btn minus-btn" style="width: 18px; border-radius: 5px; border-color: #51b1ff;" onclick="changeValue('quantity-input', -1)">-</button>
                                        <input type="number" name="product_quantity" id="quantity-input" style="text-align: center;" min="1" value="1">
                                        <button type="button" class="quantity-btn plus-btn" style="width: 18px; border-radius: 5px; border-color: #51b1ff;" onclick="changeValue('quantity-input', 1)">+</button>
                                    </div>
                                </div>

                                <div class="row input-group mb-3 quantity-input">
                                    <label>Price:</label>
                                    <div class="quantity-input price-input">
                                        <button type="button" class="quantity-btn minus-btn" style="width: 18px; border-radius: 5px; border-color: #51b1ff;" onclick="changeValue('price-input', -1)">-</button>
                                        <input type="number" name="product_price" id="price-input" style="text-align: center;" min="1" value="1">
                                        <button type="button" class="quantity-btn plus-btn" style="width: 18px; border-radius: 5px; border-color: #51b1ff;" onclick="changeValue('price-input', 1)">+</button>
                                    </div>
                                </div>

                                <div class="row input-group mb-3 quantity-input">
                                    <label>Discount:</label>
                                    <div class="quantity-input price-input">
                                        <button type="button" class="quantity-btn minus-btn" style="width: 18px; border-radius: 5px; border-color: #51b1ff;" onclick="changeValue('discount-input', -1)">-</button>
                                        <input type="number" name="discount" id="discount-input" style="text-align: center;" min="1" value="1">
                                        <button type="button" class "quantity-btn plus-btn" style="width: 18px; border-radius: 5px; border-color: #51b1ff;" onclick="changeValue('discount-input', 1)">+</button>
                                    </div>
                                </div>

                                <div class="row input-group mb-3">
                                    <label>Brand</label>
                                    <select name="brand_id"style="width: 70%; font-size: 13px;" >
                                        <option value="">-- Select brand --</option>
                                        <c:forEach var="brand" items="${listBrand}">
                                            <c:choose>
                                                <c:when test="${not empty brand.brand_id}">
                                                    <option value="${brand.brand_id}">${brand.brand_name}</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option>${brand.brand_name}</option>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="row input-group mb-3">
                                    <label>Category:</label>
                                    <select name="category_id" style="width: 70%; font-size: 13px;">
                                        <option value="">-- Select category --</option>
                                        <c:forEach var="category" items="${listCategory}">
                                            <c:choose>
                                                <c:when test="${not empty category.category_id}">
                                                    <option value="${category.category_id}">${category.category_name}</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option>${category.category_name}</option>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="row input-group mb-3">
                                    <label>Status:</label>
                                    <select name="status" style="width: 70%; font-size: 13px;">
                                        <option value="">-- Select status --</option>            
                                        <option value="true">true</option>
                                        <option value="false">false</option>
                                    </select>
                                </div>

                                <div class="row input-group mb-3">
                                    <label>Images:</label>
                                    <input name="images" type="file" class="col-lg-10 col-md-10 col-sm-8 form-control" multiple accept="image/png, image/jpeg" style="font-size: 13px">
                                </div>

                                <div class="row input-group mb-3">
                                    <label>CPU:</label>
                                    <input name="cpu" type="text" class="col-lg-10 col-md-10 col-sm-8 form-control" style="font-size: 13px" placeholder="Enter CPU of product">
                                </div>

                                <div class="row input-group mb-3">
                                    <label>GPU:</label>
                                    <input name="gpu" type="text" class="col-lg-10 col-md-10 col-sm-8 form-control" style="font-size: 13px" placeholder="Enter GPU of product">
                                </div>

                                <div class="row input-group mb-3">
                                    <label>RAM:</label>
                                    <input name="ram" type="text" class="col-lg-10 col-md-10 col-sm-8 form-control" style="font-size: 13px" placeholder="Enter RAM of product">
                                </div>

                                <div class="row input-group mb-3">
                                    <label>Storage:</label>
                                    <input name="storage" type="text" class="col-lg-10 col-md-10 col-sm-8 form-control" style="font-size: 13px" placeholder="Enter storage of product">
                                </div>

                                <div class="row input-group mb-3">
                                    <label>Screen:</label>
                                    <input name="screen" type="text" class="col-lg-10 col-md-10 col-sm-8 form-control" style="font-size: 13px" placeholder="Enter screen of product">
                                </div>

                                <div class="row input-group mb-3">
                                    <label>PIN:</label>
                                    <input name="pin" type="text" class="col-lg-10 col-md-10 col-sm-8 form-control" style="font-size: 13px" placeholder="Enter PIN of product">
                                </div>

                                <div class="row input-group mb-3">
                                    <label>Weight:</label>
                                    <input name="weight" type="text" class="col-lg-10 col-md-10 col-sm-8 form-control" style="font-size: 13px" placeholder="Enter weight of product">
                                </div>

                                <div class="row input-group mb-3">
                                    <label>OS:</label>
                                    <input name="os" type="text" class="col-lg-10 col-md-10 col-sm-8 form-control" style="font-size: 13px" placeholder="Enter OS of product">
                                </div>

                                <c:if test="${not empty requestScope.errorMessage}">
                                    <p class="Not-same">${requestScope.errorMessage}</p>
                                </c:if>
                                <c:if test="${not empty requestScope.successMessage}">
                                    <p class="Success">${requestScope.successMessage}</p>
                                </c:if>

                                <div class="login-button" style="margin-top: 25px">
                                    <a href="" class="w-50 mx-auto btn btn-primary text-center mt-2" style="display: flex; justify-content: center; background: #27A4F2; border: none; padding: 5px; text-decoration: none;" type="submit" name="btnAddProduct">
                                        Edit Product
                                    </a>
                                    <a href="/homeManagement/brandManagement" class="w-50 mx-auto btn btn-primary text-center mt-2" style="display: flex; justify-content: center; background: #27A4F2; border: none; padding: 5px; text-decoration: none; margin-top: 20px;">
                                        Go back
                                    </a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>


        <!-- Scripts -->
        <!-- Bootstrap core JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.j s"></script>
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

        <script src="/assets/js/isotope.js"></script>
        <script src="/assets/js/owl-carousel.js"></script>
        <script src="/assets/js/tabs.js"></script>
        <script src="/assets/js/custom.js"></script>
        <script src="/assets/js/toast.js"></script>
        <script>

                                            $(document).ready(function () {
                                                // Validation rules for the form
                                                $("#add-form").validate({
                                                    rules: {
                                                        product_id: {
                                                            required: true,
                                                            pattern: /^[A-Z]{2}-\d{3}$/
                                                        },
                                                        product_name: "required",
                                                        product_quantity: {
                                                            required: true,
                                                            integer: true,
                                                            min: 1
                                                        },
                                                        product_price: {
                                                            required: true,
                                                            number: true,
                                                            min: 0
                                                        },
                                                        discount: {
                                                            required: true,
                                                            number: true,
                                                            range: [0, 100]
                                                        },
                                                        product_description: {
                                                            required: true,
                                                            minlength: 10
                                                        },
                                                        brand_id: "required",
                                                        category_id: "required",
                                                        status: "required",
                                                        images: {
                                                            required: true,
                                                            extension: "png"
                                                        },
                                                        cpu: "required",
                                                        gpu: "required",
                                                        ram: "required",
                                                        storage: "required",
                                                        screen: "required",
                                                        pin: "required",
                                                        weight: "required",
                                                        os: "required"
                                                    },
                                                    messages: {
                                                        product_id: {
                                                            required: "Please enter the product ID",
                                                            pattern: "Invalid product ID format. Example: HR-301, HT-989, RT-003, etc."
                                                        },
                                                        product_name: "Please enter the product name",
                                                        product_quantity: {
                                                            required: "Please enter the product quantity",
                                                            integer: "Please enter a valid integer quantity",
                                                            min: "Quantity must be greater than 0"
                                                        },
                                                        product_price: {
                                                            required: "Please enter the product price",
                                                            number: "Please enter a valid price",
                                                            min: "Price must be greater than or equal to 0"
                                                        },
                                                        discount: {
                                                            required: "Please enter the discount",
                                                            number: "Please enter a valid discount",
                                                            range: "Discount must be between 0 and 100"
                                                        },
                                                        product_description: {
                                                            required: "Please enter the product description",
                                                            minlength: "Description must be at least 10 characters long"
                                                        },
                                                        brand_id: "Please enter the brand ID",
                                                        category_id: "Please enter the category ID",
                                                        status: "Please enter the status",
                                                        images: {
                                                            required: "Please select at least one image",
                                                            extension: "Only PNG images are allowed"
                                                        },
                                                        cpu: "Please enter the CPU information",
                                                        gpu: "Please enter the GPU information",
                                                        ram: "Please enter the RAM information",
                                                        storage: "Please enter the storage information",
                                                        screen: "Please enter the screen information",
                                                        pin: "Please enter the PIN information",
                                                        weight: "Please enter the weight information",
                                                        os: "Please enter the OS information"
                                                    },
                                                    submitHandler: function (form) {
                                                        // If the form is valid, you can submit it here
                                                        form.submit();
                                                    }
                                                });
                                            });
                                            function changeValue(inputId, increment) {
                                                var inputElement = document.getElementById(inputId);
                                                inputElement.stepUp(increment);
                                            }
        </script>
    </body>
</html>