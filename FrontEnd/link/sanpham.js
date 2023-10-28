var _user = JSON.parse(localStorage.getItem("user"));
var app = angular.module('AppBanHang', []);
app.controller("HomeCtrl", function ($scope, $http) {
    $scope.host = current_img;

    $scope.MaSanPham;
    $scope.TenSanPham;
    $scope.MoTaSanPham;
    $scope.MaNhaSanXuat;
    $scope.MaDonViTinh;
    $scope.MaDanhMuc;
    $scope.AnhDaiDien = "abc.jpg";

    $scope.listNhaSanXuat;
    $scope.listDonViTinh;
    $scope.listDanhMuc;
    $scope.listSanPham;

    $scope.page = 1;
    $scope.pageSize = 100;


    $scope.submit = "Thêm mới";

    $scope.LoadSanPham = function () {
        $http({
            method: 'POST',
            headers: { "Authorization": 'Bearer ' + _user.token },
            data: { page: $scope.page, pageSize: $scope.pageSize },
            url: current_url + '/api/SanPham/search',
        }).then(function (response) {
            $scope.listSanPham = response.data.data;
        });
    };


    // $scope.LoadNhaSanXuat = function () {
    //     $http({
    //         method: 'GET',
    //         headers: { "Authorization": 'Bearer ' + _user.token },
    //         url: current_url + '/api/DanhMuc/get-nhasanxuat',
    //     }).then(function (response) {
    //         $scope.listNhaSanXuat = response.data;
    //     });
    // };
    // $scope.LoadDonViTinh = function () {
    //     $http({
    //         method: 'GET',
    //         headers: { "Authorization": 'Bearer ' + _user.token },
    //         url: current_url + '/api/DanhMuc/get-donvitinh',
    //     }).then(function (response) {
    //         $scope.listDonViTinh = response.data;
    //     });
    // };
    $scope.LoadDanhMuc = function () {
        $http({
            method: 'GET',
            //headers: { "Authorization": 'Bearer ' + _user.token },
            url: current_url + '/api/DanhMuc/get-danhmuc',
        }).then(function (response) {
            $scope.listDanhMuc = response.data;
        });
    };
    $scope.Save = function () {

        let obj = {};
        obj.sanpham = {};
        obj.listchitiet = [];
        obj.sanpham.MaSanPham = $scope.MaSanPham;
        obj.sanpham.TenSanPham = $scope.TenSanPham;
        obj.sanpham.MoTaSanPham = $scope.MoTaSanPham;
        // obj.sanpham.MaNhaSanXuat = Number($scope.MaNhaSanXuat);
        // obj.sanpham.MaDonViTinh = Number($scope.MaDonViTinh);
        obj.sanpham.MaDanhMuc = Number($scope.MaDanhMuc);

        // var file = document.getElementById('file').files[0];
        // const formData = new FormData();
        // formData.append('file', file);
        // $http({
        //     method: 'POST',
        //     headers: {
        //         "Authorization": 'Bearer ' + _user.token,
        //         'Content-Type': undefined
        //     },
        //     data: formData,
        //     url: current_url + '/api/Users/upload',
        // }).then(function (res) {
        //     obj.sanpham.AnhDaiDien = res.data.filePath;
        //     $http({
        //         method: 'POST',
        //         headers: { "Authorization": 'Bearer ' + _user.token },
        //         data: obj,
        //         url: current_url + '/api/SanPham/create-sanpham',
        //     }).then(function (response) {
        //         $scope.LoadSanPham();
        //         alert('Thêm sản phẩm thành công!');
        //     });
        // });

        var file = document.getElementById('file').files[0];
        if (file) {
            const formData = new FormData();
            formData.append('file', file);
            $http({
                method: 'POST',
                headers: {
                    "Authorization": 'Bearer ' + _user.token,
                    'Content-Type': undefined
                },
                data: formData,
                url: current_url + '/api/Khach/upload',
            }).then(function (res) {

                obj.sanpham.AnhDaiDien = res.data.filePath;

                if ($scope.submit == "Thêm mới") {
                    $http({
                        method: 'POST',
                        headers: { "Authorization": 'Bearer ' + _user.token },
                        data: obj,
                        url: current_url + '/api/SanPham/create-item',
                    }).then(function (response) {
                        $scope.LoadSanPham();
                        alert('Thêm sản phẩm thành công!');
                    });
                } else {
                    $http({
                        method: 'POST',
                        headers: { "Authorization": 'Bearer ' + _user.token },
                        data: obj,
                        url: current_url + '/api/SanPham/update-sanpham',
                    }).then(function (response) {
                        $scope.LoadSanPham();
                        alert('Cập nhật sản phẩm thành công!');
                    });
                }
            });
        } else {
            obj.sanpham.AnhDaiDien = $scope.AnhDaiDien;
            if ($scope.submit == "Thêm mới") {
                $http({
                    method: 'POST',
                    headers: { "Authorization": 'Bearer ' + _user.token },
                    data: obj,
                    url: current_url + '/api/SanPham/create-item',
                }).then(function (response) {
                    $scope.LoadSanPham();
                    alert('Thêm sản phẩm thành công!');
                });
            } else {
                $http({
                    method: 'POST',
                    headers: { "Authorization": 'Bearer ' + _user.token },
                    data: obj,
                    url: current_url + '/api/SanPham/update-sanpham',
                }).then(function (response) {
                    $scope.LoadSanPham();
                    alert('Cập nhật sản phẩm thành công!');
                });
            }
        }
    };
    $scope.Sua = function (id) {
        $scope.submit = "Cập nhật";
        $http({
            method: 'GET',
            headers: { "Authorization": 'Bearer ' + _user.token },
            url: current_url + '/api/SanPham/get-by-id/{id}/' + id,
        }).then(function (response) {
            let sanpham = response.data;
            $scope.MaSanPham = sanpham.maSanPham;
            $scope.TenSanPham = sanpham.tenSanPham;
            $scope.MoTaSanPham = sanpham.moTaSanPham;
            $scope.MaNhaSanXuat = sanpham.maNhaSanXuat + '';
            $scope.MaDanhMuc = sanpham.maDanhMuc + '';
            $scope.MaDonViTinh = sanpham.maDonViTinh + '';
            $scope.AnhDaiDien = sanpham.anhDaiDien;
        });
    };
    $scope.Xoa = function (id) {
        var result = confirm("Bạn có thực sự muốn xóa không?");
        if (result) {
            $http({
                method: 'GET',                
                headers: { "Authorization": 'Bearer ' + _user.token },
                url: current_url + '/api/SanPham/delete-sanpham/' + id,
            }).then(function (response) {
                $scope.LoadSanPham();
                alert('Xóa thành công!');
            });
        } 
    };
    $scope.LoadSanPham();
    $scope.LoadNhaSanXuat();
    $scope.LoadDonViTinh();
    $scope.LoadDanhMuc();
});
