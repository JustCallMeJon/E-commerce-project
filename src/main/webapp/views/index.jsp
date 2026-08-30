<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="java.text.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en" xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
<head>
    <style>
        .quantity-controls {
            display: flex;
            align-items: center;
            gap: 5px;
            margin: 10px 0;

            justify-content: center;
            align-content: center;
        }

        .quantity-controls button {
            width: 38px;
            height: 38px;
            padding: 0;
            font-size: 20px;
            line-height: 1;
            background-color: #007bff;
            border: 1px solid #ced4da;
            color: #212529;
            border-radius: 4px;
        }

        .quantity-input {
            width: 55px !important;
            height: 38px;
            padding: 4px;
            text-align: center;
        }

        .quantity-input::-webkit-inner-spin-button,
        .quantity-input::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        .quantity-input {
            -moz-appearance: textfield;
        }

        .add-to-cart {
            background-color: #007bff !important;
            border-color: #6f42c1 !important;
            color: white !important;
        }

        .add-to-cart:hover {
            background-color: #59339d !important;
            border-color: #59339d !important;
            color: white !important;
        }
        .add-to-cart-container {
            text-align: center;
        }

        .add-to-cart {
            background-color: #007bff !important;
            border-color: #007bff !important;
            color: white !important;
        }

        .add-to-cart:hover {
            background-color: #0056b3 !important;
            border-color: #0056b3 !important;
            color: white !important;
        }

    </style>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
            integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
            integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
            crossorigin="anonymous"></script>
    <title>Document</title>

</head>
<body>

<section class="wrapper">
    <div class="container-fostrap">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">
                    <img th:src="@{/images/logo.png}" src="../static/images/logo.png" width="auto" height="40"
                         class="d-inline-block align-top" alt=""/>
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <h4>Welcome, ${ username } </h4>
                    <ul class="navbar-nav mr-auto"></ul>
                    <ul class="navbar-nav">
                        <li class="nav-item active">
                            <a class="nav-link" th:href="@{/}" href="${pageContext.request.contextPath}/cart">CART</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="profileDisplay">Profile</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" sec:authorize="isAuthenticated()" href="logout">Logout</a>
                        </li>

                    </ul>

                </div>
            </div>
        </nav>
    </div>
</section>
</body>
</html>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perishable Shop</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <style>
        body {
            padding: 20px;
        }

        .card-body {
            min-height: 300px; /* Set a fixed height for the card body */
        }

        .card-img-top {
            max-height: 100px; /* Limit the height of the product image */
            object-fit: contain;
        }

    </style>
</head>
<body class="bg-light">
<c:if test="${param.purchase == 'true'}">
    <script>
        alert("Unfortunately, we have yet to finish this function. However, your products have been removed!");
    </script>
</c:if>
<header>

</header>
<main>

    <div class="container">
        <h1>Welcome to Perishable Shop</h1>


        <div class="row">
            <c:forEach var="product" items="${products}">
                <div class="col-md-3">
                    <div class="card mb-4">
                        <img class="card-img-top" src="${product.image}" alt="Product 1">
                        <div class="card-body">
                            <b><h4 class="card-title">${product.name}</h4></b>
                            <h5 class="card-text">Category: ${product.category.name}</h5>
                            <h5 class="card-text">Price: $${product.price}</h5>
                            <p class="card-text">Description: ${product.description}</p>


                            <div class="quantity-controls">
                                <button type="button"
                                        class="btn btn-warning"
                                        onclick="decreaseQuantity(this)">-
                                </button>

                                <input type="number"
                                       value="1"
                                       min="1"
                                       step="1"
                                       class="form-control quantity-input">

                                <button type="button"
                                        class="btn btn-warning"
                                        onclick="increaseQuantity(this)">+
                                </button>
                            </div>

                            <div class="add-to-cart-container">
                                <a href="${pageContext.request.contextPath}/products/addtocart?id=${product.id}"
                                   class="btn add-to-cart"
                                   onclick="addToCart(this)">
                                    Add To Cart
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

    </div>
</main>
<footer>
    <div class="container">
        <p>&copy; 2023 Perishable Shop. All rights reserved

            <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
                    integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
                    crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
                    integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
                    crossorigin="anonymous"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
                    integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
                    crossorigin="anonymous"></script>
        </p>
    </div>
</footer>

<script>
    function increaseQuantity(button) {
        const input = button.parentElement.querySelector(".quantity-input");
        input.value = parseInt(input.value) + 1;
    }

    function decreaseQuantity(button) {
        const input = button.parentElement.querySelector(".quantity-input");

        if (parseInt(input.value) > 1) {
            input.value = parseInt(input.value) - 1;
        }
    }

    function addToCart(button) {
        const quantity = button.parentElement
            .querySelector(".quantity-input")
            .value;

        const url = new URL(button.href, window.location.origin);
        url.searchParams.set("quantity", quantity);

        button.href = url.toString();
    }
</script>

</body>
</html>