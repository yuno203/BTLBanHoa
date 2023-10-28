var app = angular.module('AppBanHang', ["ngRoute"]);

app.controller("HomeCtrl", function ($scope, $http) {
    $scope.listItem;
    $scope.listBanChay;

    $scope.GetSanPham = function () {
        $http({
            method: 'POST',
            data: { page: 1, pageSize: 10 },
            url: current_url + '/api/SanPham/search',
        }).then(function (response) {
            $scope.listItem = response.data.data;
        });
    };

    $scope.GetBanChay = function () {
        $http({
            method: 'GET',
            url: current_url + '/api/SanPham/get-all',
        }).then(function (response) {
            $scope.listBanChay = response.data;
        });
    };

    $scope.GetSanPham();
    $scope.GetBanChay();
});

app.config(function ($routeProvider) {
    $routeProvider
        
        .when("/chitietsp/:MaSanPham", {
            templateUrl: "view/chitietsp.html",
            controller: "ChiTietSanPhamCtrl"
        })
        .otherwise({
            redirectTo: "/"
        });
});

app.controller("ChiTietSanPhamCtrl", function ($scope, $http, $routeParams) {
    $scope.MaSanPham = $routeParams.MaSanPham; // Sử dụng $routeParams để lấy tham số MaSanPham

    $http({
        method: 'GET',
        url: current_url + '/api/SanPham/get-by-id/' + $scope.MaSanPham,
    }).then(function (response) {
        $scope.listItem = response.data;
        
    });     
});
