
function saveZf(zfWay) {
    window.localStorage.setItem("zfWay",zfWay);
}
function getZf() {
    return window.localStorage.getItem('zfWay');
}