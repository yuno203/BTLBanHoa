var app = angular.module('AppBanHang', []);
app.controller("ThongKeCtrl", function ($scope, $http) {
    $scope.listThongKe;
	$scope.listSanPham;
    $scope.listThongKeBC;
     $scope.MaSanPham;
     $scope.TenSanPham;
     $scope.Gia;
     $scope.Soluong;
     
     $scope.AnhDaiDien;
    
    $scope.begin = 0;
    $scope.page = 1;
    $scope.pageSize = 10; // Số lượng mục trên mỗi trang
    $scope.pageCount;
    $scope.prop ='gia';

    $scope.repaginate = function()
    {
        $scope.begin = 0;
        $scope.pageCount = Math.ceil($scope.listThongKe.length / $scope.pageSize);
    }
    $scope.sortBy = function(prop){
        $scope.prop = prop;
    }

    $scope.first = function(){
        $scope.begin = 0;
        
    }
    $scope.Previous = function(){
        if($scope.begin > 0){
            $scope.begin -= $scope.pageSize;
        }
    }
    $scope.next = function () {
        $scope.begin = Math.min($scope.begin + $scope.pageSize, ($scope.pageCount - 1) * $scope.pageSize);
    }
    
    $scope.last = function(){
        $scope.begin = ($scope.pageCount -1 )* $scope.pageSize;
    };
    
   
  
    $scope.ten_khach;
    $scope.fr_NgayTao;
    $scope.to_NgayTao;
    $scope.top_n;
   
    $scope.Loadthongkebanchay =function(){
        var tk1Data = {
           
            page: $scope.page, pageSize: $scope.pageSize,
            top_n : $scope.top_n
        };

        $http({
            method: 'POST',
            //headers: { "Authorization": 'Bearer ' + _user.token },
            data: tk1Data,
            url: current_url + '/api/ThongKe/search_bc',
            headers: { 'Content-type': 'application/json' }
        }).then(function (response) {
            $scope.listThongKeBC = response.data.data;
        console.log($scope.listThongKeBC)
        })
};

   
    $scope.Loadthongke =function(){
            var tkData = {
                fr_NgayTao: $scope.fr_NgayTao,
                to_NgayTao: $scope.to_NgayTao,
                page: $scope.page, pageSize: $scope.pageSize,
                ten_khach : $scope.ten_khach
            };
    
            $http({
                method: 'POST',
                //headers: { "Authorization": 'Bearer ' + _user.token },
                data: tkData,
                url: current_url + '/api/ThongKe/search',
                headers: { 'Content-type': 'application/json' }
            }).then(function (response) {
                $scope.listThongKe = response.data.data;
            console.log($scope.listThongKe)
            })
    };
 
   
    // $scope.listChiTietHoaDon;
    // $scope.LoadHoaDon();
    // $scope.SuaHD = function (MaHoaDon) {
    //     $http({
    //         method: 'GET',
    //         //headers: { "Authorization": 'Bearer ' + _user.token },
    //         url: current_url + '/api/HoaDon/get-by-id/' + MaHoaDon,
    //     }).then(function (response) {
    //         var hoadon = response.data;
    //         $scope.MaHoaDon = hoadon.maHoaDon;
    //         $scope.TenKH = hoadon.tenKH;
    //         $scope.DiaChi = hoadon.diachi;
    //         $scope.NgayTao = hoadon.ngayTao;
    //         $scope.Email = hoadon.email;
    //         $scope.TongGia = hoadon.tongGia;
    //         $scope.SDT = hoadon.sdt;
    //         $scope.TrangThai = hoadon.trangthai;
    //         $scope.Diachigiaohang = hoadon.diaChiGiaoHang;
    //         $scope.MaSanPham = String(hoadon.maSanPham);
           
    //     });
    //     $http({
    //         method: 'GET',
    //         // headers: { "Authorization": 'Bearer ' + _user.token },
    //         url: current_url + '/api/HoaDon/getcthd-by-id/' + MaHoaDon,
    //       }).then(function (response) {
    //         $scope.listChiTietHoaDon = response.data;
    //         // $scope.Soluongs = $scope.listChiTietHoaDon.soLuong;
    //         // $scope.DonGias = $scope.listChiTietHoaDon.donGia;
            
    //          console.log($scope.listChiTietHoaDon)
    //       });
        
    //  };
     
     

   
    //  $scope.XoaHD = function (MaHoaDon) {
    //     var result = confirm("Bạn có thực sự muốn xóa hóa đơn này không?");
    //     if (result) {
    //         $http({
    //             method: 'POST',
    //             //headers: { "Authorization": 'Bearer ' + _user.token },
    //             url: current_url + '/api/HoaDon/delete',
    //             data:{MaHoaDon: MaHoaDon}
    //         }).then(function (response) {
    //             $scope.LoadHoaDon();
    //             alert('Xóa thành công!');
               
    //         });
           
    //     }
    // };
    // $scope.XoaNhieuHD = function () {
    //     var selectedHoaDons = $scope.listHoaDon.filter(function (x) {
    //         return x.selected;
    //     });
    
    //     var selectedMaHoaDons = selectedHoaDons.map(function (x) {
    //         return x.maSanPham;
    //     });
    
    //     if (selectedMaHoaDons.length === 0) {
    //         alert("Vui lòng chọn ít nhất một hóa đơn để xóa.");
    //         return;
    //     }
    
    //     // Chuyển danh sách mã sản phẩm thành chuỗi dạng '1,2,3'
    //     var maHoaDonString = selectedMaHoaDons.join(',');
    
    //     var result = confirm("Bạn có thực sự muốn xóa các hóa đơn đã chọn không?");
    //     if (result) {
    //         $http({
    //             method: 'POST',
    //             //headers: { "Authorization": 'Bearer ' + _user.token },
    //             url: current_url + '/api/HoaDon/delete',
    //             data: { MaHoaDon: maHoaDonString },
    //             headers: { 'Content-type': 'application/json' }
    //         }).then(function (response) {
    //             $scope.LoadHoaDon();
    //             alert('Xóa thành công!');
    //             debugger
    //         });
    
    //     }
    // };

    //$scope.Loadthongke();
    
});

