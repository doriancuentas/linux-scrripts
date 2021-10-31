function forceDownload(url, fileName){
    var xhr = new XMLHttpRequest();
    xhr.open("GET", url, true);
    xhr.responseType = "blob";
    xhr.onload = function(){
        var urlCreator = window.URL || window.webkitURL;
        var imageUrl = urlCreator.createObjectURL(this.response);
        var tag = document.createElement('a');
        tag.href = imageUrl;
        tag.download = fileName;
        document.body.appendChild(tag);
        tag.click();
        document.body.removeChild(tag);
    }
    xhr.send();
}

document.querySelectorAll('h4 ~ * img').forEach((i)=>{
  fname = "github_linkedin" + i.src.split('/').slice(-4).join("_");
  forceDownload(i.src, fname);
  i.src= fname;
});

document.querySelectorAll('clipboard-copy').forEach((e)=>{e.parentElement.remove(e)})
l = document.querySelectorAll('h4');
t = "";
s = "";
for (i = 0; i < l.length; i++) {
    e = l[i];
    s += e.innerText;
    se = e.nextElementSibling;

    while (se != null && se.tagName != "H4") {
        s += "----____";
        s += se.outerHTML;
        // s += "||||";
        se = se.nextElementSibling;
    }

    t += "____----";
    t += s;
    s = "";
}
console.log(t);