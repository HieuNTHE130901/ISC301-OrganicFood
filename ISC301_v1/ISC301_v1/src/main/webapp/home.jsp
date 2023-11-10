<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Organic food - Cửa hàng thực phẩm hữu cơ</title>
        <!-- Add Bootstrap CSS via CDN -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto&display=swap">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link href="css/styles.css" rel="stylesheet" />
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

        </style>


    </head>
    <body>
        <%@include file="components/navBarComponent.jsp" %>

        <!-- Slider Area -->
        <!-- Replace the static header with a Bootstrap Carousel -->
        <div id="headerCarousel" class="carousel slide" data-ride="carousel" style="  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="assets/slider12.jpg" class="d-block w-100" alt="Slide 1">
                    <div class="carousel-caption d-none d-md-block">
                        <h5 class="display-4 fw-bolder text-white">ORGANIC FOOD</h5>
                        <p class="lead fw-normal text-white-50">Sống khỏe hơn cùng Organic Food!</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="assets/slider11.jpg" class="d-block w-100" alt="Slide 2">
                    <div class="carousel-caption d-none d-md-block">
                        <h5 class="display-4 fw-bolder text-white">ORGANIC FOOD</h5>
                        <p class="lead fw-normal text-white-50">Sống khỏe hơn cùng Organic Food!</p>
                    </div>
                    <!-- Add caption for the second slide here if needed -->
                </div>
                <!-- Add more carousel items (slides) as needed -->
            </div>
            <a class="carousel-control-prev" href="#headerCarousel" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#headerCarousel" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

        <!-- Section-->
        <section class="py-5" >
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row">
                    <div class="col-md-3 mb-5" >
                        <h3>Danh mục sản phẩm</h3>
                        <ul class="list-group category_block"  style="box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);">
                            <c:forEach items="${listCategories}" var="C">
                                <li class="list-group-item ${tag == C.cid ? 'active' : ''}"><a href="category?categoryId=${C.cid}">${C.cname}</a></li>
                                </c:forEach>
                        </ul>
                    </div>
                    <div class="col-md-9">
                        <h3>Danh sách sản phẩm</h3>

                        <form action="sort" method="POST">
                            Sắp xếp theo giá:  <button  class="btn btn-outline-primary" type="submit" name="sort" value="asc"> <i class="fas fa-arrow-up"></i>
                            </button>
                            <button class="btn btn-outline-primary" type="submit" name="sort" value="desc"> <i class="fas fa-arrow-down"></i>
                            </button>
                        </form>


                        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 justify-content-center" style="margin-top: 20px">
                            <c:forEach items="${listProducts}" var="P">
                                <div class="col mb-5">

                                    <div class="card h-100 rounded border border-light shadow">
                                        <!-- Sale badge with a red background -->
                                        <div class="badge bg-danger text-white position-absolute" style="top: 0.5rem;
                                             right: 0.5rem;">
                                            Sale !!
                                        </div>

                                        <!-- Product image-->
                                        <a href="detail?productId=${P.id}">
                                            <img
                                                class="card-img-top"
                                                src="${P.imageUrl}"
                                                alt="..."
                                                />
                                        </a>
                                        <!-- Product details-->
                                        <div class="card-body p-4">
                                            <div class="text-center">
                                                <!-- Product name-->
                                                <h5 class="fw-bolder">${P.name}</h5>
                                                <!-- Product reviews-->
                                                <div
                                                    class="d-flex justify-content-center small text-warning mb-2">
                                                    <div class="bi-star-fill">${P.tiltle}</div>

                                                </div>
                                                <!-- Product price-->
                                                <span class="text-muted text-decoration-line-through"> <fmt:formatNumber value="${P.price + 10000}" pattern="###,### ₫"/></span>
                                                <fmt:formatNumber value="${P.price}" pattern="###,### ₫"/>
                                            </div>
                                        </div>
                                        <!-- Product actions-->
                                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                            <div class="text-center">
                                                <a class="btn btn-outline-dark mt-auto" href="add-to-cart?productId=${P.id}">
                                                    <i class="fas fa-shopping-cart"></i> Thêm vào giỏ hàng</a>
                                            </div>
                                        </div>


                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <c:choose>
                            <c:when test="${listProducts==null || listProducts.size()==0}">
                                Sản phẩm đã hết!
                            </c:when>
                            <c:otherwise>
                                <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                                    <ul class="pagination">
                                        <li class="page-item"><a class="page-link" href="home?page=${page-1}">Trang trước</a></li>
                                            <c:forEach begin="1" end="${totalPage}" var="i">
                                            <li class="page-item ${i == page?"active":""}"><a class="page-link" href="home?page=${i}">${i}</a></li>
                                            </c:forEach>
                                        <li class="page-item"><a class="page-link" href="home?page=${page+1}">Trang tiếp theo</a></li>
                                    </ul>
                                </nav>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
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
            <!-- Add Bootstrap JS via CDN at the end of the body -->
            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
