var app = angular.module('AppBanHang', []);
app.controller("DatHangCtrl",function ($scope,$http)

{  
    // $scope.MaSanPham = JSON.parse(localStorage.getItem('carts'));

//     $scope.Cart = {};

//     $scope.getProductByID = function () {
//         $http.get("https://localhost:44385/api/SanPham/get-by-id/" + $scope.MaSanPham).then(
//             function (response) {
//                 $scope.Cart = response.data;
//             })
//         }
//     $scope.getProductByID();  

function GetProduct(){
    var listProductLocal = localStorage.getItem('listProduct')? JSON.parse(localStorage.getItem('listProduct')):[]
    var Element = document.querySelector('.mathang')
    var content = ''
    var html = listProductLocal.map(function(value){
        return `
        <img src="${value.img}" alt="">
            <div class="tttritiet">
                <a style="color: #bd2026;" href="">${value.name}</a>
                <p style="padding: 10px 0px 10px;">
                Số lượng : ${value.amount}<br>
                Giá :
                <span>${value.price}đ</span>
                </p>
            </div>`
    })
    content+= html
    Element.innerHTML = content
    tongtien()
    tamtinh()
    var CTSP = listProductLocal.map(function(item){
        return {
            Masp : item.masp,
            TenSp : item.name,
            Gia : item.price,
            SoL : item.amount,
            status : 1
        }
    })
    console.log(CTSP)
    return CTSP;
}
GetProduct()
function tongtien(){
    var sum = 0
    var VAT = 0.1
    var listProductLocal = localStorage.getItem('listProduct')? JSON.parse(localStorage.getItem('listProduct')):[]
    listProductLocal.map(function(item){
        var soluong = item.amount
        var gia = item.price
        sum +=  (soluong*gia) - (soluong*gia*VAT) 
    })
    var tongcong = document.querySelector(".tongcong strong")
    tongcong.innerHTML = sum
    localStorage.setItem('listProduct',JSON.stringify(listProductLocal))
}
function tamtinh(){
    var sum = 0
    var listProductLocal = localStorage.getItem('listProduct')? JSON.parse(localStorage.getItem('listProduct')):[]
    listProductLocal.map(function(item){
        var soluong = item.amount
        var gia = item.price
        sum += soluong*gia
    })
    var tongcong = document.querySelector(".tamtinh strong")
    tongcong.innerHTML = sum
    localStorage.setItem('listProduct',JSON.stringify(listProductLocal))
}

$scope.DatHang = function () {
    var CTSP = GetProduct();
    
    if (CTSP.length > 0) {
        var list_json_chitiethoadon = [];

        // Lặp qua toàn bộ mảng CTSP và thêm thông tin của từng sản phẩm vào list_json_chitiethoadon
        CTSP.forEach(function (product) {
            list_json_chitiethoadon.push({
                DonGia: product.Gia,
                Soluong: product.SoL,
                MaSanPham: product.Masp
            });
        });

        var HoaDonData = {
            TenKH: $scope.TenKH,
            NgayTao: new Date(),
            NgayDuyet: new Date(),
            SDT: $scope.SDT,
            TrangThai: true,
            Diachi: $scope.DiaChi,
            Email: $scope.Email,
            Diachigiaohang: $scope.Diachigiaohang,
            list_json_chitiethoadon: list_json_chitiethoadon
        };

        $http({
            method: 'POST',
            data: HoaDonData,
            url: current_url + '/api/HoaDon/create-item',
            headers: { 'Content-type': 'application/json' }
        }).then(function (response) {
            alert('Cập nhật hóa đơn thành công!');
        }).catch(function (error) {
            console.error('Lỗi:', error);
        });
    } else {
        console.error('Không có sản phẩm trong giỏ hàng.');
    }
};













// $scope.DatHang = function () {
//     var CTSP = GetProduct();
//     var firstProduct = CTSP[0]; // Lấy phần tử đầu tiên từ mảng CTSP (nếu có)
    
//     if (firstProduct) {
//         var HoaDonData = {
//             TenKH: $scope.TenKH,
//             NgayTao: new Date(),
//             NgayDuyet: new Date(),
//             SDT: $scope.SDT,
//             TrangThai: true,
//             Diachi: $scope.DiaChi,
//             Email: $scope.Email,
//             Diachigiaohang: $scope.Diachigiaohang,
//             list_json_chitiethoadon: [{
//                 DonGia: firstProduct.Gia,    // Sử dụng firstProduct để lấy giá trị từ CTSP
//                 Soluong: firstProduct.SoL,   // Tương tự
//                 MaSanPham: firstProduct.Masp // Tương tự
//             }]
          
//         };

//         $http({
//             method: 'POST',
//             //headers: { "Authorization": 'Bearer ' + _user.token },
//             data: HoaDonData,
//             url: current_url + '/api/HoaDon/create-item',
//             headers: { 'Content-type': 'application/json' }
//         }).then(function (response) {
//             alert('Cập nhật hóa đơn thành công!');
//         }).catch(function (error) {
//             console.error('Lỗi:', error);
//         });
//     } else {
//         console.error('Không có sản phẩm trong giỏ hàng.');
//     }

// $scope.DatHang =function(){
//     var CTSP = GetProduct();
//     var HoaDonData = {
//         TenKH: $scope.TenKH,
//         NgayTao:  new Date(),
//         NgayDuyet:  new Date(),
//         SDT: $scope.SDT,
//         TrangThai: true,
//         Diachi: $scope.DiaChi,
//         Email : $scope.Email,
//         Diachigiaohang: $scope.Diachigiaohang,
//         DonGia: CTSP.price,
//         Soluong: CTSP.amount,
//         MaSanPham: CTSP.masp
//     };

//     $http({
//         method: 'POST',
//         //headers: { "Authorization": 'Bearer ' + _user.token },
//         data: HoaDonData,
//         url: current_url + '/api/HoaDon/create-item',
//         headers: { 'Content-type': 'application/json' }
//     }).then(function (response) {
//         alert('Cập nhật hóa đơn thành công!');
//     }).catch(function (error) {
       
//         console.error('Lỗi:', error);
//     });
// };
});



