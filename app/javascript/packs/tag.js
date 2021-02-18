if (location.pathname.match("", "cards")){
    document.addEventListener("DOMContentLoaded", () => {
        const inputElement = document.getElementById("card_tag_tag");
        inputElement.addEventListener("keyup", () => {
            const keyword = document.getElementById("card_tag_tag").value;
            const XHR = new XMLHttpRequest();
            XHR.open("GET", `cards/search/?keyword=${keyword}`, true);
            XHR.responseType = "json";
            XHR.send();
            XHR.onload = () => {
                const searchResult = document.getElementById("search-result");
                searchResult.innerHTML = "";
                if (keyword == "") {
                    searchResult.innerText = "表示されたタグの候補を選択出来ます"
                } else if (XHR.response) {
                    const tagName = XHR.response.keyword;
                    tagName.forEach((tag) => {
                        const childElement = document.createElement("div");
                        childElement.setAttribute("class", "child");
                        childElement.setAttribute("id", tag.id);
                        childElement.innerHTML = tag.tag;
                        searchResult.appendChild(childElement);
                        const clickElement = document.getElementById(tag.id);
                        clickElement.addEventListener("click", () => {
                            let keywords = document.getElementById("card_tag_tag");
                            if (keywords.value.includes(",")) {
                                var addTag = `${clickElement.textContent},`
                            } else {
                                keywords.value = ""
                                var addTag = `${clickElement.textContent},`
                            }
                            keywords.value += addTag;
                            clickElement.remove();
                        });
                    });
                }
            };
        });
    });
}
