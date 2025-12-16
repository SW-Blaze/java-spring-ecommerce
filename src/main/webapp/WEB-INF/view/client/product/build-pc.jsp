<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <title>Xây dựng cấu hình - Zeryf</title>
                    <meta content="width=device-width, initial-scale=1.0" name="viewport">
                    <meta content="" name="keywords">
                    <meta content="" name="description">

                    <!-- Google Web Fonts -->
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link
                        href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                        rel="stylesheet">

                    <!-- Icon Font Stylesheet -->
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
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

                    <!-- Build PC Start -->
                    <div class="container-fluid py-5 mt-5">
                        <div class="container py-5">
                            <div class="mb-3">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Xây dựng cấu hình</li>
                                    </ol>
                                </nav>
                            </div>
                            <h1 class="mb-4">Xây dựng cấu hình</h1>
                            <div class="row g-4">
                                <div class="col-lg-8 text-end px-2">
                                    <ul class="nav nav-pills d-inline-flex text-center mb-5">
                                        <li class="nav-item">
                                            <a class="d-flex m-2 py-2 bg-light rounded-pill active" href="/product">
                                                <span class="text-dark" style="width: 130px;">Tạo lại</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="row g-4">
                                <div class="col-lg-8 px-2">
                                    <div class="px-3 py-4 mb-3 box-shadow-build-pc">
                                        <div class="row g-0 align-items-center">
                                            <div class="col-auto px-2 fw-bold text-center text-dark"
                                                style="width: 15%;">
                                                <div>Vi xử lý</div>
                                            </div>

                                            <div class="col-auto px-2">
                                                <div class="border rounded" style="width: 83.41px; height: 85.41px;">
                                                    <img src="/client/img/build_pc_images/cpu.png" alt=""
                                                        class="w-100 h-100" id="image-7">
                                                </div>
                                            </div>

                                            <div class="col px-2 text-dark">
                                                <div id="name-7">Vui lòng chọn linh kiện</div>
                                                <div id="price-7" class="fw-bold text-primary"></div>
                                            </div>

                                            <div class="col-auto px-2">
                                                <button type="button" id="btn-select-7" onclick="loadFragment(7)"
                                                    class="btn btn-primary text-light fw-normal">Chọn</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="px-3 py-4 mb-3 box-shadow-build-pc">
                                        <div class="row g-0 align-items-center">
                                            <div class="col-auto px-2 fw-bold text-center text-dark"
                                                style="width: 15%;">
                                                <div>Bo mạch chủ</div>
                                            </div>

                                            <div class="col-auto px-2">
                                                <div class="border rounded" style="width: 83.41px; height: 85.41px;">
                                                    <img src="/client/img/build_pc_images/mainboard.82595f5e.png" alt=""
                                                        class="w-100 h-100" id="image-11">
                                                </div>
                                            </div>

                                            <div class="col px-2 text-dark">
                                                <div id="name-11">Vui lòng chọn linh kiện</div>
                                                <div id="price-11" class="fw-bold text-primary"></div>
                                            </div>

                                            <div class="col-auto px-2">
                                                <button type="button" id="btn-select-11" onclick="loadFragment(11)"
                                                    class="btn btn-primary text-light fw-normal">Chọn</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="px-3 py-4 mb-3 box-shadow-build-pc">
                                        <div class="row g-0 align-items-center">
                                            <div class="col-auto px-2 fw-bold text-center text-dark"
                                                style="width: 15%;">
                                                <div>Ram</div>
                                            </div>

                                            <div class="col-auto px-2">
                                                <div class="border rounded" style="width: 83.41px; height: 85.41px;">
                                                    <img src="/client/img/build_pc_images/ram.png" alt=""
                                                        class="w-100 h-100" id="image-9">
                                                </div>
                                            </div>

                                            <div class="col px-2 text-dark">
                                                <div id="name-9">Vui lòng chọn linh kiện</div>
                                                <div id="price-9" class="fw-bold text-primary"></div>
                                            </div>

                                            <div class="col-auto px-2">
                                                <button type="button" id="btn-select-9" onclick="loadFragment(9)"
                                                    class="btn btn-primary text-light fw-normal">Chọn</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="px-3 py-4 mb-3 box-shadow-build-pc">
                                        <div class="row g-0 align-items-center">
                                            <div class="col-auto px-2 fw-bold text-center text-dark"
                                                style="width: 15%;">
                                                <div>Ổ HDD</div>
                                            </div>

                                            <div class="col-auto px-2">
                                                <div class="border rounded" style="width: 83.41px; height: 85.41px;">
                                                    <img src="/client/img/build_pc_images/hdd.png" alt=""
                                                        class="w-100 h-100" id="image-20">
                                                </div>
                                            </div>

                                            <div class="col px-2 text-dark">
                                                <div id="name-20">Vui lòng chọn linh kiện</div>
                                                <div id="price-20" class="fw-bold text-primary"></div>
                                            </div>

                                            <div class="col-auto px-2">
                                                <button type="button" id="btn-select-20" onclick="loadFragment(20)"
                                                    class="btn btn-primary text-light fw-normal">Chọn</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="px-3 py-4 mb-3 box-shadow-build-pc">
                                        <div class="row g-0 align-items-center">
                                            <div class="col-auto px-2 fw-bold text-center text-dark"
                                                style="width: 15%;">
                                                <div>Ổ SSD</div>
                                            </div>

                                            <div class="col-auto px-2">
                                                <div class="border rounded" style="width: 83.41px; height: 85.41px;">
                                                    <img src="/client/img/build_pc_images/ssd.png" alt=""
                                                        class="w-100 h-100" id="image-6">
                                                </div>
                                            </div>

                                            <div class="col px-2 text-dark">
                                                <div id="name-6">Vui lòng chọn linh kiện</div>
                                                <div id="price-6" class="fw-bold text-primary"></div>
                                            </div>

                                            <div class="col-auto px-2">
                                                <button type="button" id="btn-select-6" onclick="loadFragment(6)"
                                                    class="btn btn-primary text-light fw-normal">Chọn</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="px-3 py-4 mb-3 box-shadow-build-pc">
                                        <div class="row g-0 align-items-center">
                                            <div class="col-auto px-2 fw-bold text-center text-dark"
                                                style="width: 15%;">
                                                <div>VGA</div>
                                            </div>

                                            <div class="col-auto px-2">
                                                <div class="border rounded" style="width: 83.41px; height: 85.41px;">
                                                    <img src="/client/img/build_pc_images/vga.png" alt=""
                                                        class="w-100 h-100" id="image-12">
                                                </div>
                                            </div>

                                            <div class="col px-2 text-dark">
                                                <div id="name-12">Vui lòng chọn linh kiện</div>
                                                <div id="price-12" class="fw-bold text-primary"></div>
                                            </div>

                                            <div class="col-auto px-2">
                                                <button type="button" id="btn-select-12" onclick="loadFragment(12)"
                                                    class="btn btn-primary text-light fw-normal">Chọn</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="px-3 py-4 mb-3 box-shadow-build-pc">
                                        <div class="row g-0 align-items-center">
                                            <div class="col-auto px-2 fw-bold text-center text-dark"
                                                style="width: 15%;">
                                                <div>Nguồn</div>
                                            </div>

                                            <div class="col-auto px-2">
                                                <div class="border rounded" style="width: 83.41px; height: 85.41px;">
                                                    <img src="/client/img/build_pc_images/psu.png" alt=""
                                                        class="w-100 h-100" id="image-10">
                                                </div>
                                            </div>

                                            <div class="col px-2 text-dark">
                                                <div id="name-10">Vui lòng chọn linh kiện</div>
                                                <div id="price-10" class="fw-bold text-primary"></div>
                                            </div>

                                            <div class="col-auto px-2">
                                                <button type="button" id="btn-select-10" onclick="loadFragment(10)"
                                                    class="btn btn-primary text-light fw-normal">Chọn</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="px-3 py-4 mb-3 box-shadow-build-pc">
                                        <div class="row g-0 align-items-center">
                                            <div class="col-auto px-2 fw-bold text-center text-dark"
                                                style="width: 15%;">
                                                <div>Vỏ case</div>
                                            </div>

                                            <div class="col-auto px-2">
                                                <div class="border rounded" style="width: 83.41px; height: 85.41px;">
                                                    <img src="/client/img/build_pc_images/case.png" alt=""
                                                        class="w-100 h-100" id="image-8">
                                                </div>
                                            </div>

                                            <div class="col px-2 text-dark">
                                                <div id="name-8">Vui lòng chọn linh kiện</div>
                                                <div id="price-8" class="fw-bold text-primary"></div>

                                            </div>

                                            <div class="col-auto px-2">
                                                <button type="button" id="btn-select-8" onclick="loadFragment(8)"
                                                    class="btn btn-primary text-light fw-normal">Chọn</button>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Modal Popup -->
                                    <div class="modal fade" id="productModal" tabindex="-1" role="dialog">
                                        <div class="modal-dialog modal-xl" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Chọn linh kiện</h5>
                                                    <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body" id="modal-product-list">
                                                    <div class="text-center">Đang tải dữ liệu...</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="col-12">
                                        <div class="bg-light rounded">
                                            <div class="px-4">
                                                <h1 class="display-6 mb-4">Thanh <span class="fw-normal">toán</span>
                                                </h1>
                                                <div class="d-flex justify-content-between mb-4">
                                                    <h5 class="mb-0 me-4">Tổng tạm tính:</h5>
                                                    <p class="mb-0" data-cart-total-price="${totalPrice}">
                                                        <fmt:formatNumber type="number" value="${totalPrice}" /> đ
                                                    </p>
                                                </div>
                                                <div class="d-flex justify-content-between">
                                                    <h5 class="mb-0 me-4">Phí vận chuyển</h5>
                                                    <div class="">
                                                        <p class="mb-0">Miễn phí</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div
                                                class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
                                                <h5 class="mb-0 ps-4 me-4">Thành tiền</h5>
                                                <p class="mb-0 pe-4" data-cart-total-price="${totalPrice}">
                                                    <fmt:formatNumber type="number" value="${totalPrice}" /> đ
                                                </p>
                                            </div>
                                            <form:form action="/confirm-checkout" method="post" modelAttribute="cart"
                                                class="text-center">
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                    value="${_csrf.token}" />
                                                <div style="display: none;">
                                                    <c:forEach var="cartDetail" items="${cart.cartDetails}"
                                                        varStatus="status">
                                                        <div class="mb-3">
                                                            <div class="form-group">
                                                                <label>Id:</label>
                                                                <form:input class="form-control" type="text"
                                                                    value="${cartDetail.id}"
                                                                    path="cartDetails[${status.index}].id" />
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Quantity:</label>
                                                                <form:input class="form-control" type="text"
                                                                    value="${cartDetail.quantity}"
                                                                    path="cartDetails[${status.index}].quantity" />
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                                <input type="hidden" id="buildPcData" name="buildPcData">
                                                <button
                                                    class="btn btn-primary px-4 py-3 text-light text-uppercase m-auto btn-unfocus">
                                                    Tiến Hành Thanh Toán
                                                </button>
                                            </form:form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Build PC End -->

                        <jsp:include page="../layout/footer.jsp" />

                        <!-- Back to Top -->
                        <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top">
                            <i class="fa fa-arrow-up"></i>
                        </a>

                        <!-- JavaScript Libraries -->
                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                        <script
                            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                        <script src="/client/lib/easing/easing.min.js"></script>
                        <script src="/client/lib/waypoints/waypoints.min.js"></script>
                        <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                        <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

                        <!-- Template Javascript -->
                        <script src="/client/js/main.js"></script>
                        <script src="/client/js/build-pc.js"></script>
                </body>

                </html>