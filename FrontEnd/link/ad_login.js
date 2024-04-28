var app = angular.module('AppBanHang', []);
app.controller("LoginCtrl", function ($scope, $http) {
    $scope.username = '';
  $scope.password = '';
  $scope.errorMessage = '';

  $scope.login = function() {
      var data = {
          username: $scope.username,
          password: $scope.password
      };

      $http.post('https://localhost:44366/api/User/login', data)
          .then(function(response) {
              // Xử lý khi đăng nhập thành công, có thể lưu token vào localStorage và chuyển hướng đến trang chính
              var token = response.data.token;
              localStorage.setItem('token', token);
              window.location.href = 'SanPham.html';
             
          })
          .catch(function(error) {
            alert('Đăng nhập không thành công. Vui lòng kiểm tra lại tên đăng nhập và mật khẩu.');
            //   $scope.errorMessage = 'Đăng nhập không thành công. Vui lòng kiểm tra lại tên đăng nhập và mật khẩu.';
          });
  };
});

