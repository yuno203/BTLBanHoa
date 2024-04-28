var app = angular.module('AppBanHang', []);
app.controller("HoaDonNhapCtrl", function ($scope, $http) {
    
	$scope.listSanPham;
   
     $scope.MaSanPham;
     $scope.TenSanPham;
     $scope.Gia;
     $scope.Soluong;
     
     $scope.AnhDaiDien;
     $scope.MaNhaSanXuat;
     $scope.MoTa;
     $scope.ChiTiet;
    
    $scope.begin = 0;
    $scope.page = 1;
    $scope.pageSize = 10; // Số lượng mục trên mỗi trang
    $scope.pageCount;
    $scope.prop ='gia';

    $scope.repaginate = function()
    {
        $scope.begin = 0;
        $scope.pageCount = Math.ceil($scope.listSanPham.length / $scope.pageSize);
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
    
   

    $scope.PageIndex = function(total){
      var liElements = document.querySelectorAll('.pageElement li');
      liElements.forEach(function (li) {
          li.remove();
      });

      var countPage = Math.ceil((total)/$scope.pageSize)
      
      for (let i = 1; i <= countPage; i++) {
        var li = document.createElement('li')
        li.className= 'page-item'
        var a = document.createElement('a')
        li.appendChild(a)
        a.innerHTML = i
        document.querySelector('.pageElement').appendChild(li)
        li.onclick = function(){
          $scope.changePage(i)
        }
      }
    }

    $scope.changePage = function(i){
      $scope.page = i
      $scope.LoadSanPham()
    }
   
    $scope.submit = "Thêm mới";
    $scope.LoadSanPham = function () {
        $http({
            
            method: 'POST',
            headers: { "Authorization": 'Bearer ' + user.token },
            data: { page: $scope.page, pageSize: $scope.pageSize,tenSanPham: $scope.tenSanPham },
            url: current_url + '/api/SanPham/search',
        }).then(function (response) {
            $scope.listSanPham = response.data.data;
            console.log($scope.listSanPham)
           
        });
        
    };
  
    $scope.$watch('tenSanPham', function () {
        $scope.LoadSanPham();
    });
    
   
    $scope.listHoaDon
    $scope.LoadHoaDon = function () {
        $http({
            method: 'POST',
            //headers: { "Authorization": 'Bearer ' + user.token },
            data: { page: $scope.page, pageSize: $scope.pageSize },
            url: current_url + '/api/HoaDon/search',
        }).then(function (response) {
            $scope.listHoaDon = response.data.data;
            console.log($scope.listHoaDon)
           
        });
        
    };
   
   
    $scope.createhoadon =function(){
            var HoaDonData = {
                TenKH: $scope.TenKH,
                DiaChi: $scope.DiaChi,
                NgayTao: "2023-11-13T08:36:01.606Z",
                NgayDuyet: "2023-11-13T08:36:01.606Z",
                Email: $scope.Email,
                SDT: $scope.SDT,
                TrangThai: true,
                Diachigiaohang: $scope.Diachigiaohang,
                
                list_json_chitiethoadon: [{
                    DonGia: $scope.DonGia,
                    Soluong: $scope.Soluong,
                    MaSanPham: $scope.MaSanPham
                }]
            };
    
            $http({
                method: 'POST',
                //headers: { "Authorization": 'Bearer ' + _user.token },
                data: HoaDonData,
                url: current_url + '/api/HoaDon/create-item',
                headers: { 'Content-type': 'application/json' }
            }).then(function (response) {
                $scope.LoadHoaDon();
                alert('Thêm hóa đơn thành công!');
            }).catch(function (error) {
             
                console.error('Lỗi:', error);
            });
    };

    $scope.createhoadonct =function(){
        var HoaDonData = {
            MaHoaDon : $scope.MaHoaDon,
            TenKH: $scope.TenKH,
            NgayTao:  new Date(),
            NgayDuyet:  new Date(),
            SDT: $scope.SDT,
            TrangThai:$scope.TrangThai,
            Diachi: $scope.DiaChi,
            Email : $scope.Email,
            Diachigiaohang: $scope.Diachigiaohang,
            
            list_json_chitiethoadon: [{
                DonGia: $scope.DonGia,
                Soluong: $scope.Soluong,
                MaSanPham: $scope.MaSanPham,
                status:'1'
            }]
        };

        $http({
            method: 'POST',
            //headers: { "Authorization": 'Bearer ' + _user.token },
            data: HoaDonData,
            url: current_url + '/api/HoaDon/updatene-item',
            headers: { 'Content-type': 'application/json' }
        }).then(function (response) {
            $scope.LoadHoaDon();
            alert('Cập nhật hóa đơn thành công!');
        }).catch(function (error) {
         
            console.error('Lỗi:', error);
        });
};

   
    $scope.listChiTietHoaDon;
    $scope.LoadHoaDon();
    $scope.SuaHD = function (MaHoaDon) {
        $http({
            method: 'GET',
            //headers: { "Authorization": 'Bearer ' + _user.token },
            url: current_url + '/api/HoaDon/get-by-id/' + MaHoaDon,
        }).then(function (response) {
            var hoadon = response.data;
            $scope.MaHoaDon = hoadon.maHoaDon;
            $scope.TenKH = hoadon.tenKH;
            $scope.DiaChi = hoadon.diachi;
            $scope.NgayTao = hoadon.ngayTao;
            $scope.Email = hoadon.email;
            $scope.TongGia = hoadon.tongGia;
            $scope.SDT = hoadon.sdt;
            $scope.TrangThai = hoadon.trangthai;
            $scope.Diachigiaohang = hoadon.diaChiGiaoHang;
            $scope.MaSanPham = String(hoadon.maSanPham);
           
        });
        $http({
            method: 'GET',
            // headers: { "Authorization": 'Bearer ' + _user.token },
            url: current_url + '/api/HoaDon/getcthd-by-id/' + MaHoaDon,
          }).then(function (response) {
            $scope.listChiTietHoaDon = response.data;
            // $scope.Soluongs = $scope.listChiTietHoaDon.soLuong;
            // $scope.DonGias = $scope.listChiTietHoaDon.donGia;
            
             console.log($scope.listChiTietHoaDon)
          });
        
     };
     $scope.EDIT_CTHD=function(maChiTietHoaDon){
        console.log(maChiTietHoaDon)
        $scope.MaSanPham=String(maChiTietHoaDon.maSanPham);
        $scope.Soluong=maChiTietHoaDon.soLuong;
        $scope.DonGia=maChiTietHoaDon.donGia;
        //$scope.giamGia=maChiTietHoaDon.giamGia;
       
      };
      $scope.y;
      $scope.edithoadonct =function(maChiTietHoaDon){
          $scope.y=maChiTietHoaDon;
          console.log($scope.y)
          var HoaDonData = {
              MaHoaDon : $scope.MaHoaDon,
              TenKH: $scope.TenKH,
              NgayTao:  new Date(),
              NgayDuyet:   new Date(),
              SDT: $scope.SDT,
              TrangThai:$scope.TrangThai,
              Diachi: $scope.DiaChi,
              Email : $scope.Email,
              Diachigiaohang: $scope.Diachigiaohang,
              
              list_json_chitiethoadon: [{
                  maChiTietHoaDon : $scope.y,
                  DonGia: $scope.DonGia,
                  Soluong: $scope.Soluong,
                  status:'2'
              }]
          };
      
          $http({
              method: 'POST',
              //headers: { "Authorization": 'Bearer ' + _user.token },
              data: HoaDonData,
              url: current_url + '/api/HoaDon/updatene-item',
              headers: { 'Content-type': 'application/json' }
          }).then(function (response) {
              $scope.LoadHoaDon();
              alert('Cập nhật hóa đơn thành công!');
          }).catch(function (error) {
           
              console.error('Lỗi:', error);
          });
      };

      $scope.x;
      $scope.DeleteCTHD=function(maChiTietHoaDon){
        
        $scope.x=maChiTietHoaDon;
        console.log($scope.x)
        var result = confirm("Bạn có chắc muốn xóa sản phẩm này không?");
        if(result){
          $http({
            method: 'POST',
              // headers: { "Authorization": 'Bearer ' + _user.token },
            data: {
                MaHoaDon : $scope.MaHoaDon,
                TenKH: $scope.TenKH,
                NgayTao:  new Date(),
                NgayDuyet:   new Date(),
                SDT: $scope.SDT,
                TrangThai:$scope.TrangThai,
                Diachi: $scope.DiaChi,
                Email : $scope.Email,
                Diachigiaohang: $scope.Diachigiaohang,
                list_json_chitiethoadon: [{
                  maChiTietHoaDon : $scope.x,
                  status:'3'
                }]
            },
            url: current_url + '/api/HoaDon/updatene-item',
          })
          .then(function (response) {
            console.log(response)
            alert("Cập nhật đơn hàng thành công");
          }); 
        }  
      };
  
     $scope.ChiTiet = function (MaHoaDon) {
        $http({
            method: 'GET',
            //headers: { "Authorization": 'Bearer ' + _user.token },
            url: current_url + '/api/HoaDon/get-by-id/' + MaHoaDon,
        }).then(function (response) {
            var hoadon = response.data;
            $scope.MaHoaDon = hoadon.maHoaDon;
            $scope.TenKH = hoadon.tenKH;
            $scope.DiaChi = hoadon.diachi;
            //$scope.NgayTao = hoadon.ngayTao;
            $scope.Email = hoadon.email;
            $scope.SDT = hoadon.sdt;
           
            $scope.Diachigiaohang = hoadon.diaChiGiaoHang;
            //$scope.MaSanPham = hoadon.maSanPham.toString();
           
        });
      
        $http({
            method: 'GET',
            // headers: { "Authorization": 'Bearer ' + _user.token },
            url: current_url + '/api/HoaDon/getcthd-by-id/' + MaHoaDon,
          }).then(function (response) {
            $scope.listChiTietHoaDon = response.data;
             console.log($scope.listChiTietHoaDon)
          });
     };
  

   
     $scope.XoaHD = function (MaHoaDon) {
        var result = confirm("Bạn có thực sự muốn xóa hóa đơn này không?");
        if (result) {
            $http({
                method: 'POST',
                //headers: { "Authorization": 'Bearer ' + _user.token },
                url: current_url + '/api/HoaDon/delete',
                data:{MaHoaDon: MaHoaDon}
            }).then(function (response) {
                $scope.LoadHoaDon();
                alert('Xóa thành công!');
               
            });
           
        }
    };
    $scope.XoaNhieuHD = function () {
        var selectedHoaDons = $scope.listHoaDon.filter(function (x) {
            return x.selected;
        });
    
        var selectedMaHoaDons = selectedHoaDons.map(function (x) {
            return x.maSanPham;
        });
    
        if (selectedMaHoaDons.length === 0) {
            alert("Vui lòng chọn ít nhất một hóa đơn để xóa.");
            return;
        }
    
        // Chuyển danh sách mã sản phẩm thành chuỗi dạng '1,2,3'
        var maHoaDonString = selectedMaHoaDons.join(',');
    
        var result = confirm("Bạn có thực sự muốn xóa các hóa đơn đã chọn không?");
        if (result) {
            $http({
                method: 'POST',
                //headers: { "Authorization": 'Bearer ' + _user.token },
                url: current_url + '/api/HoaDon/delete',
                data: { MaHoaDon: maHoaDonString },
                headers: { 'Content-type': 'application/json' }
            }).then(function (response) {
                $scope.LoadHoaDon();
                alert('Xóa thành công!');
                debugger
            });
    
        }
    };

    $scope.LoadSanPham();
    
});

