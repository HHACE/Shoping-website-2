<%-- 
    Document   : add
    Created on : Jun 19, 2023, 10:36:56 PM
    Author     : Thanh Loc
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Models.Category"%>
<%@page import="Models.Brand"%>
<%@page import="Models.Brand"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add new product</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/jquery.validate.min.js"></script>
    </head>
    <style>
        *{
            padding:0;
            margin:0;
            box-sizing: border-box;
            font-family:'Poppins', sans-serif;
            cursor: pointer;
        }


        #wrapper {
            /* Kích thước màn hình là 1280 x 720 */
            width: 100%;
            height: 10vh;
        }
        #header{
            background-color: black;
            background-size: cover;
            background-position: center;
            height: 120px;
            width: 100%;
            padding: 30px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        #header .logo img{
            width: 85px;
            height: auto;
        }

        #menu {
            list-style:none;
            display: flex;
            margin-left: 100px;
            overflow-x: auto;
        }

        #menu .item {
            display: flex;
            justify-content: space-between;
            margin-left: 35px
        }

        #menu .item a,#menu .item .menu-link {
            color:whitesmoke;
            text-decoration: none;
            font-size: 25px;
        }
        #menu-toggle {
            display: none;
        }

        #actions {
            display: flex;
        }
        #actions .item{
            margin-left:10px;
        }
        #actions .item a{
            font-size:27px;
            margin-right: 30px;
        }
        #actions .item i.fa.fa-shopping-cart {
            font-size: 25px;
        }
        body {
            background-color: #f5f5f5;
            font-family: Arial, sans-serif;
        }
        form {
            margin: 50px auto;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            width: 500px;
            max-width: 90%;
            text-align: center;
        }
        h1 {
            margin-top: 40px;
            font-size: 36px;
            text-align: center;
            margin-bottom: 20px;
            color: #333;
            text-shadow: 1px 1px 0 #fff;
        }
        label {
            display: block;
            font-weight: bold;
            font-size: 23px;
            margin-bottom: 10px;
            color: #333;
            text-shadow: 1px 1px 0 #fff;
            text-align: left;
        }
        input[type="text"] {
            padding: 10px;
            margin: 10px auto;
            border-radius: 5px;
            border: 2px solid #ccc;
            width: 80%;
            font-size: 20px;
            color: #555;
            text-align: center;
            transition: border-color 0.3s ease;
        }
        input[type="text"]:hover, input[type="text"]:focus {
            border-color: #4CAF50;
        }
        button[type="submit"] {
            background-color: #4CAF50;
            color: #fff;
            padding: 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 20px;
            margin-top: 20px;
            transition: background-color 0.3s ease;
        }
        button[type="submit"]:hover {
            background-color: #3e8e41;
        }
        /* CSS for error messages */
        .error {
            font-size: 14px;
            color: red;
            margin-top: 5px;
            text-align: center;

        }

        /* CSS for input fields with errors */
        .error-input {
            border: 2px solid red;
        }
        select,
        option {
            color: black;
        }
        .quantity-input,
        .price-input,
        .brand-input,
        .category-input,
        .images-input {
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 10px auto;
        }

        .quantity-input .quantity-btn,
        .price-input .quantity-btn,
        .brand-input select,
        .category-input select,
        .images-input input[type="file"] {
            padding: 10px;
            background-color: #ccc;
            border: none;
            cursor: pointer;
            font-size: 20px;
            transition: background-color 0.3s ease;
        }

        .quantity-input .quantity-btn:hover,
        .quantity-input .quantity-btn:focus,
        .price-input .quantity-btn:hover,
        .price-input .quantity-btn:focus,
        .brand-input select:hover,
        .brand-input select:focus,
        .category-input select:hover,
        .category-input select:focus,
        .images-input input[type="file"]:hover,
        .images-input input[type="file"]:focus {
            background-color: #4CAF50;
        }

        .quantity-input input[type="number"],
        .price-input input[type="number"],
        .brand-input select,
        .category-input select,
        .images-input input[type="file"] {
            padding: 10px;
            margin: 0 5px;
            border-radius: 5px;
            border: 2px solid #ccc;
            width: 65%;
            font-size: 20px;
            color: #555;
            text-align: center;
            transition: border-color 0.3s ease;
        }

        .quantity-input input[type="number"]:hover,
        .quantity-input input[type="number"]:focus,
        .price-input input[type="number"]:hover,
        .price-input input[type="number"]:focus,
        .brand-input select:hover,
        .brand-input select:focus,
        .category-input select:hover,
        .category-input select:focus,
        .images-input input[type="file"]:hover,
        .images-input input[type="file"]:focus {
            border-color: #4CAF50;
        }
    </style>
    <body>
        <h1>ADD NEW PRODUCT</h1>
        <form id="add-form" method="post" action="managerController" >
            <label>Product ID:</label> <input type="text" name="product_id"><br>
            <label>Name:</label> <input type="text" name="product_name"><br>
            <label>Quantity:</label>
            <div class="quantity-input">
                <button type="button" class="quantity-btn minus-btn">-</button>
                <input type="number" name="product_quantity" min="0" value="1">
                <button type="button" class="quantity-btn plus-btn">+</button>
            </div>
            <label>Price:</label>
            <div class="quantity-input price-input">
                <button type="button" class="quantity-btn minus-btn">-</button>
                <input type="number" name="product_price" min="0" value="1">
                <button type="button" class="quantity-btn plus-btn">+</button>
            </div>

            <label>Discount:</label>
            <div class="quantity-input price-input">
                <button type="button" class="quantity-btn minus-btn">-</button>
                <input type="number" name="discount" min="0" value="1" max="75">
                <button type="button" class="quantity-btn plus-btn">+</button>
            </div>
            <label>Description:</label>
            <textarea name="product_description" style="width: 70%; font-size: 18px;"></textarea>
            <label>Brand:</label>
            <select name="brand_id"style="width: 70%; font-size: 18px;" >
                <option value="">-- Select brand --</option>
                <c:forEach var="brand" items="${listB}">
                    <option value="${brand.brand_id}">${brand.brand_name}</option>
                </c:forEach>
            </select><br>

            <label>Category:</label>
            <select name="category_id" style="width: 70%; font-size: 18px;">
                <option value="">-- Select category --</option>
                <c:forEach var="category" items="${listC}">
                    <option value="${category.category_id}">${category.category_name}</option>
                </c:forEach>
            </select><br>
            <label>status:</label>
            <select name="status" style="width: 70%; font-size: 18px;">
                <option value="">-- Select status --</option>            
                <option value="true">true</option>
                <option value="false">false</option>
            </select><br>
            <label>Images:</label>
            <input type="file" name="images" multiple accept="image/png, image/jpeg">
            <br>
            <label>CPU:</label> <input type="text" name="cpu"><br>
            <label>GPU:</label> <input type="text" name="gpu"><br>
            <label>RAM:</label> <input type="text" name="ram"><br>
            <label>Storage:</label> <input type="text" name="storage"><br>
            <label>Screen:</label> <input type="text" name="screen"><br>
            <label>PIN:</label> <input type="text" name="pin"><br>
            <label>Weight:</label> <input type="text" name="weight"><br>
            <label>OS:</label> <input type="text" name="os"><br>
            <c:if test="${not empty requestScope.errorMessage}">
                <p class="Not-same">${requestScope.errorMessage}</p>
            </c:if>
            <c:if test="${not empty requestScope.successMessage}">
                <p class="Success">${requestScope.successMessage}</p>
            </c:if>
            <button type="submit" name="btnAddProduct">Add New Product</button>
        </form>
        <script>
            $(document).ready(function () {
                $("#add-form").validate({
                    rules: {
                        product_id: {
                            required: true,
                            pattern: /^[A-Z]{2}-\d{3}$/
                        },
                        product_name: "required",
                        product_quantity: {
                            required: true,
                            digits: true,
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
                            range: [0, 75]
                        },
                        product_description: {
                            required: true,
                            minlength: 10
                        },
                        brand_id: "required",
                        category_id: "required",
                        images: {
                            required: function (element) {
                                return $('input[name="images"]').get(0).files.length === 0;
                            },
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
                            digits: "Please enter a valid integer quantity",
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
                            range: "Discount must be between 0 and 75"
                        },
                        product_description: {
                            required: "Please enter the product description",
                            minlength: "Description must be at least 10 characters long"
                        },
                        brand_id: "Please enter the brand ID",
                        category_id: "Please enter the category ID",
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
                    errorElement: "div",
                    errorPlacement: function (error, element) {
                        if (element.attr("name") === "images") {
                            error.insertAfter(element.closest('.price-input'));
                        } else {
                            error.insertAfter(element);
                        }
                    },
                    submitHandler: function (form) {
                        // Nếu form hợp lệ, bạn có thể gửi form tại đây
                        form.submit();
                    }
                });
            });
            document.addEventListener('DOMContentLoaded', function () {
                var quantityInput = document.querySelector('input[name="product_quantity"]');
                var priceInput = document.querySelector('input[name="product_price"]');
                var discountInput = document.querySelector('input[name="discount"]');

                var plusButtons = document.querySelectorAll('.quantity-btn.plus-btn');
                var minusButtons = document.querySelectorAll('.quantity-btn.minus-btn');

                plusButtons.forEach(function (button) {
                    button.addEventListener('click', function () {
                        var input = this.parentElement.querySelector('input');
                        var step = input === priceInput ? 10 : 1;
                        input.value = parseInt(input.value) + step;
                    });
                });

                minusButtons.forEach(function (button) {
                    button.addEventListener('click', function () {
                        var input = this.parentElement.querySelector('input');
                        var step = input === priceInput ? 10 : 1;
                        if (parseInt(input.value) > step) {
                            input.value = parseInt(input.value) - step;
                        }
                    });
                });
            });
        </script>
    </body>
</html>