<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Trang chủ - Laptopshop</title>

                <!-- Google Web Fonts -->
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link
                    href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                    rel="stylesheet">

                <!-- Icon Font Stylesheet -->
                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v7.1.0/css/all.css" />
                <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                    rel="stylesheet">

                <!-- Libraries Stylesheet -->
                <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                <!-- Customized Bootstrap Stylesheet -->
                <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                <!-- Template Stylesheet -->
                <link href="/client/css/style.css" rel="stylesheet">
            </head>

            <body>
                <jsp:include page="../layout/header.jsp" />


                <!-- Cart Page Start -->
                <div class="container-fluid py-5 mt-5">
                    <div class="container py-5">
                        <div class="mb-3">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/">Trang Chủ</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Giỏ Hàng</li>
                                </ol>
                            </nav>
                        </div>
                        <div class="row g-4">
                            <div class="col-lg-4 text-start">
                                <h1>Giỏ hàng (3)</h1>
                            </div>
                            <div class="col-lg-8 text-end">
                                <ul class="nav nav-pills d-inline-flex text-center mb-5">
                                    <li class="nav-item">
                                        <a class="d-flex m-2 py-2 bg-light rounded-pill active" href="/product">
                                            <span class="text-dark" style="width: 130px;">Xoá tất cả</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="row g-4">
                            <div class="table-responsive col-lg-8">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">Tên sản phẩm</th>
                                            <th scope="col">Đơn giá</th>
                                            <th scope="col">Số lượng</th>
                                            <th scope="col">Thành tiền</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th scope="row">
                                                <div class="d-flex align-items-center">
                                                    <img src="img/vegetable-item-3.png"
                                                        class="img-fluid me-5 rounded-circle"
                                                        style="width: 80px; height: 80px;" alt="">
                                                    <p class="mb-0 mt-4">Big Banana</p>
                                                </div>
                                            </th>
                                            <td>
                                                <p class="mb-0 mt-4">2.99 $</p>
                                            </td>
                                            <td>
                                                <div class="input-group quantity mt-4 border border-dark rounded d-flex align-items-center"
                                                    style="width: 100px;">
                                                    <div class="input-group-btn">
                                                        <button class="btn btn-sm btn-minus bg-light">
                                                            <i class="fa-solid fa-minus"></i>
                                                        </button>
                                                    </div>
                                                    <input type="text"
                                                        class="form-control form-control-sm text-center border-0"
                                                        value="1">
                                                    <div class="input-group-btn">
                                                        <button class="btn btn-sm btn-plus bg-light">
                                                            <i class="fa-solid fa-plus"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                                <button class="btn bg-light mt-4 btn-unfocus">
                                                    <i class="text-primary delete-hover">Xoá</i>
                                                </button>
                                            </td>
                                            <td>
                                                <p class="mb-0 mt-4">2.99 $</p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">
                                                <div class="d-flex align-items-center">
                                                    <img src="img/vegetable-item-5.jpg"
                                                        class="img-fluid me-5 rounded-circle"
                                                        style="width: 80px; height: 80px;" alt="" alt="">
                                                    <p class="mb-0 mt-4">Potatoes</p>
                                                </div>
                                            </th>
                                            <td>
                                                <p class="mb-0 mt-4">2.99 $</p>
                                            </td>
                                            <td>
                                                <div class="input-group quantity mt-4 border border-dark rounded d-flex align-items-center"
                                                    style="width: 100px;">
                                                    <div class="input-group-btn">
                                                        <button class="btn btn-sm btn-minus bg-light">
                                                            <i class="fa-solid fa-minus"></i>
                                                        </button>
                                                    </div>
                                                    <input type="text"
                                                        class="form-control form-control-sm text-center border-0"
                                                        value="1">
                                                    <div class="input-group-btn">
                                                        <button class="btn btn-sm btn-plus bg-light">
                                                            <i class="fa-solid fa-plus"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                                <button class="btn bg-light mt-4 btn-unfocus">
                                                    <i class="text-primary delete-hover">Xoá</i>
                                                </button>
                                            </td>
                                            <td>
                                                <p class="mb-0 mt-4">2.99 $</p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">
                                                <div class="d-flex align-items-center">
                                                    <img src="img/vegetable-item-2.jpg"
                                                        class="img-fluid me-5 rounded-circle"
                                                        style="width: 80px; height: 80px;" alt="" alt="">
                                                    <p class="mb-0 mt-4">Awesome Brocoli</p>
                                                </div>
                                            </th>
                                            <td>
                                                <p class="mb-0 mt-4">2.99 $</p>
                                            </td>
                                            <td>
                                                <div class="input-group quantity mt-4 border border-dark rounded d-flex align-items-center"
                                                    style="width: 100px;">
                                                    <div class="input-group-btn">
                                                        <button class="btn btn-sm btn-minus bg-light">
                                                            <i class="fa-solid fa-minus"></i>
                                                        </button>
                                                    </div>
                                                    <input type="text"
                                                        class="form-control form-control-sm text-center border-0"
                                                        value="1">
                                                    <div class="input-group-btn">
                                                        <button class="btn btn-sm btn-plus bg-light">
                                                            <i class="fa-solid fa-plus"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                                <button class="btn bg-light mt-4 btn-unfocus">
                                                    <i class="text-primary delete-hover">Xoá</i>
                                                </button>
                                            </td>
                                            <td>
                                                <p class="mb-0 mt-4">2.99 $</p>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <div class="mt-5 row g-4 justify-content-end col-lg-4">
                                <div class="col-12">
                                    <div class="bg-light rounded">
                                        <div class="p-4">
                                            <h1 class="display-6 mb-4">Thanh <span class="fw-normal">toán</span></h1>
                                            <div class="d-flex justify-content-between mb-4">
                                                <h5 class="mb-0 me-4">Tổng tạm tính:</h5>
                                                <p class="mb-0">$96.00</p>
                                            </div>
                                            <div class="d-flex justify-content-between">
                                                <h5 class="mb-0 me-4">Phí vận chuyển</h5>
                                                <div class="">
                                                    <p class="mb-0">Flat rate: $3.00</p>
                                                </div>
                                            </div>
                                            <p class="mb-0 text-end">Shipping to Ukraine.</p>
                                        </div>
                                        <div class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
                                            <h5 class="mb-0 ps-4 me-4">Thành tiền</h5>
                                            <p class="mb-0 pe-4">$99.00</p>
                                        </div>
                                        <button
                                            class="btn btn-primary px-4 py-3 text-light text-uppercase mb-4 ms-4 btn-unfocus"
                                            type="button">Tiến Hành Thanh Toán</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Cart Page End -->


                <jsp:include page="../layout/footer.jsp" />


                <!-- Back to Top -->
                <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                        class="fa fa-arrow-up"></i></a>


                <!-- JavaScript Libraries -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                <script src="/client/lib/easing/easing.min.js"></script>
                <script src="/client/lib/waypoints/waypoints.min.js"></script>
                <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

                <!-- Template Javascript -->
                <script src="/client/js/main.js"></script>
            </body>

            </html>