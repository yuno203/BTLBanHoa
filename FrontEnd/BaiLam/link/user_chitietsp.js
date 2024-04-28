var app = angular.module('AppBanHang', []);

app.controller("ChiTietSanPhamCtrl", function ($scope, $http) {
    $scope.MaSanPham = JSON.parse(localStorage.getItem('productDetail'));

    $scope.ProductDetail = {};

    $scope.getProductByID = function () {
        $http.get("https://localhost:44385/api/SanPham/get-by-id/" + Number($scope.MaSanPham)).then(
            function (response) {
                $scope.ProductDetail = response.data;
                console.log(response.data);
            })
        }
    $scope.getProductByID();    
    $scope.order = function(){
        localStorage.setItem('productDetails',$scope.MaSanPham)
        window.location = 'donhang.html'
      }
    $scope.cart = function(){
       localStorage.setItem('carts',$scope.MaSanPham)
       window.location = 'giohang.html'
    }

    console.log($scope.ProductDetail)
    $scope.cart  = function(){
        var listProduct = localStorage.getItem('listProduct')? JSON.parse(localStorage.getItem('listProduct')):[]
        var search = listProduct.find(x=>x.name=== $scope.ProductDetail.tenSanPham)
        
        if(search){
            search.amount++
            localStorage.setItem('listProduct',JSON.stringify(listProduct))
            return
        }
        listProduct.push({
            masp:  $scope.ProductDetail.maSanPham,
            img: $scope.ProductDetail.anhDaiDien,
            name: $scope.ProductDetail.tenSanPham,
            price:  $scope.ProductDetail.gia,
            amount:1
        })
        localStorage.setItem('listProduct',JSON.stringify(listProduct))
    }
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