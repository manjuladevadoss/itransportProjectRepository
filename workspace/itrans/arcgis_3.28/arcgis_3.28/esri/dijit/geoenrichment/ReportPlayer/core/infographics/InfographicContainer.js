// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See http://js.arcgis.com/3.28/esri/copyright.txt for details.
//>>built
require({cache:{"url:esri/dijit/geoenrichment/ReportPlayer/core/templates/InfographicContainer.html":'\x3cdiv class\x3d"esriGEReportPlayer_infographicContainer esriGEAbsoluteStretched"\x3e\r\n    \x3cdiv class\x3d"infographicContainer_viewDiv" data-dojo-attach-point\x3d"viewDiv"\x3e\x3c/div\x3e\r\n\x3c/div\x3e'}});
define("esri/dijit/geoenrichment/ReportPlayer/core/infographics/InfographicContainer","require dojo/_base/declare dojo/_base/lang esri/dijit/geoenrichment/Deferred esri/dijit/geoenrichment/when dijit/_WidgetBase dijit/_TemplatedMixin esri/dijit/geoenrichment/ReportPlayer/core/infographics/InfographicTypes esri/dijit/geoenrichment/utils/DomUtil esri/dijit/geoenrichment/utils/MouseUtil esri/dijit/geoenrichment/utils/WaitingUtil dojo/text!../templates/InfographicContainer.html".split(" "),function(k,
l,h,e,d,m,n,b,f,p,q,r){return l([m,n],{__isInfographicContainer:!0,templateString:r,viewModel:null,theme:null,parentWidget:null,currentFeatureIndex:null,getPreviewValueFunction:null,adjustElementsWhenResized:!1,_pendingResizeFlag:!1,_pendingUpdateFlag:!1,postCreate:function(){this.inherited(arguments);this._initDfd=new e},_initDfd:null,_currentInfographic:null,_isBeingUpdated:!1,getInnerInfographic:function(){return this._currentInfographic},getContentInitPromise:function(){return this._initDfd&&
this._initDfd.promise},_getTypeToClassPathMap:function(){var a={};a[b.STATIC]="./simpleInfographic/SimpleInfographicWithDataDrilling";a[b.ATTACHMENTS]="./AttachmentsInfographic";a[b.AREA_DETAILS]="./areaDetails/AreaDetailsInfographic";a[b.LOCATOR_TABLE]="./locator/LocatorTableInfographic";a[b.COMPARISON_TABLE]="./comparison/ComparisonTableInfographic";a.dynamic="./dynamic/DynamicInfographic";return a},_getRelativeRequire:function(){return k},_lastAppliedJson:null,updateInfographic:function(a){var c=
this;if(this.viewDiv&&a&&b.isSupported(a.type)&&!this._isBeingUpdated){a.style=a.style||{};this._lastAppliedJson=a;this._type=a.type;if(this._currentInfographic)return this._currentInfographic.updateInfographic(a);this._initDfd=this._initDfd||new e;this._isBeingUpdated=!0;var d=this._getTypeToClassPathMap()[b.isDynamic(a.type)?"dynamic":a.type],g=new e;this._getRelativeRequire()([d],function(a){g.resolve(a)});q.showProgressPromise(this.domNode,g.promise);this.onContentLoadingStart();return g.promise.then(function(b){c._createInfographicForClass(a,
b);c.onContentLoadingEnd()}).then(function(){c._isBeingUpdated=!1;if(f.isNodeInLayout(c.domNode))var b=c._currentInfographic.updateInfographic(a);else c._pendingUpdateFlag=!0;c._initDfd.resolve();c._initDfd=null;return b})}},_createInfographicForClass:function(a,c){var b=this,d=h.mixin({viewModel:this.viewModel,theme:this.theme,parentWidget:this,currentFeatureIndex:this.currentFeatureIndex,getPreviewValueFunction:this.getPreviewValueFunction,width:this.width,height:this.height,adjustElementsWhenResized:this.adjustElementsWhenResized,
onContentLoadingStart:function(){b.onContentLoadingStart()},onContentLoadingEnd:function(){b.onContentLoadingEnd()}},this._prepareCreationParameters(a),d);this._currentInfographic=new c(d);this._currentInfographic.placeAt(this.viewDiv);return this._currentInfographic},_prepareCreationParameters:function(a){return null},_type:null,getType:function(){return this._type},width:null,height:null,resize:function(a,b){void 0!==a&&(this.width=a,this.height=b);d(this._initDfd&&this._initDfd.promise,function(){f.isNodeInLayout(this.domNode)?
this._currentInfographic&&this._currentInfographic.resize(this.width,this.height):this._pendingResizeFlag=!0}.bind(this))},getPreferredHeight:function(){return this._currentInfographic.getPreferredHeight&&this._currentInfographic.getPreferredHeight()},collapseContent:function(){this._currentInfographic.collapseContent&&this._currentInfographic.collapseContent()},toJson:function(){return this._currentInfographic?this._currentInfographic.toJson():this._lastAppliedJson&&h.clone(this._lastAppliedJson)},
getVisualState:function(){return this._currentInfographic&&this._currentInfographic.getVisualState&&this._currentInfographic.getVisualState()},setVisualState:function(a){return this._currentInfographic&&this._currentInfographic.setVisualState&&this._currentInfographic.setVisualState(a)},notifyShown:function(){d(this._initDfd&&this._initDfd.promise,function(){if(f.isNodeInLayout(this.domNode)){this._pendingResizeFlag&&this.resize();this._pendingResizeFlag=!1;var a=this._pendingUpdateFlag&&this._currentInfographic.updateInfographic(this._lastAppliedJson);
this._pendingUpdateFlag=!1;d(a,function(){this._currentInfographic&&this._currentInfographic.notifyShown&&this._currentInfographic.notifyShown()}.bind(this))}}.bind(this))},_panelScale:null,notifyPanelScaleChanged:function(a){this._panelScale=a;d(this._initDfd&&this._initDfd.promise,function(){this._currentInfographic&&this._currentInfographic.notifyPanelScaleChanged&&this._currentInfographic.notifyPanelScaleChanged(this._panelScale)}.bind(this))},collectFieldInfos:function(){return this._currentInfographic&&
this._currentInfographic.collectFieldInfos&&this._currentInfographic.collectFieldInfos()},isMouseOver:function(){return p.isMouseOver(this.domNode)||this._currentInfographic&&this._currentInfographic.isMouseOver&&this._currentInfographic.isMouseOver()},onContentLoadingStart:function(){},onContentLoadingEnd:function(){},destroy:function(){this._currentInfographic&&this._currentInfographic.destroy();this.inherited(arguments)}})});