<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0,
          maximum-scale=1.0, minimum-scale=1.0">

    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
          crossorigin="anonymous">

    <title>Your Cart</title>
    <style>

        .quantity-controls {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 5px;
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
    </style>
</head>

<body class="bg-light">

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">
            E-Commerce
        </a>

        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link"
                   href="${pageContext.request.contextPath}/">
                    Products
                </a>
            </li>
        </ul>
    </div>
</nav>

<div class="container mt-4">

    <h2 class="mb-4">Your Cart</h2>

    <c:choose>

        <c:when test="${empty cartProducts}">
            <div class="alert alert-info">
                Your cart is currently empty.
            </div>

            <a href="${pageContext.request.contextPath}/"
               class="btn btn-primary">
                Continue Shopping
            </a>
        </c:when>

        <c:otherwise>

            <div class="card shadow-sm">
                <div class="card-body">

                    <div class="table-responsive">
                        <table class="table table-hover align-middle text-center">

                            <thead class="thead-dark">
                            <tr>
                                <th>Product</th>
                                <th>Preview</th>
                                <th>Price Per</th>
                                <th>Quantity</th>
                                <th>Total</th>
                            </tr>
                            </thead>

                            <tbody>

                            <c:forEach var="cartProduct"
                                       items="${cartProducts}">

                                <tr>

                                    <td>
                                        <strong>
                                                ${cartProduct.product.name}
                                        </strong>
                                    </td>

                                    <td>
                                        <img
                                                src="${cartProduct.product.image}"
                                                alt="${cartProduct.product.name}"
                                                width="80"
                                                height="80"
                                                style="object-fit: contain;">
                                    </td>

                                    <td>
                                        $${cartProduct.product.price}
                                    </td>

                                    <td>
                                        <div class="quantity-controls">

                                            <form action="${pageContext.request.contextPath}/cart/update"
                                                  method="get">

                                                <input type="hidden"
                                                       name="productId"
                                                       value="${cartProduct.product.id}">

                                                <input type="hidden"
                                                       name="quantity"
                                                       value="${cartProduct.quantity - 1}">

                                                <button type="submit"
                                                        class="btn btn-primary">
                                                    -
                                                </button>

                                            </form>

                                            <form action="${pageContext.request.contextPath}/cart/update"
                                                  method="get">

                                                <input type="hidden"
                                                       name="productId"
                                                       value="${cartProduct.product.id}">

                                                <input type="number"
                                                       name="quantity"
                                                       value="${cartProduct.quantity}"
                                                       min="0"
                                                       class="form-control quantity-input">

                                            </form>

                                            <form action="${pageContext.request.contextPath}/cart/update"
                                                  method="get">

                                                <input type="hidden"
                                                       name="productId"
                                                       value="${cartProduct.product.id}">

                                                <input type="hidden"
                                                       name="quantity"
                                                       value="${cartProduct.quantity + 1}">

                                                <button type="submit"
                                                        class="btn btn-primary">
                                                    +
                                                </button>

                                            </form>

                                        </div>
                                    </td>

                                    <td>
                                        $${cartProduct.product.price * cartProduct.quantity}
                                    </td>

                                </tr>

                            </c:forEach>

                            </tbody>

                        </table>
                    </div>

                    <hr>

                    <div class="text-right">
                        <h4>
                            Total:
                            $
                            <c:set var="cartTotal" value="0"/>

                            <c:forEach var="cartProduct"
                                       items="${cartProducts}">
                                <c:set var="cartTotal"
                                       value="${cartTotal +
                                       (cartProduct.product.price *
                                       cartProduct.quantity)}"/>
                            </c:forEach>

                                ${cartTotal}
                        </h4>

                        <form action="${pageContext.request.contextPath}/cart/purchase"
                              method="post"
                              class="mt-3">

                            <input type="hidden"
                                   name="${_csrf.parameterName}"
                                   value="${_csrf.token}"/>

                            <button type="submit"
                                    class="btn btn-success btn-lg">
                                Purchase
                            </button>

                        </form>
                    </div>

                </div>
            </div>

        </c:otherwise>

    </c:choose>

</div>

</body>
</html>