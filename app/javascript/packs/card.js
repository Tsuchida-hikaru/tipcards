// (function (window,document) {
//     var toggleCardTitle = document.getElementsByClassName('card-title');
//     var toggleCard = Array.from(document.getElementsByClassName('card-content'));
//     var clientH;
//     init();
//     function init() {
//         toggleCard.style.height = 'auto';
//         clientH = toggleCard.clientHeight;
//         toggleCard.style.height = '0px';
//         toggleCardTitle.addEventListener('click', function(){clickToggle();}, false);
//     }
//     function clickToggle() {
//         var lastH = toggleCard.style.height;
//         toggleCard.style.height = (lastH == '' || lastH == '0px')? clientH + 'px' : '0px';
//     }
// })(window,document);
document.addEventListener('DOMContentLoaded', () => {
    const accordionTrigger = document.querySelectorAll('.card-content');
    for(let i = 0; i < accordionTrigger.length; i++) {
        if(accordionTrigger[i].classList.contains('card-title')) {
            accordionTrigger[i].nextElementSibling.style.height = accordionTrigger[i].nextElementSibling.scrollheight + 'px';
            
        }
    }
});