// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See http://js.arcgis.com/3.28/esri/copyright.txt for details.
//>>built
define("esri/dijit/geoenrichment/utils/LayerProjectionUtil",["esri/dijit/geoenrichment/Deferred","esri/dijit/geoenrichment/promise/all","./GraphicUtil","./ProjectionUtil"],function(g,h,k,e){function l(b,a){b.graphics&&b.graphics.filter(function(a){return!a.geometry||!a.geometry.spatialReference}).forEach(function(a){b.remove(a)});var c=b.graphics&&b.graphics.filter(function(b){return b.geometry.spatialReference.wkid!==a.wkid});if(a&&c&&c.length){var d=c.map(function(a){return a.geometry});console.log("ProjectionUtil: projecting layer graphics from "+
d[0].spatialReference.wkid+" to "+a.wkid+". Num: "+d.length);return e.projectGeometries(d,a).then(function(a){var f=[];c.forEach(function(b,d){b.setGeometry(a[d]);b.geometry||f.push(b)});f.forEach(function(a){b.remove(a)});console.log("ProjectionUtil: projected graphics: "+(d.length-f.length))})}}function m(b,a){a&&(b.spatialReference=a)}return{projectFeatureSet:function(b,a){var c=e.getSpatialReference(a);a=b.features&&b.features.filter(function(a){return a.geometry.spatialReference.wkid!==c.wkid});
if(!c||!a||!a.length)return(new g).resolve(null);a=a.map(function(a){return a.geometry});console.log("ProjectionUtil: projecting feature set to "+c.wkid+". Num: "+a.length);return e.projectGeometries(a,c).then(function(a){var c=[];b.features.forEach(function(b,d){b.setGeometry(a[d]);b.geometry&&c.push(b)});return k.createFeatureSetFromGraphics(c)})},projectLayer:function(b,a){a=e.getSpatialReference(a);return h([l(b,a),m(b,a)]).then(function(){return b})}}});