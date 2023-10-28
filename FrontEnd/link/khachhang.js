var app = angular.module('AppBanHang', []);
app.controller("HomeCtrl", function ($scope, $http) {
    $scope.listMenu;
	$scope.listSanPham;
    $scope.LoadMenu= function () {
        $http({
            method: 'GET',
            url: current_url + '/api/SanPham/get-by-id/3',
        }).then(function (response) {  
            $scope.listMenu = response.data;  
        });
    };
	 
    // $scope.GetBanChay= function () {
    //     $http({
    //         method: 'POST',
    //         data: { page: 1, pageSize: 10},
    //         url: current_url + '/api/SanPham/search',
    //     }).then(function (response) {  
    //         $scope.listItem = response.data.data;  
    //     });
    // };
 
	//  $scope.GetBanChay();
   
    // $scope.host = current_img;

     $scope.MaSanPham;
     $scope.TenSanPham;
     $scope.Gia;
     $scope.Soluong;
     
     $scope.AnhDaiDien;
     $scope.MaNhaSanXuat;
     $scope.MoTa;
     $scope.ChiTiet;
    
   
    //  $scope.items = [];
      //$scope.page = 1;
      //$scope.pageSize = 11;
   
     
  
      $scope.page = 1;
      $scope.pageSize = 100; // Number of items per page
    //   $scope.totalPages = Math.ceil($scope.listSanPham.length / $scope.pageSize);
  
    //   $scope.prevPage = function () {
    //     if ($scope.page > 1) {
    //       $scope.page--;
    //       $scope.updatePage();
    //     }
    //   };
  
    //   $scope.nextPage = function () {
    //     if ($scope.page < $scope.totalPages) {
    //       $scope.page++;
    //       $scope.updatePage();
    //     }
    //   };
  
    //   $scope.getPages = function () {
    //     var startPage = Math.max(1, $scope.page - Math.floor($scope.pageSize / 2));
    //     var endPage = Math.min($scope.totalPages, startPage + $scope.pageSize - 1);
  
    //     if (endPage - startPage + 1 < $scope.pageSize) {
    //       startPage = Math.max(1, endPage - $scope.pageSize + 1);
    //     }
  
    //     var pages = [];
    //     for (var i = startPage; i <= endPage; i++) {
    //       pages.push(i);
    //     }
  
    //     return pages;
    //   };
    //   $scope.updatePage = function () {
    //     var startIndex = ($scope.page - 1) * $scope.pageSize;
    //     var endIndex = startIndex + $scope.pageSize;
    //     $scope.paginatedItems = $scope.items.slice(startIndex, endIndex);
    // };

    // $scope.updatePage();


    $scope.submit = "Thêm mới";
    $scope.LoadSanPham = function () {
        $http({
            method: 'POST',
            //headers: { "Authorization": 'Bearer ' + _user.token },
            data: { page: $scope.page, pageSize: $scope.pageSize },
            url: current_url + '/api/SanPham/search',
        }).then(function (response) {
            $scope.listSanPham = response.data.data;
            console.log($scope.listSanPham)
           
           
        });
        
    };

    $scope.MaChuyenMuc;
    $scope.listDanhMuc;
    $scope.LoadDanhMuc = function () {
        $http({
            method: 'GET',
            //headers: { "Authorization": 'Bearer ' + _user.token },
            url: current_url + '/api/ChuyenMuc/get-all',
        }).then(function (response) {
            $scope.listDanhMuc = response.data;
        });
        
    };
    $scope.Save = function () {

        var file = document.getElementById('file').files[0];
        if (file) {
            const formData = new FormData();
            formData.append('file', file);
            $http({
                method: 'POST',
                headers: {
                    // "Authorization": 'Bearer ' + _user.token,
                    'Content-Type': undefined
                },
                data: formData,
                url: current_url + '/api/SanPham/upload',
            }).then(function (res) {
                $scope.AnhDaiDien = res.data.filePath;
                console.log(res.data.filePath)
                if ($scope.submit == "Thêm mới") {
                    $http({
                        method: 'POST',
                        //headers: { "Authorization": 'Bearer ' + _user.token },
                        data: {
                            MaChuyenMuc:$scope.MaChuyenMuc,
                            TenSanPham:$scope.TenSanPham,
                            Gia:$scope.Gia,
                            Soluong:$scope.Soluong,
                            AnhDaiDien:"../Anh"+$scope.AnhDaiDien,
                            list_json_chitietsanpham:[{
                                MaNhaSanXuat:$scope.MaNhaSanXuat,
                                MoTa:$scope.MoTa,
                                ChiTiet:$scope.ChiTiet,
                            }]
                        },
                       
                        url: current_url + '/api/SanPham/create-item',
                        headers:{'Content-type':'application/json'}
                    }).then(function (response) {
                        $scope.LoadSanPham();
                        alert('Thêm sản phẩm thành công!');
                    }).catch(function (error) {
                        debugger
                        console.error('Lỗi:', error);
                    });
                } else {
                    $http({
                        method: 'POST',
                        //headers: { "Authorization": 'Bearer ' + _user.token },
                        data: {
                            MaSanPham:$scope.MaSanPham,
                            MaChuyenMuc:$scope.MaChuyenMuc,
                            TenSanPham:$scope.TenSanPham,
                            Gia:$scope.Gia,
                            Soluong:$scope.Soluong,
                            AnhDaiDien:"../Anh"+$scope.AnhDaiDien,
                            list_json_chitietsanpham:[{
                                MaNhaSanXuat:$scope.MaNhaSanXuat,
                                MoTa:$scope.MoTa,
                                ChiTiet:$scope.ChiTiet,
                            }]
                        },
                        url: current_url + '/api/SanPham/update-item',
                        headers:{'Content-type':'application/json'}
                    }).then(function (response) {
                        $scope.LoadSanPham();
                        alert('Cập nhật sản phẩm thành công!');
                        debugger
                        console.log(MaSanPham)
                    });
                }
            }).catch(function (error) {
                console.error('Lỗi:', error);
            });
        } else {
            AnhDaiDien = $scope.AnhDaiDien;
            if ($scope.submit == "Thêm mới") {
                $http({
                    method: 'POST',
                    //headers: { "Authorization": 'Bearer ' + _user.token },
                    data: {
                       
                        MaChuyenMuc:$scope.MaChuyenMuc,
                        TenSanPham:$scope.TenSanPham,
                        Gia:$scope.Gia,
                        Soluong:$scope.Soluong,
                        AnhDaiDien:"../Anh"+$scope.AnhDaiDien,
                        list_json_chitietsanpham:[{
                            MaNhaSanXuat:$scope.MaNhaSanXuat,
                            MoTa:$scope.MoTa,
                            ChiTiet:$scope.ChiTiet,
                        }]
                    },
                   
                    url: current_url + '/api/SanPham/create-item',
                    headers:{'Content-type':'application/json'}
                   
                }).then(function (response) {
                    $scope.LoadSanPham();
                    alert('Thêm sản phẩm thành công!');
                });
            } else {
                $http({
                    method: 'POST',
                    //headers: { "Authorization": 'Bearer ' + _user.token },
                    data: {
                        MaSanPham:$scope.MaSanPham,
                        MaChuyenMuc:$scope.MaChuyenMuc,
                        TenSanPham:$scope.TenSanPham,
                        Gia:$scope.Gia,
                        Soluong:$scope.Soluong,
                        AnhDaiDien:"../Anh"+$scope.AnhDaiDien,
                        list_json_chitietsanpham:[{
                            MaNhaSanXuat:$scope.MaNhaSanXuat,
                            MoTa:$scope.MoTa,
                            ChiTiet:$scope.ChiTiet,
                        }]
                    },
                    url: current_url + '/api/SanPham/update-item',
                    headers:{'Content-type':'application/json'}
                }).then(function (response) {
                    $scope.LoadSanPham();
                    alert('Cập nhật sản phẩm thành công!');
                });
            }
        }
    };
    
    $scope.Sua = function (MaSanPham) {
        $scope.submit = "Cập nhật";
        $http({
            method: 'GET',
            //headers: { "Authorization": 'Bearer ' + _user.token },
            url: current_url + '/api/SanPham/get-by-id/' + MaSanPham,
        }).then(function (response) {
            var sanpham = response.data;
            $scope.MaSanPham = sanpham.maSanPham;
            $scope.TenSanPham = sanpham.tenSanPham;
            $scope.Gia = sanpham.gia;
            $scope.Soluong = sanpham.soLuong;
            $scope.AnhDaiDien = sanpham.anhDaiDien;
            $scope.MaChuyenMuc = sanpham.maChuyenMuc.toString();
            
           
        });
     };
  

    $scope.XoaSanPham = function (MaSanPham) {
        var result = confirm("Bạn có thực sự muốn xóa sản phẩm này không?");
        if (result) {
            $http({
                method: 'POST',
                //headers: { "Authorization": 'Bearer ' + _user.token },
                url: current_url + '/api/SanPham/delete',
                data:{MaSanPham: MaSanPham}
            }).then(function (response) {
                $scope.LoadSanPham();
                alert('Xóa thành công!');
               
            });
           
        }
    };
    $scope.XoaSanPhamNhieu = function () {
        var selectedSanPhams = $scope.listSanPham.filter(function (x) {
            return x.selected;
        });
    
        var selectedMaSanPhams = selectedSanPhams.map(function (x) {
            return x.maSanPham;
        });
    
        if (selectedMaSanPhams.length === 0) {
            alert("Vui lòng chọn ít nhất một sản phẩm để xóa.");
            return;
        }
    
        // Chuyển danh sách mã sản phẩm thành chuỗi dạng '1,2,3'
        var maSanPhamString = selectedMaSanPhams.join(',');
    
        var result = confirm("Bạn có thực sự muốn xóa các sản phẩm đã chọn không?");
        if (result) {
            $http({
                method: 'POST',
                //headers: { "Authorization": 'Bearer ' + _user.token },
                url: current_url + '/api/SanPham/delete',
                data: { MaSanPham: maSanPhamString },
                headers: { 'Content-type': 'application/json' }
            }).then(function (response) {
                $scope.LoadSanPham();
                alert('Xóa thành công!');
                debugger
            });
    
        }
    };
    
    
    $scope.LoadDanhMuc();
    $scope.LoadSanPham();
});

