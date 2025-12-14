(function ($) {
    "use strict";

    // Spinner
    var spinner = function () {
        setTimeout(function () {
            if ($('#spinner').length > 0) {
                $('#spinner').removeClass('show');
            }
        }, 1);
    };
    spinner(0);


    // Fixed Navbar
    $(window).scroll(function () {
        if ($(window).width() < 992) {
            if ($(this).scrollTop() > 55) {
                $('.fixed-top').addClass('shadow');
            } else {
                $('.fixed-top').removeClass('shadow');
            }
        } else {
            if ($(this).scrollTop() > 55) {
                $('.fixed-top').addClass('shadow').css('top', 0);
            } else {
                $('.fixed-top').removeClass('shadow').css('top', 0);
            }
        }
    });


    // Back to top button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $('.back-to-top').fadeIn('slow');
        } else {
            $('.back-to-top').fadeOut('slow');
        }
    });
    $('.back-to-top').click(function () {
        $('html, body').animate({ scrollTop: 0 }, 1500, 'easeInOutExpo');
        return false;
    });


    // Testimonial carousel
    $(".testimonial-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 2000,
        center: false,
        dots: true,
        loop: true,
        margin: 25,
        nav: true,
        navText: [
            '<i class="bi bi-arrow-left"></i>',
            '<i class="bi bi-arrow-right"></i>'
        ],
        responsiveClass: true,
        responsive: {
            0: {
                items: 1
            },
            576: {
                items: 1
            },
            768: {
                items: 1
            },
            992: {
                items: 2
            },
            1200: {
                items: 2
            }
        }
    });


    // vegetable carousel
    $(".vegetable-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 1500,
        center: false,
        dots: true,
        loop: true,
        margin: 25,
        nav: true,
        navText: [
            '<i class="bi bi-arrow-left"></i>',
            '<i class="bi bi-arrow-right"></i>'
        ],
        responsiveClass: true,
        responsive: {
            0: {
                items: 1
            },
            576: {
                items: 1
            },
            768: {
                items: 2
            },
            992: {
                items: 3
            },
            1200: {
                items: 4
            }
        }
    });


    // Modal Video
    $(document).ready(function () {
        var $videoSrc;
        $('.btn-play').click(function () {
            $videoSrc = $(this).data("src");
        });
        console.log($videoSrc);

        $('#videoModal').on('shown.bs.modal', function (e) {
            $("#video").attr('src', $videoSrc + "?autoplay=1&amp;modestbranding=1&amp;showinfo=0");
        })

        $('#videoModal').on('hide.bs.modal', function (e) {
            $("#video").attr('src', $videoSrc);
        })

        // Add active class to header
        const navElement = $("#navbarCollapse");
        const currentUrl = window.location.pathname;
        navElement.find('a.nav-link').each(function () {
            const link = $(this); // Get the current link in the loop
            const href = link.attr('href');

            if (href === currentUrl) {
                link.addClass('active');
            } else {
                link.removeClass('active');
            }
        });
    });



    // Product Quantity
    // $('.quantity button').on('click', function () {
    //     var button = $(this);
    //     var oldValue = button.parent().parent().find('input').val();
    //     if (button.hasClass('btn-plus')) {
    //         var newVal = parseFloat(oldValue) + 1;
    //     } else {
    //         if (oldValue > 0) {
    //             var newVal = parseFloat(oldValue) - 1;
    //         } else {
    //             newVal = 0;
    //         }
    //     }
    //     button.parent().parent().find('input').val(newVal);
    // });

    $('.quantity button').on('click', function () {
        let change = 0;

        var button = $(this);
        var oldValue = button.parent().parent().find('input').val();
        if (button.hasClass('btn-plus')) {
            var newVal = parseFloat(oldValue) + 1;
            change = 1;
        } else {
            if (oldValue > 1) {
                var newVal = parseFloat(oldValue) - 1;
                change = -1;
            } else {
                newVal = 1;
            }
        }
        const input = button.parent().parent().find('input').val(newVal);
        input.val(newVal);

        // Set form index
        const index = input.attr("data-cart-detail-index")
        const el = document.getElementById(`cartDetails${index}.quantity`);
        $(el).val(newVal);

        // Get price
        const price = input.attr("data-cart-detail-price");
        const id = input.attr("data-cart-detail-id");

        const priceElement = $(`p[data-cart-detail-id='${id}']`);
        if (priceElement) {
            const newPrice = +price * newVal;
            priceElement.text(formatCurrency(newPrice.toFixed(2)) + " đ");
        }

        // Update total cart price
        const totalPriceElement = $(`p[data-cart-total-price]`);

        if (totalPriceElement && totalPriceElement.length) {
            const currentTotal = totalPriceElement.first().attr("data-cart-total-price");
            let newTotal = +currentTotal;
            if (change === 0) {
                newTotal = +currentTotal;
            } else {
                newTotal = change * (+price) + +currentTotal;
            }

            // Reset change
            change = 0;

            // Update
            totalPriceElement?.each(function (index, element) {
                // Update text
                $(totalPriceElement[index]).text(formatCurrency(newTotal.toFixed(2)) + " đ");

                // Update data-attribute
                $(totalPriceElement[index]).attr("data-cart-total-price", newTotal);
            });
        }
    });

    function formatCurrency(value) {
        // Use the 'vi-VN' locate to format the number according to Vietnamese currency form
        // and 'VND' as the currency type for Vietnamese đồng
        const formatter = new Intl.NumberFormat('vi-VN', {
            style: 'decimal',
            minimumFractionDigits: 0, // No decimal for whole numbers
        });

        let formatted = formatter.format(value);
        // Replace dots with commas for thousands separator
        formatted = formatted.replace(/\./g, ',');
        return formatted;
    }

})(jQuery);

