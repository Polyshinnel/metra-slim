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
    var country = 'ru';
    var kzState = $('#country-radio-kz');
    if(kzState.is(':checked')) {
        country = 'kz';
    }
    console.log(country);
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
            userPass: userPass,
            country: country
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
                    $('.tkp-block-search').css('display','none');
                    $('.tkp-results').css('display','block');

                    var lengthArr = data.tkp.length;
                    for(var i = 0; i < lengthArr; i++)
                    {
                        var tkpLine = '<div class="tkp-results__unit"><div class="tkp-results__unit-info-block"><div class="tkp-results__unit-info"><h4>Название ТКП:</h4><p>'+data.tkp[i].name+'</p></div><div class="tkp-results__unit-info"><h4>Название организации:</h4><p>'+data.tkp[i].customer+'</p></div></div><a href="'+data.tkp[i].link+'" class="tkp-link"><button class="blue-btn">Скачать ТКП</button></a></div>';

                        $('.tkp-results__wrapper').append(tkpLine);

                        if((data.tkp[i].buildTasks != '') || (data.tkp[i].buildTasks != undefined)){
                            var buildTasks = data.tkp[i].buildTasks;
                            for(var k = 0; k < data.tkp[i].buildTasks.length;k++)
                            {
                                var tkpLineTask = '<div class="tkp-results__unit tkp-results__unit_task"><div class="tkp-results__unit-info-block"><div class="tkp-results__unit-info tkp-results__unit-info_text"><h4>Название:</h4><p>'+data.tkp[i].buildTasks[k].name+'</p></div><div class="tkp-results__unit-info"><h4>Тип документа:</h4><p>'+'Строительное задание'+'</p></div></div><a href="'+data.tkp[i].buildTasks[k].link+'" class="tkp-link"><button class="blue-btn">Скачать</button></a></div>';
                                $('.tkp-results__wrapper').append(tkpLineTask);
                            }
                        }
                    }
                    

                    
                }
            }
        });
    }

    if(link == 'vagon')
    {
        var type_instalation = $('#typeInstalation-vagon').val();
        var type_measure = $('#typeMeasure-vagon').val();
        var weight = $('#weight-vagon').val();

        $.ajax({
            url: '/listTkp/'+link,
            method: 'post',
            dataType: 'json',
            data: {
                type_instalation: type_instalation,
                type_measure: type_measure,
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
                    $('.tkp-block-search').css('display','none');
                    $('.tkp-results').css('display','block');

                    var lengthArr = data.tkp.length;
                    for(var i = 0; i < lengthArr; i++)
                    {
                        var tkpLine = '<div class="tkp-results__unit"><div class="tkp-results__unit-info-block"><div class="tkp-results__unit-info"><h4>Название ТКП:</h4><p>'+data.tkp[i].name+'</p></div><div class="tkp-results__unit-info"><h4>Название организации:</h4><p>'+data.tkp[i].customer+'</p></div></div><a href="'+data.tkp[i].link+'" class="tkp-link"><button class="blue-btn">Скачать ТКП</button></a></div>';

                        $('.tkp-results__wrapper').append(tkpLine);

                        if((data.tkp[i].buildTasks != '') || (data.tkp[i].buildTasks != undefined)){
                            var buildTasks = data.tkp[i].buildTasks;
                            for(var k = 0; k < data.tkp[i].buildTasks.length;k++)
                            {
                                var tkpLineTask = '<div class="tkp-results__unit tkp-results__unit_task"><div class="tkp-results__unit-info-block"><div class="tkp-results__unit-info tkp-results__unit-info_text"><h4>Название:</h4><p>'+data.tkp[i].buildTasks[k].name+'</p></div><div class="tkp-results__unit-info"><h4>Тип документа:</h4><p>'+'Строительное задание'+'</p></div></div><a href="'+data.tkp[i].buildTasks[k].link+'" class="tkp-link"><button class="blue-btn">Скачать</button></a></div>';
                                $('.tkp-results__wrapper').append(tkpLineTask);
                            }
                        }
                    }



                }
            }
        });
    }

    if(link == 'platform')
    {
        var model = $('#platform-model').val();
        var quant_sensor = $('#sensors-platform').val();
        var width = $('#width-platform').val();
        var weight = $('#weight-platform').val();

        $.ajax({
            url: '/listTkp/'+link,
            method: 'post',
            dataType: 'json',
            data: {
                model: model,
                quant_sensor: quant_sensor,
                width: width,
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
                    $('.tkp-block-search').css('display','none');
                    $('.tkp-results').css('display','block');

                    var lengthArr = data.tkp.length;
                    for(var i = 0; i < lengthArr; i++)
                    {
                        var tkpLine = '<div class="tkp-results__unit"><div class="tkp-results__unit-info-block"><div class="tkp-results__unit-info"><h4>Название ТКП:</h4><p>'+data.tkp[i].name+'</p></div><div class="tkp-results__unit-info"><h4>Название организации:</h4><p>'+data.tkp[i].customer+'</p></div></div><a href="'+data.tkp[i].link+'" class="tkp-link"><button class="blue-btn">Скачать ТКП</button></a></div>';

                        $('.tkp-results__wrapper').append(tkpLine);

                        if((data.tkp[i].buildTasks != '') || (data.tkp[i].buildTasks != undefined)){
                            var buildTasks = data.tkp[i].buildTasks;
                            for(var k = 0; k < data.tkp[i].buildTasks.length;k++)
                            {
                                var tkpLineTask = '<div class="tkp-results__unit tkp-results__unit_task"><div class="tkp-results__unit-info-block"><div class="tkp-results__unit-info tkp-results__unit-info_text"><h4>Название:</h4><p>'+data.tkp[i].buildTasks[k].name+'</p></div><div class="tkp-results__unit-info"><h4>Тип документа:</h4><p>'+'Строительное задание'+'</p></div></div><a href="'+data.tkp[i].buildTasks[k].link+'" class="tkp-link"><button class="blue-btn">Скачать</button></a></div>';
                                $('.tkp-results__wrapper').append(tkpLineTask);
                            }
                        }
                    }



                }
            }
        });
    }

    if(link == 'upgrade-bundle')
    {
        var count_sensor = $('#bundle-sensors').val();
        var model = $('#bundle-type').val();

        $.ajax({
            url: '/listTkp/'+link,
            method: 'post',
            dataType: 'json',
            data: {
                count_sensor: count_sensor,
                model: model,
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
                    $('.tkp-block-search').css('display','none');
                    $('.tkp-results').css('display','block');

                    var lengthArr = data.tkp.length;
                    for(var i = 0; i < lengthArr; i++)
                    {
                        var tkpLine = '<div class="tkp-results__unit"><div class="tkp-results__unit-info-block"><div class="tkp-results__unit-info"><h4>Название ТКП:</h4><p>'+data.tkp[i].name+'</p></div><div class="tkp-results__unit-info"><h4>Название организации:</h4><p>'+data.tkp[i].customer+'</p></div></div><a href="'+data.tkp[i].link+'" class="tkp-link"><button class="blue-btn">Скачать ТКП</button></a></div>';

                        $('.tkp-results__wrapper').append(tkpLine);

                        if((data.tkp[i].buildTasks != '') || (data.tkp[i].buildTasks != undefined)){
                            var buildTasks = data.tkp[i].buildTasks;
                            for(var k = 0; k < data.tkp[i].buildTasks.length;k++)
                            {
                                var tkpLineTask = '<div class="tkp-results__unit tkp-results__unit_task"><div class="tkp-results__unit-info-block"><div class="tkp-results__unit-info tkp-results__unit-info_text"><h4>Название:</h4><p>'+data.tkp[i].buildTasks[k].name+'</p></div><div class="tkp-results__unit-info"><h4>Тип документа:</h4><p>'+'Строительное задание'+'</p></div></div><a href="'+data.tkp[i].buildTasks[k].link+'" class="tkp-link"><button class="blue-btn">Скачать</button></a></div>';
                                $('.tkp-results__wrapper').append(tkpLineTask);
                            }
                        }
                    }



                }
            }
        });
    }

});


