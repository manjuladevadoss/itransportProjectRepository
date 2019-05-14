// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See http://js.arcgis.com/3.28/esri/copyright.txt for details.
//>>built
require({cache:{"url:esri/dijit/geoenrichment/ReportPlayer/core/templates/ReportContainerStack.html":'\x3cdiv class\x3d"esriGEReportPlayer_reportContainerStack"\x3e\r\n    \x3cdiv data-dojo-attach-point\x3d"emptyPlaceholder" class\x3d"reportContainerStack_emptyPlaceholder"\x3e${nls.infographicEmpty}\x3c/div\x3e\r\n    \x3cdiv data-dojo-attach-point\x3d"fillerContainer" class\x3d"reportContainerStack_zoomFillerContainer"\x3e\r\n        \x3cdiv data-dojo-attach-point\x3d"scalableContainer" class\x3d"reportContainerStack_zoomScalableContainer"\x3e\r\n            \x3cdiv data-dojo-attach-point\x3d"infographicPageDiv"\x3e\x3c/div\x3e\r\n        \x3c/div\x3e\r\n    \x3c/div\x3e\r\n\x3c/div\x3e'}});
define("esri/dijit/geoenrichment/ReportPlayer/core/reportContainerStack/ReportContainerStack","dojo/_base/declare dojo/_base/lang dijit/_WidgetBase dijit/_TemplatedMixin ./_ScrollSupport ./_ZoomSupport ../supportClasses/templateJsonUtils/query/TemplateJsonQueryUtil ../themes/ReportThemes ./utils/MobileGesturesUtil esri/dijit/geoenrichment/utils/DeviceUtil esri/dijit/geoenrichment/utils/DomUtil dojo/text!../templates/ReportContainerStack.html dojo/i18n!esri/nls/jsapi".split(" "),function(f,g,h,k,l,
m,e,n,p,q,c,r,d){d=d.geoenrichment.dijit.ReportPlayer.ReportPlayer;return f([h,k,l,m],{templateString:r,nls:d,viewModel:null,theme:null,parentWidget:null,currentFeatureIndex:null,isVertical:!0,documentOptions:null,renderOptions:{},infographicPage:null,postCreate:function(){var a=this;this.inherited(arguments);this.renderOptions=g.mixin({center:!1,minTop:0,minRight:0,minBottom:0,minLeft:0},this.renderOptions);this.infographicPage=this.viewModel.layoutBuilder.createElement("infographicPageStack",{viewModel:this.viewModel,
theme:this.theme,parentWidget:this,currentFeatureIndex:this.currentFeatureIndex,isVertical:this.isVertical,onSectionCreated:function(b){a._notifySectionAboutScale(b)}},this.infographicPageDiv);this.own(this.infographicPage);this._setEmptyState(!1);q.isMobileDevice()&&p.enableMobileGestures(this)},resize:function(a,b){this.domNode.style.width=a?a+"px":"auto";this.domNode.style.height=b?b+"px":"auto"},setMaxWidth:function(a){this.domNode.style.maxWidth=a+"px"},setMaxHeight:function(a){this.domNode.style.maxHeight=
a+"px"},notifyShown:function(){this._pendingJson?(this.fromJson(this._pendingJson),!this._pendingJson&&this.onPendingDataApplied()):this.infographicPage.notifyShown()},_maxPanelWidth:null,_maxPanelHeight:null,getCurrentPageDim:function(){return this.isVertical?{w:this._maxPanelWidth,h:1E6}:{w:1E6,h:this._maxPanelHeight}},_calcMaxPanelSize:function(a){this._maxPanelHeight=this._maxPanelWidth=0;a.forEach(function(a){if(a=e.getParentBox(a))this._maxPanelWidth=Math.max(this._maxPanelWidth,a.w),this._maxPanelHeight=
Math.max(this._maxPanelHeight,a.h)},this)},_pendingJson:null,fromJson:function(a){if(this._canApplyJson())return this._pendingJson=null,this.documentOptions=a.documentOptions,this.theme=this.infographicPage.theme=a.theme&&a.theme.id!==n.GRAPHIC?a.theme:null,a=e.collectSectionJsons(a,{backgroundForeground:!1,populateWithFloatingElementsBehind:!0}),this._setEmptyState(!a.length),this._calcMaxPanelSize(a),this.infographicPage.setItems(a);this._pendingJson=a},_canApplyJson:function(){return c.isNodeInLayout(this.domNode)},
_setEmptyState:function(a){c.hide([this.fillerContainer,this.emptyPlaceholder]);c.show(a?this.emptyPlaceholder:this.fillerContainer)},onPendingDataApplied:function(){}})});