// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See http://js.arcgis.com/3.28/esri/copyright.txt for details.
//>>built
define("esri/dijit/geoenrichment/ReportPlayer/core/charts/utils/builder/columnBarLine/_BarSizeCalculator",["../../ChartTypes","../ChartPlots","./_ComparisonUtil","../../ChartBarThickness"],function(k,l,n,e){function p(a,c,d,b){var f=b.renderColumnBarsInOppositeDirections&&1<c;a=d/(a||1)/(b.isStacked?1:f?Math.round(c/2):c);a=Math.round(a);return a=b.columnBarGap?a-b.columnBarGap:b.columnThickness===e.SMALL?.25*a:b.columnThickness===e.LARGE?.75*a:.5*a}return{updateBarSize:function(a){var c=a.chart,
d=a.visualProperties,b=a.comparisonInfo,f=a.seriesItems,h=a.chartType,e=a.isMultiFeatureChart,m=a.numComparisonFeatures;a=a.chartSize;if(c&&!k.isLineLike(h)){a=a||d[k.isColumnLike(h)?"width":"height"];var g=0;f.forEach(function(a){g=Math.max(g,a.points.length)});m&&(g+=m);b=n.getEffectiveNumberOfSeries(f,h,b,e);d=p(g,b,a,d);c.getPlot(l.PRIMARY).opt.maxBarSize=d;c.getPlot(l.PRIMARY).opt.minBarSize=d;c.dirty=!0}}}});