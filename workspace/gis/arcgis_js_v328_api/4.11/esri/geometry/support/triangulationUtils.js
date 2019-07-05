// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.11/esri/copyright.txt for details.
//>>built
define(["require","exports","../../core/libs/earcut/earcut","./coordsUtils","./meshUtils/deduplicate"],function(z,r,v,w,x){function y(a,f,e){if(1===a.length)return a[0];f=new Float64Array(f);e=new Uint32Array(e);for(var h=0,k=0,b=0,g=0;g<a.length;g++){for(var p=a[g],d=0;d<p.position.length;d++)f[h++]=p.position[d];for(d=0;d<p.faces.length;d++)e[k++]=p.faces[d]+b;b=h/3}return{position:f,faces:e}}function t(a,f){for(var e=a.length,h=Array(e),k=Array(e),b=Array(e),g=0,p=0,d=0,q=0,l=0;l<e;++l)q+=a[l].length;
for(var q=new Float64Array(3*q),n=0,r=e-1;0<=r;r--){var c=a[r],m=!w.isClockwise(c,!1,!1);if(m&&1!==e)h[g++]=c;else{for(var t=c.length,l=0;l<g;++l)t+=h[l].length;l={index:n,pathLengths:Array(g+1),count:t,holeIndices:Array(g)};l.pathLengths[0]=c.length;0<c.length&&(b[d++]={index:n,count:c.length});n=m?u(c,c.length-1,-1,q,n,c.length,f):u(c,0,1,q,n,c.length,f);for(c=0;c<g;++c)m=h[c],l.holeIndices[c]=n,l.pathLengths[c+1]=m.length,0<m.length&&(b[d++]={index:n,count:m.length}),n=u(m,0,1,q,n,m.length,f);
g=0;0<l.count&&(k[p++]=l)}}for(c=0;c<g;++c)m=h[c],0<m.length&&(b[d++]={index:n,count:m.length}),n=u(m,0,1,q,n,m.length,f);p<e&&(k.length=p);d<e&&(b.length=d);return{position:q,polygons:k,outlines:b}}function u(a,f,e,h,k,b,g){k*=3;for(var p=0;p<b;++p){var d=a[f];h[k++]=d[0];h[k++]=d[1];h[k++]=g?d[2]:0;f+=e}return k/3}Object.defineProperty(r,"__esModule",{value:!0});r.triangulate=function(a){var f=t(a.rings,a.hasZ),e=[],h=0,k=0;a=function(a){var d=a.index,b=new Float64Array(f.position.buffer,3*d*f.position.BYTES_PER_ELEMENT,
3*a.count);a=a.holeIndices.map(function(a){return a-d});a=new Uint32Array(v(b,a,3));e.push({position:b,faces:a});h+=b.length;k+=a.length};for(var b=0,g=f.polygons;b<g.length;b++)a(g[b]);a=y(e,h,k);b=x.default(a.position.buffer,6,a.faces);a.position=new Float64Array(b.buffer);a.faces=b.indices;return a};r.pathsToTriangulationInfo=t});