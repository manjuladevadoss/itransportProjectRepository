//>>built
define("dojox/grid/util",["../main","dojo/_base/lang","dojo/dom","dojo/_base/sniff"],function(n,p,q,h){var b=p.getObject("grid.util",!0,n);b.na="...";b.rowIndexTag="gridRowIndex";b.gridViewTag="gridView";b.fire=function(a,c,d){function b(a,c){if(null==a)return null;var d=c?"Width":"Height";return a["scroll"+d]>a["client"+d]?a:b(a.parentNode,c)}var f,e,k,l;if(h("webkit")&&"focus"==c){e=a.domNode?a.domNode:a;if(f=b(e,!1))k=f.scrollTop;if(e=b(e,!0))l=e.scrollLeft}var m=a&&c&&a[c];a=m&&(d?m.apply(a,d):
a[c]());h("webkit")&&"focus"==c&&(f&&(f.scrollTop=k),e&&(e.scrollLeft=l));return a};b.setStyleHeightPx=function(a,c){if(0<=c){var d=a.style;c+="px";a&&d.height!=c&&(d.height=c)}};b.mouseEvents="mouseover mouseout mousedown mouseup click dblclick contextmenu".split(" ");b.keyEvents=["keyup","keydown","keypress"];b.funnelEvents=function(a,c,d,g){g=g?g:b.mouseEvents.concat(b.keyEvents);for(var f=0,e=g.length;f<e;f++)c.connect(a,"on"+g[f],d)};b.removeNode=function(a){(a=q.byId(a))&&a.parentNode&&a.parentNode.removeChild(a);
return a};b.arrayCompare=function(a,c){for(var d=0,b=a.length;d<b;d++)if(a[d]!=c[d])return!1;return a.length==c.length};b.arrayInsert=function(a,c,b){a.length<=c?a[c]=b:a.splice(c,0,b)};b.arrayRemove=function(a,c){a.splice(c,1)};b.arraySwap=function(a,c,b){var d=a[c];a[c]=a[b];a[b]=d};return b});