// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See http://js.arcgis.com/3.28/esri/copyright.txt for details.
//>>built
define("esri/dijit/analysis/mixins/browselayers/configs/Common",["dojo/_base/lang","dojo/has","../../../../../kernel","dojo/i18n!../../../nls/BrowseLayerMixin","../../../ItemTypes"],function(g,h,k,b,d){var f={getLAALCustomSection:function(a){var c=this._isCustomAnalysisQuery(a.portal,a.isPortal),e=[{name:b.customeSectionName,baseQuery:this._getLAALBaseQuery(a.customQueryTags,a.portal,a.isPortal),filters:[{fetchGroupIdByQuery:this._getDefaultQueryString(a.isPortal),name:b.Categories,type:"group",path:["categories"],
staticSchema:this._getStaticLAALSchema(a.portal,a.isPortal)}].concat(this._getFilters(a.isPortal)),disableSubResources:!0}];c&&e.push({name:b.customAnalysisGroupName,baseQuery:"",filters:[{id:this._getAnalysisGroupQuery(a.portal,a.isPortal).split(":")[1],name:b.Categories,type:"group",path:["categories"],staticSchema:void 0}].concat(this._getFilters(a.isPortal)),disableSubResources:!1});return e},getAddtoMapActions:function(a){return{allowed:function(a){return a.type!==d.RFT&&a.type!==d.XLS&&a.type!==
d.CSV},asynchronous:!1,onAction:a,name:b.customActionName}},getEditRFTActions:function(a){return{allowed:function(a){return a.type===d.RFT},asynchronous:!1,onAction:a,name:b.edit}},getSystemRFTSection:function(a){return{name:"System",baseQuery:'(group:"'+(a.rftGroupId&&a.rftGroupId.id)+'") -type:"Attachment" -tags:"mature support"',filters:[].concat(this._getFilters(a.isPortal)),addToFront:!1}},getStaticFilters:function(a){if((a=a.tags)&&0!==a.length){var c=[];a.forEach(function(a){c.push(b[a]?b[a]:
a)});return c}},getBoundaryLayersSection:function(a){return{name:b.boundaryLayers,baseQuery:"("+a.portal.EsriBoundaryLayersGroupQuery.split("AND")[1].trim()+')-type:"Attachment" -tags:"mature support"',filters:this._getFilters(a.isPortal),addToFront:!1,disableSubResources:!1}},getNumberOfPages:function(){return 16},_getLAALBaseQuery:function(a,c,b){b=['typekeywords:"Analysis Ready"'];(c||c.user||!c.user.demographics)&&b.push('-typekeywords:"Requires Credits"');b.push('-type:"Attachment" -tags:"mature support"');
b.push(this._queryTagsForLivingAtlasItemBrowser(a));return b.join(" ")},_queryTagsForLivingAtlasItemBrowser:function(a){a=a.tags;var b=[];if(!a||0===a.length)return"";if(1===a.length)return"tags: ("+a[0]+")";a.forEach(function(a){b.push(a)});return"tags: ("+b.join(" OR ")+")"},_getAnalysisGroupQuery:function(a,b){return this._isCustomAnalysisQuery(a,b)},_getDefaultQueryString:function(a){var b='title:"Living Atlas Analysis Layers" AND owner:esri';a&&(b='title:"Living Atlas Analysis Layers" AND owner:"esri_livingatlas"');
return b},_isCustomAnalysisQuery:function(a,b){return a&&a.analysisLayersGroupQuery&&a.analysisLayersGroupQuery!==this._getDefaultQueryString(b)?a.analysisLayersGroupQuery:!1},_getStaticLAALSchema:function(a,c){return[{title:"categories",categories:[{title:"boundaries and places",categories:[{title:"boundaries",categories:[],displayName:b.boundaries},{title:"places",categories:[],displayName:b.places}],displayName:b.boundariesAndPlaces},{title:"hexbins",categories:[],displayName:b.hexbins},{title:"transportation",
categories:[],displayName:b.transportation}]}]},_getFilters:function(a){return["tags"]}};h("extend-esri")&&g.setObject("dijit.analysis.mixins.browselayers.configs.Common",f,k);return f});