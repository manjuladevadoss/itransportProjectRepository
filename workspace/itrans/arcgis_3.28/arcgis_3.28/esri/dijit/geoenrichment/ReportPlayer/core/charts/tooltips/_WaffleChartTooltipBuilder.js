// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See http://js.arcgis.com/3.28/esri/copyright.txt for details.
//>>built
define("esri/dijit/geoenrichment/ReportPlayer/core/charts/tooltips/_WaffleChartTooltipBuilder",["dojo/dom-construct","dojo/string","./_BuilderUtil","dojo/i18n!esri/nls/jsapi"],function(e,f,c,d){d=d.geoenrichment.dijit.ReportPlayer.ChartTooltip;return{buildWaffleChartTooltip:function(a,b){c.addTitle(b,a.label,a.color);b=e.create("div",{"class":"chartTooltip_row esriGERowHigh"},b);c.addRowOffset(b);a.isUnavailableData?c.addLabel(d.unavailableData,b):a.hasNegativeValues?c.addLabel(a.valueLabel,b):c.addLabel(f.substitute(d.waffleChartTooltip_label,
{value:a.valueLabel,total:a.sumValueLabel}),b)}}});