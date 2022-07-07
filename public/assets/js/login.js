import {fadeIn,fadeOut,getAllUrlParams} from './common.js';

let location = window.location.href;
let params = getAllUrlParams(location);
let pageName = params.controller;
console.log(pageName);

if(pageName == undefined){
    //Авторизация
    let loginBtn = document.querySelector('#loginBtn');

    let showPassBtn = document.querySelector('#show-pass');

    

    showPassBtn.onclick = () => {
        let passwordInput = document.querySelector('#password');
        if(passwordInput.getAttribute('type') == 'password'){
            passwordInput.setAttribute('type','text');
        }else{
            passwordInput.setAttribute('type','password');
        }
    }

    loginBtn.onclick = function(){
        let login = document.querySelector('#login').value;
        let password = document.querySelector('#password').value;

        let auth = {
            login: login,
            password: password
        };


        let fancyBox = document.querySelector('.fancy-box');
        let messageText = document.querySelector('.fanncy-message p');
        let messageImg = document.querySelector('.fanncy-message img');

        //Если надо что то выполнить в функции - запили внутреннюю функцию await!
        async function loginFunction(){
            let response = await fetch('/controllers/endpoints/LoginEndpoint.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json;charset=utf-8'
                },
                body: JSON.stringify(auth)
            });
        
            let result = await response.json();
            console.log(result.message);

            if(result.message != 'auth ok'){

                if(result.message == 'await-page'){
                    document.location.href = "/?controller=AwaitPage";
                }else{
                    messageText.innerHTML = result.message;
                    messageImg.src = '/assets/default/img/error.svg'
    
                    fadeIn(fancyBox,400);
                    setTimeout(function(){
                        fadeOut(fancyBox,400)
                    }, 1700);
                }
                
            }else{
                document.location.href = "/?controller=Main";
            }
        }

        loginFunction();
    }
}

if(pageName == 'register'){
    //Регистрация
    let registerBtn = document.querySelector('#registerBtn');

    registerBtn.onclick = function(){
        let userName = document.querySelector('#user-name').value;
        let userMail = document.querySelector('#user-email').value;
        let orgName = document.querySelector('#user-organization').value;
        let orgAddr = document.querySelector('#user-address').value;
        let phone = document.querySelector('#user-phone').value;
        let pass = document.querySelector('#user-password').value;

        let register = {
            username: userName,
            usermail: userMail,
            orgName: orgName,
            orgAddr: orgAddr,
            phone: phone,
            pass: pass,
        };


        let fancyBox = document.querySelector('.fancy-box');
        let messageText = document.querySelector('.fanncy-message p');
        let messageImg = document.querySelector('.fanncy-message img');

        //Если надо что то выполнить в функции - запили внутреннюю функцию await!
        async function registerFunction(){
            let response = await fetch('/controllers/endpoints/RegisterEndpoint.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json;charset=utf-8'
                },
                body: JSON.stringify(register)
            });
        
            let result = await response.json();
            console.log(result.message);

            if(result.message != 'register ok'){
                messageText.innerHTML = result.message;
                messageImg.src = '/assets/default/img/error.svg'

                fadeIn(fancyBox,400);
                setTimeout(function(){
                    fadeOut(fancyBox,400)
                }, 1700);
            }else{
                messageText.innerHTML = 'Регистрация прошла успешно!';
                messageImg.src = '/assets/default/img/sucess.svg'

                fadeIn(fancyBox,400);
                setTimeout(function(){
                    fadeOut(fancyBox,400)
                    let urlParams = new URLSearchParams({
                        controller: 'ConfirmCode',
                        mail: result.usermail
                    });
                    document.location.href = "/?"+urlParams;
                }, 1700);
            }

            
        }

        registerFunction();
    }
}

