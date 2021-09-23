var temp;
var on = 0;
var post = 0;
var cnt = 0;
var saveHi = new Array();  // length =  갯수 0 1 2 3 4 구분자 &
var time = 0;
var color = [0, "#FFEB5A", "#96FFFF",  "#51FFA6", ];
var st_x, st_y;
function getDomPath(el) {
      if (!el) {
        return;
      }
      var stack = [];
      var isShadow = false;
      while (el.parentNode != null) {
        var sibCount = 0;
        var sibIndex = 0;
        for ( var i = 0; i < el.parentNode.childNodes.length; i++ ) {
          var sib = el.parentNode.childNodes[i];
          if ( sib.nodeName == el.nodeName ) {
            if ( sib === el ) {
              sibIndex = sibCount;
            }
            sibCount++;
          }
        }
        var nodeName = el.nodeName.toLowerCase();
        if (isShadow) {
          nodeName += "::shadow";
          isShadow = false;
        }
        if ( sibCount > 1 ) {
          stack.unshift(nodeName + ':(' + (sibIndex + 1) + ')');
        } else {
          stack.unshift(nodeName);
        }
        el = el.parentNode;
        if (el.nodeType === 11) { // for shadow dom, we
          isShadow = true;
          el = el.host;
        }
      }
      stack.splice(0,1); // removes the html element
      return stack.join('-');
    }
function getObjByPath(path)
{
    var patharr = path.toString().split("-");
    var domObj = document.body;
    for(var i = 1; i < patharr.length; i++)
    {
        var now = patharr[i];
        var ind = 1;
        if(now.includes(":")){
            var temp = now.split(":");
            now = temp[0];
            var ind = Number(temp[1].split("(")[1].replace(")",""));
        }
        var nind = 0;
        for(var j = 0; j < domObj.childNodes.length ; j++)
        {
            var sib = domObj.childNodes[j];
            if(sib.nodeName.toLowerCase() == now)
            {
                nind++;
            }   
            if(nind == ind)
            {
                domObj = sib;
                break;
            }
        }
    }
    return domObj;
}
 
function hilighting(selected_s, selected_e, startOffset, endOffset, col, type) {
    var ttemp;
    var temp;
    var span;
    var text;
    var textNode;
    var plag = 0;
    var selected = selected_s;
        while(true){
        //  alert("count");
            if(selected == null ){
            //  alert("다시 부모 옆으로!");
                if(plag == 1){
                //  alert("type 1");
                    selected = temp.nextSibling;
                    plag = 0;
                    continue;
                }
                else
                {
            //      alert("type 2");
                    selected = temp.parentNode.nextSibling;
                    if(selected == null)
                    {
                        temp = temp.parentNode;
                        //alert(temp.nodeName);
                        continue;
                    }
                }
            }
            plag = 0;
            temp = selected;
 
             
            if(temp.nodeType != 3)
            {
                selected = temp.childNodes[0];
                plag = 1;
                continue;
            }
            text = temp.nodeValue;
            if(text.length <= 1)
            {
                selected = selected.nextSibling;
                continue;
            }
            span = document.createElement("span");
            span.style.backgroundColor = col;
            if(temp == selected_s){
                if(selected_s == selected_e){
    //              alert("같으면서 끝");
                    temp.nodeValue = text.substring(0, startOffset);
                    textNode = document.createTextNode(text.substring(startOffset, endOffset));
                    span.appendChild(textNode);
                    temp.parentNode.insertBefore(span, temp.nextSibling);
                    textNode = document.createTextNode(text.substring(endOffset));
                    temp.parentNode.insertBefore(textNode, temp.nextSibling.nextSibling);
                    selected = temp.nextSibling.nextSibling.nextSibling;
                    break;          
                }else{
            //      alert("시작");
                        temp.nodeValue = text.substring(0, startOffset);
                        textNode = document.createTextNode(text.substring(startOffset));
                        span.appendChild(textNode);
                        temp.parentNode.insertBefore(span, temp.nextSibling);
                        selected = temp.nextSibling.nextSibling;
                }
            } else if(temp == selected_e) {
            //  alert("끝");
                    temp.nodeValue = "";
                    textNode = document.createTextNode(text.substring(0, endOffset));
                    span.appendChild(textNode);
                    temp.parentNode.insertBefore(span, temp.nextSibling);
                    textNode = document.createTextNode(text.substring(endOffset));
                    temp.parentNode.insertBefore(textNode, temp.nextSibling.nextSibling);
                    break;
            } else {
            //  alert("중간");
                temp.nodeValue = "";
                textNode = document.createTextNode(text);
                span.appendChild(textNode);
                temp.parentNode.insertBefore(span, temp.nextSibling);
                selected = temp.nextSibling.nextSibling;
            }
 
        }
}
 
 
 