// Biến toàn cục lưu trạng thái các linh kiện đã chọn
let currentBuild = {
    cpuId: null,
    mainboardId: null,
    ramId: null,
    hddId: null,
    ssdId: null,
    vgaId: null,
    psuId: null,
    caseId: null,
};

function loadFragment(categoryId) {
    console.log("Đang tải danh mục ID:", categoryId); // Debug

    // Hiển thị Modal và loading
    $('#productModal').modal('show');
    $('#modal-product-list').html('<div class="text-center p-5"><div class="spinner-border text-primary"></div><p>Đang tải dữ liệu...</p></div>');

    // Chuẩn bị dữ liệu lọc tương thích
    let baseId = null;
    let criteria = null;

    // RULE 1: Nếu chọn Mainboard (11) -> Lọc theo CPU (7)
    if (categoryId === 11 && currentBuild.cpuId) {
        baseId = currentBuild.cpuId;
        criteria = "Socket";
    }

    // RULE 2: Nếu chọn RAM (9) -> Lọc theo Mainboard (11)
    else if (categoryId === 9 && currentBuild.mainboardId) {
        baseId = currentBuild.mainboardId;
        criteria = "Bus RAM hỗ trợ"; // Hoặc "Loại RAM hỗ trợ" tùy DB
    }

    // Gọi AJAX về Server
    $.ajax({
        url: "/product-list",
        type: "GET",
        data: {
            categoryId: categoryId,
            baseProductId: baseId,
            criteriaName: criteria
        },
        success: function (responseHtml) {
            // Nhét HTML server trả về vào Modal
            $('#modal-product-list').html(responseHtml);
        },
        error: function (xhr) {
            console.log("Lỗi:", xhr);
            $('#modal-product-list').html('<div class="alert alert-danger">Lỗi tải dữ liệu: ' + xhr.status + '</div>');
        }
    });
}

// 3. Hàm xử lý trung gian để tránh lỗi nháy đơn/kép (Gọi từ nút Chọn trong Modal)
function handleSelect(buttonElement) {
    let btn = $(buttonElement);

    // Lấy dữ liệu từ data-attributes
    let id = btn.attr('data-id');
    let name = btn.attr('data-name');
    let image = btn.attr('data-image');
    let price = btn.attr('data-price'); // Có thể là chuỗi hoặc số
    let catId = btn.data('catid');      // .data() tự ép về số

    // Gọi hàm cập nhật giao diện
    selectProduct(id, name, image, price, catId);
}

// 4. Hàm cập nhật giao diện sau khi chọn
function selectProduct(id, name, image, price, categoryId) {
    // Lưu ID vào biến toàn cục
    if (categoryId === 7) currentBuild.cpuId = id;
    if (categoryId === 11) currentBuild.mainboardId = id;
    if (categoryId === 9) currentBuild.ramId = id;

    // Cập nhật HTML (Ảnh, Tên, Giá)
    $(`#item-img-${categoryId}`).attr('src', `/images/product/${image}`);
    $(`#item-name-${categoryId}`).text(name).removeClass('text-muted');

    // Format giá tiền Việt Nam
    let formattedPrice = new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(price);
    $(`#item-price-${categoryId}`).text(formattedPrice);

    // Đổi nút "Chọn" thành "Đổi khác"
    $(`#btn-select-${categoryId}`).text('Đổi khác').removeClass('btn-primary').addClass('btn-outline-primary');

    // Đóng Modal
    $('#productModal').modal('hide');

    // (Tùy chọn) Reset linh kiện phụ thuộc
    if (categoryId === 7) {
        // Nếu đổi CPU -> Reset Mainboard và RAM để đảm bảo tương thích
        resetSlot(11);
        resetSlot(9);
    }
}

// 5. Hàm Reset 1 slot về trạng thái ban đầu
function resetSlot(categoryId) {
    if (categoryId === 11) currentBuild.mainboardId = null;
    if (categoryId === 9) currentBuild.ramId = null;

    $(`#item-img-${categoryId}`).attr('src', 'https://dummyimage.com/100x100/dee2e6/6c757d.jpg');
    $(`#item-name-${categoryId}`).text('Chưa chọn linh kiện').addClass('text-muted');
    $(`#item-price-${categoryId}`).text('0 đ');
    $(`#btn-select-${categoryId}`).text('Chọn linh kiện').addClass('btn-primary').removeClass('btn-outline-primary');
}
