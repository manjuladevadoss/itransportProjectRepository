//>>built
define("dojox/wire/ml/JsonHandler",["dojo","dijit","dojox","dojo/require!dojox/wire/ml/RestHandler,dojox/wire/_base,dojox/wire/ml/util"],function(a,f,e){a.provide("dojox.wire.ml.JsonHandler");a.require("dojox.wire.ml.RestHandler");a.require("dojox.wire._base");a.require("dojox.wire.ml.util");a.declare("dojox.wire.ml.JsonHandler",e.wire.ml.RestHandler,{contentType:"text/json",handleAs:"json",headers:{Accept:"*/json"},_getContent:function(b,c){var d=null;("POST"==b||"PUT"==b)&&(b=c?c[0]:void 0)&&(d=
a.isString(b)?b:a.toJson(b));return d}})});