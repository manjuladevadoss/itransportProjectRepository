// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.11/esri/copyright.txt for details.
//>>built
define("require exports ../../core/tsSupport/declareExtendsHelper ../../core/tsSupport/decorateHelper ../../core/Accessor ../../core/accessorSupport/decorators".split(" "),function(g,h,e,c,f,b){return function(d){function a(){var a=null!==d&&d.apply(this,arguments)||this;a.refreshTimestamp=null;return a}e(a,d);a.prototype.refresh=function(a){void 0===a&&(a=Date.now());this._set("refreshTimestamp",a);this.doRefresh&&this.doRefresh()};c([b.property()],a.prototype,"layer",void 0);c([b.aliasOf("layer.refreshInterval")],
a.prototype,"refreshInterval",void 0);c([b.property({readOnly:!0})],a.prototype,"refreshTimestamp",void 0);return a=c([b.subclass("esri.layers.mixins.RefreshableLayerView")],a)}(b.declared(f))});