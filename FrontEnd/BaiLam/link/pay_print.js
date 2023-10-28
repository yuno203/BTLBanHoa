var list = JSON.parse(localStorage.getItem('cart'));
function DatHang() {
    var hoten = $('#txt_hoten').val();
    var sdt = $('#txt_sdt').val();
    var email = $('#txt_email').val();
    var diachi = $('#txt_diachi').val();
    var ghichu = $('#txt_ghichu').val();
    var number = /^[0-9]+$/;
    var a = email.indexOf("@");
    var c = email.lastIndexOf(".");

    if (hoten == null || hoten == "") {
        alert("Họ tên không được để trống! Vui lòng nhập lại!");
        return false;
    } else if (sdt == null || sdt == "") {
        alert("Số điện thoại không được để trống! Vui lòng nhập lại!");
        return false;
    } else if (!sdt.match(number) || sdt.length != 10) {
        alert("Số điện thoại không hợp lệ! Vui lòng nhập lại!");
        return false;
    } else if (email != "" && email != null && (a < 1 || c < (a + 2) || (c + 2) >= email.length)) {
        alert("Email không hợp lệ! Vui lòng nhập lại!");
        return false;
    } else if (diachi == null || diachi == "") {
        alert("Địa chỉ không được để trống! Vui lòng nhập lại!");
        return false;
    }

    var choose;
    var radioValue = $("input[name='payments']:checked").val();
    if (radioValue == "tm") {
        choose = "Trả tiền mặt khi nhận hàng";
    }
    else if (radioValue == "ck") {
        choose = "Chuyển khoản ngân hàng";
    }
    else {
        alert("Vui lòng chọn phương thức thanh toán!");
        return false;
    }

    var stk = $('#stk').val();
    if (radioValue == "ck" && (stk == null || stk == "")) {
        alert("Số tài khoản không được để trống! Vui lòng nhập lại!");
        return false;
    }
    else if (radioValue == "ck" && (stk != null || stk == "")) {
        if (!stk.match(number)) {
            alert("Số tài khoản không hợp lệ! Vui lòng nhập lại!");
            return false;
        }
    }

    var str = `
        <section style="text-align: center;">
            <h1>HÓA ĐƠN GIÁ TRỊ GIA TĂNG</h1>
            <div class="ban">(Bản thể hiện hóa đơn điện tử)</div>
            <div class="ngay">
                <p id="date"></p>
                <script>
                    n = new Date();
                    y = n.getFullYear();
                    m = n.getMonth() + 1;
                    d = n.getDate();
                    document.getElementById("date").innerHTML = "Ngày " + d + " tháng " + m + " năm " + y;
                </script>
            </div>
        </section>

        <div class="le dam">Tên đơn vị bán hàng: Nguyễn Chiến Computer</div>
        <div class="le">Mã số thuế: 3269289058</div>
        <div class="le">Địa chỉ: 195 Nguyễn Chế Nghĩa, Gia Lộc, Hải Dương</div>
        <div class="le doi">Điện thoại: 0948.098.195</div>
        <div class="le doi">Số tài khoản: 762618652671614</div>
        <div class="le dam">Người mua hàng: `+ hoten + `</div>
        <div class="le">Email: `+ email + `</div>
        <div class="le">Điện thoại: `+ sdt + `</div>
        <div class="le">Địa chỉ: `+ diachi + `</div>
        <div class="le doi">Hình thức thanh toán: `+ choose + `</div>
        <div class="le doi">Số tài khoản: `+ stk + `</div>
        <div class="le">Ghi chú: `+ ghichu + `</div>
        <table>
            <tr>
                <th>STT</th>
                <th>Tên sản phẩm</th>
                <th>Số lượng</th>
                <th>Thành tiền</th>
            </tr>
    `;
    var n = 0;
    var t = 0;
    var sl = 0;
    for (x of list) {
        t += x.price * x.quantity;
        sl += x.quantity;
        str += `
        <tr>
            <td>`+ (++n) + `</td>
            <td>`+ x.name + `</td>
            <td>`+ x.quantity + `</td>
            <td>`+ (x.price * x.quantity) + `</td>
         </tr>
        `;
    }
    str += `
        <tr>
            <td></td>
            <td class="dam">Tổng</td>
            <td class="dam">`+ sl + `</td>
            <td class="dam">`+ t + `</td>
        </tr>
    </table>
    <div class="doi dam ky">Người mua hàng</div>
    <div class="doi dam ky">Người bán hàng</div>
    <div class="doi ky1">(Ký, ghi rõ họ tên)</div>
    <div class="doi ky1">(Ký, ghi rõ họ tên)</div>
    `;
    printHtml(str);
}
function LoadData() {
    var str = "";
    var t = 0;
    for (x of list) {
        t += x.price * x.quantity;
        str += `
        <div class="row pay">
            <div class="col-6 col-s-12" style="text-align: left;">
                <label>` + x.name + ` * ` + x.quantity + `</label>
            </div>
            <div class="col-6 col-s-12" style="text-align: right;">
                <label>`+ (x.price * x.quantity) + `đ</label>
            </div>
        </div>
        `;
    }
    $('#spham').html(str);
    $('#tt').html(t);
}
LoadData();
function printHtml(data) {
    let popupWin = window.open('', '_blank', 'top=0,left=0,height=100%,width=auto');
    popupWin.document.write(`
        <html>
            <head>
            <title>Print tab</title>
            <style>
            * {
                margin: 0;
                padding: 0;
            }

            table {
                margin-top: 15px;
                width: 100%;
            }

            body {
                width: 900px;
                margin: 0 auto;
            }

            tr {
                line-height: 27px;
            }

            table,
            th,
            td {
                border: 1px solid black;
                border-collapse: collapse;
                text-align: center;
            }

            .ngay {
                font-style: italic;
                font-size: 15px;
                margin-bottom: 5px;
            }

            .ban {
                font-style: italic;
                font-size: 15px;
                margin: 3px 0px;
            }

            .dam {
                font-weight: bold;
            }

            .le {
                margin-bottom: 4px;
                font-size: 15px;
            }

            .doi {
                width: 50%;
                float: left;
            }

            .ky {
                text-align: center;
                margin-top: 20px;
            }

            .ky1 {
                font-style: italic;
                text-align: center;
                margin-top: 5px;
            }
            </style>
            </head>
            <body onload="window.print();window.close()">${data}</body>
        </html>`
    );
    popupWin.document.close();
}