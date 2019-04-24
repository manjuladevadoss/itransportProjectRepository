// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See http://js.arcgis.com/3.28/esri/copyright.txt for details.
//>>built
require({cache:{"url:esri/layers/vectorTiles/views/2d/engine/webgl/shaders/heatmapShaders.xml":'\x3csnippets\x3e\r\n  \x3csnippet name\x3d"heatmapVS"\x3e\r\n  \x3c![CDATA[\r\n    attribute vec2 a_pos;\r\n    attribute vec2 a_tex;\r\n\r\n    uniform mediump vec2 u_minmax;\r\n\r\n    varying mediump vec2 v_uv;\r\n    varying mediump float v_slope;\r\n\r\n    void main(void) {\r\n      gl_Position \x3d vec4(a_pos, 0.0, 1.0);\r\n      v_uv \x3d a_tex;\r\n      v_slope \x3d 1.0 / (u_minmax.y - u_minmax.x);\r\n    }\r\n  ]]\x3e\r\n  \x3c/snippet\x3e\r\n\r\n  \x3csnippet name\x3d"heatmapFS"\x3e\r\n  \x3c![CDATA[\r\n    \tprecision mediump float;\r\n\r\n      uniform lowp sampler2D u_texture;\r\n      uniform lowp float u_opacity;\r\n      uniform mediump vec2 u_minmax;\r\n      uniform lowp sampler2D u_gradient;\r\n\r\n      varying mediump vec2 v_uv;\r\n      varying mediump float v_slope;\r\n\r\n      vec4 getColor(float intensity) {\r\n        float normalizedIntensity \x3d clamp((intensity - u_minmax.x) * v_slope, 0.0, 1.0);\r\n\r\n        return texture2D(u_gradient, vec2(0.5, normalizedIntensity));\r\n      }\r\n\r\n      void main() {\r\n      // sample the intnsity value\r\n        lowp vec4 color \x3d texture2D(u_texture, v_uv);\r\n\r\n        // interpolate the color from the ramp using the intensity value\r\n        gl_FragColor \x3d getColor(color.r) *  u_opacity;\r\n      }\r\n  ]]\x3e\r\n  \x3c/snippet\x3e\r\n\x3c/snippets\x3e\r\n'}});
define("esri/layers/vectorTiles/views/2d/engine/webgl/passes/WGLPaintPassHeatmap","require exports dojo/text!../shaders/heatmapShaders.xml ../../../../webgl/BufferObject ../../../../webgl/FramebufferObject ../../../../webgl/Program ../../../../webgl/ShaderSnippets ../../../../webgl/Texture ../../../../webgl/VertexArrayObject".split(" "),function(g,h,m,n,p,q,k,l,r){Object.defineProperty(h,"__esModule",{value:!0});g=function(){function e(){this._initWGLExtensions=this._initialized=!1}e.prototype.dispose=
function(){this._program&&(this._program.dispose(),this._program=null);this._vertexArrayObject&&(this._vertexArrayObject.dispose(),this._vertexArrayObject=null);this._intensityFBO&&(this._intensityFBO.dispose(),this._intensityFBO=null);this._gradientTex&&(this._gradientTex.dispose(),this._gradientTex=null);this._boundFBO=null};e.prototype.preRender=function(a,c){console.log("Heatmap: Running prerender");a=a.context;c=a.getViewport();this._bindHeatmapSurface(a,c.width,c.height)};e.prototype.postRender=
function(a,c){console.log("Heatmap: Running postrender");this._drawHeatmap(a.context,a.rendererInfo,1)};e.prototype._bindHeatmapSurface=function(a,c,d){if(!this._initWGLExtensions){var b=a.gl.getSupportedExtensions();if(-1===b.indexOf("OES_texture_float_linear")||-1===b.indexOf("WEBGL_color_buffer_float"))throw Error("Required WebGL extensions needed for the heatmap drawing are not available!");a.gl.getExtension("OES_texture_float_linear");a.gl.getExtension("WEBGL_color_buffer_float");this._initWGLExtensions=
!0}c=Math.round(c/4);d=Math.round(d/4);this._intensityFBO&&this._intensityFBO.width===c&&this._intensityFBO.height===d||(this._intensityFBO&&this._intensityFBO.dispose(),b=new l(a,{target:3553,internalFormat:34836,pixelFormat:6408,dataType:5126,samplingMode:9729,wrapMode:33071,width:c,height:d}),this._intensityFBO=p.createWithAttachments(a,b,{colorTarget:0,depthStencilTarget:3,width:c,height:d,multisampled:!1}));this._boundFBO=a.getBoundFramebufferObject();a.bindFramebuffer(this._intensityFBO);this._prevVP=
a.getViewport();a.setViewport(0,0,c,d);a.setStencilWriteMask(255);a.setClearColor(0,0,0,0);a.setClearStencil(0);a.clear(a.gl.COLOR_BUFFER_BIT|a.gl.STENCIL_BUFFER_BIT)};e.prototype._drawHeatmap=function(a,c,d){a.bindFramebuffer(this._boundFBO);this._boundFBO=null;a.setViewport(this._prevVP.x,this._prevVP.y,this._prevVP.width,this._prevVP.height);this._initialized||(this._initialized=this._initialize(a));a.setBlendFunctionSeparate(1,771,1,771);a.setBlendingEnabled(!0);a.bindVAO(this._vertexArrayObject);
a.bindProgram(this._program);a.bindTexture(this._intensityFBO.colorTexture,2);this._program.setUniform1i("u_texture",2);this._program.setUniform1f("u_opacity",d);c=c.heatmapParameters;this._updateGradient(a,c);this._program.setUniform2f("u_minmax",c.minPixelIntensity,c.maxPixelIntensity);a.setActiveTexture(5);a.bindTexture(this._gradientTex,5);this._program.setUniform1i("u_gradient",5);a.drawArrays(5,0,4);a.bindVAO()};e.prototype._initialize=function(a){if(this._initialized)return!0;var c={a_pos:0,
a_tex:1};this._shaderSnippets=new k;k.parse(m,this._shaderSnippets);var d=new q(a,this._shaderSnippets.heatmapVS,this._shaderSnippets.heatmapFS,c);if(!d)return!1;var b=new Int8Array(16);b[0]=-1;b[1]=-1;b[2]=0;b[3]=0;b[4]=1;b[5]=-1;b[6]=1;b[7]=0;b[8]=-1;b[9]=1;b[10]=0;b[11]=1;b[12]=1;b[13]=1;b[14]=1;b[15]=1;a=new r(a,c,{geometry:[{name:"a_pos",count:2,type:5120,offset:0,stride:4,normalized:!1,divisor:0},{name:"a_tex",count:2,type:5120,offset:2,stride:4,normalized:!1,divisor:0}]},{geometry:n.createVertex(a,
35044,b)});this._program=d;this._vertexArrayObject=a;return this._initialized=!0};e.prototype._updateGradient=function(a,c){if(!this._gradientTex||c.color.refreshColorRamp){this._gradientTex&&(this._gradientTex.dispose(),this._gradientTex=null);this._gradientTex=new l(a,{target:3553,internalFormat:6408,pixelFormat:6408,dataType:5121,samplingMode:9728,wrapMode:33071,width:1,height:512});a=document.createElement("CANVAS");a.width=1;a.height=512;for(var d=a.getContext("2d"),b=c.color,e=[],f=0;f<b.values.length;++f)e.push({ratio:b.values[f],
color:"rgba("+Math.floor(255*b.colors[4*f+0])+", "+Math.floor(255*b.colors[4*f+1])+", "+Math.floor(255*b.colors[4*f+2])+", "+b.colors[4*f+3]+")"});b=d.createLinearGradient(0,0,0,512);for(f=0;f<e.length;f++){var g=e[f];b.addColorStop(g.ratio,g.color)}d.fillStyle=b;d.fillRect(0,0,1,512);this._gradientTex.setData(a);c.color.refreshColorRamp=!1}};return e}();h.default=g});