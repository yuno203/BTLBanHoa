var tang = document.querySelectorAll(".tang")
tang.forEach(function(event){
    event.addEventListener("click",function(btn){
        a = btn.target
        var btnparent = a.parentElement
        var input = btnparent.querySelector('.dem')
        var soluong = input.value
        soluong++
        input.value = soluong
        total()
    })
})

var giam = document.querySelectorAll(".giam")
giam.forEach(function(event){
    event.addEventListener("click",function(btn){
        a = btn.target
        var btnparent = a.parentElement
        var input = btnparent.querySelector('.dem')
        var soluong = input.value
        
        if(soluong>1){
            soluong--
            input.value = soluong
            total()
        }

    })
})


var nhap = document.querySelectorAll('.dem')
nhap.forEach(function(event){
    event.addEventListener("input",function(btn){
        var a = btn.target
        var b = a.value
        b = parseInt(b)
        if(isNaN(b) || b == 0){
            b =1
            a.value = b
        }
        total()
    })
})


function total(){
    var giohang = document.querySelectorAll(".giohang")
    var tongcong = document.querySelector(".tongcong strong")
    var VATbill = document.querySelector(".VAT strong")
    var tongtien = 0
    var all = 0
    giohang.forEach(function(btn){
        var giatien = btn.querySelector(".gia").innerHTML
        var soluong = btn.querySelector(".dem").value
        var tamtinh = document.querySelector(".tamtinh strong")
        var tien = giatien * soluong *1000
        tongtien += tien
        var VAT = tongtien * 5/100
        VATbill.innerHTML = VAT
        tamtinh.innerHTML = tongtien
        all = parseInt(tongtien)  + parseInt(VAT)
        tongcong.innerHTML = all
    
    })
}
total()


var xoa = document.querySelectorAll(".X")
xoa.forEach(function(btn){
    btn.addEventListener("click",function(event){
        btn = event.target
        btnDel = btn.parentElement
        xoa = btnDel.parentElement
        xoa.remove()
        total()
    })
})