<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Trang chủ - Zeryf</title>

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

                <!-- Spinner Start -->
                <div id="spinner"
                    class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                    <div class="spinner-grow text-primary" role="status"></div>
                </div>
                <!-- Spinner End -->

                <jsp:include page="../layout/header.jsp" />

                <!-- Menu -->
                <div class="container-fluid mt-9 mb-4" style="height: 424px;">
                    <div class="container">
                        <div class="row" style="height: 432px">
                            <!-- CỘT TRÁI: MENU-->
                            <div class="col-2 d-none d-md-block ps-0">
                                <ul class="list-unstyled">
                                    <a href="/build-pc" class="d-flex align-items-center">
                                        <i class="fa-solid fa-screwdriver-wrench"></i>
                                        <div class="ps-2 text-dark">Xây dựng cấu hình</div>
                                    </a>
                                    <a href="#" class="d-flex align-items-center">
                                        <i class="fa-solid fa-laptop"></i>
                                        <div class="ps-2 text-dark">Laptop</div>
                                    </a>
                                    <a href="#" class="d-flex align-items-center">
                                        <i class="fa-solid fa-computer"></i>
                                        <div class="ps-2 text-dark">PC - Máy tính bàn</div>
                                    </a>
                                    <a href="#" class="d-flex align-items-center">
                                        <i class="fa-solid fa-microchip"></i>
                                        <div class="ps-2 text-dark">Linh kiện máy tính</div>
                                    </a>
                                    <a href="#" class="d-flex align-items-center">
                                        <i class="fa-regular fa-keyboard"></i>
                                        <div class="ps-2 text-dark">Phụ kiện máy tính</div>
                                    </a>
                                </ul>
                            </div>

                            <!-- CỘT GIỮA: SLIDER + BANNER -->
                            <div class="col-slider-banner p-0">
                                <!-- Slider -->
                                <div id="main-slider" class="carousel slide mb-3" data-bs-ride="carousel"
                                    style="width: 800px; height: 280px;">
                                    <div class="carousel-inner">
                                        <div class="carousel-item active">
                                            <img src="/client/img/slider_main/build_pc.png"
                                                class="d-block w-100 rounded">
                                        </div>
                                        <div class="carousel-item">
                                            <img src="/client/img/slider_main/laptop_gaming.png"
                                                class="d-block w-100 rounded">
                                        </div>
                                        <div class="carousel-item">
                                            <img src="/client/img/slider_main/pc_zeryf.png"
                                                class="d-block w-100 rounded">
                                        </div>
                                        <div class="carousel-item">
                                            <img src="/client/img/slider_main/super_deal.png"
                                                class="d-block w-100 rounded">
                                        </div>
                                    </div>
                                    <button class="carousel-control-prev" type="button" data-bs-target="#main-slider"
                                        data-bs-slide="prev">
                                        <span class="carousel-control-prev-icon"></span>
                                    </button>
                                    <button class="carousel-control-next" type="button" data-bs-target="#main-slider"
                                        data-bs-slide="next">
                                        <span class="carousel-control-next-icon"></span>
                                    </button>
                                </div>
                                <!-- Banner hàng ngang -->
                                <div class="d-flex g-2">
                                    <div class="col-3">
                                        <img src="/client/img/slider_main/pc_2tr.png" class="img-fluid rounded">
                                    </div>
                                    <div class="col-3">
                                        <img src="/client/img/slider_main/laptop_10tr.png" class="img-fluid rounded">
                                    </div>
                                    <div class="col-3">
                                        <img src="/client/img/slider_main/iphone_1tr.png" class="img-fluid rounded">
                                    </div>
                                    <div class="col-3">
                                        <img src="/client/img/slider_main/giadung_50.png" class="img-fluid rounded">
                                    </div>
                                </div>
                            </div>
                            <!-- CỘT PHẢI: 2 BANNER -->
                            <div class="col-hot-promo d-none d-lg-block pe-0">
                                <div class="d-flex flex-column gap-hot-promo">
                                    <img src="/client/img/slider_main/hot_promo.gif" class="rounded">
                                    <img src="/client/img/slider_main/hot_promo.gif" class="rounded">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Menu -->

                <!-- Container Start-->
                <div class="container-fluid fruite py-5">
                    <div class="container py-5">
                        <div class="tab-class text-center">
                            <div class="row g-4">
                                <div class="col-lg-4 text-start">
                                    <h1>Sản Phẩm Nổi Bật</h1>
                                </div>
                                <div class="col-lg-8 text-end">
                                    <ul class="nav nav-pills d-inline-flex text-center mb-5">
                                        <li class="nav-item">
                                            <a class="d-flex m-2 py-2 bg-light rounded-pill active" href="/products">
                                                <span class="text-dark" style="width: 130px;">Xem tất cả</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="tab-content">
                                <div id="tab-1" class="tab-pane fade show p-0 active">
                                    <div class="row g-4">
                                        <div class="col-lg-12">
                                            <div id="product-list-start" style="scroll-margin-top: 120px;"></div>
                                            <div class="row g-4">
                                                <c:forEach var="product" items="${products}">
                                                    <div class="col-md-6 col-lg-4 col-xl-3">
                                                        <div class="rounded position-relative fruite-item">
                                                            <div class="fruite-img">
                                                                <a href="/product/${product.id}">
                                                                    <img src="/images/product/${product.image}"
                                                                        class="img-fluid w-100 rounded-top" alt="">
                                                                </a>
                                                            </div>
                                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                                style="top: 10px; left: 10px;">Hot</div>
                                                            <div
                                                                class="p-4 border border-secondary border-top-0 rounded-bottom position-relative">
                                                                <h4 style="font-size: 15px;">
                                                                    <a href="/product/${product.id}">${product.name}</a>
                                                                </h4>
                                                                <p style="font-size: 13px;">${product.shortDesc}</p>
                                                                <div
                                                                    class="d-flex flex-lg-wrap justify-content-center flex-column">
                                                                    <p class="text-dark fw-bold mb-3"
                                                                        style="font-size: 15px;">
                                                                        <fmt:formatNumber type="number"
                                                                            value="${product.price}" /> đ
                                                                    </p>
                                                                    <form method="post"
                                                                        action="/add-product-to-cart/${product.id}"
                                                                        class="w-100">
                                                                        <input type="hidden"
                                                                            name="${_csrf.parameterName}"
                                                                            value="${_csrf.token}" />
                                                                        <button
                                                                            class="mx-auto btn border border-primary px-3 text-primary w-100">
                                                                            Thêm vào giỏ
                                                                        </button>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                                <nav aria-label="Page navigation example" class="col-12">
                                                    <ul class="pagination d-flex justify-content-center">
                                                        <li class="page-item">
                                                            <a class="${1 eq currentPage ? 'disabled page-link' : 'page-link'}"
                                                                href="/?page=${currentPage - 1}#product-list-start"
                                                                aria-label="Previous">
                                                                <span aria-hidden="true">&laquo;</span>
                                                            </a>
                                                        </li>
                                                        <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                                                            <li class="page-item">
                                                                <a class="${(loop.index) eq currentPage ? 'active page-link' : 'page-link'}"
                                                                    href="/?page=${loop.index}#product-list-start">
                                                                    ${loop.index}
                                                                </a>
                                                            </li>
                                                        </c:forEach>
                                                        <li class="page-item">
                                                            <a class="${totalPages eq currentPage ? 'disabled page-link' : 'page-link'}"
                                                                href="/?page=${currentPage + 1}#product-list-start"
                                                                aria-label="Next">
                                                                <span aria-hidden="true">&raquo;</span>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </nav>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Fruits Shop End-->

                <jsp:include page="../layout/feature.jsp" />

                <jsp:include page="../layout/footer.jsp" />

                <!-- Back to Top -->
                <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top">
                    <i class="fa fa-arrow-up"></i>
                </a>

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