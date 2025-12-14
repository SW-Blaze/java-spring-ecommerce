<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

                <div class="row" style="max-height: 60vh; overflow-y: auto">
                    <c:if test="${empty products}">
                        <div class="col-12 text-center p-5">
                            <h5 class="text-muted">Không tìm thấy linh kiện phù hợp với cấu hình hiện tại!</h5>
                            <p>Hãy thử chọn linh kiện khác.</p>
                        </div>
                    </c:if>

                    <div class="row">
                        <div class="col-12 col-md-2">
                            <div class="row g-4">
                                <div class="col-12">
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
                                <div class="col-12">
                                    <div class="mb-2"><b>Nhu cầu</b></div>

                                    <div class="form-check form-check-inline">
                                        <input type="checkbox" class="form-check-input" id="target-1" value="GAMING">
                                        <label for="target-1" class="form-check-label">Gaming</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input type="checkbox" class="form-check-input" id="target-2" value="VAN-PHONG">
                                        <label for="target-2" class="form-check-label">Văn phòng</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input type="checkbox" class="form-check-input" id="target-3" value="DO-HOA">
                                        <label for="target-3" class="form-check-label">Đồ hoạ</label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="mb-2"><b>Mức giá</b></div>

                                <div class="form-check form-check-inline">
                                    <input type="checkbox" class="form-check-input" id="price-1" value="DUOI-1O-TRIEU">
                                    <label for="price-1" class="form-check-label">Dưới 10 triệu</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input type="checkbox" class="form-check-input" id="price-2" value="TU-10-15-TRIEU">
                                    <label for="price-2" class="form-check-label">Từ 10 - 15 triệu</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input type="checkbox" class="form-check-input" id="price-3" value="TU-15-20-TRIEU">
                                    <label for="price-3" class="form-check-label">Từ 15 - 20 triệu</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input type="checkbox" class="form-check-input" id="price-4" value="TREN-20-TRIEU">
                                    <label for="price-4" class="form-check-label">Trên 20 triệu</label>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="mb-2"><b>Sắp xếp</b></div>

                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="exampleRadios"
                                        id="exampleRadios1" value="option1" checked>
                                    <label class="form-check-label" for="exampleRadios1">
                                        Giá tăng dần
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="exampleRadios"
                                        id="exampleRadios2" value="option2">
                                    <label class="form-check-label" for="exampleRadios2">
                                        Giá giảm dần
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-md-10 text-center">
                            <div class="row g-4 justify-content-center">
                                <c:forEach var="p" items="${products}">
                                    <div class="col-md-6 col-lg-4 col-xl-3">

                                        <!-- Card full height -->
                                        <div class="rounded position-relative fruite-item h-100 d-flex flex-column">

                                            <!-- Image -->
                                            <div class="fruite-img">
                                                <a href="/product/${p.id}">
                                                    <img src="/images/product/${p.image}"
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
                                                    <a href="/product/${p.id}" class="text-dark text-decoration-none">
                                                        ${p.name}
                                                    </a>
                                                </h4>

                                                <!-- Short desc -->
                                                <p style="font-size: 13px; min-height:40px;">
                                                    ${p.shortDesc}
                                                </p>

                                                <!-- Price + button -->
                                                <div class="mt-auto">
                                                    <p class="text-dark fw-bold mb-3 text-center"
                                                        style="font-size: 15px;">
                                                        <fmt:formatNumber type="number" value="${p.price}" />
                                                        đ
                                                    </p>

                                                    <form method="post" action="/add-product-to-build/${p.id}">
                                                        <input type="hidden" name="${_csrf.parameterName}"
                                                            value="${_csrf.token}">
                                                        <button
                                                            class="btn border border-primary px-3 text-primary w-100 rounded-pill">
                                                            Chọn
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
                            </div>
                        </div>
                    </div>
                </div>