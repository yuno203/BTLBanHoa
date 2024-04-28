var app = angular.module('AppBanHang', []);
app.controller("GioHangCtrl",function ($scope,$http)

    {   $scope.MaSanPham = JSON.parse(localStorage.getItem('carts'));

    $scope.Cart = {};

    $scope.getProductByID = function () {
        $http.get("https://localhost:44385/api/SanPham/get-by-id/" + $scope.MaSanPham).then(
            function (response) {
                $scope.Cart = response.data;
            })
        }
    $scope.getProductByID();  

});




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