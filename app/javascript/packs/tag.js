if (location.pathname.match("", "cards")){
    document.addEventListener("DOMContentLoaded", () => {
        const inputElement = document.getElementById("card_tag_tag");
        inputElement.addEventListener("keyup", () => {
            console.log("読み込み成功");
            const keyword = document.getElementById("card_tag_tag").value;
            const XHR = new XMLHttpRequest();
            XHR.open("GET", `cards/search/?keyword=${keyword}`, true);
            XHR.responseType = "json";
            XHR.send();
            XHR.onload = () => {
                const searchResult = document.getElementById("search-result");
                searchResult.innerHTML = "";
                if (XHR.response) {
                    const tagName = XHR.response.keyword;
                    tagName.forEach((tag) => {
                        const childElement = document.createElement("div");
                        childElement.setAttribute("class", "child");
                        childElement.setAttribute("id", tag.id);
                        childElement.innerHTML = tag.tag;
                        searchResult.appendChild(childElement);
                        const clickElement = document.getElementById(tag.id);
                        clickElement.addEventListener("click", () => {
                            let keyWords = document.getElementById("card_tag_tag");
                            if (keyWords.value.includes(",")) {
                                var addTag = `${clickElement.textContent},`
                            } else {
                                keyWords.value = ""
                                var addTag = `${clickElement.textContent},`
                            }
                            keyWords.value += addTag;
                            clickElement.remove();
                        });
                    });
                }
            };
        });
    });
}
