// ==UserScript==
// @name         WhatsCrapp
// @namespace    siguza.whatscrapp
// @version      1.0
// @description  Ugh.
// @author       Siguza
// @homepage     https://github.com/Siguza/Stash/UserScripts
// @include      /^https?:\/\/web\.whatsapp\.com\/.*$/
// @grant        none
// @run-at       document-start
// ==/UserScript==
/* jshint -W097 */
'use strict';

document.head.appendChild(document.createElement('style')).innerHTML = '.butterbar.butterbar-notification{display:none}';