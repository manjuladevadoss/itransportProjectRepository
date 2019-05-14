// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See http://js.arcgis.com/3.28/esri/copyright.txt for details.
//>>built
define("esri/dijit/geoenrichment/utils/htmlToSvg/supportClasses/DomProcessor",["dojo/dom-construct","./text/ReplaceUtil"],function(e,k){var f=/^ /,g=/ $/,h={_tempNode:null,cleanUp:function(){this._tempNode&&e.destroy(this._tempNode);this._tempNode=null},replaceTextWithSpans:function(b,c){if(2>b.childNodes.length)1===b.childNodes.length&&(c=b.childNodes[0],"#text"===c.nodeName&&(c=h._provideSpansToPreserveNBSPs(c))&&b.innerHTML!==c&&(b.innerHTML=c));else{for(c=[];b.childNodes.length;)c.push(b.removeChild(b.childNodes[0]));
c.forEach(function(a){if("#text"===a.nodeName){if(a=h._provideSpansToPreserveNBSPs(a,!1))if(a=e.create("span",{innerHTML:a}),1===a.childNodes.length)e.place(a,b);else for(;a.childNodes.length;)b.appendChild(a.removeChild(a.childNodes[0]))}else e.place(a,b)})}this._processWhiteSpacesInSpans(b)},_provideSpansToPreserveNBSPs:function(b,c){b=this._getDisplayedText(b);return b.trim()?function(a){var b=!1;a=a.replace(/([^;])(&nbsp;)([^&])/g,"$1 $3");-1!==a.indexOf("\x26nbsp;")&&(a=a.split("\x26nbsp;").map(function(a){return a?
(b=!0,"\x3cspan\x3e"+a+"\x3c/span\x3e"):a}).join("\x26nbsp;"));b&&(a=a.replace(/((&nbsp;)+)/g,"\x3cspan\x3e$1\x3c/span\x3e"));return a}(b):c?k.removeReturns(b):null},_getDisplayedText:function(b){this._tempNode=this._tempNode||e.create("div",null,document.body);var c;b.parentNode?c=b.parentNode.innerHTML:(this._tempNode.appendChild(b),c=b.parentNode.innerHTML,this._tempNode.removeChild(b));return c||""},_processWhiteSpacesInSpans:function(b){for(var c=0;c<b.childNodes.length;c++){var a=b.childNodes[c-
1],d=b.childNodes[c];a&&"SPAN"===a.nodeName&&"SPAN"===d.nodeName&&(a.innerHTML.trim()||d.innerHTML.trim())&&(!a.innerHTML.trim()&&f.test(d.innerHTML)?d.innerHTML=d.innerHTML.substr(1):g.test(a.innerHTML)&&!d.innerHTML.trim()?a.innerHTML=a.innerHTML.substr(0,a.innerHTML.length-1):!g.test(a.innerHTML)&&f.test(d.innerHTML)?(d.innerHTML=d.innerHTML.substr(1),e.create("span",{innerHTML:" "},a,"after"),c++):g.test(a.innerHTML)&&!f.test(d.innerHTML)&&(a.innerHTML=a.innerHTML.substr(0,a.innerHTML.length-
1),e.create("span",{innerHTML:" "},a,"after"),c++))}}};return h});