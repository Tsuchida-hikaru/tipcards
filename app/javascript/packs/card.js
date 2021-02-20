document.addEventListener('DOMContentLoaded', () => {
    // トリガークラスを持つ要素を取得
    const accordionTrigger = document.querySelectorAll('.card-title');
    for (let i = 0; i < accordionTrigger.length; i++) {
        // トリガーが付いている要素を展開したときの高さを付加
        if (accordionTrigger[i].classList.contains('icon-opened')) {
            // scrollHeightプロパティでpaddingを含む表示されていない要素の高さを取得
            accordionTrigger[i].nextElementSibling.style.height = accordionTrigger[i].nextElementSibling.scrollHeight + 'px';
        }
        // トリガーを押したときのアクション
        accordionTrigger[i].addEventListener('click', (e) => {
           // クリックされた要素を取得
           let currentElement = e.currentTarget;
           // 同じ親要素を持つ隣接した次の要素（展開対象の要素）を取得
           let accordionTarget = currentElement.nextElementSibling;

           if (accordionTarget.style.height) {
               // トリガーのクラスを削除
               currentElement.classList.remove('icon-opened');
               accordionTarget.style.color = 'white'
               accordionTarget.style.height = null;
           } else {
               // トリガーのクラスを付加
               currentElement.classList.add('icon-opened');
               accordionTarget.style.color = 'black'
               // scrollHeightプロパティでpaddingを含む表示されていない要素の高さを取得
               accordionTarget.style.padding = '1rem 0px'
               accordionTarget.style.height = accordionTarget.scrollHeight + 'px';
           }
        });
    }
});