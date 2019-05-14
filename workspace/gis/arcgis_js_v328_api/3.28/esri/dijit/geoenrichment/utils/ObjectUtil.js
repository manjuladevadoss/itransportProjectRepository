// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See http://js.arcgis.com/3.28/esri/copyright.txt for details.
//>>built
define("esri/dijit/geoenrichment/utils/ObjectUtil",["dojo/number"],function(g){var d={};Math.log10=Math.log10||function(a){return Math.log(a)*Math.LOG10E};d.populateObject=function(a,b,c){function f(a,b){function e(e){var d=a[e],h=b[e],l=d&&"object"===typeof d;void 0!==d&&(void 0===h?b[e]=d:h&&"object"===typeof h&&l?f(d,h):c&&(l?(h=b[e]={},f(d,h)):b[e]=a[e]))}if(a&&b&&!(Array.isArray(a)&&!Array.isArray(b)||Array.isArray(b)&&!Array.isArray(a)))if(Array.isArray(a))a.forEach(function(a,b){e(b)});else for(var d in a)e(d)}
f(b,a);return a};d.filterByPattern=function(a,b){function c(a,b,f){for(var e in a){var d=b[e];if("object"===typeof a[e]){if(d&&"object"===typeof d){var m=f[e]={};c(a[e],d,m)}}else void 0!==d&&(f[e]=d)}}var f={};c(b,a,f);return f};d.traverseObject=function(a,b){for(var c in a){var f=a[c];b(f);f&&"object"===typeof f&&d.traverseObject(f,b)}};d.copyOwnJsonProperties=function(a,b,c){b=b||{};for(var f in a){var e=a[f];a.hasOwnProperty(f)&&"function"!=typeof e&&(e&&"object"==typeof e&&c&&(e=c(f,e)),void 0!==
e&&(b[f]=e))}return b};d.removeUndefinedProperties=function(a){a&&Object.keys(a).forEach(function(b){void 0===a[b]&&delete a[b]});return a};d.roundNumber=function(a,b){return"number"!==typeof a?a:parseFloat(a.toFixed(void 0!==b?b:0))};d.getBestPrecision=function(a){return 0===a?0:Math.max(0,Math.round(Math.log10(3E3/Math.abs(a))))};var k;d.formatNumber=function(a,b){b="number"===typeof b?{places:b}:b||{};var c=b.places,f={};0<=c?f.places=c:c=-1;a=g.format(a,f);if(b.noSeparator){void 0===k&&(k=g.format(9999,
{places:0}).replace(/9/g,""));var f=k,e;if(f)for(;0<=(e=a.indexOf(f));)a=a.substr(0,e)+a.substr(e+1)}if(b.preserveTrailingZeroes||0>=c||!a)return a;for(b=a.length;0<c&&"0"==a.charAt(b-1);)b--,--c||b--;return a.substr(0,b)};d.getPlaces=function(a,b){function c(b,d){var c=a.indexOf(b,f);if(0>c)return e;b=a.charAt(c+b.length);return!b||0>d.indexOf(b)?e:c-f}a=+a;if(isNaN(a))return-1;a+="";var f=a.indexOf(".")+1,e=f?a.length-f:0;if(2>=e||!b)return e;b=0;if(!+a.substr(0,f-1))for(;"0"===a.charAt(f);)f++,
b++,e--;for(var d=e-1;2<=d;d--){var g=Math.min(c("000000000000000".substr(0,d),"01234"),c("999999999999999".substr(0,d),"56789"));if(g!==e){e=g;break}}return e+b};d.parseNumber=function(a,b,c){if(""===a)return"undefined"!==typeof c?c:NaN;if(null==a||"string"!==typeof a&&isNaN(a))return NaN;a=String(a);if(!a.trim())return void 0!==c?c:NaN;c=g.parse(a);isNaN(c)&&a.trim().length&&(c=Number(a));return isNaN(c)||void 0===b||0>b?c:g.round(c,b)};d.compareEqual=function(a,b,c){return void 0===c?a===b:Number(Number(a).toFixed(c))===
Number(Number(b).toFixed(c))};d.objectToTime=function(a){if(!a)return null;a="string"===typeof a?new Date(a):a;return a.getTime?a.getTime():Number(a)||null};d.objectToDate=function(a){return a?a.getTime?a:new Date(a):null};return d});