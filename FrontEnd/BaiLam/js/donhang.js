/* điều kiện tên */
var hoten = document.getElementById("tro");
var hotenloi = document.getElementById("tttrave");

function checkht(){
    if(!hoten.value.match(/^[A-Za-z]{3,50}$/))
    {
        hotenloi.innerHTML = "nhập lại tên đi bro";
        return false;
    }
    hotenloi.innerHTML = "";
    return true; 
}
/* điều kiện số điện thoại */
var sdt = document.getElementById("trosdt");
var sdtloi = document.getElementById("tttravesdt");

function checksdt(){
    if(!sdt.value.match(/^\d{3}[-\s]?\d{3}[-\s]?\d{4}$/))
    {
        sdtloi.innerHTML = "ông bạn check xem có bị khóa sim k mà k nhập đc";
        return false;
    }
    sdtloi.innerHTML = "";
    return true; 
}
/* điều kiện email */
var email = document.getElementById("troemail");
var emailloi = document.getElementById("tttraveemail");

function checkemail(){
    if(!email.value.match(/^[A-Za-z\._\-0-9]*[@][A-Za-z]*[\.][a-z]{2,4}$/))
    {
        emailloi.innerHTML = "nhập lại email nhé bạn";
        return false;
    }
    emailloi.innerHTML = "";
    return true; 
}

// function GetProduct(){
//     var listProductLocal = localStorage.getItem('listProduct')? JSON.parse(localStorage.getItem('listProduct')):[]
//     var Element = document.querySelector('.mathang')
//     var content
//     var html = listProductLocal.map(function(value,index){
//         return `
//         <img src="${value.img}" alt="">
//             <div class="tttritiet">
//                 <a style="color: #bd2026;" href="">${value.name}</a>
//                 <p style="padding: 10px 0px 10px;">
//                 Số lượng : ${value.amount}<br>
//                 Giá :
//                 <span>${value.price}đ</span>
//                 </p>
//             </div>`
//     })
//     content+= html
//     Element.innerHTML = content
//     tongtien()
//     tamtinh()
//     var CTSP = listProductLocal.map(function(item){
//         return {
//             Masp : item.masp,
//             TenSp : item.name,
//             Gia : item.price,
//             SoL : item.amount,
//             status : 1
//         }
//     })
//     console.log(CTSP)
// }
// GetProduct()
// function tongtien(){
//     var sum = 0
//     var VAT = 0.1
//     var listProductLocal = localStorage.getItem('listProduct')? JSON.parse(localStorage.getItem('listProduct')):[]
//     listProductLocal.map(function(item){
//         var soluong = item.amount
//         var gia = item.price
//         sum += soluong*gia*VAT
//     })
//     var tongcong = document.querySelector(".tongcong strong")
//     tongcong.innerHTML = sum
//     localStorage.setItem('listProduct',JSON.stringify(listProductLocal))
// }
// function tamtinh(){
//     var sum = 0
//     var listProductLocal = localStorage.getItem('listProduct')? JSON.parse(localStorage.getItem('listProduct')):[]
//     listProductLocal.map(function(item){
//         var soluong = item.amount
//         var gia = item.price
//         sum += soluong*gia
//     })
//     var tongcong = document.querySelector(".tamtinh strong")
//     tongcong.innerHTML = sum
//     localStorage.setItem('listProduct',JSON.stringify(listProductLocal))
// }