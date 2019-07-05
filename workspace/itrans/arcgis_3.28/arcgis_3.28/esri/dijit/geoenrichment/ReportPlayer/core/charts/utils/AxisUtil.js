// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See http://js.arcgis.com/3.28/esri/copyright.txt for details.
//>>built
define("esri/dijit/geoenrichment/ReportPlayer/core/charts/utils/AxisUtil",[],function(){function p(a,c,b,d){for(var e=0,f=0;(e+1)*c<=a;)e++;for(;e*c+(f+1)*b<=a;)f++;return e*c+f*b+(d?b:-b)}var q={},k;q.getPrettifyYAxisParameters=function(a,c,b){b=b||{};var d=b.baseLineValue||0,e=b.dataLabelsSize&&a<d,f=b.dataLabelsSize&&c>d;a=Math.min(a,d);c=Math.max(c,d);var l=Math.abs(c-a);if(!k){k=[];for(var h=-20;20>h;h++){var m=Math.pow(10,h);k.push(1*m,2*m,5*m)}}for(var n,g,h=0;h<k.length;h++)if(m=k[h+1],l>
k[h]&&l<=m){n=m/5;g=n/5;break}a={majorTickStep:n,minorTickStep:g,min:0===a?0:p(Math.abs(a),n,g,0>a)*(0<a?1:-1),max:0===c?0:p(Math.abs(c),n,g,0<c)*(0<c?1:-1),includeZero:0===d,fixUpper:"none",fixLower:"none"};0===d&&(b.renderColumnBarsInOppositeDirections?a.min=-a.max:b.previewBelowZero&&(a.min=Math.min(a.min,.5*-g)));b.dataLabelsSize&&(c=b.chartSize,g=b.dataLabelsSize,l=Math.abs(a.max-a.min),e&&f||b.renderColumnBarsInOppositeDirections?(b=Math.abs(d-a.min),d=Math.abs(a.max-d),e=c*b/l,f=c*d/l,b=Math.max((a.min-
b*(e/Math.max(5,e-g)-1)*1.1)/a.min,(a.max+d*(f/Math.max(5,f-g)-1))/a.max),a.min*=b,a.max*=b):(d=l*(c/Math.max(5,c-g)-1),a.min-=e||b.renderColumnBarsInOppositeDirections?1.1*d:0,a.max+=f||b.renderColumnBarsInOppositeDirections?d:0));return a};return q});