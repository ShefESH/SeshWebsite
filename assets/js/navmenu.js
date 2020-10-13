function setNavmenuColor(document) {
    var url = window.location.href;
    console.log(url)
    // Highlighting for the wiki and sub-directories
    if (url.indexOf("wiki") > -1) {
        if (url.indexOf("worksheets") > -1) {
            setStyle(document.querySelector("#worksheets"))
        } else if (url.indexOf("sessions") > -1) {
            setStyle(document.querySelector("#past-sessions "))
        } else if (url.indexOf("resources") > -1) {
            setStyle(document.querySelector("#resources"))
        } else if (url.indexOf("virtual-machine") > -1) {
            setStyle(document.querySelector("#virtual-machine"))
        } else {
            setStyle(document.querySelector("#wiki-home"))
        }
        setStyle(document.querySelector("#wiki"));
    // Highligting for careers and sub-directories
    } else if (url.indexOf("careers") > -1) {
        if (url.indexOf("partners") > -1) {
            setStyle(document.querySelector("#partners"))
        } else if (url.indexOf("opportunities") > -1) {
            setStyle(document.querySelector("#opportunities"))
        } else {
            setStyle(document.querySelector("#careers-home"))
        }
        setStyle(document.querySelector("#careers"));
    // Highligting for sessions, committee and contact and the main home
    } else if (url.indexOf("sessions") > -1) {
        setStyle(document.querySelector("#sessions"));
    } else if (url.indexOf("committee") > -1) {
        setStyle(document.querySelector("#committee"));
    } else if (url.indexOf("contact") > -1) {
        setStyle(document.querySelector("#contact"));
    } else if (url.indexOf("") > -1) {
        setStyle(document.querySelector("#home"));
    }
}

function setStyle(element) {
    element.style.backgroundColor = "#1c1e29";
    element.style.borderRadius = "5px";
}

const nav = document.querySelector('nav.nav')
const head = document.querySelector('header')
const navTop = nav.offsetTop

function stickyNav() {
    if (window.scrollY >= navTop) {
        nav.classList.add('sticky')
        head.style.paddingBottom = `${nav.offsetHeight}px`
    } else {
        nav.classList.remove('sticky')
        head.style.paddingBottom = 0
    }
}

window.addEventListener('scroll', stickyNav)
