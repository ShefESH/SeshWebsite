function setNavmenuColor(document) {
    var url = window.location.href;

    if (url.indexOf("sessions") > -1) {
        let myElement = document.querySelector("#sessions");
        myElement.style.backgroundColor = "#1c1e29";
    }
    else if (url.indexOf("committee") > -1) {
        let myElement = document.querySelector("#committee");
        myElement.style.backgroundColor = "#1c1e29";
    }
    else if (url.indexOf("contact") > -1) {
        let myElement = document.querySelector("#contact");
        myElement.style.backgroundColor = "#1c1e29";
    }
    else if (url.indexOf("careers") > -1) {
        let myElement = document.querySelector("#careers");
        myElement.style.backgroundColor = "#1c1e29";
    }
    else if (url.indexOf("wiki") > -1) {
        let myElement = document.querySelector("#wiki");
        myElement.style.backgroundColor = "#1c1e29";
    }
}