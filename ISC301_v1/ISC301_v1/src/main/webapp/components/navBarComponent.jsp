<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!-- Navigation-->
<script>
    function login() {
        window.location.href = "login.jsp";
    }
    function logout() {
        window.location.href = "logout";
    }
</script>
<!-- Add Bootstrap CSS via CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto&display=swap">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link href="css/styles.css" rel="stylesheet" />
<link href="css/customcss.css" rel="stylesheet" />
<style>
    /* Green theme styles */
    .navbar-light {
        background-color: #80ac53 !important;
    }
    .navbar-brand,
    .navbar-brand:hover {
        color: #fff !important;
    }
    .navbar-nav .nav-link,
    .navbar-nav .nav-link:hover {
        color: #fff !important;
    }
    .navbar-toggler-icon {
        background-image: url("data:image/svg+xml;charset=utf-8,%3Csvg viewBox='0 0 30 30' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='rgba(255, 255, 255, 0.5)' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 7h22M4 15h22M4 23h22'/%3E%3C/svg%3E") !important;
    }
    .form-control {
        background-color: #fff !important;
        color: #198754 !important;
    }
    .btn-outline-success {
        color: #198754 !important;
        border-color: #198754 !important;
    }
    .btn-outline-success:hover {
        background-color: #198754 !important;
        color: #fff !important;
    }
    .btn-outline-dark {
        color: #198754 !important;
        border-color: #198754 !important;
    }
    .btn-outline-dark:hover {
        background-color: #198754 !important;
        color: #fff !important;
    }
    .navbar {
        margin-bottom: 20px;
    }

    .navbar-brand {
        font-size: 24px;
        font-weight: bold;
    }

    .navbar-nav .nav-link {
        font-size: 18px;
    }

    .navbar-toggler {
        border-color: #198754;
    }

    .navbar-toggler-icon {
        background-color: #198754;
    }

    .form-control:focus {
        box-shadow: none;
        border-color: #198754;
    }

    .btn-outline-success:hover,
    .btn-outline-dark:hover {
        background-color: #198754;
        color: #fff !important;
    }
    .navbar-nav .nav-link:hover {
        color: #fff !important;
        background-color: #198754 !important;
        border-radius: 5px;
        transition: background-color 0.3s ease-in-out;
    }

    .btn-outline-success:hover,
    .btn-outline-dark:hover {
        background-color: #198754 !important;
        color: #fff !important;
        border-radius: 5px;
        transition: background-color 0.3s ease-in-out;
    }

</style>

<nav class="navbar navbar-expand-lg navbar-light bg-light" style="  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="home">Organic Food</a>
        <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation"
            >
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <c:if test="${sessionScope.acc != null}">
                    <li class="nav-item">
                        <a class="nav-link" href="#!">Xin chào <br> ${sessionScope.acc.user}</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc.isAdmin == 1}">
                    <li class="nav-item">
                        <a class="nav-link" href="manageOrder">Quản lý<br> Đơn đặt hàng</a>
                    </li> 
                    <li class="nav-item">
                        <a class="nav-link" href="managerAccount">Quản lý<br> Tài khoản</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="managerCategory">Quản lý<br> Danh mục</a>
                    </li>

                </c:if>
                <c:if test="${sessionScope.acc.isSell == 1}">
                    <li class="nav-item">
                        <a class="nav-link" href="manager">Quản lý<br> Sản phẩm</a>
                    </li>
                </c:if>
            </ul>
            <form action="search" class="d-flex mx-auto">
                <input
                    value="${key}"
                    class="form-control me-2"
                    type="search"
                    placeholder="Tìm kiếm sản phẩm"
                    aria-label="Search"
                    name="keyword"
                    />
                <button class="btn btn-outline-success" type="submit">
                    <i class="fas fa-search"></i>
                </button>
            </form>
            <div class="d-flex align-items-center">
                <a class="btn btn-outline-dark me-3" href="carts">

                    Giỏ hàng <i class="fas fa-shopping-cart"></i>
                    <span class="badge bg-dark text-white ms-1 rounded-pill">${sessionScope.carts.size()}</span>
                </a>
                <c:choose>
                    <c:when test="${sessionScope.acc == null}">
                        <a class="btn btn-outline-dark" href="login.jsp">

                            Login  <i class="fas fa-user"></i>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <button class="btn btn-outline-dark ms-lg-2" onclick="logout()">

                            Logout  <i class="fas fa-user"></i>
                        </button>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</nav>