if(pageName == 'confirmcode'){
    //Регистрация
    let confirmBtn = document.querySelector('#confirmBtn');

    let addElem = '<span id="repeat-send">Повторить отправку</span>';
    let rootElem = document.querySelector('.service-form__text_mod');
    let timeLeft = 10;
    function addCounter(){
        let coutDownTimer = setInterval(function(){
            if(timeLeft <= 1){
                clearInterval(coutDownTimer);
                rootElem.innerHTML=addElem;
            }else{
                timeLeft--
                let timeStr = timeLeft+' с';
                let timer = document.querySelector('#timer-coutdown');
                timer.innerHTML=timeStr;
            }
        },1000)
    }

    addCounter();


    document.body.addEventListener('click',(event) => {
        if(event.target.id == 'repeat-send'){
            let userMail = params.mail;
            
            let confirm = {
                type: 'resend',
                mail: userMail,
            };
    
            let fancyBox = document.querySelector('.fancy-box');
            let messageText = document.querySelector('.fanncy-message p');
            let messageImg = document.querySelector('.fanncy-message img');
    
            //Если надо что то выполнить в функции - запили внутреннюю функцию await!
            async function confirmFunction(){
                let response = await fetch('/controllers/endpoints/ConfirmCodeEndpoint.php', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json;charset=utf-8'
                    },
                    body: JSON.stringify(confirm)
                });
            
                let result = await response.json();
                console.log(result.message);
    
                messageText.innerHTML = result.message;
                messageImg.src = '/assets/default/img/sucess.svg'

                fadeIn(fancyBox,400);
                setTimeout(function(){
                    fadeOut(fancyBox,400);
                }, 1700);
            }
    
            confirmFunction();


            timeLeft = 10;
            rootElem.innerHTML = 'Отправить повторно код через: <span id="timer-coutdown">59 c</span>';
            addCounter();
        }
    })

    confirmBtn.onclick = function(){
        let confirmCode = document.querySelector('#confirm-code').value;
        let userMail = params.mail;

        let confirm = {
            code: confirmCode,
            mail: userMail,
            type: 'ack'
        };


        let fancyBox = document.querySelector('.fancy-box');
        let messageText = document.querySelector('.fanncy-message p');
        let messageImg = document.querySelector('.fanncy-message img');

        //Если надо что то выполнить в функции - запили внутреннюю функцию await!
        async function confirmFunction(){
            let response = await fetch('/controllers/endpoints/ConfirmCodeEndpoint.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json;charset=utf-8'
                },
                body: JSON.stringify(confirm)
            });
        
            let result = await response.json();
            console.log(result.message);

            if(result.message != 'confirm ok'){
                messageText.innerHTML = result.message;
                messageImg.src = '/assets/default/img/error.svg'

                fadeIn(fancyBox,400);
                setTimeout(function(){
                    fadeOut(fancyBox,400)
                }, 1700);
            }else{
                messageText.innerHTML = 'Почта успешно подтверждена!';
                messageImg.src = '/assets/default/img/sucess.svg'

                fadeIn(fancyBox,400);
                setTimeout(function(){
                    fadeOut(fancyBox,400);
                    document.location.href = "/";
                }, 1700);
            }

        }

        confirmFunction();
    }
}

//Восстановление пароля - ввод почты

if(pageName == 'restore'){
    let restoreBtn = document.querySelector('#send-restore');
    restoreBtn.onclick = () => {
        let restoreMail = document.querySelector('#restore-mail').value;

        let restore = {
            type: 'getToken',
            mail: restoreMail
        };

        let fancyBox = document.querySelector('.fancy-box');
        let messageText = document.querySelector('.fanncy-message p');
        let messageImg = document.querySelector('.fanncy-message img');

        async function restoreFunction(){
            let response = await fetch('/controllers/endpoints/RestoreEndpoint.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json;charset=utf-8'
                },
                body: JSON.stringify(restore)
            });
        
            let result = await response.json();
            console.log(result.message);

            if(result.message != 'restore send'){
                messageText.innerHTML = result.message;
                messageImg.src = '/assets/default/img/error.svg'

                fadeIn(fancyBox,400);
                setTimeout(function(){
                    fadeOut(fancyBox,400)
                }, 1700);
            }else{
                messageText.innerHTML = 'На вашей почте лежит инструкция по сбросу пароля';
                messageImg.src = '/assets/default/img/sucess.svg'

                fadeIn(fancyBox,400);
                setTimeout(function(){
                    fadeOut(fancyBox,400);
                    document.location.href = "/";
                }, 1700);
            }

        }

        restoreFunction();
    }
}

if(pageName == 'restorepass'){
    let changePassBtn = document.querySelector('#change-pass');
    changePassBtn.onclick = () => {
        let pass = document.querySelector('#restore-pass').value;
        let confirmPass = document.querySelector('#restore-pass-confirm').value;
        let token = params.token;

        let change = {
            type: 'restore',
            pass: pass,
            passConfirm: confirmPass,
            token: token
        };

        let fancyBox = document.querySelector('.fancy-box');
        let messageText = document.querySelector('.fanncy-message p');
        let messageImg = document.querySelector('.fanncy-message img');

        async function changePass(){
            let response = await fetch('/controllers/endpoints/RestoreEndpoint.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json;charset=utf-8'
                },
                body: JSON.stringify(change)
            });
        
            let result = await response.json();
            console.log(result.message);

            if(result.message != 'pass updated'){
                messageText.innerHTML = result.message;
                messageImg.src = '/assets/default/img/error.svg'

                fadeIn(fancyBox,400);
                setTimeout(function(){
                    fadeOut(fancyBox,400)
                }, 1700);
            }else{
                messageText.innerHTML = 'Пароль успешно изменен, можете авторизовываться';
                messageImg.src = '/assets/default/img/sucess.svg'

                fadeIn(fancyBox,400);
                setTimeout(function(){
                    fadeOut(fancyBox,400);
                    document.location.href = "/";
                }, 1700);
            }

        }

        changePass();
    }
}