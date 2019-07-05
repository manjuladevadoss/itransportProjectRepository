// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.11/esri/copyright.txt for details.
//>>built
define("require exports ./ensureType ./extensions ./metadata ./utils ./decorators/cast".split(" "),function(t,m,l,n,h,p,q){function r(c,g){return function(a){a=+c(a);null!=g.min&&(a=Math.max(g.min,a));null!=g.max&&(a=Math.min(g.max,a));return a}}Object.defineProperty(m,"__esModule",{value:!0});m.processPrototype=function(c){var g=c.declaredClass,a=c.properties||{},d;for(d in a){var b=a[d],e=typeof b;null==b?h.setPropertyMetadata(c,d,{value:b}):Array.isArray(b)?h.setPropertyMetadata(c,d,{type:[b[0]],
value:null}):"object"===e?p.getProperties(b)||b instanceof Date?h.setPropertyMetadata(c,d,{type:b.constructor,value:b}):h.setPropertyMetadata(c,d,b):"boolean"===e?h.setPropertyMetadata(c,d,{type:Boolean,value:b}):"string"===e?h.setPropertyMetadata(c,d,{type:String,value:b}):"number"===e?h.setPropertyMetadata(c,d,{type:Number,value:b}):"function"===e&&h.setPropertyMetadata(c,d,{type:b,value:null})}c=h.getPropertiesMetadata(c);for(d in c){a=c[d];e=a.type;b=a.types;if(!a.cast)if(e){for(var b=a,k=0,f=
e;Array.isArray(f)&&1===f.length&&"string"!==typeof f[0]&&"number"!==typeof f[0];)f=f[0],k++;e=l.isOneOf(f)?0===k?l.ensureOneOf(f):l.ensureNArrayTyped(l.ensureOneOf(f),k):1===k?l.ensureArray(f):1<k?l.ensureNArray(f,k):l.ensureType(e);b.cast=e}else b&&(Array.isArray(b)?a.cast=l.ensureArrayTyped(l.ensureOneOfType(b[0])):a.cast=l.ensureOneOfType(b));a.range&&(a.cast=r(a.cast,a.range))}n.processPrototypeMetadatas(c,g);return c};m.processClass=function(c){for(var g=c.prototype,a=g.declaredClass,d=c._meta.bases,
b={},e=d.length-1;0<=e;e--)h.merge(b,h.getMetadata(d[e].prototype));var k=b.properties;n.processClassMetadatas(k,a);Object.defineProperty(c,"__accessorMetadata__",{value:{properties:k,autoDestroy:!!b.autoDestroy}});for(var f={},a=function(a){var b=k[a];f[a]={enumerable:!0,configurable:!0,get:function(){return this.__accessor__?this.__accessor__.get(a):b.value},set:function(c){var d=this.__accessor__;if(!d)Object.defineProperty(this,a,{enumerable:!0,configurable:!0,writable:!0,value:c});else if(!Object.isFrozen(this)){if(d.initialized&&
b.readOnly)throw new TypeError("[accessor] cannot assign to read-only property '"+a+"' of "+this.declaredClass);if(2===d.lifecycle&&b.constructOnly)throw new TypeError("[accessor] cannot assign to construct-only property '"+a+"' of "+this.declaredClass);d.set(a,c)}}}},d=0,e=Object.getOwnPropertyNames(k);d<e.length;d++)a(e[d]);Object.defineProperties(c.prototype,f);if(b.parameters)for(c=0,a=Object.getOwnPropertyNames(b.parameters);c<a.length;c++)d=a[c],e=Object.getOwnPropertyDescriptor(g,d)||{value:g[d]},
(e=q.autocastMethod(g,d,e))&&Object.defineProperty(g,d,e);return b}});