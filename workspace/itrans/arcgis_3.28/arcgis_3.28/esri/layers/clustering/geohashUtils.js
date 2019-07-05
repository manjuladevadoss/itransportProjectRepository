// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See http://js.arcgis.com/3.28/esri/copyright.txt for details.
//>>built
define("esri/layers/clustering/geohashUtils","dojo/has dojo/string dojo/_base/lang dojo/_base/array ../../kernel ../../geometry/Point ../../geometry/Extent ../../SpatialReference ../../geometry/webMercatorUtils".split(" "),function(H,I,J,k,K,q,l,L,z){function r(a){var b=a.spatialReference;if(!b)return{x:a.x,y:a.y};var c=b.isWebMercator(),d;4326===b.wkid?d={x:a.x,y:a.y}:c&&(d={x:a.getLongitude(),y:a.getLatitude()});return d}function t(a){var b=a.spatialReference,c=!(!b||!b.isWebMercator()),d;b&&4326===
b.wkid?d=new l(a.toJson()):c&&(d=z.webMercatorToGeographic(a,!0));return d}function u(a,b){b.x=q.prototype._normalizeX(a.x,L.prototype._info[4326]);b.y=a.y;return b}function M(a){a=f.decimals[a].toString(2);return I.pad(a,f.bitsPerBase32Char,"0")}function A(a,b){var c;b=b.slice();b.splice(1,0,0);for(var d=b[0],e=b[2],n=0;n<a.length;n++)Number(a[n])?b[0]=b[1]:b[2]=b[1],c=b[1]=(b[0]+b[2])/2,d=b[0],e=b[2];return{value:c,min:d,max:e}}function B(a,b,c){var d=[];b=b.slice();b.splice(1,0,0);for(var e=b[0],
n=b[2],f=0;f<c;f++)a>=b[1]?(b[0]=b[1],e=1):(b[2]=b[1],e=0),b[1]=(b[0]+b[2])/2,d.push(e),e=b[0],n=b[2];return{value:d.join(""),min:e,max:n}}function C(a){var b=a*f.bitsPerBase32Char;0===b%2?a=b/=2:(a=(b+1)/2,b-=a);return{lon:a,lat:b}}function N(a){var b=0;a=a.split("").reverse().join("");for(var c=0;c<a.length;c++)b+=Number(a[c])*Math.pow(2,c);return f.base32[b]}function v(a,b){var c={x:a.xmin,y:a.ymax},d={x:a.xmax,y:a.ymin},e={x:a.xmax,y:a.ymax};return{sw:g.pointToGeohash({x:a.xmin,y:a.ymin},b),nw:g.pointToGeohash(c,
b),se:g.pointToGeohash(d,b),ne:g.pointToGeohash(e,b)}}function w(a,b,c,d,e){var f=a;do e[f]||(e[f]=!0,d.push(f)),(a=f===b)||(f=h(f,c));while(!a)}function D(a,b,c,d){var e=v(a,b);a=[];w(e.sw,e.nw,"n",a,{});b=[];w(e.se,e.ne,"n",b,{});for(e=0;e<a.length;e++)w(a[e],b[e],"e",c,d)}function E(a){return k.filter(a,function(a){return 180===a.xmax?!0:!1})[0]}function F(a){return k.filter(a,function(a){return-180===a.xmin?!0:!1})[0]}function m(a,b,c,d){var e=g.geographicToWebMercator(a);a={x:e.x-b,y:e.y-b};
b=g.webMercatorToGeographic({x:e.x+b,y:e.y+b},!0);a=g.webMercatorToGeographic(a,!0);return new l(null!=c?c:a.x,a.y,null!=d?d:b.x,b.y)}function x(a,b,c,d){var e;a=v(a,b);var f,p;"min"===d?p=180:"max"===d&&(f=-180);var h=f;d=p;e=g.geohashToCell(a.sw).extent;b=g.geohashToCell(a.ne).extent;a=null!=h?h:e.xmin;e=e.ymin;d=null!=d?d:b.xmax;b=b.ymax;a=m({x:a,y:e},c,f,p);c=m({x:d,y:b},c,f,p);return new l(a.xmin,a.ymin,c.xmax,c.ymax)}function G(a,b,c){var d=a,e=0;do e++,(a=d===b)||(d=h(d,c));while(!a);return e}
function y(a,b){a=v(a,b);b=G(a.nw,a.ne,"e");return{rows:G(a.nw,a.sw,"s"),cols:b}}function h(a,b){var c=a.length%2,d=a.slice(-1),e=f.decimals[d];a=a.slice(0,-1);-1!=f.borders[b][c].indexOf(d)&&a&&(a=h(a,b));return a+f.neighbors[b][c][e]}var f={base32:"0123456789bcdefghjkmnpqrstuvwxyz",decimals:function(){for(var a={},b=0;32>b;b++)a["0123456789bcdefghjkmnpqrstuvwxyz"[b]]=b;return a}(),neighbors:{n:[null,"238967debc01fg45kmstqrwxuvhjyznp"],s:[null,"bc01fg45238967deuvhjyznpkmstqrwx"],e:[null,"14365h7k9dcfesgujnmqp0r2twvyx8zb"],
w:[null,"p0r21436x8zb9dcf5h7kjnmqesgutwvy"]},borders:{n:[null,"bcfguvyz"],s:[null,"0145hjnp"],e:[null,"prxz"],w:[null,"028b"]},bitsPerBase32Char:5,maxGeohashLength:12,longitudeRange:[-180,180],latitudeRange:[-90,90]};f.neighbors.n[0]="14365h7k9dcfesgujnmqp0r2twvyx8zb";f.neighbors.s[0]="p0r21436x8zb9dcf5h7kjnmqesgutwvy";f.neighbors.e[0]="238967debc01fg45kmstqrwxuvhjyznp";f.neighbors.w[0]="bc01fg45238967deuvhjyznpkmstqrwx";f.borders.n[0]="prxz";f.borders.s[0]="028b";f.borders.e[0]="bcfguvyz";f.borders.w[0]=
"0145hjnp";var g={geographicToWebMercator:function(a){a=q.lngLatToXY(a.x,a.y);return{x:a[0],y:a[1]}},webMercatorToGeographic:function(a,b){a=q.xyToLngLat(a.x,a.y,b);return{x:a[0],y:a[1]}},geohashToCell:function(a){for(var b=[],c=0;c<a.length;c++)b.push(M(a[c]));for(var b=b.join(""),c=[],d=[],e=0;e<b.length;e++)0===e%2?c.push(b[e]):d.push(b[e]);c=c.join("");d=d.join("");c=[c,d];b=A(c[0],f.longitudeRange);c=A(c[1],f.latitudeRange);return{point:{x:b.value,y:c.value},extent:{xmin:b.min,xmax:b.max,ymin:c.min,
ymax:c.max},geohash:a}},pointToCell:function(a,b){var c,d;b=b||f.maxGeohashLength;if(a=r(a)){a=u(a,a);c=C(b);b=B(a.x,f.longitudeRange,c.lon);var e=B(a.y,f.latitudeRange,c.lat);c=b.value;d=e.value;b={xmin:b.min,xmax:b.max,ymin:e.min,ymax:e.max};for(var e=[],g=Math.ceil((c.length+d.length)/f.bitsPerBase32Char),h=0,k=0,l=0;l<g*f.bitsPerBase32Char;l++){var m=0===l%2?c[h++]:d[k++];null==m&&(m=0);e.push(m)}c=e.join("");d=f.bitsPerBase32Char;e=c.length/d;g=[];for(h=0;h<e;h++)k=c.substr(h*d,d),g.push(N(k));
c=g.join("");return{point:a,extent:b,geohash:c}}},geohashToPoint:function(a){return g.geohashToCell(a).point},pointToGeohash:function(a,b){return(a=g.pointToCell(a,b))&&a.geohash},getCells:function(a){return k.map(a,function(a){return g.geohashToCell(a)})},getCellSize:function(a){var b=f.longitudeRange,c=f.latitudeRange,b=Math.abs(b[1]-b[0]),c=Math.abs(c[1]-c[0]);a=C(a||1);return{width:b/Math.pow(2,a.lon),height:c/Math.pow(2,a.lat)}},getCellSizeInMeters:function(a){a=g.getCellSize(a);var b=z.metersPerDegree;
a.width*=b;a.height*=b;return a},getIntersecting:function(a,b,c){b=b||1;c=c||0;var d=[],e=t(a);if(e){c&&(e=g.expandExtent(a,b,c));a=e.normalize();var f={};k.forEach(a,function(a){D(a,b,d,f)})}return d},countIntersecting:function(a,b,c){b=b||1;c=c||0;var d=0,e=t(a);if(e){c&&(e=g.expandExtent(a,b,c));a=e.normalize();if(2===a.length){d=E(a);e=F(a);c=y(d,b);var f=y(e,b);a=c.rows;c=c.cols+f.cols;d={x:d.xmin,y:d.ymax};e={x:e.xmax,y:e.ymax};d=u(d,{});e=u(e,{});d=g.pointToGeohash(d,b);b=g.pointToGeohash(e,
b);d===b&&c--;b={rows:a,cols:c}}else b=y(a[0],b);d=b.cols*b.rows}return d},getChildren:function(a){a=a||"";var b=[],c;for(c in f.decimals)b.push(a+c);return b},getNeighbors:function(a){var b=h(a,"n"),c=h(a,"s");return[b,h(b,"e"),h(b,"w"),c,h(c,"e"),h(c,"w"),h(a,"e"),h(a,"w")]},getExtentFromDistance:function(a,b){b=b||1E3;var c;(a=r(a))&&(c=m(a,b));return c},expandExtent:function(a,b,c){b=b||1;c=c||0;if(a=t(a)){if(c){a=a.normalize();if(2===a.length){var d=c;c=E(a);a=F(a);c=x(c,b,d,"min");a=x(a,b,d,
"max");360<=c.getWidth()+a.getWidth()?(b=-180,a=180):(b=c.xmin,a=a.xmax);return new l(b,c.ymin,a,c.ymax)}return x(a[0],b,c)}return a}},getNeighborsWithinDistance:function(a,b,c){c=c||1E3;b=b||1;var d=[];if(a=r(a)){c=m(a,c).normalize();var e={};k.forEach(c,function(a){D(a,b,d,e)})}return d}};H("extend-esri")&&J.setObject("layers.clustering.geohashUtils",g,K);return g});