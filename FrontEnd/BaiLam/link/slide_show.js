var listIndex = 0;
var list = document.getElementsByClassName("silde_img");
for (x of list) {
    x.style.display = "none";
}
list[listIndex].style.display = "block";
function ShowLeft() {
    for (x of list) {
        x.style.display = "none";
    }
    if (listIndex == 0) {
        listIndex = list.length - 1;
    } else {
        listIndex = listIndex - 1;
    }
    list[listIndex].style.display = "block";
}

function ShowRight() {
    for (x of list) {
        x.style.display = "none";
    }
    if (listIndex == list.length - 1) {
        listIndex = 0;
    } else {
        listIndex = listIndex + 1;
    }
    list[listIndex].style.display = "block";
}


var myIndex = 0;
carousel();
function carousel() {
    var i;
    var x = document.getElementsByClassName("slide_auto");
    for (i = 0; i < x.length; i++) {
        x[i].style.display = "none";
    }
    myIndex++;
    if (myIndex > x.length) { myIndex = 1 }
    x[myIndex - 1].style.display = "block";
    setTimeout(carousel, 4000);
}