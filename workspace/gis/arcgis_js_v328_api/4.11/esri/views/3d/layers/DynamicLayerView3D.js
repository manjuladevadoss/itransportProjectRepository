// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.11/esri/copyright.txt for details.
//>>built
define("require exports ../../../core/tsSupport/declareExtendsHelper ../../../core/tsSupport/decorateHelper ../../../core/Logger ../../../core/promiseUtils ../../../core/watchUtils ../../../core/accessorSupport/decorators ../../../core/libs/gl-matrix-2/mat4f64 ../../../geometry/Extent ../../../geometry/support/aaBoundingRect ./LayerView3D ./support/overlayImageUtils ./support/projectExtentUtils ../support/debugFlags ../webgl-engine/Stage ../webgl-engine/lib/RenderGeometry ../webgl-engine/lib/Texture ../webgl-engine/materials/DefaultMaterial ../../layers/RefreshableLayerView".split(" "),
function(p,H,t,f,u,v,w,h,x,q,g,y,r,z,A,l,B,C,D,E){var F=u.getLogger("esri.views.3d.layers.DynamicLayerView3D");p=function(n){function c(){var a=null!==n&&n.apply(this,arguments)||this;a.supportsDraping=!0;a.hasDraped=!0;a.fullExtentInLocalViewSpatialReference=null;a.overlayUpdating=!1;a.maximumDataResolution=null;a._images=[];a._extents=[];a.updateWhenStationary=!0;return a}t(c,n);Object.defineProperty(c.prototype,"drawingOrder",{get:function(){return this._get("drawingOrder")},set:function(a){if(a!==
this._get("drawingOrder")){this._set("drawingOrder",a);var b=new Set;this._images.forEach(function(e){e&&e.material&&(e.material.renderPriority=a,b.add(e.material.id))});0<b.size&&(this.view._stage.getDrapedRenderer().updateRenderOrder(b),this.emit("draped-data-change"))}},enumerable:!0,configurable:!0});c.prototype.initialize=function(){var a=this;this.drawingOrder=this.view.getDrawingOrder(this.layer.uid);this.addResolvingPromise(z.toViewIfLocal(this).then(function(b){return a._set("fullExtentInLocalViewSpatialReference",
b)}));this.handles.add(this.watch("suspended",function(){return a._suspendedChangeHandler()}));this.handles.add(this.view.resourceController.scheduler.registerIdleStateCallbacks(function(){a._isScaleRangeActive()&&a.notifyChange("suspended")},function(){}));this._isScaleRangeLayer()&&this.handles.add([this.layer.watch("minScale",function(){return a.notifyChange("suspended")}),this.layer.watch("maxScale",function(){return a.notifyChange("suspended")})],"layer");this.handles.add([this.watch("fullOpacity",
this._opacityChangeHandler.bind(this)),this.layer.on("redraw",this._layerRedrawHandler.bind(this))],"layer")};c.prototype.destroy=function(){this.clear()};c.prototype.setDrapingExtent=function(a,b,e,d,c,m){d=this._extentAndSizeAtResolution(b,e,d);b=d.size;d=d.extent;m*=this.view.pixelRatio;if("imageMaxWidth"in this.layer||"imageMaxHeight"in this.layer){var k=this.layer.imageMaxWidth,h=this.layer.imageMaxHeight;if(b.width>k){var f=k/b.width;b.height=Math.floor(b.height*f);b.width=k;m*=f}b.height>h&&
(f=h/b.height,b.width=Math.floor(b.width*f),b.height=h,m*=f)}k=this._extents[a];k&&g.equals(k.extent,d)&&!this._imageSizeDiffers(d,e,k.imageSize,b)||(this._extents[a]={extent:g.create(d),spatialReference:e,imageSize:b,renderLocalOrigin:c,pixelRatio:m},this.suspended||this._fetch(a))};c.prototype.getGraphicFromGraphicUid=function(a){return null};c.prototype.clear=function(){for(var a=0;a<this._images.length;a++)this._clearImage(a)};c.prototype.doRefresh=function(){this.suspended||this.refetch()};c.prototype.canResume=
function(){if(!this.inherited(arguments))return!1;if(this._isScaleRangeLayer()){var a=this.layer,b=a.minScale,a=a.maxScale;if(0<b||0<a){var e=this.view.scale;if(e<a||0<b&&e>b)return!1}}return!0};c.prototype.isUpdating=function(){if(this.overlayUpdating)return!0;for(var a=0,b=this._images;a<b.length;a++)if(b[a].loadingPromise)return!0;return!1};c.prototype.processResult=function(a,b){if(b instanceof HTMLImageElement||b instanceof HTMLCanvasElement)a.image=b};c.prototype.updateImage=function(a){return!1};
c.prototype.refetch=function(){for(var a=0;a<this._extents.length;a++)this._extents[a]&&this._fetch(a)};c.prototype.beforeFetch=function(){};c.prototype.findExtentInfoAt=function(a){for(var b=0,e=this._extents;b<e.length;b++){var d=e[b],c=d.extent;if((new q(c[0],c[1],c[2],c[3],d.spatialReference)).contains(a))return d}return null};c.prototype._imageSizeDiffers=function(a,b,e,d){if(!this.maximumDataResolution||A.TESTS_DISABLE_UPDATE_THROTTLE_THRESHOLDS)return!0;b=g.width(a)/this.maximumDataResolution.x;
a=g.height(a)/this.maximumDataResolution.y;a=Math.abs(a/e.height-a/d.height);return 1.5<Math.abs(b/e.width-b/d.width)||1.5<a?!0:!1};c.prototype._fetch=function(a){var b=this;if(!this.suspended){this.beforeFetch();var e=this._extents[a],d=e.extent,c=new q(d[0],d[1],d[2],d[3],e.spatialReference);this._images[a]||(this._images[a]={texture:null,material:null,rendergeometry:null,loadingPromise:null,image:null,pixelData:null,renderExtent:g.create(d)});var f=this._images[a];f.loadingPromise&&f.loadingPromise.cancel();
0===c.width||0===c.height?this._clearImage(a):(f.loadingPromise=this._waitFetchReady().then(function(){return b.layer.fetchImage(c,e.imageSize.width,e.imageSize.height,{requestAsImageElement:!0,pixelRatio:e.pixelRatio})}),f.loadingPromise.then(function(c){g.set(f.renderExtent,d);b.processResult(f,c);b._createStageObjects(a,f.image);0===a&&b._images[1]&&b._images[1].rendergeometry&&b._createStageObjects(1,null);b.notifyChange("updating");b.emit("draped-data-change")}).catch(function(a){a&&"CancelError"!==
a.name&&"cancel"!==a.dojoType&&F.error(a);b.notifyChange("updating")}).then(function(){f.loadingPromise=null},function(){f.loadingPromise=null}),this.notifyChange("updating"))}};c.prototype._clearImage=function(a){a=this._images[a];var b=this.view._stage;a&&(a.rendergeometry&&(b.getDrapedRenderer().removeRenderGeometries([a.rendergeometry]),a.rendergeometry=null),a.texture&&(b.remove(l.ModelContentType.TEXTURE,a.texture.id),a.texture=null),a.material&&(b.remove(l.ModelContentType.MATERIAL,a.material.id),
a.material=null),a.loadingPromise&&(a.loadingPromise.cancel(),a.loadingPromise=null),a.image=null,a.pixelData=null)};c.prototype._createStageObjects=function(a,b){var c=this.view._stage,d=this._images[a];b&&(d.texture&&c.remove(l.ModelContentType.TEXTURE,d.texture.id),d.texture=new C(b,"dynamicLayer",{width:b.width,height:b.height,wrap:{s:33071,t:33071}}),c.add(l.ModelContentType.TEXTURE,d.texture));d.material?b&&d.material.setParameterValues({textureId:d.texture.id}):(d.material=new D({ambient:[1,
1,1],diffuse:[0,0,0],transparent:!0,opacity:this.fullOpacity,textureId:d.texture.id,receiveSSAO:!1},"dynamicLayer"),d.material.renderPriority=this.drawingOrder,c.add(l.ModelContentType.MATERIAL,d.material));var f;b=this._extents[a].renderLocalOrigin;if(0===a)f=r.createGeometryForExtent(d.renderExtent,-1);else if(1===a){a=this._images[0].renderExtent;if(!a)return;f=r.createOuterImageGeometry(a,d.renderExtent,-1)}else{console.error("DynamicLayerView3D._createStageObjects: Invalid extent idx");return}a=
new B(f);a.material=d.material;a.origin=b;a.transformation=x.mat4f64.create();a.name="dynamicLayer";a.uniqueName="dynamicLayer#"+f.id;c=c.getDrapedRenderer();c.addRenderGeometries([a]);d.rendergeometry&&c.removeRenderGeometries([d.rendergeometry]);d.rendergeometry=a};c.prototype._isScaleRangeLayer=function(){return"minScale"in this.layer&&"maxScale"in this.layer};c.prototype._isScaleRangeActive=function(){return this._isScaleRangeLayer()?0<this.layer.minScale||0<this.layer.maxScale:!1};c.prototype._extentAndSizeAtResolution=
function(a,b,c){var d=g.width(a)/g.height(a),e={width:c,height:c};1.0001<d?e.height=c/d:.9999>d&&(e.width=c*d);b=this._clippedExtent(a,b,G);e.width=Math.round(e.width/(g.width(a)/g.width(b)));e.height=Math.round(e.height/(g.height(a)/g.height(b)));return{size:e,extent:b}};c.prototype._clippedExtent=function(a,b,c){if("local"!==this.view.viewingMode)return g.set(c,a);b=this.view.basemapTerrain;var d=b.extent;return b.ready&&d?g.intersection(a,d,c):g.set(c,a)};c.prototype._opacityChangeHandler=function(a){for(var b=
0,c=this._images;b<c.length;b++){var d=c[b];d&&d.material&&d.material.setParameterValues({opacity:a})}this.emit("draped-data-change")};c.prototype._layerRedrawHandler=function(){for(var a=!1,b=0;b<this._images.length;b++){var c=this._images[b];this.updateImage(c)&&(a=!0,this._createStageObjects(b,c.image))}a&&this.emit("draped-data-change")};c.prototype._suspendedChangeHandler=function(){if(this.suspended)this.clear(),this.emit("draped-data-change");else for(var a=0;a<this._extents.length;a++)this._fetch(a)};
c.prototype._waitFetchReady=function(){return this.updateWhenStationary?w.whenOnce(this.view,"stationary"):v.resolve()};f([h.property()],c.prototype,"layer",void 0);f([h.property({dependsOn:["view.scale","layer.minScale","layer.maxScale"]})],c.prototype,"suspended",void 0);f([h.property({type:Boolean})],c.prototype,"supportsDraping",void 0);f([h.property({type:Boolean})],c.prototype,"hasDraped",void 0);f([h.property({value:0,type:Number})],c.prototype,"drawingOrder",null);f([h.property({readOnly:!0})],
c.prototype,"fullExtentInLocalViewSpatialReference",void 0);f([h.property()],c.prototype,"overlayUpdating",void 0);f([h.property({dependsOn:["overlayUpdating"]})],c.prototype,"updating",void 0);return c=f([h.subclass("esri.views.3d.layers.DynamicLayerView3D")],c)}(h.declared(y,E));var G=g.create();return p});