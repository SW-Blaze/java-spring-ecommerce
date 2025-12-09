<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!-- Navbar start -->
        <div class="container-fluid fixed-top bg-white pb-3 shadow">
            <div class="container px-0">
                <nav class="navbar navbar-light navbar-expand-xl row">
                    <!-- LOGO -->
                    <a href="/" class="navbar-brand col">
                        <h1 class="text-primary display-6">Zeryf</h1>
                    </a>
                    <!-- TOGGLER MOBILE -->
                    <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarCollapse">
                        <span class="fa fa-bars text-primary"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-between mx-5" id="navbarCollapse">
                        <!-- SEARCH BAR -->
                        <input class="form-control border-1 border-dark py-2 px-4 rounded col"
                            placeholder="Bạn muốn mua gì hôm nay...">
                        <!-- RIGHT ICONS (USER + BELL + CART) -->
                        <div class="d-flex m-3 me-0 col">
                            <!-- Khi chưa đăng nhập -->
                            <c:if test="${empty pageContext.request.userPrincipal}">
                                <!-- USER -->
                                <div class="dropdown my-auto mx-4">
                                    <a href="/login" class="dropdown d-flex align-items-center" role="button">
                                        <i class="fa-regular fa-circle-user fa-2x"></i>
                                        <span class="d-flex flex-column fa-1x">
                                            <span class="d-flex flex-column fa-1x px-2">Đăng nhập</span>
                                            <span class="d-flex flex-column fa-1x px-2">Đăng ký</span>
                                        </span>
                                    </a>
                                </div>
                                <!-- CART -->
                                <a href="/cart" class="d-flex align-items-center position-relative me-4 my-auto">
                                    <i class="fa-solid fa-cart-shopping fa-2x"></i>
                                    <div>
                                        <span class="d-flex flex-column fa-1x px-2">
                                            Giỏ hàng của bạn
                                        </span>
                                        <span class="d-flex flex-column fa-1x px-2">
                                            (${sessionScope.sum}) sản phẩm
                                        </span>
                                    </div>
                                </a>
                            </c:if>
                            <!-- Khi đã đăng nhập -->
                            <c:if test="${not empty pageContext.request.userPrincipal}">
                                <!-- USER DROPDOWN -->
                                <div class="dropdown my-auto mx-4">
                                    <a href="#" class="dropdown d-flex align-items-center" role="button"
                                        id="dropdownMenuLink" aria-expanded="false">
                                        <i class="fa-regular fa-circle-user fa-2x"></i>
                                        <span class="d-flex flex-column fa-1x">
                                            <span class="d-flex flex-column fa-1x px-2">Xin chào,</span>
                                            <span class="d-flex flex-column fa-1x px-2">${sessionScope.fullName}</span>
                                        </span>
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-end p-4" aria-labelledby="dropdownMenuLink">
                                        <li class="align-items-center row" style="min-width: 300px;">
                                            <div class="col">
                                                <img style="width: 50px; height: 50px; border-radius: 50%; overflow: hidden;"
                                                    src="/images/avatar/${sessionScope.avatar}" />
                                            </div>
                                            <div class="text-center my-3 col">
                                                <c:out value="${sessionScope.fullName}" />
                                            </div>
                                        </li>

                                        <li>
                                            <a class="dropdown-item text-low-dark" href="#">
                                                Thông tin tài khoản
                                            </a>
                                        </li>

                                        <li>
                                            <a class="dropdown-item text-low-dark" href="/order-history">
                                                Quản lý đơn hàng
                                            </a>
                                        </li>
                                        <li>
                                            <hr class="dropdown-divider">
                                        </li>
                                        <li>
                                            <form method="post" action="/logout">
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                    value="${_csrf.token}" />
                                                <button class="dropdown-item btn btn-primary text-center text-low-dark">
                                                    Đăng xuất
                                                </button>
                                            </form>
                                        </li>
                                    </ul>
                                </div>
                                <!-- CART -->
                                <a href="/cart" class="d-flex align-items-center position-relative me-4 my-auto">
                                    <i class="fa-solid fa-cart-shopping fa-2x"></i>
                                    <div>
                                        <span class="d-flex flex-column fa-1x px-2">
                                            Giỏ hàng của bạn
                                        </span>
                                        <span class="d-flex flex-column fa-1x px-2">
                                            (${sessionScope.sum}) sản phẩm
                                        </span>
                                    </div>
                                </a>
                            </c:if>

                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Navbar End -->