// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.11/esri/copyright.txt for details.
//>>built
define("require exports ../../../../../core/tsSupport/extendsHelper ../../../camera/constraintUtils ../AnimationController ../../../webgl-engine/lib/Camera".split(" "),function(e,f,h,k,l,g){Object.defineProperty(f,"__esModule",{value:!0});e=function(d){function c(b,a){a=d.call(this)||this;a.view=b;a.beginCamera=new g;a.elapsedTimeSec=0;a.constraintOptions={selection:15,interactionType:4,interactionFactor:0,interactionStartCamera:new g,interactionDirection:null,tiltMode:0};return a}h(c,d);Object.defineProperty(c.prototype,
"steppingFinished",{get:function(){return this.momentum.isFinished(this.elapsedTimeSec)},enumerable:!0,configurable:!0});c.prototype.onControllerStart=function(b){this.beginCamera.copyFrom(b);this.constraintOptions.interactionStartCamera=this.beginCamera;d.prototype.onControllerStart.call(this,b)};c.prototype.stepController=function(b,a){a.copyViewFrom(this.beginCamera);this.elapsedTimeSec+=b;this.momentumStep(this.elapsedTimeSec,a);k.applyAll(this.view,a,this.constraintOptions)};return c}(l.AnimationController);
f.MomentumController=e});