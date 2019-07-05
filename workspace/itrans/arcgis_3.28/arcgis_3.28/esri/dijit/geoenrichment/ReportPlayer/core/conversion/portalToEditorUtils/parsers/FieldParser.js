// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See http://js.arcgis.com/3.28/esri/copyright.txt for details.
//>>built
define("esri/dijit/geoenrichment/ReportPlayer/core/conversion/portalToEditorUtils/parsers/FieldParser","esri/dijit/geoenrichment/utils/JsonXmlConverter ../../../supportClasses/templateJsonUtils/fieldInfo/RichTextJsonUtil ../../../supportClasses/templateJsonUtils/fieldInfo/FieldInfoBuilder ../../../supportClasses/templateJsonUtils/fieldInfo/FieldInfoFormatUtil ../../ConversionUtil ../../ShapeConverter ../../../annotations/shape/ShapeJsonUtil ./_FieldInfoBuilder ./ImageParser ./AlignParser ../../../../_devConfig".split(" "),
function(q,v,g,w,l,r,x,m,t,y,z){function n(a){a=a.attributes||{};w.processFieldInfoTagAttributes(a);return a}function u(a){return q.queryJson(a,/^d$|^text$|^reportName$|^reportTitle2/)}var h={},p={parseImageTrigger:function(a,b){var d=m.getCalculatorOrScriptFieldInfo(a.attributes.field,b);if(!d)return console.log("Parse template error \x3d\x3e can't build fieldInfo for field "+a.attributes.field),console.log(a),null;var c={fieldInfo:d,cases:[]},e=this;a.tags.forEach(function(a){var d="case"===a.name?
a.attributes.key:"default";a=a.tags[0];var f=b.processFileName(a.attributes.value);c.cases.push({compareInfos:e._getCompareInfosFromTriggerKey(d),setters:[{property:a.attributes.property,value:f}]});b.putImageData(f)});return c},parseFieldTrigger:function(a,b,d){b.triggerJson={fieldInfo:d&&m.getCalculatorOrScriptFieldInfo(a.attributes.field,d),cases:[]};var c=this;a.tags.forEach(function(a){var d={compareInfos:c._getCompareInfosFromTriggerKey("case"===a.name?a.attributes.key:"default"),setters:[]};
b.triggerJson.cases.push(d);a.tags.forEach(function(a){d.setters.push({property:a.attributes.property,value:a.attributes.value})})})},_getCompareInfosFromTriggerKey:function(a){return a.split(l.KEY_INTERVAL_SEPARATOR).map(function(a){var b=l.ONE_FIELD_KEY_TEST.test(a)?a.replace(l.KEY_OPERATOR_RE,""):a;a=a.substr(0,a.length-b.length)||"\x3d";return{value:b,operator:a}})}},A={getFieldInfo:function(a,b,d,c){return(a=c.parsers.getParser("chart").portalToEditor(a,b,c))&&g.createFieldInfoFromChart(a)}},
B={getFieldInfo:function(a,b,d,c){return(a=c.parsers.getParser("infographic").portalToEditor(a,b,c))&&g.createFieldInfoFromInfographic(a)}},C={getFieldInfo:function(a,b,d,c){b=t.getElement(a,c);var e;a.tags&&a.tags[0]&&"trigger"===a.tags[0].name&&(e=p.parseImageTrigger(a.tags[0],c));return g.createFieldInfoFromImage(b,e)}},D={getFieldInfo:function(a,b,d,c){b=r.svgJsonToShapeObject(a);d=r.getStylesFromSvgJson(a);b=x.createShapeJsonFromShapeObj(b,d);a=a.attributes;b.style.angle=Number(a.angle)||0;y.parseAlign(a,
b.style);return g.createFieldInfoFromShape(b)}},E={getFieldInfo:function(a,b,d,c){a=c.parsers.getParser("section").parseSection(a,c);return g.createFieldInfoFromSection(a)}},k={getFieldInfo:function(a,b,d,c,e){a=n(a);b=b||a.f;if(e.templateJson.metadata.mapImageInfosHash[b])return b=t.parseMapImageDField(b,e),g.createFieldInfoFromImage(b);var f=g.createFieldInfoFromSpecialFieldName(b,a.m);if(!f){var h;2===d.tags.length&&d.tags[1].text&&(h=d.tags[1].text);f=m.getCalculatorOrScriptFieldInfo(b,e,{format:a.m,
additionalText:h,summaryType:a.summary})}f&&c&&(p.parseFieldTrigger(c,f,e),f.triggerJson&&!f.triggerJson.fieldInfo&&(f.triggerJson.fieldInfo=null,console.log("Parse template error \x3d\x3e can't build fieldInfo for field "+c.attributes.field),console.log(c)));return f}};h.parseField=function(a,b,d,c){var e;if(z.emulateErrors.layoutParseError)throw Error("Error test: something crashed during the parsing of the layout!");if(a){if("chart"===a.name)return A.getFieldInfo(a,b,d,c);if("infographic"===a.name)return B.getFieldInfo(a,
b,d,c)||!1;if(("img"===a.name||"mapImage"===a.name)&&a.attributes)return C.getFieldInfo(a,b,d,c);if("svg"===a.name)return D.getFieldInfo(a,b,d,c);if("section"===a.name)return E.getFieldInfo(a,b,d,c);if("d"===a.name)e=k.getFieldInfo(a,null,b,d,c);else if("a"===a.name&&a.tags&&"d"===a.tags[0].name){var f=a.tags[0];(e=k.getFieldInfo(f,null,b,d,c))&&a.attributes&&a.attributes.hreff&&(e.linkFieldInfo=k.getFieldInfo(f,a.attributes.hreff,b,d,c))}else e="text"===a.name?g.createFieldInfoFromSpecialFieldName(n(a).name):
g.createFieldInfoFromSpecialFieldName(a.name,n(a).m)}if(!e){a=u(b);if(1===a.length&&a[0].attributes&&"TrialUrlText"===a[0].attributes.name)return g.createFieldInfoFromSpecialFieldName(a[0].attributes.name);e=h.parseRichTextTag(b,c)}return e};h.parseRichTextTag=function(a,b){var d,c=u(a);if(c.length){var e=[],f=[],h=!0;c.some(function(d,c){c=d.attributes?d.attributes.name:d.name;c="d"===d.name?k.getFieldInfo(d,null,a,null,b):c&&g.createFieldInfoFromSpecialFieldName(c);if(!c)return h=!1,!0;"d"===d.name?
e.push(c):f.push(c)});h&&(d=v.createFieldInfoFromRichText(q.getInnerHTML(a),e,f))}return d};h.parseFieldTrigger=function(a,b,d){b=b||{};p.parseFieldTrigger(a,b,d);return b.triggerJson};return h});