function save_hilight(path_s, path_e, startOffset, endOffset, col)
{
    var list = path_s + ";@" + path_e + ";@" + startOffset + ";@" + endOffset + ";@" + col;
    chrome.runtime.sendMessage({foo: list});
}
 
$(document).keydown(function(event) {
    if(event.keyCode == '192')
    {
        on = 1;
        if(time)
            clearTimeout(time);
        time = setTimeout(function() {on = 0;} , 3000);
    }
    else if(event.keyCode == '49')
    {
        on = 2;
        if(time)
            clearTimeout(time);
        time = setTimeout(function() {on = 0;} , 3000);
    }
    else if(event.keyCode == '50')
    {
        on = 3;
        if(time)
            clearTimeout(time);
        time = setTimeout(function() {on = 0;} , 3000);
    }
})
 
 
$(document).mousedown(function(event) {
    st_x = event.pageX;
    st_y = event.pageY;
})
 
function getLoginInfo(event){
        var user_id = $('#user_id').val();
        var user_password = $('#user_password').val();
        var list = user_id + "^" + user_password;
        chrome.runtime.sendMessage({foo: list});
 
}
function getPageInfo(event) {
    event.stopPropagation();
    list = $('#highPath').text();
    url = $('#urlID').text();
    chrome.runtime.sendMessage({foo: list + "!:^ "});
    if(url.includes("?"))
        location.href = url + "&highPathFlag=TRUE";
    else
        location.href = url + "?highPathFlag=TRUE";
}
 
function logoutFunc(evnet) {
    chrome.runtime.sendMessage({foo: "LOGOUT"});
}
$("document").ready(function(){
    //우리 주소
    chrome.extension.onMessage.addListener(function(request, sender, sendResponse) {
        var data = request.hi;
        if(data.includes("!^#"))
        {
            data = data.split("!^#");
            var obj = document.getElementById('scrap_highlights');
            if(obj != null)
                obj.value = data[0];
            obj = document.getElementById('scrap_uri');
            if(obj != null)
                obj.value = data[1];
            obj = document.getElementById('user_id');
            if(obj != null)
                obj.value = data[2];
            obj = document.getElementById('user_passwd');
            if(obj != null)
                obj.value = data[3];
        }
        else if(data == "yes")
        {
            location.href = "http://10.229.212.158:8080/index.do";
        }
        else
        {
            var data = request.hi.split("|");
            for(var i = 0; i<data.length ; i++)
            {
                var h = data[i];
                h = h.split(";@");
                hilighting(getObjByPath(h[0]), getObjByPath(h[1]), Number(h[2]), Number(h[3]), color[Number(h[4])]);
            }
        }
    });
     
    url = location.href;
    //밑줄 그어야 하는지
    if(url.includes("highPathFlag=TRUE"))
    {
        chrome.runtime.sendMessage({foo: "giveHighPath"});
    }
    //홈 페이지
     if(url.includes("http://10.229.212.158:8080"))
    {
        if(url.includes("index.do"))
        {
            chrome.runtime.sendMessage({foo: "^"});
        }
        else if(url == "http://10.229.212.158:8080/" || url.includes("login.do") || url.includes("register_h.do"))
        {
             chrome.runtime.sendMessage({foo: "login?"});
            document.querySelector('#loginForm').addEventListener('submit', getLoginInfo);
        }
        else if(url.includes("highlight_insert.do"))
        {
            chrome.runtime.sendMessage({foo: "give"});
        }
        var page = document.getElementById("urlID");
        if(page != null )
        {
            page.addEventListener('click', getPageInfo);
        }
        var logout = document.getElementById("logout");
        if(logout != null)
        {
            logout.addEventListener('click', logoutFunc);
        }
    }
    else
    {
        chrome.runtime.sendMessage({foo: "clear" , url : location.href});
    }
    //로그인 페이지
    $("*").mouseup(function(event) {
        if(on != 0)
        {
            var ed_x = event.pageX;
            var ed_y = event.pageY;
            event.stopPropagation();
            clearTimeout(time);
            time = 0;
            var param =  window.getSelection();
            var param2 = param.getRangeAt(0);
            var ps = param.anchorNode;
            var pe = param.focusNode;
            if(ps == pe ||  !(st_y >= ed_y + 15 || st_y >= ed_y - 15 && st_x > ed_x) )
            {
                path_s = getDomPath(param.anchorNode);
                path_e = getDomPath(param.focusNode);
                startOffset = param2.startOffset;
                endOffset =  param2.endOffset;
            }
            else
            {
                path_e = getDomPath(param.anchorNode);
                path_s = getDomPath(param.focusNode);
                endOffset = param2.startOffset;
                startOffset =  param2.endOffset;
            }
     
 
            hilighting(getObjByPath(path_s),getObjByPath(path_e), startOffset, endOffset, color[on]);
            save_hilight(path_s, path_e, startOffset, endOffset, on);
            on = 0;
        }
    });
})