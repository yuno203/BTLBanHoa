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