/*!
 * jQuery Cookie Plugin v1.4.0
 * https://github.com/carhartl/jquery-cookie
 *
 * Copyright 2013 Klaus Hartl
 * Released under the MIT license
 */
!function(e){"function"==typeof define&&define.amd?define(["jquery"],e):e(jQuery)}(function(e){function n(e){return c.raw?e:encodeURIComponent(e)}function i(e){return c.raw?e:decodeURIComponent(e)}function o(e){return n(c.json?JSON.stringify(e):String(e))}function t(e){0===e.indexOf('"')&&(e=e.slice(1,-1).replace(/\\"/g,'"').replace(/\\\\/g,"\\"));try{return e=decodeURIComponent(e.replace(u," ")),c.json?JSON.parse(e):e}catch(e){}}function r(n,i){var o=c.raw?n:t(n);return e.isFunction(i)?i(o):o}var u=/\+/g,c=e.cookie=function(t,u,d){if(u!==undefined&&!e.isFunction(u)){if(d=e.extend({},c.defaults,d),"number"==typeof d.expires){var f=d.expires,a=d.expires=new Date;a.setDate(a.getDate()+f)}return document.cookie=[n(t),"=",o(u),d.expires?"; expires="+d.expires.toUTCString():"",d.path?"; path="+d.path:"",d.domain?"; domain="+d.domain:"",d.secure?"; secure":""].join("")}for(var s=t?undefined:{},p=document.cookie?document.cookie.split("; "):[],m=0,x=p.length;m<x;m++){var k=p[m].split("="),l=i(k.shift()),g=k.join("=");if(t&&t===l){s=r(g,u);break}t||(g=r(g))===undefined||(s[l]=g)}return s};c.defaults={},e.removeCookie=function(n,i){return e.cookie(n)!==undefined&&(e.cookie(n,"",e.extend({},i,{expires:-1})),!e.cookie(n))}});