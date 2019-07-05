// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.11/esri/copyright.txt for details.
//>>built
define("require exports ../../../core/tsSupport/extendsHelper ../../../core/tsSupport/assignHelper ../../../core/promiseUtils ../../../core/scheduling ../../../core/libs/gl-matrix-2/common ../../../core/libs/gl-matrix-2/mat2d ../../../core/libs/gl-matrix-2/mat2df64 ../../../core/libs/gl-matrix-2/vec2 ../../../core/libs/gl-matrix-2/vec2f64 ./Container ./webgl/BitBlitRenderer ./webgl/enums ./webgl/Painter ./webgl/shaders/StencilPrograms ../../support/screenshotUtils ../../webgl/BufferObject ../../webgl/context-util ../../webgl/FramebufferObject ../../webgl/programUtils ../../webgl/RenderingContext ../../webgl/VertexArrayObject".split(" "),
function(w,x,A,N,B,C,D,t,E,n,m,F,G,u,H,y,p,z,I,q,J,K,L){Object.defineProperty(x,"__esModule",{value:!0});w=function(v){function g(a,b){void 0===b&&(b={});var c=v.call(this)||this;c._renderParameters={drawPhase:0,state:c.state,pixelRatio:window.devicePixelRatio,stationary:!1,globalOpacity:1};c._renderRequested=!1;c._clipData=new Float32Array(8);c._upperLeft=m.vec2f64.create();c._upperRight=m.vec2f64.create();c._lowerLeft=m.vec2f64.create();c._lowerRight=m.vec2f64.create();c._mat2=E.mat2df64.create();
c._clipRendererInitialized=!1;c._supersampleScreenshots=!0;c.stage=c;c._stationary=!0;c.attached=!0;var f=b.canvas,f=void 0===f?document.createElement("canvas"):f,e=b.alpha,e=void 0===e?!0:e,d=b.stencil,d=void 0===d?!0:d,g=b.renderContext,g=void 0===g?"webgl":g;b=b.supersampleScreenshots;b=void 0===b?!0:b;c._canvas=f;f.setAttribute("style","width: 100%; height:100%; display:block;");a.appendChild(f);a=I.createContextOrErrorHTML(f,{alpha:e,antialias:!1,depth:!0,stencil:d},g);c.context=new K(a);c.painter=
new H.default(c.context);c._taskHandle=C.addFrameTask({render:function(){return c.renderFrame()}});c._taskHandle.pause();c._supersampleScreenshots=b;return c}A(g,v);g.prototype.destroy=function(){this.removeAllChildren();this.renderFrame();this._taskHandle.remove();this._boundFBO=this._taskHandle=null;this._clipFBO&&(this._clipFBO.dispose(),this._clipFBO=null);this._labelsFBO1&&(this._labelsFBO1.dispose(),this._labelsFBO1=null);this._labelsFBO2&&(this._labelsFBO2.dispose(),this._labelsFBO2=null);
this._blitRenderer&&(this._blitRenderer.dispose(),this._blitRenderer=null);this._clipVAO&&(this._clipVAO.dispose(),this._clipVBO=this._clipVAO=null);this._clipStencilProgram&&(this._clipStencilProgram.dispose(),this._clipStencilProgram=null);this.painter.dispose();this.context.dispose();this._canvas.parentNode&&this._canvas.parentNode.removeChild(this._canvas);this._canvas=null};Object.defineProperty(g.prototype,"background",{get:function(){return this._background},set:function(a){this._background=
a;this.requestRender()},enumerable:!0,configurable:!0});Object.defineProperty(g.prototype,"state",{get:function(){return this._state},set:function(a){this._state=a;this.requestRender()},enumerable:!0,configurable:!0});Object.defineProperty(g.prototype,"stationary",{get:function(){return this._stationary},set:function(a){this._stationary!==a&&(this._stationary=a,this.requestRender())},enumerable:!0,configurable:!0});g.prototype.requestRender=function(){this._renderRequested=!0;this._taskHandle&&this._taskHandle.resume()};
g.prototype.renderFrame=function(){this._renderRequested&&(this._renderRequested=!1,this._renderParameters.state=this._state,this._renderParameters.stationary=this.stationary,this._renderParameters.pixelRatio=window.devicePixelRatio,this._renderParameters.globalOpacity=1,this.processRender(this._renderParameters));this._renderRequested||this._taskHandle.pause()};g.prototype.setHighlightOptions=function(a){this.painter.setHighlightOptions(a)};g.prototype.renderChildren=function(a){var b=this.context,
c=this.children;this.beforeRenderChildren(a);a.drawPhase=u.WGLDrawPhase.MAP;for(var c=a.children?a.children:c,f=c.length,e=0;e<f;e++){var d=c[e];d.attached&&d.processRender(a)}var g=b.getBoundFramebufferObject();b.bindFramebuffer(this._labelsFBO2);e=a.stationary;b.setClearColor(0,0,0,e?0:1);b.clear(b.gl.COLOR_BUFFER_BIT);if(e)for(a.drawPhase=u.WGLDrawPhase.LABEL_ALPHA,a.labelFBO=this._labelsFBO1,e=0;e<f;e++)d=c[e],d.attached&&d.processRender(a);b.bindFramebuffer(g);a.labelFBO=this._labelsFBO2;a.drawPhase=
u.WGLDrawPhase.LABEL;for(e=0;e<f;e++)d=c[e],d.attached&&d.processRender(a);a=this._labelsFBO2;this._labelsFBO2=this._labelsFBO1;this._labelsFBO1=a;this.afterRenderChildren()};g.prototype.beforeRenderChildren=function(a){var b=this.context,c=a.state,f=a.pixelRatio;if(this.painter){b.enforceState();var e=c.size;a=c.rotation;var d=Math.round(e[0]*f),e=Math.round(e[1]*f);this._boundFBO=b.getBoundFramebufferObject();this._labelsFBO1&&this._labelsFBO1.width===d&&this._labelsFBO1.height===e||(this._labelsFBO1&&
(this._labelsFBO1.dispose(),this._labelsFBO2.dispose()),this._labelsFBO1=q.createWithAttachments(b,{target:3553,pixelFormat:6408,internalFormat:6408,dataType:5121,samplingMode:9728,wrapMode:33071,width:d,height:e},{colorTarget:0,depthStencilTarget:0}),b.bindFramebuffer(this._labelsFBO1),b.setDepthWriteEnabled(!0),b.setStencilWriteMask(255),b.setClearColor(0,0,0,0),b.setClearDepth(1),b.setClearStencil(0),b.clear(b.gl.COLOR_BUFFER_BIT|b.gl.DEPTH_BUFFER_BIT|b.gl.STENCIL_BUFFER_BIT),b.setDepthWriteEnabled(!1),
b.bindFramebuffer(this._boundFBO),this._labelsFBO2=q.createWithAttachments(b,{target:3553,pixelFormat:6408,internalFormat:6408,dataType:5121,samplingMode:9728,wrapMode:33071,width:d,height:e},{colorTarget:0,depthStencilTarget:0}));if(c.spatialReference&&(c.spatialReference._isWrappable?c.spatialReference._isWrappable():c.spatialReference.isWrappable)){var g=D.common.toRadian(a),k=Math.abs(Math.cos(g)),h=Math.abs(Math.sin(g)),l=Math.round(c.worldScreenWidth);if(Math.round(d*k+e*h)<=l)this._clipFrame=
!1;else{this._clipFBO&&this._clipFBO.width===d&&this._clipFBO.height===e||(this._clipFBO=new q(b,{colorTarget:0,depthStencilTarget:3,width:d,height:e}));var p=.5*d,M=.5*e,c=1/d,r=1/e,f=.5*l*f,m=.5*(d*h+e*k),d=this._upperLeft,k=this._upperRight,h=this._lowerLeft,l=this._lowerRight;n.vec2.set(d,-f,-m);n.vec2.set(k,f,-m);n.vec2.set(h,-f,m);n.vec2.set(l,f,m);t.mat2d.identity(this._mat2);t.mat2d.translate(this._mat2,this._mat2,[p,M]);0!==a&&t.mat2d.rotate(this._mat2,this._mat2,g);n.vec2.transformMat2d(d,
d,this._mat2);n.vec2.transformMat2d(k,k,this._mat2);n.vec2.transformMat2d(h,h,this._mat2);n.vec2.transformMat2d(l,l,this._mat2);a=this._clipData;a.set([2*h[0]*c-1,2*(e-h[1])*r-1,2*l[0]*c-1,2*(e-l[1])*r-1,2*d[0]*c-1,2*(e-d[1])*r-1,2*k[0]*c-1,2*(e-k[1])*r-1]);this._clipRendererInitialized||this._initializeClipRenderer(b);this._clipVBO.setData(a);this._boundFBO=b.getBoundFramebufferObject();b.bindFramebuffer(this._clipFBO);b.setDepthWriteEnabled(!0);b.setStencilWriteMask(255);b.setClearColor(0,0,0,0);
b.setClearDepth(1);b.setClearStencil(0);b.clear(b.gl.COLOR_BUFFER_BIT|b.gl.DEPTH_BUFFER_BIT|b.gl.STENCIL_BUFFER_BIT);b.setDepthWriteEnabled(!1);this._clipFrame=!0}}else this._clipFrame=!1}};g.prototype.afterRenderChildren=function(){var a=this.context;a.logIno();this._clipFrame&&this._clipRendererInitialized&&(a.bindFramebuffer(this._boundFBO),this._boundFBO=null,a.bindVAO(this._clipVAO),a.bindProgram(this._clipStencilProgram),a.setDepthWriteEnabled(!1),a.setDepthTestEnabled(!1),a.setStencilTestEnabled(!0),
a.setBlendingEnabled(!1),a.setColorMask(!1,!1,!1,!1),a.setStencilOp(7680,7680,7681),a.setStencilWriteMask(255),a.setStencilFunction(519,1,255),a.drawElements(4,6,5123,0),a.bindVAO(),a.setColorMask(!0,!0,!0,!0),a.setBlendingEnabled(!0),a.setStencilFunction(514,1,255),this._blitRenderer.render(a,this._clipFBO.colorTexture,9728,1),a.setStencilTestEnabled(!1))};g.prototype.doRender=function(a){var b=this.context,c=a.state,f=a.pixelRatio;this._resizeCanvas(a);this.context.enforceState();b.setViewport(0,
0,f*c.size[0],f*c.size[1]);b.setDepthWriteEnabled(!0);b.setStencilWriteMask(255);this.background&&this.background.color?(c=this.background.color,b.setClearColor(c.r/255,c.g/255,c.b/255,c.a)):b.setClearColor(0,0,0,0);b.setClearDepth(1);b.setClearStencil(0);b.clear(b.gl.COLOR_BUFFER_BIT|b.gl.DEPTH_BUFFER_BIT|b.gl.STENCIL_BUFFER_BIT);b.setDepthWriteEnabled(!1);v.prototype.doRender.call(this,a)};g.prototype.takeScreenshot=function(a,b){var c=p.screenshotSuperSampleSettings(a,this._supersampleScreenshots),
f=c.framebufferWidth,e=c.framebufferHeight,d=this.context,g=a.layers,k={drawPhase:null,globalOpacity:1,stationary:!0,state:this._renderParameters.state.clone(),pixelRatio:c.pixelRatio};if(null!=a.rotation){var h=k.state.viewpoint;h.rotation=a.rotation;k.state.viewpoint=h}0<g.length&&(k.children=[],g.forEach(function(a){var c=b.find(function(b){return b.layer.id===a.id});c&&c.container&&c.attached&&k.children.push(c.container)}));var l=q.create(d,{colorTarget:0,depthStencilTarget:3,width:f,height:e}),
g=d.getBoundFramebufferObject(),h=d.getViewport();d.bindFramebuffer(l);d.setViewport(0,0,f,e);f=d.gl;d.setClearColor(0,0,0,0);d.setClearDepth(1);d.setClearStencil(0);d.clear(f.COLOR_BUFFER_BIT|f.DEPTH_BUFFER_BIT|f.STENCIL_BUFFER_BIT);this.renderChildren(k);c=this._readbackScreenshot(c);d.bindFramebuffer(g);d.setViewport(h.x,h.y,h.width,h.height);this.requestRender();d=this._ensureScreenshotEncodeCanvas();a=p.encodeResult(c,a,d,{flipY:!0,premultipliedAlpha:!0});return B.resolve(a)};g.prototype._ensureScreenshotEncodeCanvas=
function(){this._screenshotEncodeCanvas||(this._screenshotEncodeCanvas=document.createElement("canvas"));return this._screenshotEncodeCanvas};g.prototype._readbackScreenshot=function(a){var b=a.framebufferWidth,c=a.framebufferHeight,f=a.region;a=a.resample;var e=this.context.gl;if(a){var d=p.createEmptyImageData(b,c,this._ensureScreenshotEncodeCanvas());e.readPixels(0,0,b,c,6408,5121,new Uint8Array(d.data.buffer));b=p.createEmptyImageData(f.width,f.height,this._ensureScreenshotEncodeCanvas());return p.resampleHermite(d,
b,!0,a.region.x,c-(a.region.y+a.region.height),a.region.width,a.region.height)}d=p.createEmptyImageData(f.width,f.height,this._ensureScreenshotEncodeCanvas());e.readPixels(f.x,c-(f.y+f.height),f.width,f.height,6408,5121,new Uint8Array(d.data.buffer));return d};g.prototype._resizeCanvas=function(a){var b=this._canvas,c=b.style,f=a.state.size,e=a.pixelRatio;a=f[0];var f=f[1],d=Math.round(a*e),e=Math.round(f*e);if(b.width!==d||b.height!==e)b.width=d,b.height=e;c.width=a+"px";c.height=f+"px"};g.prototype._initializeClipRenderer=
function(a){if(this._clipRendererInitialized)return!0;this._blitRenderer=new G;var b=y.stencil.attributes,c=J.createProgram(a,y.stencil);if(!c)return!1;var f=z.createVertex(a,35040,32),e=new Uint16Array([0,1,2,2,1,3]),e=z.createIndex(a,35044,e);a=new L(a,b,{geometry:[{name:"a_pos",count:2,type:5126,offset:0,stride:8,normalized:!1,divisor:0}]},{geometry:f},e);this._clipStencilProgram=c;this._clipVBO=f;this._clipVAO=a;return this._clipRendererInitialized=!0};return g}(F.Container);x.Stage=w});