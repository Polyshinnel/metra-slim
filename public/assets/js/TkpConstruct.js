import {fadeIn,fadeOut,getAllUrlParams,slideToggle} from './common.js';

let selectors = document.querySelectorAll('.selector-block');
slideToggle(selectors);

let tabSelectors = document.querySelectorAll('.tkp-tab-selector');
for (const tabSelector of tabSelectors) {
    tabSelector.addEventListener('click',function(){
        for (const tabSelector of tabSelectors) {
            tabSelector.classList.remove('tkp-tab-selector_active');
        }
        this.classList.add('tkp-tab-selector_active');
        let tabName = this.querySelector('p').innerHTML;
        let tkpTabs = document.querySelectorAll('.tkp-tab');
        for (const tkpTab of tkpTabs) {
            tkpTab.classList.remove('tkp-tab_active');
            let tabData = tkpTab.getAttribute('data-tab');
            if(tabData == tabName){
                tkpTab.classList.add('tkp-tab_active');
            }
        }
    })
}

let getTkpBtn = document.querySelector('.get-tkp');
getTkpBtn.onclick = () => {

    let typeSensor = document.querySelector('#typeSensor').value;
    let typeInstalation = document.querySelector('#typeInstalation').value;
    let length = document.querySelector('#length').value;
    let model = document.querySelector('#model').value;
    let weight = document.querySelector('#weight').value;

    let customerName = document.querySelector('#customerName').value;
    let instalationPlace = document.querySelector('#instalationPlace').value;
    let expiredData = document.querySelector('#expiredData').value;

    let tkpInfo = {
        typeSensor: typeSensor,
        typeInstalation: typeInstalation,
        length: length,
        model: model,
        weight: weight,
        customerName: customerName,
        instalationPlace: instalationPlace,
        expiredDate: expiredData
    };


    let fancyBox = document.querySelector('.fancy-box');
    let messageText = document.querySelector('.fanncy-message p');
    let messageImg = document.querySelector('.fanncy-message img');

    //Если надо что то выполнить в функции - запили внутреннюю функцию await!
    async function getTkpFunction(){
        let response = await fetch('/controllers/endpoints/getTkp.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: JSON.stringify(tkpInfo)
        });
    
        let result = await response.json();

        if(result.message != 'tkp not empty'){
            messageText.innerHTML = result.message;
            messageImg.src = '/assets/default/img/error.svg'

            fadeIn(fancyBox,400);
            setTimeout(function(){
                fadeOut(fancyBox,400)
            }, 1700);
        }else{
            document.querySelector('.tkp-block-search').style.display = 'none';
            document.querySelector('.tkp-results').style.display = 'block';
            let tkpBlock = result.tkp;
            document.querySelector('.tkp-results__wrapper').innerHTML = '';
            for (const tkpUnit of tkpBlock) {
                console.log(tkpUnit.buildTasks);
                let tkpLine = '<div class="tkp-results__unit"><div class="tkp-results__unit-info-block"><div class="tkp-results__unit-info"><h4>Название ТКП:</h4><p>'+tkpUnit.name+'</p></div><div class="tkp-results__unit-info"><h4>Название организации:</h4><p>'+tkpUnit.customer+'</p></div></div><a href="'+tkpUnit.link+'" class="tkp-link"><button class="blue-btn">Скачать ТКП</button></a></div>';
                
                document.querySelector('.tkp-results__wrapper').insertAdjacentHTML('beforeend',tkpLine);

                if((tkpUnit.buildTasks != '') || (tkpUnit.buildTasks != undefined)){
                    let buildTasks = tkpUnit.buildTasks;
                    for (const buildTask of buildTasks) {
                        let tkpLineTask = '<div class="tkp-results__unit tkp-results__unit_task"><div class="tkp-results__unit-info-block"><div class="tkp-results__unit-info tkp-results__unit-info_text"><h4>Название:</h4><p>'+buildTask.name+'</p></div><div class="tkp-results__unit-info"><h4>Тип документа:</h4><p>'+'Строительное задание'+'</p></div></div><a href="'+buildTask.link+'" class="tkp-link"><button class="blue-btn">Скачать</button></a></div>'

                        document.querySelector('.tkp-results__wrapper').insertAdjacentHTML('beforeend',tkpLineTask);
                    }
                }
                
            }
        }

    }

    getTkpFunction();
}

document.querySelector('.change-tkp').onclick = () => {
    document.querySelector('.tkp-block-search').style.display = 'block';
    document.querySelector('.tkp-results').style.display = 'none';
}

new AirDatepicker('#expiredData', {
    selectedDates: [new Date()],
    autoClose: true
})