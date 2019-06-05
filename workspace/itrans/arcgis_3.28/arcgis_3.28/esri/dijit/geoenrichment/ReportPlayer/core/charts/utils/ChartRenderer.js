// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See http://js.arcgis.com/3.28/esri/copyright.txt for details.
//>>built
define("esri/dijit/geoenrichment/ReportPlayer/core/charts/utils/ChartRenderer",["dojo/dom-construct","../ChartContainer","./ThemeCalculator","./ChartJsonUtil"],function(g,h,k,f){return{createChartPage:function(b,a){var d=b.json,c=b.creationParams;f.provideDefaultValueForMissing(d);var d=f.cleanUpJson(d,c.viewModel.isGraphicStyle),e=c.viewModel.getChartDefaultStyles(c.theme);c.chartTheme=k.getThemeForSettings(d,e,c.isEditMode);a=a||h;e=b.node?g.create("div",null,b.node):void 0;a=new a(c,e);"function"===
typeof b.placeFunc&&b.placeFunc(a);a.updateChart(d);return a}}});