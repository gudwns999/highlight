var hilights = "";
var scrapURI;
var userId;
var userPassward;
 
var loginInfo;
var my_tabs;
function init() {
    var port = chrome.extension.connect({
        name: "Sample Communication"
    });
    port.postMessage("Info");
    port.onMessage.addListener(function (msg) {
        loginInfo = msg;
        if(loginInfo == 0)
        {
            chrome.tabs.create({url:"http://10.229.212.158:8080/"});
        }
        else
        {
            chrome.tabs.create({url:"http://10.229.212.158:8080/highlight_insert.do"});
        }
    });
 
}
window.addEventListener('load', init);