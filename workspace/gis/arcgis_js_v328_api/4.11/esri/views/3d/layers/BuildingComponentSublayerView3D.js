// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.11/esri/copyright.txt for details.
//>>built
define("require exports ../../../core/tsSupport/assignHelper ../../../core/tsSupport/declareExtendsHelper ../../../core/tsSupport/decorateHelper ../../../core/tsSupport/generatorHelper ../../../core/tsSupport/awaiterHelper ../../../Graphic ../../../core/Error ../../../core/Logger ../../../core/maybe ../../../core/promiseUtils ../../../core/watchUtils ../../../core/accessorSupport/decorators ../../../layers/support/fieldUtils ./BuildingSublayerView3D ./I3SMeshView3D ./i3s/I3SUtil ./support/DefinitionExpressionSceneLayerView ../../layers/support/popupUtils".split(" "),
function(E,F,G,w,d,p,g,x,q,y,z,r,t,c,l,A,B,u,C,m){var D=y.getLogger("esri.views.3d.layers.BuildingComponentSublayerView3D");return function(f){function b(){var a=null!==f&&f.apply(this,arguments)||this;a.layerView=null;a._elevationContext="scene";a._isIntegratedMesh=!1;a.lodFactor=1;a.progressiveLoadFactor=1;return a}w(b,f);b.prototype.initialize=function(){var a=this;this._layerUid=this.layer.layer.uid;this.handles.add([t.init(this,["layer.renderer","definitionExpressionFields","filterExpressionFields"],
function(){return a._updateRequiredFields()}),t.init(this.layer,"renderer",function(b){return a._rendererChange(b)}),this.watch(["parsedDefinitionExpression","parsedFilterExpression"],function(){return a._filterChange()})])};Object.defineProperty(b.prototype,"parsedFilterExpression",{get:function(){if("Overview"===this.layer.modelName)return null;var a=this.layerView.parsedFilterExpression;if(!a)return null;var b=[],c=a.getFields();u.findFieldsCaseInsensitive(c,this.layer.fields,{missingFields:b});
return 0<b.length?(D.error("filterExpression references unknown fields: "+b.join(", ")),null):a},enumerable:!0,configurable:!0});Object.defineProperty(b.prototype,"filterExpressionFields",{get:function(){if(this.parsedFilterExpression){var a=this.parsedFilterExpression.getFields();return u.findFieldsCaseInsensitive(a,this.layer.fields)}return null},enumerable:!0,configurable:!0});b.prototype._createLayerGraphic=function(a){a=new x(null,null,a);a.layer=this.layer.layer;a.sourceLayer=this.layer;return a};
b.prototype.canResume=function(){return this.inherited(arguments)&&(!this._controller||this._controller.rootNodeVisible)};b.prototype.isUpdating=function(){return!(!this._controller||!this._controller.updating)};b.prototype.fetchPopupFeatures=function(a,b){return g(this,void 0,void 0,function(){var a,c,d,e,f,g,h,n,k;return p(this,function(v){switch(v.label){case 0:if(a=this._validateFetchPopupFeatures(b))return[2,r.reject(a)];if(!z.isSome(b)||!b.clientGraphics||0===b.clientGraphics.length)return[2,
[]];c=[];d=[];f=l.unpackFieldNames;g=[this.layer.fields];return[4,m.getRequiredFields(this.layer,m.getFetchPopupTemplate(this.layer,b))];case 1:e=f.apply(void 0,g.concat([v.sent()]));h=0;for(n=b.clientGraphics;h<n.length;h++)k=n[h],l.featureHasFields(e,k)?c.push(k):d.push(k);return 0===d.length?[2,r.resolve(c)]:[2,this.whenGraphicAttributes(d,e).catch(function(){return d}).then(function(a){return c.concat(a)})]}})})};b.prototype._updateRequiredFields=function(){return g(this,void 0,void 0,function(){var a,
b,c,d;return p(this,function(e){switch(e.label){case 0:return b=l.fixFields,c=[this.layer.fields],this.layer.renderer?[4,this.layer.renderer.getRequiredFields(this.layer.fields)]:[3,2];case 1:return d=e.sent(),[3,3];case 2:d=[],e.label=3;case 3:return a=b.apply(void 0,c.concat([d.concat(this.definitionExpressionFields||[],this.filterExpressionFields||[])])),this._set("requiredFields",a),[2]}})})};b.prototype._validateFetchPopupFeatures=function(b){var a=this.layer;if(!a.popupEnabled)return new q("buildingscenelayerview3d:fetchPopupFeatures",
"Popups are disabled",{layer:a});if(!m.getFetchPopupTemplate(a,b))return new q("buildingscenelayerview3d:fetchPopupFeatures","Layer does not define a popup template",{layer:a})};b.prototype.getFilters=function(){var a=this.inherited(arguments);this.addSqlFilter(a,this.parsedFilterExpression,this.filterExpressionFields,this.logError);this.addSqlFilter(a,this.parsedDefinitionExpression,this.definitionExpressionFields,this.logError);return a};d([c.property()],b.prototype,"layer",void 0);d([c.property()],
b.prototype,"layerView",void 0);d([c.property({dependsOn:["_controller.updating"]})],b.prototype,"updating",void 0);d([c.property({dependsOn:["_controller.rootNodeVisible"]})],b.prototype,"suspended",void 0);d([c.property({readOnly:!0,aliasOf:"view.qualitySettings.sceneService.3dObject.lodFactor"})],b.prototype,"lodFactor",void 0);d([c.property({readOnly:!0,dependsOn:["layerView.parsedFilterExpression"]})],b.prototype,"parsedFilterExpression",null);d([c.property({type:[String],readOnly:!0,dependsOn:["parsedFilterExpression"]})],
b.prototype,"filterExpressionFields",null);d([c.property({readOnly:!0})],b.prototype,"requiredFields",void 0);return b=d([c.subclass("esri.views.3d.layers.BuildingComponentSublayerView3D")],b)}(c.declared(A,B.I3SMeshView3D,C.DefinitionExpressionSceneLayerView))});