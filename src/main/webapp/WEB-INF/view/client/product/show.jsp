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

                <!-- Container Start-->
                <div class="container-fluid fruite py-5 mt-5">
                    <div class="container py-5">
                        <div class="mb-3">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Tất cả sản phẩm</li>
                                </ol>
                            </nav>
                        </div>
                        <h1 class="mb-4">Tất cả sản phẩm</h1>
                        <div class="row g-4">
                            <div class="col-12 col-md-2">
                                <div class="row g-4">
                                    <div class="col-12" id="brandFilter">
                                        <div class="mb-2"><b>Thương hiệu</b></div>

                                        <div class="form-check form-check-inline">
                                            <input type="checkbox" class="form-check-input" id="brand-1" value="APPLE">
                                            <label for="brand-1" class="form-check-label">Apple</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input type="checkbox" class="form-check-input" id="brand-2" value="ASUS">
                                            <label for="brand-2" class="form-check-label">Asus</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input type="checkbox" class="form-check-input" id="brand-3" value="ACER">
                                            <label for="brand-3" class="form-check-label">Acer</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input type="checkbox" class="form-check-input" id="brand-4" value="DELL">
                                            <label for="brand-4" class="form-check-label">Dell</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input type="checkbox" class="form-check-input" id="brand-5" value="LENOVO">
                                            <label for="brand-5" class="form-check-label">Lenovo</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input type="checkbox" class="form-check-input" id="brand-6" value="LG">
                                            <label for="brand-6" class="form-check-label">LG</label>
                                        </div>

                                    </div>
                                    <div class="col-12" id="targetFilter">
                                        <div class="mb-2"><b>Nhu cầu</b></div>

                                        <div class="form-check form-check-inline">
                                            <input type="checkbox" class="form-check-input" id="target-1"
                                                value="GAMING">
                                            <label for="target-1" class="form-check-label">Gaming</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input type="checkbox" class="form-check-input" id="target-2"
                                                value="VAN-PHONG">
                                            <label for="target-2" class="form-check-label">Văn phòng</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input type="checkbox" class="form-check-input" id="target-3"
                                                value="DO-HOA">
                                            <label for="target-3" class="form-check-label">Đồ hoạ</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12" id="priceFilter">
                                    <div class="mb-2"><b>Mức giá</b></div>

                                    <div class="form-check form-check-inline">
                                        <input type="checkbox" class="form-check-input" id="price-1"
                                            value="DUOI-1O-TRIEU">
                                        <label for="price-1" class="form-check-label">Dưới 10 triệu</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input type="checkbox" class="form-check-input" id="price-2"
                                            value="TU-10-15-TRIEU">
                                        <label for="price-2" class="form-check-label">Từ 10 - 15 triệu</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input type="checkbox" class="form-check-input" id="price-3"
                                            value="TU-15-20-TRIEU">
                                        <label for="price-3" class="form-check-label">Từ 15 - 20 triệu</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input type="checkbox" class="form-check-input" id="price-4"
                                            value="TREN-20-TRIEU">
                                        <label for="price-4" class="form-check-label">Trên 20 triệu</label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="mb-2"><b>Sắp xếp</b></div>

                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="radio-sort" id="sort-1"
                                            value="gia-tang-dan">
                                        <label class="form-check-label" for="sort-1">
                                            Giá tăng dần
                                        </label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="radio-sort" id="sort-2"
                                            value="gia-giam-dan">
                                        <label class="form-check-label" for="sort-2">
                                            Giá giảm dần
                                        </label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="radio-sort" id="sort-3"
                                            value="gia-nothing" checked>
                                        <label class="form-check-label" for="sort-3">
                                            Không sắp xếp
                                        </label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <button class="btn border-secondary rounded-pill" id="btnFilter">
                                        Lọc sản phẩm
                                    </button>
                                </div>
                            </div>
                            <div class="col-12 col-md-10 text-center">
                                <div class="row g-4 justify-content-center">
                                    <c:forEach var="product" items="${products}">
                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                            <!-- Card full height -->
                                            <div class="rounded position-relative fruite-item h-100 d-flex flex-column">
                                                <!-- Image -->
                                                <div class="fruite-img">
                                                    <a href="/product/${product.id}">
                                                        <img src="/images/product/${product.image}"
                                                            class="img-fluid w-100 rounded-top"
                                                            style="height:220px; object-fit:cover;" alt="">
                                                    </a>
                                                </div>

                                                <!-- Badge -->
                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                    style="top: 10px; left: 10px;">Hot</div>

                                                <!-- Content -->
                                                <div
                                                    class="p-4 border border-secondary border-top-0 rounded-bottom d-flex flex-column flex-grow-1">

                                                    <!-- Name -->
                                                    <h4 class="flex-grow-0" style="font-size: 15px; min-height:45px;">
                                                        <a href="/product/${product.id}"
                                                            class="text-dark text-decoration-none">
                                                            ${product.name}
                                                        </a>
                                                    </h4>

                                                    <!-- Short desc -->
                                                    <p style="font-size: 13px; min-height:40px;">
                                                        ${product.shortDesc}
                                                    </p>

                                                    <!-- Price + button -->
                                                    <div class="mt-auto">
                                                        <p class="text-dark fw-bold mb-3 text-center"
                                                            style="font-size: 15px;">
                                                            <fmt:formatNumber type="number" value="${product.price}" />
                                                            đ
                                                        </p>

                                                        <form method="post" action="/add-product-to-cart/${product.id}">
                                                            <input type="hidden" name="${_csrf.parameterName}"
                                                                value="${_csrf.token}">
                                                            <button
                                                                class="btn border border-primary px-3 text-primary w-100 rounded-pill">
                                                                Thêm vào giỏ
                                                            </button>
                                                        </form>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </c:forEach>
                                    <c:if test="${param.error != null}">
                                        <nav aria-label="Page navigation example" class="col-12">
                                            <ul class="pagination d-flex justify-content-center">
                                                <li class="page-item">
                                                    <a class="${1 eq currentPage ? 'disabled page-link' : 'page-link'}"
                                                        href="/products?page=${currentPage - 1}" aria-label="Previous">
                                                        <span aria-hidden="true">&laquo;</span>
                                                    </a>
                                                </li>
                                                <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                                                    <li class="page-item">
                                                        <a class="${(loop.index) eq currentPage ? 'active page-link' : 'page-link'}"
                                                            href="/products?page=${loop.index}">
                                                            ${loop.index}
                                                        </a>
                                                    </li>
                                                </c:forEach>
                                                <li class="page-item">
                                                    <a class="${totalPages eq currentPage ? 'disabled page-link' : 'page-link'}"
                                                        href="/products?page=${currentPage + 1}" aria-label="Next">
                                                        <span aria-hidden="true">&raquo;</span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </nav>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
                </div>
                </div>
                <!-- Container End-->

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