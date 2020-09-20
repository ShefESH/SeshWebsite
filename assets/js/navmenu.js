function setNavmenuColor(document) {
    var url = window.location.href;

    if (url.indexOf("sessions") > -1) {
        let element = document.querySelector("#sessions");
        setStyle(element);
    }
    else if (url.indexOf("committee") > -1) {
        let element = document.querySelector("#committee");
        setStyle(element);
    }
    else if (url.indexOf("contact") > -1) {
        let element = document.querySelector("#contact");
        setStyle(element);
    }
    else if (url.indexOf("careers") > -1) {
        let element = document.querySelector("#careers");
        setStyle(element);
    }
    else if (url.indexOf("wiki") > -1) {
        let element = document.querySelector("#wiki");
        setStyle(element);
    }
}

function setStyle(element) {
    element.style.backgroundColor = "#1c1e29";
    element.style.borderRadius = "5px";
}