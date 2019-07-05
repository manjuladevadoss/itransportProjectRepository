// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.11/esri/copyright.txt for details.
//>>built
define("require exports ../../core/tsSupport/decorateHelper ../../core/tsSupport/declareExtendsHelper ../../core/tsSupport/generatorHelper ../../core/tsSupport/awaiterHelper dojo/number ../../arcade/Feature ../../core/date ../../core/lang ../../core/promiseUtils ./fieldUtils ../../support/arcadeUtils".split(" "),function(l,f,D,E,h,g,x,y,m,z,t,n,p){function A(){return g(this,void 0,void 0,function(){return h(this,function(a){return[2,t.create(function(a){l(["../../core/sql/WhereClause"],a)})]})})}
function B(){return g(this,void 0,void 0,function(){return h(this,function(a){return[2,t.create(function(a){l(["../../support/arcadeUtils"],a)})]})})}function v(a,b){b={spatialReference:b};if(a=a.labelExpressionInfo){var c=a.expression;c&&!a.value&&(b.hasArcadeExpression=!0,b.compiledArcadeFunc=p.createFunction(c))}return b}function u(a,b,c,d){a=n.getField(d,a);if(!a)return b;if(null==c[a.name])return"";if(b=a.domain)if("codedValue"===b.type||"coded-value"===b.type){d=c[a.name];var e=0;for(b=b.codedValues;e<
b.length;e++){var k=b[e];if(k.code===d)return k.name}}else if("range"===b.type&&(d=+c[a.name],e="range"in b?b.range[1]:b.maxValue,("range"in b?b.range[0]:b.minValue)<=d&&d<=e))return b.name;c=c[a.name];"date"===a.type||"esriFieldTypeDate"===a.type?(a=m.fromJSON("shortDate"),(a="DateFormat"+m.getFormat(a))&&(c=z.substitute({myKey:c},"{myKey:"+a+"}"))):n.isNumericField(a)&&(c=x.format(+c));return c?c:""}Object.defineProperty(f,"__esModule",{value:!0});var q=new y,C=function(a){return null};f.createLabelFunction=
function(a,b,c){return g(this,void 0,void 0,function(){var d,e,k,f,g,r,l,m,n,p,w;return h(this,function(h){switch(h.label){case 0:if(!a||!a.symbol)return[2,C];d=a.where;e=a.getLabelExpression();return[4,t.all([d?A():null,"arcade"===e.type?B():null])];case 1:return k=h.sent(),f=k[0],g=k[1],"arcade"===e.type?(l=v(a,c),m=g.createFunction(e.expression),n={fields:b},p={vars:{$feature:q,$view:l.view},spatialReference:c},r=function(a){q.repurposeFromGraphicLikeObject(a.geometry,a.attributes,n);a=g.executeFunction(m,
p);return null!=a?a.toString():null}):r=function(a){var c=a&&a.attributes;return c?e.expression.replace(/{[^}]*}/g,function(a){return u(a.slice(1,-1),a,c,b)}):null},d?(w=f.create(d),[2,function(a){return w.testFeature(a)?r(a):null}]):[2,r]}})})};f.getLabelingOptions=v;f.buildLabelText=function(a,b,c,d){var e="";if(d&&d.hasArcadeExpression){if(d.compiledArcadeFunc)return q.repurposeFromGraphicLikeObject(b.geometry,b.attributes,{fields:c}),a=p.executeFunction(d.compiledArcadeFunc,{vars:{$feature:q,
$view:d.view},spatialReference:d.spatialReference}),null!=a?a.toString():null}else var f=b&&b.attributes||{},e=a.replace(/{[^}]*}/g,function(a){return u(a.slice(1,-1),a,f,c)});return e};f.formatField=u});