$('.change-tkp').click(function(){
    $('.tkp-block-search').css('display','block');
    $('.tkp-results').css('display','none');
});

$('.search-category img').click(function () {
    var searchQuery = $('.search-category input').val();
    var url = '/search?search='+ encodeURIComponent(searchQuery);
    getRedirect(url);
})

$('.search-category input').on('keypress',function (e) {
    if(e.which == 13)
    {
        var searchQuery = $('.search-category input').val();
        var url = '/search?search='+ encodeURIComponent(searchQuery);
        getRedirect(url);
    }
})

$('.header-menu').click(function(){
    var sidebar = $('.sidebar');
    if(sidebar.hasClass('sidebar_active')) {
        $('.sidebar').removeClass('sidebar_active');
    } else {
        $('.sidebar').addClass('sidebar_active');
    }
});

$(document).on('click','.decline-user',function () {
    let id = $(this).attr('data-id');
    $(this).removeClass('decline-user');
    $(this).addClass('confirm-user');
    $(this).find('img').attr('src','/assets/img/icons/admin-icons/cross.svg')

    $.ajax({
        url: '/authorizeDealer',
        method: 'post',
        dataType: 'html',
        data: {
            id: id,
            status: 0
        },
        success: function(data){

        }
    });
})

$(document).on('click','.confirm-user',function () {
    let id = $(this).attr('data-id');
    $(this).addClass('decline-user');
    $(this).removeClass('confirm-user');
    $(this).find('img').attr('src','/assets/img/icons/admin-icons/check.svg')

    $.ajax({
        url: '/authorizeDealer',
        method: 'post',
        dataType: 'html',
        data: {
            id: id,
            status: 1
        },
        success: function(data){
        }
    });
})

