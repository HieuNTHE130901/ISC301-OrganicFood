<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link rel="stylesheet" href="css/login.css">
        <title>Thay đổi Mật khẩu</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
            rel="stylesheet"
            />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <script>
            function doforgetPass() {
                window.location.href = "forgetPassword";
            }
        </script>
        <style>
            body {
                background-color: #e6ffcc; /* Green background color */
                 color: black; /* Set text color to black */
            }
        </style>


    </head>

    <body>
        <%@include file="components/navBarComponent.jsp" %>
        <div id="logreg-forms">
            <br>
            <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Thay đổi mật khẩu</p>
            <form class="form-signin" action="forgetPassword" method="post">
                <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                        <label class="form-label" for="form3Example1c">Tài khoản</label>
                        <input type="text" id="form3Example1c" class="form-control" required name="user" />
                    </div>
                </div>
                <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-lock fa-lg me-3 fa-fw"></i> 
                    <div class="form-outline flex-fill mb-0">
                        <label class="form-label" for="form3Example1c">Mật khẩu cũ</label>
                        <input type="password" id="form3Example1c" class="form-control" required name="pass" />
                    </div>
                </div>
                <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-lock fa-lg me-3 fa-fw"></i> 
                    <div class="form-outline flex-fill mb-0">
                        <label class="form-label" for="form3Example1c">Mật khẩu mới</label>
                        <input type="password" id="form3Example1c" class="form-control" required name="newPassword" />
                    </div>
                </div>
                <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-lock fa-lg me-3 fa-fw"></i> 
                    <div class="form-outline flex-fill mb-0">
                        <label class="form-label" for="form3Example3c">Nhập lại mật khẩu mới</label>
                        <input type="password" id="form3Example3c" class="form-control" required name="confirmPassword" />
                    </div>
                </div>

                <div class="d-block mx-4 mb-3 mb-lg-4  text-danger"><b>${mess}</b></div>
                <div class="d-block mx-4 mb-3 mb-lg-4 text-center">
                    <button class="btn btn-primary btn-block px-5 w-100" type="submit">Xác nhận</button>
                </div>

                <div class="text-center pt-2">
                    <a href="login">Trở về</a>
                </div>
            </form>
        </div>   
        <%@include file="components/footerComponent.jsp" %>
    </body>
</html>
