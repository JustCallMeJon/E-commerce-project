<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="java.text.*" %>

<!doctype html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>Document</title>
</head>
<body>
<c:forEach var="cartProduct" items="${cartProducts}">
    <div>
        <h3>${cartProduct.product.name}</h3>
        <p>Quantity: ${cartProduct.quantity}</p>
        <p>Price: $${cartProduct.product.price}</p>
    </div>
</c:forEach>
</body>
</html>