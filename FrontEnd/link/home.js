var app = angular.module('AppBanHang', []);
app.controller("HomeCtrl", function ($scope, $http) {
    $scope.listMenu;
	$scope.listItem;	
    $scope.LoadMenu= function () {
        $http({
            method: 'GET',
            url: current_url + '/api/SanPham/get-by-id/3',
        }).then(function (response) {  
            $scope.listMenu = response.data;  
        });
    };
	 
    $scope.GetBanChay= function () {
        $http({
            method: 'POST',
            data: { page: 1, pageSize: 10},
            url: current_url + '/api/SanPham/search',
        }).then(function (response) {  
            $scope.listItem = response.data.data;  
        });
    };
 
	$scope.GetBanChay();
   
      
});

