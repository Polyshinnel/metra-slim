export function fadeIn(el,timeout,display = 'block'){
    el.style.opacity = 0;
    el.style.display = display || 'block';
    el.style.transition = `opacity ${timeout}ms`;
    setTimeout(() => {
        el.style.opacity = 1;
    }, 10);
}

export function fadeOut(el, timeout){
    el.style.opacity = 1;
    el.style.transition = `opacity ${timeout}ms`;
    el.style.opacity = 0;

    setTimeout(() => {
        el.style.display = 'none';
    }, timeout);
};

export function getAllUrlParams(url) {
    let queryString = url ? url.split('?')[1] : window.location.search.slice(1);
    let obj = {};
    if (queryString) {
        queryString = queryString.split('#')[0];
        let arr = queryString.split('&');
        for (let i=0; i<arr.length; i++) {
            let a = arr[i].split('=');

            let paramNum = undefined;
            let paramName = a[0].replace(/\[\d*\]/, function(v) {
                paramNum = v.slice(1,-1);
                return '';
            });

            let paramValue = typeof(a[1])==='undefined' ? true : a[1];

            paramName = paramName.toLowerCase();
            paramValue = paramValue.toLowerCase();

            if (obj[paramName]) {
                if (typeof obj[paramName] === 'string') {
                    obj[paramName] = [obj[paramName]];
                }
                if (typeof paramNum === 'undefined') {
                    obj[paramName].push(paramValue);
                }
                else {
                    obj[paramName][paramNum] = paramValue;
                }
            }
            else {
                obj[paramName] = paramValue;
            }
        }
    }
    return obj;
}

export function slideToggle(selectors){
    for (const selector of selectors) {
        let input = selector.querySelector('input');
        input.addEventListener('click',function(){ 
            let selectList = selector.querySelector('.select-list');
            selectList.classList.toggle('select-list_active');
            

            let elems = selectList.querySelectorAll('li');
            for (const elem of elems) {
                elem.addEventListener('click',function(){
                    
                    input.value = this.innerHTML;
                    if(selectList.classList.contains('select-list_active')){
                        console.log('click!');
                        selectList.classList.toggle('select-list_active');
                    }
                    
                })
            }
        })
    }
}