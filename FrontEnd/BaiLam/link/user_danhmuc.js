var app = angular.module('AppBanHang', []);

app.controller("DanhMucCtrl", function ($scope, $http) {

    $scope.MaChuyenMuc = JSON.parse(localStorage.getItem('productDetails'));

    $scope.ProductDetails = {};

    $scope.getProductByID = function () {
        $http.get("https://localhost:44385/api/SanPham/get-by-id/" + Number($scope.MaChuyenMuc)).then(
            function (response) {
                $scope.ProductDetails = response.data;
                console.log(response.data);
            })
        }
    $scope.getProductByID();
    $scope.listSanPhamAll;
    $scope.listCMAll;
    $scope.listItem;
    $scope.GetSanPham = function () {
        $http({
            method: 'POST',
            data: { page: 1, pageSize: 10 },
            url: current_url + '/api/SanPham/search',
        }).then(function (response) {
            $scope.listItem = response.data.data;
        });
    };
    $scope.GetSanPham();
    // $scope.listSanPham1;
    // $scope.ten_ChuyenMuc;
    // $scope.GetSP=function(){
    //     $http({
    //         method:'POST',
    //         data:{
    //             page:$scope.page,
    //             pageSize:$scope.pageSize,
    //             ten_ChuyenMuc:$scope.ten_ChuyenMuc,
    //         },
    //         url:'https://localhost:44385/api/ChuyenMuc/search',
    //     }).then(function(response){
    //         $scope.listSanPham1=response.data.data;
    //         console.log($scope.listSanPham1)
    //     })
    // }
    // $scope.GetSP();
    $scope.GetChuyenMuc = function () {
        $http({
            method: 'GET',
            url: current_url + '/api/ChuyenMuc/get-all',
        }).then(function (response) {
            $scope.listCMAll = response.data;
        });
    };
   
    $scope.GetChuyenMuc();
    $scope.danhmuc = function(x){
        localStorage.setItem('productDetail',x.maSanPham)
        window.location = 'chitietsp.html'
    }
    
    $scope.listcm;
    $scope.ChiTiet = function (MaChuyenMuc) {
        $http({
            method: 'GET',
            // headers: { "Authorization": 'Bearer ' + _user.token },
            url: current_url + '/api/SanPham/getcmsp-by-id/' + MaChuyenMuc,
          }).then(function (response) {
            $scope.listcm = response.data;
             console.log($scope.listcm)
        });
    };
    $scope.page = 1;
    $scope.pageSize = 10;
    $scope.listSanPham;
    $scope.tenSanPham='';
    $scope.giaFrom=0;
    $scope.giaTo=0
    $scope.maChuyenMuc = 0;

    $scope.LoadSanPham = function (maChuyenMuc) {
        $scope.maChuyenMuc = maChuyenMuc;
        $http({
            method: 'POST',
            //headers: { "Authorization": 'Bearer ' + user.token },
            data: { page: $scope.page, pageSize: $scope.pageSize,  
                tenSanPham : $scope.tenSanPham ,giaFrom : $scope.giaFrom,
                 giaTo : $scope.giaTo,soLuong :  $scope.soLuong, maChuyenMuc : $scope.maChuyenMuc},
            url: current_url + '/api/SanPham/search',
        }).then(function (response) {
            $scope.listSanPham = response.data.data;
            console.log(response    )
            console.log($scope.listSanPham)
           
        });
        
    };
    $scope.LoadSanPham();
    $scope.setDefaults = function () {
        $scope.giaFrom = 250000;
        $scope.LoadSanPham()
    };
    $scope.setDefaults1 = function () {
        $scope.giaFrom = 100000;
        $scope.giaTo = 20000;
        $scope.LoadSanPham()
    };
    $scope.setDefaultsmax = function () {
        var defaultGiaTo = 2000000;
        $scope.giaTo = defaultGiaTo;
        $scope.LoadSanPham()
    };
});


