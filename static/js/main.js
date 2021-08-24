$(document).ready(function () {
    var close_msg = $('a.close');
    var pageURL = $(location).attr("href");
    close_msg.attr("href", pageURL)
    var top = $('#top');
    var nav = $('#nav');
    var flag = $('#flag');

    var top_h = $('#top').css('height');
    var nav_h = $('#nav').css('height');
    var flag_h = $('#flag').css('height');

    top_h = top_h.replace('px', '');
    nav_h = nav_h.replace('px', '');
    flag_h = nav_h.replace('px', '');
    top_h = parseInt(top_h);
    nav_h = parseInt(nav_h);
    flag_h = parseInt(flag_h);

    nav.css('margin-top', top_h + "px");
    flag.css('margin-top', top_h + nav_h + "px");

    var hint_label_username = $('#hint_id_username');
    hint_label_username.css('display', 'none')

    var captcha = $('#div_id_captcha > label');
    // captcha.css('display', 'none');


    var button_form = $('#button');
    button_form.css("margin-top", '20px');
    var div_id_new_password1 = $("#div_id_new_password1");
    div_id_new_password1.addClass('row mx-auto text-center');
    var input_reset_passw = $(".ctrlHolder input");
    input_reset_passw.addClass('col-12 mx-auto text-center ');
    var label_reset_passw = $(".ctrlHolder label");
    label_reset_passw.addClass('col-12 mx-auto text-center');
    var ul_reset_passw = $(".ctrlHolder ul");
    ul_reset_passw.addClass('col-12 h-100 mx-auto text-center');
    var li_reset_passw = $(".ctrlHolder li");
    li_reset_passw.addClass('col-12 mx-auto text-center');
    var div_hint_id_new_password1 = $("#hint_id_new_password1");
    div_hint_id_new_password1.addClass('row mx-auto text-center');


    var top = $('#top');
    var nav = $('#nav');
    $(window).on('wheel', function (event) {
        if (event.originalEvent.deltaY < 0) {
            nav.css('opacity', '1');
            top.css('opacity', '1');
        } else {
            nav.css('opacity', '0');
            top.css('opacity', '0');
        }
    });

    var lastY;
    $(window).bind('touchmove', function (e) {
        var currentY = e.originalEvent.touches[0].clientY;
        if (currentY > lastY) {
            top.removeClass('scroll_down');
            nav.removeClass('active');
            nav.css('opacity', '1');
            top.css('opacity', '1');
        } else if (currentY < lastY) {
            top.addClass('scroll_down');
            nav.addClass('active');
            nav.css('opacity', '0');
            top.css('opacity', '0');
        }
        lastY = currentY;
    });

    // var filesToUpload = input.files;
    // var file = filesToUpload[0];

    // var img = document.createElement("img");
    // var reader = new FileReader();
    // reader.onload = function (e) {
    //     img.src = e.target.result
    // }
    // reader.readAsDataURL(file);

    // var ctx = canvas.getContext("2d");
    // ctx.drawImage(img, 0, 0);

    // var MAX_WIDTH = 800;
    // var MAX_HEIGHT = 600;
    // var width = img.width;
    // var height = img.height;
    // alert('hello');
    // if (width > height) {
    //     if (width > MAX_WIDTH) {
    //         height *= MAX_WIDTH / width;
    //         width = MAX_WIDTH;
    //     }
    // } else {
    //     if (height > MAX_HEIGHT) {
    //         width *= MAX_HEIGHT / height;
    //         height = MAX_HEIGHT;
    //     }
    // }
    // canvas.width = width;
    // canvas.height = height;
    // var ctx = canvas.getContext("2d");
    // ctx.drawImage(img, 0, 0, width, height);

    // var dataurl = canvas.toDataURL("image/png");

    //Post dataurl to the server with AJAX


})