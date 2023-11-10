<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
            />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Giỏ hàng</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
            rel="stylesheet"
            />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <style>
            body {
                background-color: #e6ffcc; /* Green background color */
                 color: black; /* Set text color to black */
            }
        </style>
    </head>
    <body>
        <%@include file="components/navBarComponent.jsp" %>

        <!-- Phần sản phẩm-->
        <section class="py-5">
            <div class="container" style="min-height: 1000px">
                <c:choose>
                    <c:when test="${sessionScope.carts==null||sessionScope.carts.size()==0}">
                        <h1>Danh sách giỏ hàng trống</h1>
                    </c:when>
                    <c:otherwise>
                        <h3>Danh sách sản phẩm</h3>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Hình ảnh</th>
                                    <th scope="col">Tên</th>
                                    <th scope="col">Giá</th>
                                    <th scope="col">Số lượng</th>
                                    <th scope="col">Tổng giá</th>
                                    <th scope="col">Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${carts}" var="C">
                                <form action="update-quantity">
                                    <tr>
                                    <input type="hidden" name="productId" value="${C.value.product.id}"/>
                                        <th scope="row">${C.value.product.id}</th>
                                        <td>${C.value.product.name}</td>
                                        <td><img src="${C.value.product.imageUrl}" width="50"/></td>
                                        <td><fmt:formatNumber value="${C.value.product.price}" pattern="###,### ₫"/></td>
                                        <td><input onchange="this.form.submit()" type="number" name="quantity" value="${C.value.quantity}"/></td>
                                        <td><fmt:formatNumber value="${C.value.product.price*C.value.quantity}" pattern="###,### ₫"/></td>
                                        <td><a href="delete-cart?productId=${C.value.product.id}" class="btn btn-outline-danger"><i class="bi bi-trash"></i>Xoá</a></td>
                                    </tr>
                                </form>
                            </c:forEach>
                            </tbody>
                        </table>
                        <h3>Tổng số tiền: <fmt:formatNumber value="${totalMoney}" pattern="###,### ₫"/></h3>
                        <a href="checkout" class="btn btn-success w-25">Thanh toán</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </section>
        <%@include file="components/footerComponent.jsp" %>
    </body>
</html>