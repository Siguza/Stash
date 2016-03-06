// ==UserScript==
// @name         NoFuckAdBlock
// @namespace    siguza.nofuckadblock
// @version      1.0
// @description  Fuck "FuckAdBlock"
// @author       Siguza
// @homepage     https://github.com/Siguza/Stash/UserScripts
// @include      /^https?:\/\/.*/.*$/
// @grant        none
// @run-at       document-start
// ==/UserScript==

window.adBlockDetected = function(){};
window.adBlockNotDetected = function(){};
// FuckAdBlock
var func = null;
var fake = {};
fake.on = function(bool, call)
{
    if(!bool)
    {
        func = call;
    }
    return fake;
};
fake.onDetected = function()
{
    return fake;
};
fake.adBlockNotDetected = fake.onNotDetected = function(call)
{
    func = call;
    return fake;
};
fake.setOption = function(){};
Object.freeze(fake);
Object.defineProperty(window, 'fuckAdBlock',
                      {
    get: function()
    {
        return fake;
    },
    set: function(val)
    {
        // lolnope
    },
});
document.addEventListener('DOMContentLoaded', function()
                          {
    if(func != null)
    {
        func();
    }
});