import {fadeIn,fadeOut,getAllUrlParams,slideToggle} from './common.js';

//Определение страницы

let location = window.location.href;
let params = getAllUrlParams(location);
let pageName = params.controller;
console.log(pageName);

if((pageName == 'main') || (pageName == undefined)){
    document.addEventListener('DOMContentLoaded', function() {
        let splide = new Splide('.main-slider', {
            type: 'loop',
            arrows: false,
            autoplay: true,
            interval: 3500
        });
        splide.mount();
    } );
}

