// 1. Kiểm tra biến toàn cục từ JSP
if (typeof currentBuild === 'undefined') {
    var currentBuild = {
        cpuId: null, mainboardId: null, ramId: null, hddId: null,
        ssdId: null, vgaId: null, psuId: null, caseId: null
    };
}

let selectedProducts = {};
let currentCategoryId = null;

function loadFragment(categoryId) {
    console.log("Đang tải danh mục ID: ", categoryId); // Debug

    currentCategoryId = categoryId;

    // Hiển thị Modal và loading
    $('#productModal').modal('show');

    // Chuẩn bị dữ liệu lọc tương thích
    let baseProductId = null;
    let criteria = null;

    // Nếu chọn mainboard → lấy CPU
    if (categoryId === 11) {
        baseProductId = currentBuild.cpuId; // CPU
    }

    // Nếu chọn RAM → lấy mainboard
    if (categoryId === 9) {
        baseProductId = currentBuild.mainboardId; // Mainboard
    }

    // Gọi AJAX về Server
    $.ajax({
        url: "/product-list",
        type: "GET",
        data: {
            categoryId: categoryId,
            baseProductId: baseProductId,
            criteriaName: criteria
        },
        success: function (responseHtml) {
            // Nhét HTML server trả về vào Modal
            $('#modal-product-list').html(responseHtml);
        },
        error: function (xhr) {
            console.log("Lỗi:", xhr);
            $('#modal-product-list')
                .html('<div class="alert alert-danger">Lỗi tải dữ liệu: ' + xhr.status + '</div>')
                .load(url);
        }
    });
}

$(document).on('click', '.btn-select-product', function () {
    const product = {
        id: $(this).data('id'),
        name: $(this).data('name'),
        price: $(this).data('price'),
        image: $(this).data('image')
    };

    fillSelectedProduct(currentCategoryId, product);

    $('#productModal').modal('hide');
});

// Hàm fill dữ liệu
function fillSelectedProduct(categoryId, product) {

    selectedProducts[categoryId] = product.id;

    $('#image-' + categoryId).attr(
        'src',
        '/images/product/' + product.image
    );

    $('#name-' + categoryId).text(product.name);

    $('#price-' + categoryId).text(
        new Intl.NumberFormat('vi-VN').format(product.price) + ' đ'
    );
}

// 3. Hàm xử lý trung gian để tránh lỗi nháy đơn/kép (Gọi từ nút Chọn trong Modal)
function handleSelect(buttonElement) {
    let btn = $(buttonElement);

    // Lấy dữ liệu từ data-attributes
    let id = btn.data('id'); // Lấy data-id
    let catId = btn.data('catid'); // Lấy data-catid
    let name = btn.attr('data-name');
    let image = btn.attr('data-image');
    let price = btn.attr('data-price'); // Có thể là chuỗi hoặc số

    // Gọi hàm cập nhật giao diện
    selectProduct(id, name, image, price, catId);
}

// 4. Hàm cập nhật giao diện VÀ lưu vào Server
function selectProduct(id, name, image, price, categoryId) {

    // --- CẬP NHẬT BIẾN TOÀN CỤC ---
    if (categoryId === 7) currentBuild.cpuId = id;
    if (categoryId === 11) currentBuild.mainboardId = id;
    if (categoryId === 9) currentBuild.ramId = id;
    if (categoryId === 20) currentBuild.hddId = id;
    if (categoryId === 6) currentBuild.ssdId = id;
    if (categoryId === 12) currentBuild.vgaId = id;
    if (categoryId === 10) currentBuild.psuId = id;
    if (categoryId === 8) currentBuild.caseId = id;

    // --- CẬP NHẬT GIAO DIỆN ---

    // 1. Sửa đường dẫn ảnh cho khớp với JSP (QUAN TRỌNG)
    $(`#item-img-${categoryId}`).attr('src', `/images/product/${image}`);
    $(`#item-name-${categoryId}`).text(name).removeClass('text-muted');

    // 2. Format giá tiền (Bỏ số thập phân)
    // 'maximumFractionDigits: 0' là tham số để bỏ .00
    let formattedPrice = new Intl.NumberFormat('vi-VN', {
        style: 'currency',
        currency: 'VND',
        maximumFractionDigits: 0
    }).format(price);

    $(`#item-price-${categoryId}`).text(formattedPrice);

    // Cập nhật giá vào input ẩn
    $(`#hidden-price-${categoryId}`).val(price);

    $(`#btn-select-${categoryId}`).text('Đổi');
    $('#productModal').modal('hide');

    // Reset các slot phụ thuộc (CPU đổi -> Main, Ram đổi)
    // Trường hợp 1: Nếu đổi CPU (ID 7) -> Reset Mainboard (11) và RAM (9)
    if (categoryId === 7) {
        resetSlot(11);
        resetSlot(9);
    }

    // Trường hợp 2: Nếu đổi Mainboard (ID 11) -> Reset RAM (9)
    // (Vì Mainboard quyết định khe RAM là DDR4 hay DDR5)
    if (categoryId === 11) {
        resetSlot(9);
    }

    // Tính tổng tiền ngay lập tức
    calculateTotal();

    // --- GỌI AJAX ---
    let csrfToken = $('input[name="_csrf"]').val();

    $.ajax({
        url: "/build-pc/select",
        type: "POST",
        data: {
            categoryId: categoryId,
            productId: id,
            _csrf: csrfToken
        },
        success: function (res) {
            console.log("Session updated: " + res);
            calculateTotal(); // Tính lại tổng tiền

        },
        error: function (e) { console.log("Lỗi session"); }
    });
}

