// var tang = document.querySelectorAll(".tang")
// tang.forEach(function(event){
//     event.addEventListener("click",function(btn){
//         a = btn.target
//         var btnparent = a.parentElement
//         var input = btnparent.querySelector('.dem')
//         var soluong = input.value
//         soluong++
//         input.value = soluong
//         total()
//     })
// })

// var giam = document.querySelectorAll(".giam")
// giam.forEach(function(event){
//     event.addEventListener("click",function(btn){
//         a = btn.target
//         var btnparent = a.parentElement
//         var input = btnparent.querySelector('.dem')
//         var soluong = input.value
        
//         if(soluong>1){
//             soluong--
//             input.value = soluong
//             total()
//         }

//     })
// })


// var nhap = document.querySelectorAll('.dem')
// nhap.forEach(function(event){
//     event.addEventListener("input",function(btn){
//         var a = btn.target
//         var b = a.value
//         b = parseInt(b)
//         if(isNaN(b) || b == 0){
//             b =1
//             a.value = b
//         }
//         total()
//     })
// })


// function total(){
//     var giohang = document.querySelectorAll(".giohang")
//     var tongcong = document.querySelector(".tongcong strong")
//     var VATbill = document.querySelector(".VAT strong")
//     var tongtien = 0
//     var all = 0
//     giohang.forEach(function(btn){
//         var giatien = btn.querySelector(".gia").innerHTML
//         var soluong = btn.querySelector(".dem").value
//         var tamtinh = document.querySelector(".tamtinh strong")
//         var tien = giatien * soluong *1000
//         tongtien += tien
//         var VAT = tongtien * 5/100
//         VATbill.innerHTML = VAT
//         tamtinh.innerHTML = tongtien
//         all = parseInt(tongtien)  + parseInt(VAT)
//         tongcong.innerHTML = all
    
//     })
// }
// total()


// var xoa = document.querySelectorAll(".X")
// xoa.forEach(function(btn){
//     btn.addEventListener("click",function(event){
//         btn = event.target
//         btnDel = btn.parentElement
//         xoa = btnDel.parentElement
//         xoa.remove()
//         total()
//     })
// })

function GetProduct(){
    var listProductLocal = localStorage.getItem('listProduct')? JSON.parse(localStorage.getItem('listProduct')):[]
    
    var Element = document.querySelector('.nhieugiohang')
    var content = ''
    var html = listProductLocal.map(function(value,index){
        return `<div class="giohang">
                   
                    <div class="anhchitiet"> <img src="${value.img}" alt=""></div>
                    <div class="chitietphai">
                        <span ><a style="color: #bd2026;display: block;font-weight: 600;font-size: 14px;" href="">${value.name}</a></span>
                        <br>
                        <p>
                        <span class="gia" >${value.price}đ</span><sup>đ</sup>
                        </p>    
                        <div class="soluong">
                            <div class="giam" onclick="giamsl(${index})"></div>
                            <input type="text" class="dem" value="${value.amount}" >
                            <div class="tang" onclick="tangsl(${index})" style="margin-left: -1px;"></div>
                        </div>
                    </div>
                    <div class="huy" >
                        <span onclick="xoasp(${index})" class="X" href="">X</span><br><br><br>
                        
                    </div>
                </div>`
    })
    content+= html
    Element.innerHTML = content
    tongtien()
    console.log(localStorage);
   
}

GetProduct()

function tongtien(){
    var sum = 0
    var listProductLocal = localStorage.getItem('listProduct')? JSON.parse(localStorage.getItem('listProduct')):[]
    listProductLocal.map(function(item){
        var soluong = item.amount
        var gia = item.price
        sum += soluong*gia
    })
    var tongcong = document.querySelector(".tongcong strong")
    tongcong.innerHTML = sum
    localStorage.setItem('listProduct',JSON.stringify(listProductLocal))
}

function giamsl(index){
    var listProductLocal = localStorage.getItem('listProduct')? JSON.parse(localStorage.getItem('listProduct')):[]
    var amount = listProductLocal[index].amount
    if(amount>1){
        amount--
        listProductLocal[index].amount = amount
        localStorage.setItem('listProduct',JSON.stringify(listProductLocal))
        GetProduct()
        tongtien()
    }
}

function tangsl(index){
    var listProductLocal = localStorage.getItem('listProduct')? JSON.parse(localStorage.getItem('listProduct')):[]
    var amount = listProductLocal[index].amount
    amount++
    listProductLocal[index].amount = amount
    localStorage.setItem('listProduct',JSON.stringify(listProductLocal))
    GetProduct()
    tongtien()
    
}

function xoasp(index){
    var listProductLocal = localStorage.getItem('listProduct')? JSON.parse(localStorage.getItem('listProduct')):[]
    listProductLocal.splice(listProductLocal[index],1)
    localStorage.setItem('listProduct',JSON.stringify(listProductLocal))
    GetProduct()
    tongtien()
}