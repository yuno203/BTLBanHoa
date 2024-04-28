var app = angular.module('AppBanHang', []);
app.controller("KhachCtrl", function ($scope, $http) {
    $scope.listKhachHang;
    $scope.page = 1;
    $scope.pageSize = 10;
    $scope.LoadKhachhang = function () {
        $http({
            
            method: 'POST',
            //headers: { "Authorization": 'Bearer ' + user.token },
            data: { page: $scope.page, pageSize: $scope.pageSize },
            url: current_url + '/api/Khach/search',
        }).then(function (response) {
            $scope.listKhachHang = response.data.data;
            console.log($scope.listKhachHang)
           
        });
        
    };
    $scope.createkhachhang =function(){
        var KhachHangData = {
            TenKH: $scope.TenKH,
            GioiTinh:  true,
            DiaChi: $scope.DiaChi,
            SDT: $scope.SDT,
            Email:$scope.Email,
        };

        $http({
            method: 'POST',
            //headers: { "Authorization": 'Bearer ' + _user.token },
            data: KhachHangData,
            url: current_url + '/api/Khach/create-item',
            headers: { 'Content-type': 'application/json' }
        }).then(function (response) {
            console.log(KhachHangData)
            $scope.LoadKhachhang();
            alert('Thêm khách hàng thành công!');
        }).catch(function (error) {
         
            console.error('Lỗi:', error);
        });
    };
    $scope.SuaKH = function (id) {
        $http({
            method: 'GET',
            //headers: { "Authorization": 'Bearer ' + _user.token },
            url: current_url + '/api/Khach/get-by-id/' + id,
        }).then(function (response) {
            var khach = response.data;
            $scope.Id = khach.id;
            $scope.TenKH = khach.tenKH;
            $scope.GioiTinh = khach.gioiTinh;
            $scope.DiaChi = khach.diaChi;
            $scope.Email = khach.email;
            $scope.SDT = khach.sdt;
            
           
        });
    };
    
    $scope.editkhach =function(){
        var KhachHangData = {
            Id : $scope.Id,
            TenKH: $scope.TenKH,
            GioiTinh:  true,
            DiaChi: $scope.DiaChi,
            SDT: $scope.SDT,
            Email:$scope.Email,
        };
    
        $http({
            method: 'POST',
            //headers: { "Authorization": 'Bearer ' + _user.token },
            data: KhachHangData,
            url: current_url + '/api/Khach/update-item',
            headers: { 'Content-type': 'application/json' }
        }).then(function (response) {
            $scope.LoadKhachhang();
            alert('Cập nhật khách thành công!');
        }).catch(function (error) {
         
            console.error('Lỗi:', error);
        });
    };
    $scope.XoaKhach = function (Id) {
        var result = confirm("Bạn có thực sự muốn xóa khach hang này không?");
        if (result) {
            $http({
                method: 'POST',
                //headers: { "Authorization": 'Bearer ' + _user.token },
                url: current_url + '/api/Khach/delete',
                data:{Id: Id}
            }).then(function (response) {
                $scope.LoadKhachhang();
                alert('Xóa thành công!');
               
            });
           
        }
    };
    $scope.XoaNhieuKhach = function () {
        var selectedKhachs = $scope.listKhachHang.filter(function (x) {
            return x.selected;
        });
    
        var selectedIds = selectedKhachs.map(function (x) {
            return x.id;
        });
    
        if (selectedIds.length === 0) {
            alert("Vui lòng chọn ít nhất một khach để xóa.");
            return;
        }
    
        // Chuyển danh sách mã sản phẩm thành chuỗi dạng '1,2,3'
        var IdString = selectedIds.join(',');
    
        var result = confirm("Bạn có thực sự muốn xóa các hóa đơn đã chọn không?");
        if (result) {
            $http({
                method: 'POST',
                //headers: { "Authorization": 'Bearer ' + _user.token },
                url: current_url + '/api/Khach/delete',
                data: { Id: IdString },
                headers: { 'Content-type': 'application/json' }
            }).then(function (response) {
                $scope.LoadKhachhang();
                alert('Xóa thành công!');
               
            });
    
        }
    };
    $scope.LoadKhachhang();
    
});

