// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See http://js.arcgis.com/3.28/esri/copyright.txt for details.
//>>built
define("esri/layers/vectorTiles/views/2d/engine/webgl/mesh/templates/WGLFillTemplate","require exports ../../../../../../core/tsSupport/extendsHelper dojo/has ../../../../../../core/Logger ../../../../../../core/libs/earcut/earcut ../../color ../../definitions ../../enums ../../enums ../../number ../../TileClipper ../../WGLDisplayRecord ../Tesselator ./WGLMeshTemplate".split(" "),function(w,C,F,G,H,I,J,K,B,L,m,M,D,N,O){Object.defineProperty(C,"__esModule",{value:!0});var P=H.getLogger("esri.views.2d.engine.webgl.mesh.templates.WGLFillTemplate"),
u=[],A=[];w=function(w){function l(c,a,d,e,b,g,f,k){var h=w.call(this)||this;h.fillColor=e;h.tl=b;h.br=g;h.aux=f;h.isBFS=k;h.geometryType=B.WGLGeometryType.FILL;h.useLibtess=!1;e=G("esri-featurelayer-webgl");h.useLibtess="libtess"===((e||{}).tesselator||"libtess");h.useLibtess&&(h._tesselator=new N.default);h.vvFlags=a;h._materialStore=c;h.materialId=h._materialStore.createSpriteMaterial(d,h.geometryType,a);h._tileClipper=new M.TileClipper(0,0,0,1,8);h._tileClipper.setExtent(512);return h}F(l,w);
l.fromSimpleFill=function(c,a,d,e,b,g){void 0===g&&(g=!1);d=(b=d.color)&&"none"!==d.style&&J.premultiplyAlphaRGBA(b)||0;if(!e)return new l(c,a,null,d,0,0,0,g);var f=e.rect;b=f.x+1;var k=f.y+1,h=f.x+1+e.width,E=f.y+1+e.height,f=m.i1616to32(b,k),r=m.i1616to32(h,E);b=m.i8888to32(m.nextHighestPowerOfTwo(h-b),m.nextHighestPowerOfTwo(E-k),0,0);return new l(c,a,e,d,f,r,b,g)};l.fromPictureFill=function(c,a,d,e,b,g){void 0===g&&(g=!1);b=K.PICTURE_FILL_COLOR;var f=e.rect,k=f.x+1+e.width,h=f.y+1+e.height,f=
m.i1616to32(f.x+1,f.y+1),k=m.i1616to32(k,h);d=m.i8888to32(m.nextHighestPowerOfTwo(d.width),m.nextHighestPowerOfTwo(d.height),0,0);return new l(c,a,e,b,f,k,d,g)};l.prototype.writeMesh=function(c,a,d,e,b,g,f){u.length=0;if(this.vvFlags&L.WGLVVFlag.COLOR||0!==this.fillColor)if("esriGeometryPolygon"!==d)P.error("Unable to handle geometryType: "+d);else{var k=b.geometry,k=(b=this._isClippingRequired(k))?this._clip(k,!this.useLibtess):k.rings;return this.useLibtess?this._writeMeshLibtess(c,a,d,e,k,b,g,
f):this._writeMeshEarcut(c,a,d,e,k,b,g,f)}};l.prototype._isClippingRequired=function(c){var a=0;for(c=c.rings;a<c.length;a++){var d=c[a],e=d.length;if(!(3>e)){var b=d[0][0],g=d[0][1];if(-8>b||520<b||-8>g||520<g)return!0;for(var f=1;f<e;++f)if(b+=d[f][0],g+=d[f][1],-8>b||520<b||-8>g||520<g)return!0}}return!1};l.prototype._clip=function(c,a){var d;this._tileClipper.reset(3);for(var e=0,b=c.rings;e<b.length;e++){var g=b[e],f=g.length;if(!(3>f)){c=g[0][0];d=g[0][1];this._tileClipper.moveTo(c,d);for(var k=
1;k<f;++k)c+=g[k][0],d+=g[k][1],this._tileClipper.lineTo(c,d);this._tileClipper.close()}}return this._tileClipper.result(a)};l.prototype._writeMeshLibtess=function(c,a,d,e,b,g,f,k){if(b&&b.length){d=this._materialStore.get(this.materialId);f=[];var h=a.indexVector;a=a.get("geometry");var l=new D(e,this.geometryType,this.materialId),r=this._getOffset(a,d);l.vertexFrom=r;l.indexFrom=h.length;c.push(l);this._tesselator.beginPolygon(u,f);for(c=0;c<b.length;c++){var v=b[c];if(!(3>v.length)){this._tesselator.beginContour();
var p=void 0,t=void 0;g?(p=v[0].x,t=v[0].y):(p=v[0][0],t=v[0][1]);var n=[p,t,0];this._tesselator.addVertex(n,n);for(n=1;n<v.length-1;n++){var q=void 0,m=void 0;g?(p=v[n].x,t=v[n].y):(q=v[n][0],m=v[n][1],p+=q,t+=m);q=[p,t,0];this._tesselator.addVertex(q,q)}this._tesselator.endContour()}}this._tesselator.endPolygon();this._writeVerticesLibTess(l,a,e,u,d,k);this._writeIndicesLibTess(l,h,r,f)}};l.prototype._writeMeshEarcut=function(c,a,d,e,b,g,f,k){if(b&&b.length){d=this._materialStore.get(this.materialId);
f=a.indexVector;a=a.get("geometry");var h=new D(e,this.geometryType,this.materialId),l=this._getOffset(a,d);h.vertexFrom=l;h.indexFrom=f.length;c.push(h);for(var r=c=0,m=0;m<b.length;m++){var p=b[m],t=r,n=void 0,q=void 0;g?(n=p[0].x,q=p[0].y):(n=p[0][0],q=p[0][1]);u[r++]=n;u[r++]=q;for(var w=0,x=1;x<p.length;++x){var y=void 0,z=void 0;g?(y=n,z=q,n=p[x].x,q=p[x].y,y=n-y,z=q-z):(y=p[x][0],z=p[x][1],n+=y,q+=z);w-=y*(q+q+z);u[r++]=n;u[r++]=q}0<w?(0<t-c&&(this._write(h,f,a,l,e,u,A,c,t,d,k),c=t),A.length=
0):0>w?0<t-c?A.push(.5*(t-c)):r=t:r=t}0<r-c&&this._write(h,f,a,l,e,u,A,c,r,d,k);u.length=A.length=0}};l.prototype._write=function(c,a,d,e,b,g,f,k,h,l,m){e=I(g.slice(k,h),f,2);e.length&&(k=this._getOffset(d,l),this._writeVertices(c,d,b,g,f,l,m),this._writeIndices(c,a,k,e))};l.prototype._getOffset=function(c,a){a=a.materialKeyInfo.hasVV()?8:6;return c.length/a};l.prototype._writeVertices=function(c,a,d,e,b,g,f){for(b=0;b<e.length;b+=2){var k=m.i1616to32(e[b],e[b+1]);a.push(k);a.push(d);a.push(this.fillColor);
a.push(this.tl);a.push(this.br);a.push(this.aux);this._writeVV(a,f,g);c.vertexCount++}};l.prototype._writeIndices=function(c,a,d,e){for(var b=0;b<e.length;b+=3)a.push(d+e[b]),a.push(d+e[b+1]),a.push(d+e[b+2]),c.indexCount+=3};l.prototype._writeVerticesLibTess=function(c,a,d,e,b,g){for(var f=0;f<e.length;f+=2){var k=m.i1616to32(e[f],e[f+1]);a.push(k);a.push(d);a.push(this.fillColor);a.push(this.tl);a.push(this.br);a.push(this.aux);this._writeVV(a,g,b);c.vertexCount++}};l.prototype._writeIndicesLibTess=
function(c,a,d,e){for(var b=0;b<e.length;b++)a.push(d+e[b]),c.indexCount++};l.prototype._writeVV=function(c,a,d){d.materialKeyInfo.hasVV()&&(this.isBFS?(c.push(4294967295),c.push(4294967295)):(c.push(a[B.VVType.COLOR]),c.push(a[B.VVType.OPACITY])))};return l}(O.default);C.default=w});