$("#upload-file").change(function(){
    if (window.FormData === undefined) {
        alert('В вашем браузере FormData не поддерживается')
    } else {
        var formData = new FormData();
        formData.append('userFile', $("#upload-file")[0].files[0]);

        $.ajax({
            type: "POST",
            url: '/uploadImg',
            cache: false,
            contentType: false,
            processData: false,
            data: formData,
            dataType : 'json',
            success: function(data){
                console.log(data)
                if (data.err == '') {
                    $('.input-file span').html(data.fileName);
                    $('#addr-img').val(data.fileAddr);
                } else {
                    alert(data.err)
                }
            }
        });
    }
});

$(document).ready( function () {
    $('#table_id').DataTable({
        language: {
            "decimal":        "",
            "emptyTable":     "Нет данных для отображения",
            "info":           "_START_ из _END_ Всего _TOTAL_ записей",
            "infoEmpty":      "0 из 0 записей",
            "infoFiltered":   "(отфильтровано _MAX_ записей)",
            "infoPostFix":    "",
            "thousands":      ",",
            "lengthMenu":     "Показать _MENU_ записей",
            "loadingRecords": "Загрузка...",
            "processing":     "",
            "search":         "Поиск: ",
            "zeroRecords":    "Нет совпадений",
            "paginate": {
                "first":      "First",
                "last":       "Last",
                "next":       "След.",
                "previous":   "Пред."
            },
            "aria": {
                "sortAscending":  ": отсортировать по возрастанию",
                "sortDescending": ": отсортировать по убыванию"
            }
        },
        ordering:  false,
    });
} );

$('#add-tkp-product').click(function(){
    $('.tkp-data-wrapper').append('<div class="tkp-data-wrapper-item tkp-data-wrapper-item-new input-block">\n' +
        '                        <div class="input-block__title">\n' +
        '                            <label>Ид продукта</label>\n' +
        '                        </div>\n' +
        '                        <input type="text" placeholder="ИД продукта">\n' +
        '                    </div>')
});

$('#save-tkp-data').click(function () {
    let name = $('#tkp-name').val();
    let typeSensor = $('#type_sensor').val();
    let typeInstalation = $('#type_instalation').val();
    let length = $('#length').val();
    let model = $('#model').val();
    let weight = $('#weight').val();
    let path = $('#path').val();
    let id = $(this).attr('data-id');

    let tkpObj = {
        'name': name,
        'type_sensor': typeSensor,
        'type_instalation': typeInstalation,
        'length': length,
        'model': model,
        'weight': weight,
        'path': path,
        'id': id
    }

    let products = [];
    let newProducts = [];

    $('.tkp-data-wrapper-item-current').each(function () {
        let productId = $(this).find('input').val();
        let recordId = $(this).find('input').attr('data-id');
        let product = {
            'id': recordId,
            'product_id': productId
        }
        products.push(product)
    })

    $('.tkp-data-wrapper-item-new').each(function () {
        let productId = $(this).find('input').val();
        let product = {
            'tkp_id': id,
            'product_id': productId
        }
        newProducts.push(product)
    })

    let updateObj = {
        'tkp_info': tkpObj,
        'products': products,
        'new_products': newProducts
    }

    console.log(updateObj);
})