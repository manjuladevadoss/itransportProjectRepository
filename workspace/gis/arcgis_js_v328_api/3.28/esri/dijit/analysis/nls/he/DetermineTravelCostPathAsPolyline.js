// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See http://js.arcgis.com/3.28/esri/copyright.txt for details.
//>>built
define("esri/dijit/analysis/nls/he/DetermineTravelCostPathAsPolyline",{inputSourceLayerLabel:"\u05d1\u05d7\u05e8 \u05e9\u05db\u05d1\u05ea \u05e8\u05e1\u05d8\u05e8 \u05d0\u05d5 \u05e9\u05db\u05d1\u05ea \u05e0\u05e7\u05d5\u05d3\u05d5\u05ea \u05de\u05d5\u05e6\u05d0 \u05e9\u05dc \u05d9\u05e9\u05d5\u05d9\u05d5\u05ea \u05db\u05d3\u05d9 \u05dc\u05e7\u05d1\u05d5\u05e2 \u05d0\u05ea \u05d4\u05de\u05e1\u05dc\u05d5\u05dc\u05d9\u05dd \u05de\u05d4\u05df",inputCostRasterLabel:"\u05d1\u05d7\u05e8 \u05d0\u05ea \u05e9\u05db\u05d1\u05ea \u05d4\u05e8\u05e1\u05d8\u05e8 \u05e9\u05dc \u05e2\u05dc\u05d5\u05ea \u05d4\u05e0\u05e1\u05d9\u05e2\u05d4",
inputDestinationLayerLabel:"\u05d1\u05d7\u05e8 \u05e9\u05db\u05d1\u05ea \u05e8\u05e1\u05d8\u05e8 \u05d0\u05d5 \u05e9\u05db\u05d1\u05ea \u05d9\u05e2\u05d3\u05d9\u05dd \u05e9\u05dc \u05d9\u05e9\u05d5\u05d9\u05d5\u05ea \u05db\u05d3\u05d9 \u05dc\u05e7\u05d1\u05d5\u05e2 \u05d0\u05ea \u05d4\u05de\u05e1\u05dc\u05d5\u05dc\u05d9\u05dd \u05d0\u05dc\u05d9\u05d4\u05dd",pathTypeLabel:"\u05d1\u05d7\u05e8 \u05d0\u05ea \u05e1\u05d5\u05d2 \u05d4\u05de\u05e1\u05dc\u05d5\u05dc\u05d9\u05dd \u05e9\u05ea\u05e8\u05e6\u05d4 \u05dc\u05e7\u05d1\u05d5\u05e2 (\u05d0\u05d5\u05e4\u05e6\u05d9\u05d5\u05e0\u05dc\u05d9)",
bestSingle:"\u05d4\u05d9\u05d7\u05d9\u05d3 \u05d4\u05d8\u05d5\u05d1 \u05d1\u05d9\u05d5\u05ea\u05e8",eachCell:"\u05dc\u05db\u05dc \u05ea\u05d0",eachZone:"\u05dc\u05db\u05dc \u05d0\u05d6\u05d5\u05e8",outputPolylineName:"\u05e9\u05dd \u05e7\u05d5 \u05d4\u05ea\u05d5\u05e6\u05d0\u05d4",outputLayerName:"\u05e2\u05dc\u05d5\u05ea \u05e0\u05e1\u05d9\u05e2\u05d4 \u05de\u05d9\u05d8\u05d1\u05d9\u05ea \u05d1\u05ea\u05d5\u05e8 \u05e7\u05d5 \u05e9\u05dc \u200e${layername}\u200e",drawDestinationPointLayerName:"\u05e0\u05e7\u05d5\u05d3\u05d5\u05ea \u05d9\u05e2\u05d3",
drawSourcePointLayerName:"\u05e0\u05e7\u05d5\u05d3\u05d5\u05ea \u05de\u05d5\u05e6\u05d0",itemDescription:"\u05e9\u05db\u05d1\u05ea \u05d4\u05d9\u05e9\u05d5\u05d9\u05d5\u05ea \u05e0\u05d5\u05e6\u05e8\u05d4 \u05de\u05d4\u05e4\u05e2\u05dc\u05d4 \u05e9\u05dc '\u05e7\u05d1\u05d9\u05e2\u05ea \u05de\u05e1\u05dc\u05d5\u05dc \u05e2\u05dc\u05d5\u05ea \u05d4\u05e0\u05e1\u05d9\u05e2\u05d4 \u05d1\u05ea\u05d5\u05e8 \u05e7\u05d5' \u05d1\u05e9\u05db\u05d1\u05d4 \u200e${layerName}\u200e. ",itemTags:"\u05ea\u05d5\u05e6\u05d0\u05ea \u05d4\u05e0\u05d9\u05ea\u05d5\u05d7, \u05e7\u05d1\u05d9\u05e2\u05ea \u05de\u05e1\u05dc\u05d5\u05dc \u05e2\u05dc\u05d5\u05ea \u05d4\u05e0\u05e1\u05d9\u05e2\u05d4 \u05d1\u05ea\u05d5\u05e8 \u05e7\u05d5, \u200e${layername}\u200e \u200f\u200e${fieldname}",
itemSnippet:"\u05e9\u05db\u05d1\u05ea \u05d4\u05d9\u05e9\u05d5\u05d9\u05d5\u05ea \u05e0\u05d5\u05e6\u05e8\u05d4 \u05d1\u05d0\u05de\u05e6\u05e2\u05d5\u05ea '\u05e7\u05d1\u05d9\u05e2\u05ea \u05de\u05e1\u05dc\u05d5\u05dc \u05e2\u05dc\u05d5\u05ea \u05d4\u05e0\u05e1\u05d9\u05e2\u05d4 \u05d1\u05ea\u05d5\u05e8 \u05e7\u05d5'.",missingMessage:"\u05e9\u05db\u05d1\u05ea \u05d4\u05d9\u05e2\u05d3 \u05d0\u05de\u05d5\u05e8\u05d4 \u05dc\u05d4\u05d9\u05d5\u05ea \u05e9\u05d5\u05e0\u05d4 \u05de\u05e9\u05db\u05d1\u05ea \u05d4\u05de\u05e7\u05d5\u05e8",
noValueMessage:"\u05d7\u05d5\u05d1\u05d4 \u05dc\u05d4\u05d6\u05d9\u05df \u05d0\u05ea \u05d4\u05e2\u05e8\u05da \u05d4\u05d6\u05d4",placeHolder:"--\u05d1\u05d7\u05e8 \u05e9\u05db\u05d1\u05d4--"});