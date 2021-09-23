var hilights = "";
var url;
var userId;
var userPassward;
 
 
var logIn = 0;
var tabURL;
chrome.runtime.onMessage.addListener(
        function(request) {
            if(request.foo.includes("!:^"))
            {
                var data = request.foo.split("!:^");
                hilights = data[0];
            }
            else if(request.foo.includes(";@"))
            {
                if(hilights == "")
                    hilights = request.foo;
                else
                    hilights += "|" + request.foo;
            }
            else if(request.foo == "clear")
            {
                hilights = "";
                url = request.url;
            }
            else if(request.foo == "giveHighPath")
            {
                var temp = hilights;
                hilights = "";
                chrome.tabs.query({active: true, currentWindow: true}, function(tabs) {
                      chrome.tabs.sendMessage(tabs[0].id, {hi: temp}, function(response) {
                      });
                    });
            }
            else if(request.foo == "login?"){
                if(logIn != 0){
                chrome.tabs.query({active: true, currentWindow: true}, function(tabs) {
                      chrome.tabs.sendMessage(tabs[0].id, {hi: "yes"}, function(response) {
                      });
                    });
                }
            }
            else if(request.foo == "^")
                logIn = 1;
            else if(request.foo == "LOGOUT")//if(request.foo.includes("^"))
            {
                logIn = 0;
                userId = 0;
                userPassward = 0;
            }
            else if(request.foo == "give")
            {
                var temp = hilights + "!^#" + url + "!^#" + userId + "!^#" + userPassward;
                chrome.tabs.query({active: true, currentWindow: true}, function(tabs) {
                      chrome.tabs.sendMessage(tabs[0].id, {hi: temp}, function(response) {
                      });
                    });
            }
            else
            {
                 
                userId = request.foo.split("^")[0];
                userPassward = request.foo.split("^")[1];
            }
        });
 
chrome.extension.onConnect.addListener(function (port) {
    port.onMessage.addListener(function (message) {
         
 
        if (message == "Info") {
            port.postMessage(logIn);
        }
        else if (message == "loginSuc")
        {
            logIn = 1;
        }
    });
});