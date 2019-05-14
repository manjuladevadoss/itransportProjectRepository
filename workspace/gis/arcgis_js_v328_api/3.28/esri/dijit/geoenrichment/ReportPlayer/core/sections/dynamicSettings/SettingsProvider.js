// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See http://js.arcgis.com/3.28/esri/copyright.txt for details.
//>>built
define("esri/dijit/geoenrichment/ReportPlayer/core/sections/dynamicSettings/SettingsProvider","esri/dijit/geoenrichment/promise/all ./areaDetails/_AreaDetailsSettingsBuilder ./chart/_ChartSettingsBuilder ./comparison/_ComparisonSettingsBuilder ./dynamicInfographic/_DynamicInfographicSettingsBuilder ./locator/_LocatorSettingsBuilder ./map/_MapSettingsBuilder ./multiFeature/_MultiFeatureSettingsBuilder".split(" "),function(c,d,e,f,g,h,k,l){return{getSettingsSet:function(a){return c({areaDetailsSettings:d.provideAreaDetailsSettings(a),
chartSettings:e.provideChartSettings(a),comparisonSettings:f.provideComparisonSettings(a),dynamicInfographicSettings:g.provideDynamicInfogarphicSettings(a),locatorSettings:h.provideLocatorSettings(a),mapSettings:k.provideMapSettings(a),multiFeatureSettings:l.provideMultiFeatureSettings(a)}).then(function(b){Object.keys(b).forEach(function(a){if(a=b[a])a.exportSettings&&(b.hasExport=!0),a.viewSettings&&(b.hasViewSettings=!0),a.filter&&(b.hasFilter=!0)});return b.hasExport||b.hasViewSettings||b.hasFilter||
b.multiFeatureSettings?b:null})}}});