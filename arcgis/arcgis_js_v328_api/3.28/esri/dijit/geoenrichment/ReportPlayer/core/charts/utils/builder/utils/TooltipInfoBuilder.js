// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See http://js.arcgis.com/3.28/esri/copyright.txt for details.
//>>built
define("esri/dijit/geoenrichment/ReportPlayer/core/charts/utils/builder/utils/TooltipInfoBuilder",["./ChartDataUtil","esri/dijit/geoenrichment/ReportPlayer/countryConfig","../../../../supportClasses/templateJsonUtils/fieldInfo/FieldInfoBuilder"],function(e,f,g){return{getTooltipInfo:function(a){function b(c,b,d){c=e.formatNumber(c||0,void 0!==b?{dataLabelsDecimals:b}:void 0!==a.decimals?{dataLabelsDecimals:a.decimals}:a.visualProperties);if(!d)return c;a.visualProperties.dataLabelsShowValuePercentSymbol||
a.fieldInfo&&g.isFieldInfoInPercentState(a.fieldInfo)?c+="%":a.visualProperties.dataLabelsShowValueCurrencySymbol&&(c=f.getCurrencySymbol()+c);return c}var d=a.isMultiFeature?a.absSumInAreasValue:a.absSumInSeriesValue;return{isMultiFeature:a.isMultiFeature,value:a.yValue,label:a.pointLabel,color:a.color,seriesLabel:a.seriesLabel,valueLabel:b(a.yValue,void 0,!0),sumValueLabel:b(a.isMultiFeature?a.sumInAreasValue:a.sumInSeriesValue,void 0,!0),minValueLabel:b(a.isMultiFeature?a.minInAreasValue:a.minInSeriesValue,
void 0,!0),maxValueLabel:b(a.isMultiFeature?a.maxInAreasValue:a.maxInSeriesValue,void 0,!0),avgValueLabel:b(a.isMultiFeature?a.avgInAreasValue:a.avgInSeriesValue,void 0,!0),weightValueLabel:d?b(Math.abs(a.yValue)/d*100,2)+"%":"",formatFunc:function(a){return b(a,void 0,!0)},isUnavailableData:isNaN(a.yValue),conditionalStyling:a.conditionalStyling,fieldInfo:a.fieldInfo,isThisAreaSpecific:a.isThisAreaSpecific,isThisAreaSingleSeries:a.isThisAreaSingleSeries,hasNegativeValues:a.hasNegativeValues,getGroup:null}}}});