var app = angular.module('AppBanHang', []);

app.controller("HomeCtrl", function ($scope, $http) {
    $scope.listItem;
    $scope.listBanChay;
    $scope.listCMAll;
    $scope.GetSanPham = function () {
        $http({
            method: 'POST',
            data: { page: 1, pageSize: 10 },
            url: current_url + '/api/SanPham/search',
        }).then(function (response) {
            $scope.listItem = response.data.data;
        });
    };
    $scope.GetChuyenMuc = function () {
        $http({
            method: 'GET',
            url: current_url + '/api/ChuyenMuc/get-all',
        }).then(function (response) {
            $scope.listCMAll = response.data;
        });
    };
    $scope.GetChuyenMuc();
    $scope.GetBanChay = function () {
        $http({
            method: 'GET',
            url: current_url + '/api/SanPham/get-banchay',
        }).then(function (response) {
            $scope.listBanChay = response.data;
        });
    };

    $scope.GetSanPham();
    $scope.GetBanChay();

    $scope.product = function(x) {
        localStorage.setItem('productDetail', JSON.stringify(x.maSanPham));
        window.location = 'chitietsp.html';
    }
    $scope.category = function(x){
        localStorage.setItem('productDetails', JSON.stringify(x.maChuyenMuc));
        window.location = 'danhmuc.html';
      }
});



// app.controller("ChiTietSanPhamCtrl", function ($scope, $http) {
//     $scope.MaSanPham = JSON.parse(localStorage.getItem('productDetail'));

//     $scope.ProductDetail = {};

//     $scope.getProductByID = function () {
//         $http.get("https://localhost:44385/api/SanPham/get-by-id/" + $scope.MaSanPham).then(
//             function (response) {
//                 $scope.ProductDetail = response.data;
//                 console.log(response.data);
//             })
//         }
//     $scope.getProductByID();    
//     $scope.order = function(){
//         localStorage.setItem('productDetails',$scope.MaSanPham)
//         window.location = 'donhang.html'
//       }
//     $scope.cart = function(){
//        localStorage.setItem('carts',$scope.MaSanPham)
//        window.location = 'giohang.html'
//     }
// });

// app.controller("GioHangCtrl",function ($scope,$http)

//     {   $scope.MaSanPham = JSON.parse(localStorage.getItem('carts'));

//     $scope.Cart = {};

//     $scope.getProductByID = function () {
//         $http.get("https://localhost:44385/api/SanPham/get-by-id/" + $scope.MaSanPham).then(
//             function (response) {
//                 $scope.Cart = response.data;
//                 console.log(response.data);
//             })
//         }
//     $scope.getProductByID();  
// });




// app.controller("DatHangCtrl",function ($scope,$http)
//     {   $scope.MaSanPham = JSON.parse(localStorage.getItem('productDetails'));

//     $scope.Order = {};

//     $scope.getProductByID = function () {
//         $http.get("https://localhost:44385/api/SanPham/get-by-id/" + $scope.MaSanPham).then(
//             function (response) {
//                 $scope.Order = response.data;
//                 console.log(response.data);
//             })
//         }
//     $scope.getProductByID();    
//         $scope.TenKH;
//         $scope.Diachi;
//         $scope.Email;
//         $scope.SDT;
//         $scope.DiaChiGiaoHang;
//         $scope.TongGia;
//         $scope.Save = function()
//         {
//             $http({
//                 method: 'POST',
//                 data: {
//                     TenK_H:$scope.TenKH,
//                     S_DT:$scope.SDT,
//                     Dia_chi_gh:$scope.DiaChiGiaoHang,
//                     Email:$scope.Email,
//                     list_json_chitiethoadon:[{

//                     }]
//                 },
//                 url: current_url + '/api/HoaDon/create-item',
//                 headers:{'Content-type':'application/json'}
                
//             }).then(function (response) {
//                 $scope.LoadSanPham();
//                 alert('Đặt hàng thành công!');
//             }).catch(function (error) {
//                 debugger
//                 console.error('Lỗi:', error);
//             });
//         }
//     }

//)