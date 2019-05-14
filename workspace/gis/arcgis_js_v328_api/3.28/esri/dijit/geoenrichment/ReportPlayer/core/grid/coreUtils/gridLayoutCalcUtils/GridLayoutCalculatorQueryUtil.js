// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See http://js.arcgis.com/3.28/esri/copyright.txt for details.
//>>built
define("esri/dijit/geoenrichment/ReportPlayer/core/grid/coreUtils/gridLayoutCalcUtils/GridLayoutCalculatorQueryUtil",[],function(){var f={markAsDirty:function(a){a._fieldToColumnHash=null;a._dataIdToDataHash=null},_calcGridHashes:function(a){a._fieldToColumnHash={};a.columns.forEach(function(b){a._fieldToColumnHash[b.field]=b});a._dataIdToDataHash={};a.store.data.forEach(function(b){a._dataIdToDataHash[b.id]=b})},fieldToColumn:function(a,b){a._fieldToColumnHash||f._calcGridHashes(a);return a._fieldToColumnHash&&
a._fieldToColumnHash[b]},dataIdToData:function(a,b){a._dataIdToDataHash||f._calcGridHashes(a);return a._dataIdToDataHash&&a._dataIdToDataHash[b]},getSpannedColumns:function(a,b,c){var d=[];if(1>c)return[];var e;a.columns.some(function(a){if(e||a.field===b)d.push(a),e=!0;if(d.length===c)return!0});return d},getColumnSpannedFields:function(a,b,c){var d=null;b=b.columnSpans&&b.columnSpans[c];if(1<b){d=[];c=f.fieldToColumn(a,c);for(var e=c.index;e<c.index+b;e++)d.push(a.columns[e].field)}return d},getRowSpannedData:function(a,
b,c){var d=null;c=b.rowSpans&&b.rowSpans[c];if(1<c)for(var d=[],e=b.index;e<b.index+c;e++)d.push(a.store.data[e]);return d},getMovableData:function(a,b,c){return(b=b.movableIndexHashVertical&&b.movableIndexHashVertical[c])&&a.store.data[b]},getMovableColumn:function(a,b,c){return(b=b.movableFieldsHashHorizontal&&b.movableFieldsHashHorizontal[c])&&f.fieldToColumn(a,b)}};return f});