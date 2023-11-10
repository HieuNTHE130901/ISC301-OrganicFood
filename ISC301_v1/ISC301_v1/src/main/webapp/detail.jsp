<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
            />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>detail</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />       
        <!-- Add Bootstrap CSS via CDN -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto&display=swap">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">       
        <link href="css/customcss.css" rel="stylesheet" />
        <style>
            #notification {
                display: none;
                position: fixed;
                bottom: 20px;
                left: 20px;
                min-width: 300px;
                background-color: #f8f9fa;
                border: 1px solid #dee2e6;
                padding: 10px;
                border-radius: 5px;
                font-size: 16px;
                color: #495057;
                box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);
                z-index: 1000;
            }
            #notification.show {
                display: block;
                animation: slideIn 0.3s ease-in-out;
            }
            @keyframes slideIn {
                0% {
                    transform: translateY(100%);
                }
                100% {
                    transform: translateY(0%);
                }
            }
            .chat-container {
                position: fixed;
                bottom: 20px;
                right: 20px;
                cursor: pointer;
            }
            .chat-container img {
                width: 60px;
                height: 60px;
                box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);
            }
            .messenger-chat img {
                border-radius: 50%;
            }
            .zalo-chat img {
                border-radius: 50%;
            }
            .call-store img {
                border-radius: 50%;
            }
            .chat-container {
                position: fixed;
                z-index: 9999;
            }

            .messenger-chat {
                bottom: 120px;
                right: 20px;
            }

            .zalo-chat {
                bottom: 70px;
                right: 20px;
            }

            .call-store {
                bottom: 20px;
                right: 20px;
            }

            /* Thiết lập kiểu cho các biểu tượng */
            .chat-container img {
                width: 50px;
                height: 50px;
            }
            .product-policies-wrapper {
                background-color: #f8f9fa;
                border-radius: 5px;
                padding: 20px;
            }

            .product-policies li {
                display: flex;
                align-items: center;
            }

            .product-policies img {
                height: 40px;
                width: 40px;
                object-fit: contain;
            }

            .product-policies .media-body {
                margin-top: 5px;
            }

            .product-trust-badge img {
                max-width: 100%;
                height: auto;
            }

        </style>
    </head>
    <body>
        <%@include file="components/navBarComponent.jsp" %>
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6 col-lg-6">
                        <img class="card-img-top mb-5 mb-md-0" src="${product.imageUrl}" alt="Product Image">
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="mb-5">
                           
                            <h2 class=""> <br>${product.name}</h2>
                            <div class="fs-5">                            
                                <span class=""><fmt:formatNumber value="${product.price}" pattern="###,### ₫"/></span>                               
                            </div>
                        </div>
                        <div class="mb-5">
                            <a href="add-to-cart?productId=${product.id}" class="btn btn-primary" type="button">
                                Thêm vào giỏ hàng <i class="fas fa-shopping-cart"></i>
                            </a>
                        </div>
                        <div class="product-policies-wrapper mb-5">
                            <h5 class="fw-bold">
                                Duy nhất tại Organic Food 
                            </h5>
                            <ul class="product-policies list-unstyled">
                                <li class="media mb-3">
                                    <img class="img-fluid mr-3 policy-icon" src="//theme.hstatic.net/200000423303/1000941350/14/policy_product_image_1.png?v=551" alt="Free ship 5km cho đơn hàng từ 499k">
                                    <div class="media-body">
                                        Free ship 5km cho đơn hàng từ 499k
                                    </div>
                                </li>
                                <li class="media mb-3">
                                    <img class="img-fluid mr-3 policy-icon" src="//theme.hstatic.net/200000423303/1000941350/14/policy_product_image_2.png?v=551" alt="Giao hàng trong 2h">
                                    <div class="media-body">
                                        Giao hàng trong 2h
                                    </div>
                                </li>                       
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row ">
                    <div class="col-lg-6">
                        <div class="other-div">
                            <br>
                            <h2 class="mb-4">Chi tiết sản phẩm:</h2>
                            <p class="fw-bold">${product.name}</p>
                            <p>${product.description}</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <!-- Related items section-->
        <section class="py-5 bg-light" >
            <div class="container px-4 px-lg-5 mt-5">
                <h2 class="fw-bolder mb-4">Các sản phẩm liên quan</h2>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <c:forEach items="${listLast}" var="L">
                        <div class="col mb-5">
                            <div class="card h-100">
                                <!-- Sale badge with a red background -->
                                <div class="badge bg-danger text-white position-absolute" style="top: 0.5rem; right: 0.5rem;">
                                    Sale !!
                                </div>
                                <!-- Product image-->
                                <a href="detail?productId=${L.id}">
                                    <img class="card-img-top" src="${L.imageUrl}" alt="..."  style="box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);" />
                                    <!-- Product details-->
                                    <div class="card-body p-4">
                                        <div class="text-center">
                                            <!-- Product name-->
                                            <h5 class="fw-bolder" style=" color: black;">${L.name}</h5>
                                            <!-- Product reviews-->
                                            <div class="d-flex justify-content-center small text-warning mb-2">
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                            </div>
                                            <!-- Product price-->
                                            <span class="text-muted text-decoration-line-through"><fmt:formatNumber value="${L.price+10000}" pattern="###,### ₫"/></span>
                                            <fmt:formatNumber value="${L.price}" pattern="###,### ₫"/>
                                        </div>
                                    </div>
                                    <!-- Product actions-->
                                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="add-to-cart?productId=${L.id}">Thêm vào giỏ hàng <i class="fas fa-shopping-cart"></i></a></div>
                                    </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>
        <!-- Phần thông báo -->
        <div id="notification" class="notification">Khách hàng X vừa đặt sản phẩm Y, Z phút trước</div>

        <!-- Phần chat bằng Messenger -->
        <div class="chat-container messenger-chat">
            <a href="https://www.messenger.com/t/your-page-id" target="_blank">
                <img src="assets/messenger.png" alt="Messenger" />
            </a>
        </div>

        <!-- Phần chat bằng Zalo -->
        <div class="chat-container zalo-chat">
            <a href="https://zalo.me/your-zalo-id" target="_blank">
                <img src="assets/zalo.png" alt="Zalo" />
            </a>
        </div>

        <!-- Phần gọi điện -->
        <div class="chat-container call-store">
            <a href="tel:+1234567890">
                <img src="assets/call.png" alt="Gọi điện" />
            </a>
        </div>
        <%@include file="components/footerComponent.jsp" %>
        <script>
            // Lấy tham chiếu đến phần tử thông báo
            var notification = document.getElementById("notification");

            // Mảng chứa các nội dung thông báo
            var messages = [
                {
                    customerName: "Ngọc Minh",
                    product: "Giò chả",
                    minutesAgo: 10
                },
                {
                    customerName: "Thùy Trâm",
                    product: "Bánh mì",
                    minutesAgo: 5
                },
                {
                    customerName: "Thu Hà",
                    product: "Thịt lợn",
                    minutesAgo: 2
                }
            ];

            // Biến đếm vị trí hiện tại trong mảng thông báo
            var currentIndex = 0;

            // Hiển thị thông báo với nội dung từ mảng
            function showNotification() {
                var message = messages[currentIndex];
                notification.textContent = "Khách hàng " + message.customerName + " vừa đặt sản phẩm " + message.product + ", " + message.minutesAgo + " phút trước";
                notification.classList.add("show");

                // Tăng biến đếm vị trí hiện tại
                currentIndex = (currentIndex + 1) % messages.length;
            }

            // Ẩn thông báo
            function hideNotification() {
                notification.classList.remove("show");
            }

            // Gọi hàm hiển thị thông báo ban đầu
            showNotification();

            // Lặp lại hiển thị thông báo sau mỗi 15 giây
            setInterval(function () {
                hideNotification();
                setTimeout(showNotification, 300); // Hiển thị thông báo lại sau 0.3 giây để tạo hiệu ứng ẩn/hiện
            }, 10000);
        </script>
    </body>
</html>

