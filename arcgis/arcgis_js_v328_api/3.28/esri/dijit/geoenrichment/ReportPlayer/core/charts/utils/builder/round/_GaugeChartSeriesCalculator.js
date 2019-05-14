// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See http://js.arcgis.com/3.28/esri/copyright.txt for details.
//>>built
define("esri/dijit/geoenrichment/ReportPlayer/core/charts/utils/builder/round/_GaugeChartSeriesCalculator","../../ThemeCalculator ../../ChartTypes ../../ChartJsonUtil ../../../../supportClasses/conditionalStyling/ConditionalStyleUtil ../../../../supportClasses/templateJsonUtils/fieldInfo/FieldInfoBuilder ../utils/ChartDataUtil ../utils/TooltipInfoBuilder".split(" "),function(B,r,C,t,D,u,E){return{calcSeries:function(c){var v=c.seriesItems,f=c.chartType,F=c.themeSettings,G=c.viewModel,d=c.visualProperties,
H=c.currentFeatureIndex;c=[];var w=v[0],x={name:"data",data:[]},g=[],k=0,y=0,l=1E6,m=-1E6,z,b=w.points;1===b.length&&(b=b.slice(),b.push(C.getGaugeOthersPoint()));if(r.isConditionalStylingEnabled(f)&&d.conditionalStyling){var A=t.getStatistics(d.conditionalStyling);z=A&&u.getChartData(A,b.length)}var I=D.isFieldInfoInPercentState(b[0].fieldInfo);b.forEach(function(a,b){1!==b?a=u.getPointValue({point:a,index:0,seriesIndex:0,maxValue:!1,chartType:f,visualProperties:d,viewModel:G,currentFeatureIndex:H,
chartData:z}):(a=g[0],a=d.gaugeRangeMax?Math.max(0,d.gaugeRangeMax-a):I?Math.max(0,100-a):0);a=(g[b]=a)||0;k+=a;y+=Math.abs(a);l=Math.min(l,a);m=Math.max(m,a)});0===g[1]&&(b.length=1);var J=k/b.length,K=0>d.gaugeRangeMin||0>g[0];b.forEach(function(a,c){var h=1===c,n=g[c],p=n||0,e;r.isConditionalStylingEnabled(f)&&d.conditionalStyling&&(e=(e=t.getConditionalStyle(p,d.conditionalStyling))&&e.backgroundColor,h&&!d.gaugeConditionalStylingOthers&&(e=void 0));e=e||B.calcColorForPoint({point:a,seriesItem:w,
pointIndex:c,isOthersPoint:h,seriesIndex:0,numSeries:v.length,chartType:f,themeSettings:F});var q=p;h||d.gaugeRangeMin&&(q=Math.max(0,q-d.gaugeRangeMin));x.data.push({originalValue:n,x:1,y:Math.max(1E-4,q),isUnavailableData:isNaN(n),valueProp:"y",unsortedIndex:c,name:a.label,point:a,fill:e,fieldInfo:b[0].fieldInfo,seriesIndex:0,isOthersPoint:h,tooltip:E.getTooltipInfo({yValue:p,pointLabel:a.label,seriesLabel:null,minInSeriesValue:l,maxInSeriesValue:m,sumInSeriesValue:k,absSumInSeriesValue:y,avgInSeriesValue:J,
visualProperties:d,chartType:f,color:e,conditionalStyling:d.conditionalStyling,fieldInfo:b[0].fieldInfo,decimals:a.value&&a.value.decimals,hasNegativeValues:K}),stroke:{width:0}})});c.push(x);return c}}});