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
        <title>Shop Homepage - Start Bootstrap Template</title>
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
                <h1>Thanh toán</h1>
                <div class="row">
                    <div class="col-md-8" style="border: 1px solid #ccc; border-radius: 5px; padding: 1rem">
                        <h3>Danh sách sản phẩm</h3>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Hình ảnh</th>
                                    <th scope="col">Tên</th>
                                    <th scope="col">Giá</th>
                                    <th scope="col">Số lượng</th>
                                    <th scope="col">Tổng giá</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${carts}" var="C">
                                    <tr>
                                        <input type="hidden" name="productId" value="${C.value.product.id}"/>
                                        <th scope="row">${C.value.product.id}</th>
                                        <td>${C.value.product.name}</td>
                                        <td><img src="${C.value.product.imageUrl}" width="50"/></td>
                                        <td><fmt:formatNumber value="${C.value.product.price}" pattern="###,### ₫"/></td>
                                        <td>${C.value.quantity}</td>
                                        <td><fmt:formatNumber value="${C.value.product.price*C.value.quantity}" pattern="###,### ₫"/></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <h3>Tổng số tiền: <fmt:formatNumber value="${totalMoney}" pattern="###,### ₫"/></h3>
                    </div>
                    <div class="col-md-4" style="border: 1px solid #ccc; border-radius: 5px; padding: 1rem">
                        <h3>Thông tin khách hàng</h3>
                        <form action="checkout" method="POST">
                            <div class="mb-3">
                                <label for="name" class="form-label">Tên</label>
                                <input type="text" class="form-control" id="name" name="name" aria-describedby="emailHelp">
                            </div>
                            <div class="mb-3">
                                <label for="phone" class="form-label">Số điện thoại</label>
                                <input type="text" class="form-control" id="phone" name="phone" aria-describedby="emailHelp">
                            </div>
                            <div class="mb-3">
                                <label for="address" class="form-label">Địa chỉ</label>
                                <input type="text" class="form-control" id="address" name="address" aria-describedby="emailHelp">
                            </div>
                            <div class="mb-3">
                                <label for="note" class="form-label">Ghi chú</label>
                                <textarea class="form-control" id="note" name="note" rows="3"></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary bg-success w-100">Gửi</button>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <%@include file="components/footerComponent.jsp" %>
    </body>
</html>