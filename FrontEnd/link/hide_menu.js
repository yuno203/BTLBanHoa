function openNav() {
    document.getElementById("mySidenav").style.width = "100%";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}

function openNavMid() {
    document.getElementById("mySidenavMid").style.width = "360px";
}

function closeNavMid() {
    document.getElementById("mySidenavMid").style.width = "0";
}

$(function () {
    $(window).scroll(function () {
        if ($(this).scrollTop() != 0) {
            $('#myBtn').fadeIn();
        }
        else {
            $('#myBtn').fadeOut();
        }
    });
    $('#myBtn').click(function () {
        $('body,html').animate({ scrollTop: 0 }, 800);
    });
});

function LoadUserKH() {
    var u = JSON.parse(localStorage.getItem('userKH')) || [];

    $('#tenkhachhang').html(u.tenkh);
    $('#tenkh').html(u.tenkh);
    $('#sdtkh').html(u.sdtkh);
    $('#emailkh').html(u.emailkh);
    $('#diachikh').html(u.diachikh);
    //$('#mkkh').html(u.mkkh);
}

function LogOut() {
    localStorage.setItem('userKH', null);
    window.location.href = "index.html";
}