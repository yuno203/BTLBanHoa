var app = angular.module('AppBanHang', []);
app.controller("ChuyenMucCtrl", function ($scope, $http) {
    $scope.listChuyenMuc;
    $scope.page = 1;
    $scope.pageSize = 10;
    $scope.LoadChuyenMuc = function () {
        $http({
            
            method: 'POST',
            //headers: { "Authorization": 'Bearer ' + user.token },
            data: { page: $scope.page, pageSize: $scope.pageSize },
            url: current_url + '/api/ChuyenMuc/search',
        }).then(function (response) {
            $scope.listChuyenMuc = response.data.data;
            console.log($scope.listChuyenMuc)
           
        });
        
    };
    $scope.createchuyenmuc =function(){
        var ChuyenMucData = {
            MaChuyenMucCha: $scope.MaChuyenMucCha,
            TenChuyenMuc: $scope.TenChuyenMuc,
            DacBiet: $scope.Dacbiet,
            NoiDung:$scope.NoiDung,
        };

        $http({
            method: 'POST',
            //headers: { "Authorization": 'Bearer ' + _user.token },
            data: ChuyenMucData,
            url: current_url + '/api/ChuyenMuc/create-item',
            headers: { 'Content-type': 'application/json' }
        }).then(function (response) {
            console.log(ChuyenMucData)
            $scope.LoadChuyenMuc();
            alert('Thêm chuyên mục thành công!');
        }).catch(function (error) {
         
            console.error('Lỗi:', error);
        });
    };
    $scope.SuaCM = function (MaChuyenMuc) {
        $http({
            method: 'GET',
            //headers: { "Authorization": 'Bearer ' + _user.token },
            url: current_url + '/api/ChuyenMuc/get-by-id/' + MaChuyenMuc,
        }).then(function (response) {
            var chuyenmuc = response.data;
            $scope.MaChuyenMuc = chuyenmuc.maChuyenMuc;
            $scope.MaChuyenMucCha = chuyenmuc.maChuyenMucCha;
            $scope.TenChuyenMuc = chuyenmuc.tenChuyenMuc;
            $scope.DacBiet = chuyenmuc.dacBiet;
            $scope.NoiDung = chuyenmuc.noiDung;
          
            
           
        });
    };
    
    $scope.editchuyenmuc =function(){
        var ChuyenMucData = {
            MaChuyenMuc : $scope.MaChuyenMuc,
            MaChuyenMucCha: $scope.MaChuyenMucCha,
            TenChuyenMuc: $scope.TenChuyenMuc,
            DacBiet: $scope.Dacbiet,
            NoiDung:$scope.NoiDung,
        };
    
        $http({
            method: 'POST',
            //headers: { "Authorization": 'Bearer ' + _user.token },
            data: ChuyenMucData,
            url: current_url + '/api/ChuyenMuc/update-item',
            headers: { 'Content-type': 'application/json' }
        }).then(function (response) {
            $scope.LoadChuyenMuc();
            alert('Cập nhật chuyen muc thành công!');
        }).catch(function (error) {
         
            console.error('Lỗi:', error);
        });
    };
    $scope.Xoachuyenmuc = function (MaChuyenMuc) {
        var result = confirm("Bạn có thực sự muốn xóa khach hang này không?");
        if (result) {
            $http({
                method: 'DELETE',
                //headers: { "Authorization": 'Bearer ' + _user.token },
                url: current_url + '/api/ChuyenMuc/delete',
                data:{MaChuyenMuc: MaChuyenMuc}
            }).then(function (response) {
                $scope.LoadChuyenMuc();
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
    $scope.LoadChuyenMuc();
    
});

