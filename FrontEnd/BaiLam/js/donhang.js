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