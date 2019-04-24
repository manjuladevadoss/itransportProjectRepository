// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See http://js.arcgis.com/3.28/esri/copyright.txt for details.
//>>built
define("esri/dijit/geoenrichment/utils/htmlToSvg/supportClasses/imageUtils/ImageOptimizer",["esri/dijit/geoenrichment/when","esri/dijit/geoenrichment/promise/all","esri/dijit/geoenrichment/utils/ImageUtil","esri/dijit/geoenrichment/utils/async/AsyncQueue"],function(k,l,p,q){var m={},r=/["']data:image.*?["']/ig,t={analyze:function(e,d){function c(a){var b={text:a,images:(a.match(r)||[]).map(function(a){return a.replace(/["']/g,"")}),size:a.length,totalImagesSize:0,noImageSize:0,newText:"",newSize:0},
c=0,d=a;b.images.forEach(function(a){c+=a.length;d=d.replace(a,"")});b.totalImagesSize=c;b.noImageSize=d.length;f+=b.size;g+=b.noImageSize;n+=b.totalImagesSize;return b}var f=0,g=0,n=0,h=[];return k(q.executeFunctions(e.map(function(a){return function(){var b=c(a);h.push(b)}}),0),function(){var a=1;f>d&&(a=Math.sqrt((d-g)/n));return{infos:h,factor:a,sumSize:f}})}};m.optimizeSize=function(e,d){return d?k(t.analyze(e,d),function(c){function f(e){g++;c.infos.forEach(function(a){a.newText=a.text;a.newSize=
a.size});var h;return l(c.infos.map(function(a){return l(a.images.map(function(b){h=!0;return p.scaleImage(b,{factor:c.factor*e}).then(function(c){a.newText=a.newText.replace(b,c);a.newSize=a.newText.length})})).then(function(){return a.newText})})).then(function(a){var b=0;c.infos.forEach(function(a){b+=a.newSize});if(h)return b<=d?(console.log("SVG string has been optimized "+c.sumSize/1E6+" \x3d\x3e "+b/1E6+" Mb with "+g+" iteration(s)."),a):f(e-.1);console.log("SVG can't be optimized.");return a})}
if(1<=c.factor)return k(e);var g=0;return f(.9)}):k(e)};return m});