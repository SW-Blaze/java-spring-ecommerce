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

let selectedProducts = {};

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
        baseProductId = selectedProducts[7] || null; // CPU
    }

    // Nếu chọn RAM → lấy mainboard
    if (categoryId === 9) {
        baseProductId = selectedProducts[11] || null; // Mainboard
    }

    $('#productModal').modal('show');

    let url = `/product-list?categoryId=${categoryId}`;

    if (baseProductId) {
        url += `&baseProductId=${baseProductId}`;
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

let buildCart = {
    items: {}, // key = categoryId
    total: 0
};

function selectProduct(id, name, image, price, categoryId) {

    // 1️⃣ Nếu slot đã có sản phẩm → trừ giá cũ
    if (buildCart.items[categoryId]) {
        buildCart.total -= buildCart.items[categoryId].price;
    }

    // 2️⃣ Lưu sản phẩm mới
    buildCart.items[categoryId] = {
        productId: id,
        price: Number(price),
        quantity: 1
    };

    // 3️⃣ Cộng tổng
    buildCart.total += Number(price);

    // 4️⃣ Update UI
    $(`#image-${categoryId}`).attr('src', `/images/product/${image}`);
    $(`#name-${categoryId}`).text(name);
    $(`#price-${categoryId}`).text(
        new Intl.NumberFormat('vi-VN').format(price) + ' đ'
    );

    // 5️⃣ Update nút
    $(`#btn-select-${categoryId}`)
        .text('Đổi khác')
        .removeClass('btn-primary')
        .addClass('btn-outline-primary');

    // 6️⃣ Update tổng tiền
    updateTotalPrice();

    // 7️⃣ Đóng modal
    $('#productModal').modal('hide');

    // 8️⃣ Reset phụ thuộc
    if (categoryId === 7) {
        resetSlot(11);
        resetSlot(9);
    }
}

function resetSlot(categoryId) {
    if (buildCart.items[categoryId]) {
        buildCart.total -= buildCart.items[categoryId].price;
        delete buildCart.items[categoryId];
        updateTotalPrice();
    }

    $(`#image-${categoryId}`).attr('src', 'https://dummyimage.com/100x100/dee2e6/6c757d.jpg');
    $(`#name-${categoryId}`).text('Vui lòng chọn linh kiện');
    $(`#price-${categoryId}`).text('');
    $(`#btn-select-${categoryId}`)
        .text('Chọn')
        .addClass('btn-primary')
        .removeClass('btn-outline-primary');
}

function updateTotalPrice() {
    const formatted = new Intl.NumberFormat('vi-VN').format(buildCart.total) + ' đ';

    $('[data-cart-total-price]').each(function () {
        $(this)
            .text(formatted)
            .attr('data-cart-total-price', buildCart.total);
    });
}

$('form').on('submit', function () {
    let payload = [];

    Object.values(buildCart.items).forEach(item => {
        payload.push({
            productId: item.productId,
            quantity: 1
        });
    });

    $('#buildPcData').val(JSON.stringify(payload));
});