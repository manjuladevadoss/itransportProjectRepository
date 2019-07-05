// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.11/esri/copyright.txt for details.
//>>built
define("require exports ../core/tsSupport/assignHelper ../core/tsSupport/declareExtendsHelper ../core/tsSupport/decorateHelper ../request ../core/Error ../core/lang ../core/Logger ../core/promiseUtils ../core/urlUtils ../core/accessorSupport/decorators ./Layer ./mixins/SceneService ./pointCloudFilters/jsonUtils ./pointCloudFilters/typeUtils ./support/commonProperties ./support/Field ../renderers/support/pointCloud/jsonUtils ../renderers/support/pointCloud/typeUtils".split(" "),function(p,C,q,r,d,
t,e,u,v,f,w,c,x,y,g,z,l,h,A,B){function m(c,b,a){c&&((c=A.read(c,b,a)||void 0)||k.error("Failed to create renderer",{rendererDefinition:c,layer:this,context:a}));return c}var k=v.getLogger("esri.layers.PointCloudLayer");return function(n){function b(a,b){a=n.call(this)||this;a.operationalLayerType="PointCloudLayer";a.opacity=1;a.filters=[];a.fields=null;a.path=null;a.legendEnabled=!0;a.renderer=null;a.type="point-cloud";return a}r(b,n);b.prototype.normalizeCtorArgs=function(a,b){return"string"===
typeof a?q({url:a},b):a};b.prototype.readServiceFields=function(a,b,c){return Array.isArray(a)?a.map(function(a){var b=new h;"FieldTypeInteger"===a.type&&(a=u.clone(a),a.type="esriFieldTypeInteger");b.read(a,c);return b}):Array.isArray(b.attributeStorageInfo)?b.attributeStorageInfo.map(function(a){return new h({name:a.name,type:"ELEVATION"===a.name?"double":"integer"})}):null};Object.defineProperty(b.prototype,"elevationInfo",{set:function(a){this._set("elevationInfo",a);this._validateElevationInfo()},
enumerable:!0,configurable:!0});b.prototype.load=function(){var a=this,b=this.loadFromPortal({supportedTypes:["Scene Service"]}).then(function(){return a._fetchService()},function(){return a._fetchService()});this.addResolvingPromise(b);return this.when()};b.prototype.importLayerViewModule=function(a){switch(a.type){case "2d":return f.reject(new e("point-cloud-layer:view-not-supported","PointCloudLayer is only supported in 3D"));case "3d":return f.create(function(a){return p(["../views/3d/layers/PointCloudLayerView3D"],
a)})}};b.prototype._validateLayer=function(a){if(a.layerType&&"PointCloud"!==a.layerType)throw new e("pointcloudlayer:layer-type-not-supported","PointCloudLayer does not support this layer type",{layerType:a.layerType});if(isNaN(this.version.major)||isNaN(this.version.minor))throw new e("layer:service-version-not-supported","Service version is not supported.",{serviceVersion:this.version.versionString,supportedVersions:"1.x-2.x"});if(2<this.version.major)throw new e("layer:service-version-too-new",
"Service version is too new.",{serviceVersion:this.version.versionString,supportedVersions:"1.x-2.x"});};b.prototype.hasCachedStatistics=function(a){return null!=this.attributeStorageInfo&&this.attributeStorageInfo.some(function(b){return b.name===a})};b.prototype.queryCachedStatistics=function(a){if(!this.hasCachedStatistics(a))return f.reject(new e("pointcloudlayer:no-cached-statistics","Cached statistics for this attribute are not available"));for(var b=0,c=this.attributeStorageInfo;b<c.length;b++){var d=
c[b];if(d.name===a)return a=w.join(this.parsedUrl.path,"./statistics/"+d.key),t(a,{query:{f:"json"},responseType:"json"}).then(function(a){return a.data})}};b.prototype._validateElevationInfo=function(){var a=this.elevationInfo;a&&("absolute-height"!==a.mode&&k.warn(".elevationInfo\x3d","Point cloud layers only support absolute-height elevation mode"),a.featureExpressionInfo&&"0"!==a.featureExpressionInfo.expression&&k.warn(".elevationInfo\x3d","Point cloud layers do not support featureExpressionInfo"))};
d([c.property({type:["PointCloudLayer"]})],b.prototype,"operationalLayerType",void 0);d([c.property({readOnly:!0,json:{write:!1,read:!1,origins:{"web-document":{write:!1,read:!1}}}})],b.prototype,"opacity",void 0);d([c.property({type:["show","hide"]})],b.prototype,"listMode",void 0);d([c.property({types:[z.types],json:{origins:{service:{read:{source:"filters",reader:g.read}}},read:{source:"layerDefinition.filters",reader:g.read},write:{target:"layerDefinition.filters",writer:g.write}}})],b.prototype,
"filters",void 0);d([c.property({type:[h]})],b.prototype,"fields",void 0);d([c.reader("service","fields",["fields","attributeStorageInfo"])],b.prototype,"readServiceFields",null);d([c.property({readOnly:!0})],b.prototype,"attributeStorageInfo",void 0);d([c.property(l.elevationInfo)],b.prototype,"elevationInfo",null);d([c.property({type:String,json:{origins:{"web-scene":{read:!0,write:!0}},read:!1}})],b.prototype,"path",void 0);d([c.property(l.legendEnabled)],b.prototype,"legendEnabled",void 0);d([c.property({types:B.types,
json:{origins:{service:{read:{source:"drawingInfo.renderer",reader:m}}},read:{source:"layerDefinition.drawingInfo.renderer",reader:m},write:{target:"layerDefinition.drawingInfo.renderer"}}})],b.prototype,"renderer",void 0);d([c.property({json:{read:!1},readOnly:!0})],b.prototype,"type",void 0);return b=d([c.subclass("esri.layers.PointCloudLayer")],b)}(c.declared(x,y))});