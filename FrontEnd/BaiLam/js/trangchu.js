/* nút chuyển lên đầu */
const totop = document.querySelector(".nutup")

window.addEventListener("scroll", ()=>{
    if(window.pageYOffset > 300)
    {totop.classList.add("active");}
    else{
        totop.classList.remove("active");
    }
}
)