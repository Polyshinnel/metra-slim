function showFancyBox(message,status)
{
    $('.fancy-box').fadeIn(300);
    $('.fanncy-message p').html(message);
    var img = 'assets/img/sucess.svg';
    if(status == 'error'){
        img = 'assets/img/error.svg';
    }
    $('.fanncy-message img').attr('src',img)
    setTimeout(function () {
        $('.fancy-box').fadeOut(300);
    },2500);
}

function getRedirect(url)
{
    $(location).attr('href',url);
}

function getUrlVars()
{
    var vars = [], hash;
    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for(var i = 0; i < hashes.length; i++)
    {
        hash = hashes[i].split('=');
        vars.push(hash[0]);
        vars[hash[0]] = hash[1];
    }
    return vars;
}

$('#loginBtn').click(function () {
    var login = $('#login').val();
    var pass = $('#password').val();

    $.ajax({
        url: '/authUser',
        method: 'post',
        dataType: 'html',
        data: {
            username: login,
            password: pass
        },
        success: function(data){
            if(data != 'auth success'){
                showFancyBox(data,'error');
            }
            else
            {
                getRedirect('/');
            }
        }
    });
});

$('#registerBtn').click(function () {
    var userName = $('#user-name').val();
    var userMail = $('#user-email').val();
    var orgName = $('#user-organization').val();
    var orgAddress = $('#user-address').val();
    var userPhone = $('#user-phone').val();
    var userPass = $('#user-password').val();

    $('.fancy-box').fadeIn(300);
    $('.fanncy-message p').html('Идет отправка кода подтверждения');
    $('.fanncy-message img').attr('src','assets/img/wait-cirle.gif');

    $.ajax({
        url: '/registerUser',
        method: 'post',
        dataType: 'json',
        data: {
            userName: userName,
            userMail: userMail,
            orgName: orgName,
            orgAddress: orgAddress,
            userPhone: userPhone,
            userPass: userPass
        },
        success: function(data){
            $('.fancy-box').fadeOut(300);
            if(data.status != 'Register Success!')
            {
                showFancyBox(data.status,'error');
            }
            else
            {
                var img = 'assets/img/sucess.svg';
                var url = '/confirm?mail='+data.mail;
                getRedirect(url);
            }
        }
    });
});

$('#confirmBtn').click(function () {
    var params = getUrlVars();
    var mail = params.mail;
    var confirmCode = $('#confirm-code').val();
    confirmCode = confirmCode.replace(/[^0-9]/g, '');

    $('.fancy-box').fadeIn(300);
    $('.fanncy-message p').html('Идет отправка кода подтверждения');
    $('.fanncy-message img').attr('src','assets/img/wait-cirle.gif');

    $.ajax({
        url: '/confirmMail',
        method: 'post',
        dataType: 'html',
        data: {
            mail: mail,
            code: confirmCode
        },
        success: function(data){
            if(data != 'Регистрация успешно завершена!'){
                showFancyBox(data,'error');
            }
            else
            {
                showFancyBox(data,'success');
                getRedirect('/');
            }
        }
    });
});

$('#send-restore').click(function () {
    var mail = $('#restore-mail').val();
    $('.fancy-box').fadeIn(300);
    $('.fanncy-message p').html('Идет отправка сообщения с инструкцией на почту');
    $('.fanncy-message img').attr('src','assets/img/wait-cirle.gif');
    $.ajax({
        url: '/restoreMail',
        method: 'post',
        dataType: 'json',
        data: {
            mail: mail,
        },
        success: function(data){
            if(data.response != 'mail send'){
                showFancyBox(data.response,'error');
            }
            else
            {
                showFancyBox('Сообщение отправлено на почту','success');
                getRedirect('/');
            }
        }
    });
});

$('#change-pass').click(function () {
    var pass = $('#restore-pass').val();
    var passConfirm = $('#restore-pass-confirm').val();
    var getParams = getUrlVars();
    var token = getParams.token
    var flag = 0;
    if(pass != passConfirm)
    {
        flag++;
        showFancyBox('Пароли не совпадают!','error');
    }
    if(flag == 0)
    {
        $.ajax({
            url: '/restorePass',
            method: 'post',
            dataType: 'html',
            data: {
                token: token,
                pass: pass
            },
            success: function(data){
                if(data != 'change success'){
                    showFancyBox(data,'error');
                }
                else
                {
                    showFancyBox('Новый пароль успешно установлен','success');
                    getRedirect('/');
                }
            }
        });
    }
})

$(document).ready(function () {
    var currUrl = window.location.pathname;
    $('.sidebar__menu-item').each(function () {
        var sidebarLinks = $(this).find('a').attr('href');
        if(sidebarLinks == currUrl)
        {
            $(this).addClass('sidebar__menu-item_active');
        }
    })
});

$('.tkp-tab-selector').click(function () {
   var dataId = $(this).attr('data-tab');

   $('.tkp-tab-selector').each(function () {
        $(this).removeClass('tkp-tab-selector_active');
   });
   $(this).addClass('tkp-tab-selector_active');

   $('.tkp-tab').each(function () {
        $(this).removeClass('tkp-tab_active')
       var dataTab = $(this).attr('data-tab');
        if(dataTab == dataId)
        {
            $(this).addClass('tkp-tab_active');
        }
   })

    $('.get-tkp').attr('data-link',dataId)
});

$('.selector-block input').click(function () {
    console.log($(this).parent().find('.select-list'));
    $(this).parent().find('.select-list').slideToggle();
})

$('.select-list li').click(function () {
    var data = $(this).html();
    $(this).parent().parent().find('input').val(data);
    $(this).parent().slideUp();
})

$('.get-tkp').click(function () {
    var link = $(this).attr('data-link');

    var clientData = {
        customerName : $('#customerName').val(),
        instalationPlace: $('#instalationPlace').val(),
        expiredData: $('#expiredData').val()
    };

    if(link == 'auto')
    {
        var typeSensor = $('#typeSensor').val();
        var model = $('#model').val();
        var typeInstalation = $('#typeInstalation').val();
        var weight = $('#weight').val();
        var length = $('#length').val();

        $.ajax({
            url: '/listTkp/'+link,
            method: 'post',
            dataType: 'json',
            data: {
                typeSensor: typeSensor,
                typeInstalation: typeInstalation,
                length: length,
                model: model,
                weight: weight,
                customerName: clientData.customerName,
                instalationPlace: clientData.instalationPlace,
                expiredDate: clientData.expiredData
            },
            success: function(data){
                if(data.message != 'tkp not empty')
                {
                    showFancyBox(data.message, 'error');
                }
                else
                {

                }
            }
        });
    }

})