// 5. Hàm Reset 1 slot về trạng thái ban đầu
function resetSlot(categoryId) {
    // Reset biến logic
    if (categoryId === 11) currentBuild.mainboardId = null;
    if (categoryId === 9) currentBuild.ramId = null;

    // Reset giao diện
    let placeholderImg = "cpu.png";
    if (categoryId === 11) placeholderImg = "mainboard.82595f5e.png";
    else if (categoryId === 9) placeholderImg = "ram.png";
    else placeholderImg = "cpu.png"; // Fallback

    $(`#image-${categoryId}`)
        .attr('src', `/client/img/build_pc_images/${placeholderImg}`);
    $(`#name-${categoryId}`)
        .text('Vui lòng chọn linh kiện')
        .addClass('text-muted');
    $(`#price-${categoryId}`)
        .text('0 đ');

    // QUAN TRỌNG: Phải set giá trị ẩn về 0
    $(`#hidden-price-${categoryId}`).val(0);

    $(`#btn-select-${categoryId}`)
        .text('Chọn')
        .removeClass('btn-outline-primary')
        .addClass('btn-primary');


    // Tính lại tổng tiền ngay sau khi reset
    calculateTotal();
}

// 6. Hàm tính tổng tiền và cập nhật input submit
function calculateTotal() {
    let total = 0;
    // Mảng chứa ID các sản phẩm đã chọn để gửi đi thanh toán
    let selectedItems = [];

    // Danh sách Category ID cần duyệt
    let categoryIds = [7, 11, 9, 20, 6, 12, 10, 8];

    categoryIds.forEach(catId => {
        // 1. Tính tổng tiền
        let priceVal = $(`#hidden-price-${catId}`).val();
        if (priceVal && !isNaN(priceVal)) {
            total += parseFloat(priceVal);
        }

        // 2. Gom ID sản phẩm (để gửi form thanh toán)
        // Cần đảm bảo bạn có lưu product ID đâu đó.
        // Hiện tại code JS của bạn lưu trong currentBuild global variable
        // Mapping lại theo tên biến trong currentBuild
        let prodId = null;
        if (catId === 7) prodId = currentBuild.cpuId;
        else if (catId === 11) prodId = currentBuild.mainboardId;
        else if (catId === 9) prodId = currentBuild.ramId;
        else if (catId === 20) prodId = currentBuild.hddId;
        else if (catId === 6) prodId = currentBuild.ssdId;
        else if (catId === 12) prodId = currentBuild.vgaId;
        else if (catId === 10) prodId = currentBuild.psuId;
        else if (catId === 8) prodId = currentBuild.caseId;

        if (prodId && prodId !== 'null') {
            selectedItems.push({
                categoryId: catId,
                productId: prodId
            });
        }
    });

    // 3. Hiển thị tổng tiền ra giao diện (Checkout box)
    let totalString = new Intl.NumberFormat('vi-VN', {
        style: 'currency',
        currency: 'VND',
        maximumFractionDigits: 0
    }).format(total);

    $('[data-cart-total-price]').text(totalString);

    // 4. Cập nhật vào Input ẩn để Submit Form (Quan trọng cho bước Thanh toán)
    // Chuyển object thành chuỗi JSON để controller xử lý
    $('#buildPcData').val(JSON.stringify(selectedItems));
}

$(document).ready(function () {
    calculateTotal();
});

// Reset tất cả sản phẩm đã chọn
function resetBuildPc() {

    if (!confirm("Bạn có chắc muốn tạo lại cấu hình không?")) return;

    // 1. Reset biến global
    currentBuild = {
        cpuId: null,
        mainboardId: null,
        ramId: null,
        hddId: null,
        ssdId: null,
        vgaId: null,
        psuId: null,
        caseId: null
    };

    // 2. Reset toàn bộ slot UI
    const allCategories = [7, 11, 9, 20, 6, 12, 10, 8];
    allCategories.forEach(catId => resetSlot(catId));

    // 3. Reset tổng tiền
    calculateTotal();

    // 4. GỌI SERVER RESET SESSION
    $.ajax({
        url: "/build-pc/reset",
        type: "POST",
        data: {
            _csrf: $('input[name="_csrf"]').val()
        },
        success: function () {
            console.log("Build PC session reset");
        },
        error: function () {
            console.error("Reset session failed");
        }
    });
}

