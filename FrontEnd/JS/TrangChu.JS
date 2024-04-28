const body = document.getElementsByTagName('body')[0]

function menuhome(){
    body.classList.toggle('nav-expand')
}



window.onclick = function(event){
    openCloseDropdown(event)
}
function closeAllDropdown(){
    var dropdown = document.getElementsByClassName('menu-expand')
    for(var i = 0 ;i < dropdown.length;i++) 
    {
        dropdown[i].classList.remove('menu-expand')
    }
}
function openCloseDropdown(event){
    if(!event.target.matches('.menu-drop'))
    {
        closeAllDropdown()
    }
    else{
        var menu = event.target.dataset.menu
    var content = document.getElementById(menu)
    if(content.classList.contains('menu-expand')){
        closeAllDropdown()
    }else{
        closeAllDropdown()
        content.classList.add('menu-expand')
    }
    }
    
}

function Openhd(){
    $('.showhd').css({'transform':'scaleY(1)'});
}
function exithd(){
    $('.showhd').css({'transform':'scaleY(0)'});
}

//Thêm mới
function OpenAddsp(){
    $('.add-sp').css({'transform':'scaleY(1)'});
}
//thoat
function exit(){
    $('.add-sp').css({'transform':'scaleY(0)'});
}
function OpenEdit(){
    $('.edit_cthd').css({'transform':'scaleY(1)'});
}
//thoat
function exited(){
    $('.edit_cthd').css({'transform':'scaleY(0)'});
}


//lam moi
function NhapMoi() {
    document.getElementById('TenSP').value = '';
    document.getElementById('GiaSP').value = '';
    document.getElementById('SlSP').value = '';
}



