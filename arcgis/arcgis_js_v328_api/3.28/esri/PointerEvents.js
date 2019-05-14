// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See http://js.arcgis.com/3.28/esri/copyright.txt for details.
//>>built
define("esri/PointerEvents","dojo/_base/declare dojo/_base/lang dojo/_base/array dojo/has ./kernel ./Evented ./geometry/Point ./geometry/ScreenPoint".split(" "),function(h,e,n,q,r,t,k,l){h=h([t],{declaredClass:"esri.PointerEvents",tapRadius:8,clickRadius:2,doubleTapRadius:10,tapStartTolerance:50,doubleTapDuration:300,minWheelValue:1,maxWheelValue:1,mozWheelDivisor:-1!==q("mac")?1:3,wheelDivisor:120,preventPageScroll:!0,_dragging:!1,constructor:function(a,b){this.node=a;e.mixin(this,b);void 0!==a.style.msTouchAction?
a.style.msTouchAction="none":void 0!==a.style.touchAction&&(a.style.touchAction="none");b=navigator.msPointerEnabled;var c=function(a){a.preventDefault()};a.addEventListener("selectstart",c,!1);a.addEventListener("dragstart",c,!1);this._pointerDown=e.hitch(this,this._pointerDown);this._pointerMove=e.hitch(this,this._pointerMove);this._pointerUp=e.hitch(this,this._pointerUp);this._pointerCancel=e.hitch(this,this._pointerCancel);a.addEventListener(b?"MSPointerDown":"pointerdown",this._pointerDown,!1);
a.addEventListener(b?"MSPointerMove":"pointermove",this._pointerMove,!1);a.addEventListener(b?"MSPointerUp":"pointerup",this._pointerUp,!1);a.addEventListener(b?"MSPointerCancel":"pointercancel",this._pointerCancel,!1);this.map&&(this._mouseOver=e.hitch(this,this._mouseOver),this._mouseOut=e.hitch(this,this._mouseOut),this._mouseLeave=e.hitch(this,this._mouseLeave),this._mouseDown=e.hitch(this,this._mouseDown),this._mouseUp=e.hitch(this,this._mouseUp),this._mouseClick=e.hitch(this,this._mouseClick),
this._mouseWheel=e.hitch(this,this._mouseWheel),this._mouseMove=e.hitch(this,this._mouseMove),this._mouseEnter=e.hitch(this,this._mouseEnter),this._onKeyDown=e.hitch(this,this._onKeyDown),this._onKeyUp=e.hitch(this,this._onKeyUp),a.addEventListener("mouseover",this._mouseOver,!1),a.addEventListener("mouseout",this._mouseOut,!1),a.addEventListener("mouseleave",this._mouseLeave,!1),a.addEventListener("mousedown",this._mouseDown,!1),a.addEventListener("mouseup",this._mouseUp,!1),a.addEventListener("click",
this._mouseClick,!1),a.addEventListener("mousewheel",this._mouseWheel,!1),a.addEventListener("mousemove",this._mouseMove,!1),a.addEventListener("mouseenter",this._mouseEnter,!1));this._numTouches=0;this._touches={};this._touchIds=[];this._taps=[];this._immediate=!1},_pointerDown:function(a){if(-1<n.indexOf(this._touchIds,a.pointerId))this._pointerUp(a);else{var b=this._touches,c=a.target,d=a.pointerId,f=this._touchIds,g,e=(new Date).getTime();g=b[d]={};g.pointerId=d;g.startX=g.pageX=a.pageX;g.startY=
g.pageY=a.pageY;g.startTS=e;f.push(d);this._numTouches++;c.setPointerCapture?c.setPointerCapture(d):c.msSetPointerCapture&&c.msSetPointerCapture(d);c=b[f[0]];b=b[f[1]];1!==this._numTouches&&(2===this._numTouches?this._swipeActive&&(c&&(c.startX=c.pageX,c.startY=c.pageY,c.moved=!1),this._swipeActive=!1,this._fire("onSwipeEnd",this._processTouchEvent(a,c))):this._swipeActive?(this._swipeActive=!1,this._fire("onSwipeEnd",this._processTouchEvent(a,c))):this._pinchActive&&(this._pinchActive=!1,this._fire("onPinchEnd",
this._processTouchEvent(a,[c,b]))))}},_pointerMove:function(a){var b=this._touches,c=this._touchIds,d,f,g;if((d=b[a.pointerId])&&(d.pageX!==a.pageX||d.pageY!==a.pageY))if(d.pageX=a.pageX,d.pageY=a.pageY,f=Math.abs(d.pageX-d.startX),g=Math.abs(d.pageY-d.startY),!d.moved&&(f>=this.tapRadius||g>=this.tapRadius)&&(d.moved=d.absMoved=!0),1===this._numTouches)this._swipeActive?this._fire("onSwipeMove",this._processTouchEvent(a,a)):d.moved&&(this._swipeActive=!0,this._fire("onSwipeStart",this._processTouchEvent(a,
a)));else if(2===this._numTouches)if(d=b[c[0]],b=b[c[1]],this._pinchActive)this._fire("onPinchMove",this._processTouchEvent(a,[d,b]));else if(d.moved||b.moved){c=Math.abs(d.startX-b.startX);f=Math.abs(d.startY-b.startY);g=Math.abs(d.pageX-b.pageX);var e=Math.abs(d.pageY-b.pageY);Math.abs(Math.sqrt(g*g+e*e)-Math.sqrt(c*c+f*f))>=2*this.tapRadius&&(this._pinchActive=!0,this._fire("onPinchStart",this._processTouchEvent(a,[d,b])))}},_pointerUp:function(a){var b=this._touches,c,d=this.node,f=a.target,g=
a.pointerId,e=this._touchIds,h=e.slice(0),k=n.map(h,function(a){return b[a]}),m=(new Date).getTime();if(c=b[g])if(c.pageX=a.pageX,c.pageY=a.pageY,c.endTS=m,this._numTouches--,f.releasePointerCapture?f.releasePointerCapture(g):f.msReleasePointerCapture&&f.msReleasePointerCapture(g),0===this._numTouches)if(this._touches={},this._touchIds=[],this._swipeActive)this._swipeActive=!1,this._fire("onSwipeEnd",this._processTouchEvent(a,a));else if(this._pinchActive)this._pinchActive=!1,this._fire("onPinchEnd",
this._processTouchEvent(a,a));else{if(!c.absMoved){var f=Infinity,g=-Infinity,e=Infinity,m=-Infinity,l=this.tapStartTolerance,p;for(p=0;p<h.length;p++)c=k[p],c.startTS<f&&(f=c.startTS),c.startTS>g&&(g=c.startTS),c.endTS<e&&(e=c.endTS),c.endTS>m&&(m=c.endTS);Math.abs(g-f)<=l&&Math.abs(m-e)<=l&&this._basicTap(a,k)}}else 1===this._numTouches&&this._pinchActive&&(e.splice(n.indexOf(e,a.pointerId),1),delete b[a.pointerId],c=b[e[0]],c.startX=c.pageX,c.startY=c.pageY,c.moved=!1,document.msElementsFromPoint&&
(h=document.msElementsFromPoint(c.pageX,c.pageY),n.some(h,function(a){return a===d})||(this._touches={},this._touchIds=[],this._numTouches=0)),this._pinchActive=!1,this._fire("onPinchEnd",this._processTouchEvent(a,[a,c])))},_pointerCancel:function(a){this._numTouches&&this._pointerUp(a)},_basicTap:function(a,b){var c=(new Date).getTime(),d=this,f=this._immediate;a=this._processTouchEvent(a,b);this._taps.push({touchInfos:b,ts:c,event:a});2<this._taps.length&&this._taps.shift();this._fire("onBasicTap",
a);clearTimeout(this._tapTimer);a=2===this._taps.length?this.doubleTapDuration/2:this.doubleTapDuration;this._tapTimer=setTimeout(function(){var a=d;d=null;clearTimeout(a._tapTimer);a._analyzeTap(f)},f?0:a)},_analyzeTap:function(a){var b=this._taps,c=b[0],d=b[1],f=c.touchInfos,e=d&&d.touchInfos;b.length&&(a||(this._taps=[]),c&&d?f.length===e.length?d.ts-c.ts<=this.doubleTapDuration?(1===f.length?(a=Math.abs(f[0].startX-e[0].startX),f=Math.abs(f[0].startY-e[0].startY),f=a<=this.doubleTapRadius&&f<=
this.doubleTapRadius):f=!0,f?this._processedDoubleTap(b):this._processedTap(d)):this._processedTap(d):this._processedTap(d):this._processedTap(c||d))},_processedTap:function(a){var b=a.event;this._fire("onProcessedTap",b);1===a.touchInfos.length?this._fire("onTap",this._fixEvent(b)):2===a.touchInfos.length&&this._fire("onTwoFingerTap",b)},_processedDoubleTap:function(a){var b=1===a[1].touchInfos.length,c;b&&(c=[this._fixEvent(a[0].event),this._fixEvent(a[1].event)],c[1].relatedEvents=c);a=[a[0].event,
a[1].event];a[1].relatedEvents=a;this._fire("onProcessedDoubleTap",a[1]);b&&(this._fire("onDoubleTap",c[1]),this._fire("onDblClick",c[1]))},_mouseOver:function(a){this._fire("onMouseOver",this._processMouseEvent(a))},_mouseMove:function(a){this._dragging?this._fire("onMouseDrag",this._processMouseEvent(a)):this._fire("onMouseMove",this._processMouseEvent(a))},_mouseOut:function(a){this._fire("onMouseOut",this._processMouseEvent(a))},_mouseLeave:function(a){document.removeEventListener("keydown",this._onKeyDown,
!1);document.removeEventListener("keyup",this._onKeyUp,!1);this._fire("onMouseOut",this._processMouseEvent(a))},_mouseDown:function(a){this._downX=a.pageX;this._downY=a.pageY;this._fire("onMouseDown",this._processMouseEvent(a));0===a.button&&(this._dragging=!0,this._fire("onMouseDragStart",this._processMouseEvent(a)))},_mouseUp:function(a){this._dragging&&(this._dragging=!1,this._fire("onMouseDragEnd",this._processMouseEvent(a)));this._fire("onMouseUp",this._processMouseEvent(a))},_mouseClick:function(a){Math.abs(a.pageX-
this._downX)<=this.clickRadius&&Math.abs(a.pageY-this._downY)<=this.clickRadius&&this._fire("onClick",this._processMouseEvent(a))},_mouseWheel:function(a){var b=this.map;(b?b.isScrollWheelZoom||b.isScrollWheelPan:this.preventPageScroll)&&a.preventDefault();var b=a.wheelDelta?a.wheelDelta/this.wheelDivisor:-a.detail/this.mozWheelDivisor,c=Math.abs(b),c=c<=this.minWheelValue?this.minWheelValue:this.maxWheelValue;a.value=0>b?-c:c;this._fire("onMouseWheel",this._processMouseEvent(a))},_mouseEnter:function(a){document.removeEventListener("keydown",
this._onKeyDown,!1);document.removeEventListener("keyup",this._onKeyUp,!1);document.addEventListener("keydown",this._onKeyDown,!1);document.addEventListener("keyup",this._onKeyUp,!1);this._fire("onMouseEnter",this._processMouseEvent(a))},_onKeyDown:function(a){this._fire("onKeyDown",a)},_onKeyUp:function(a){this._fire("onKeyUp",a)},_fire:function(a,b){if(this[a])this[a](b);if(this.map&&this.map[a])this.map[a](b)},_fixEvent:function(a){var b={},c;for(c in a)b[c]=a[c];b.preventDefault=function(){a.preventDefault()};
b.stopPropagation=function(){a.stopPropagation()};this.map&&(b.screenPoint=b.screenPoints[0],b.mapPoint=b.mapPoints[0]);return b},_processTouchEvent:function(a,b){var c=this.map,d=c&&c.position,f=0;if(d&&b)if(e.isArray(b)){var g,h;a.screenPoints=[];a.mapPoints=[];for(g=0;g<b.length;g++)b[g]?(h=new l(b[g].pageX-d.x,b[g].pageY-d.y),a.screenPoints.push(h),a.mapPoints.push(c.extent?c.toMap(h):new k)):f++}else a.screenPoint=new l(b.pageX-d.x,b.pageY-d.y),a.mapPoint=c.extent?c.toMap(a.screenPoint):new k;
a.numPoints=b?e.isArray(b)?b.length-f:1:0;return a},_processMouseEvent:function(a){var b=this.map,c=b&&b.position;c&&(a.screenPoint=new l(a.pageX-c.x,a.pageY-c.y),a.mapPoint=b.extent?b.toMap(a.screenPoint):new k);return a},setImmediateTap:function(a){this._immediate=a},destroy:function(){var a=this.node;a.removeEventListener("MSPointerDown",this._pointerDown,!1);a.removeEventListener("MSPointerMove",this._pointerMove,!1);a.removeEventListener("MSPointerUp",this._pointerUp,!1);a.removeEventListener("MSPointerCancel",
this._pointerCancel,!1);this.map&&(a.removeEventListener("mouseover",this._mouseOver,!1),a.removeEventListener("mousemove",this._mouseMove,!1),a.removeEventListener("mouseout",this._mouseOut,!1),a.removeEventListener("mouseleave",this._mouseLeave,!1),a.removeEventListener("mousedown",this._mouseDown,!1),a.removeEventListener("mouseup",this._mouseUp,!1),a.removeEventListener("click",this._mouseClick,!1),a.removeEventListener("mouseenter",this._mouseEnter,!1));clearTimeout(this._tapTimer);this.node=
this.map=this._numTouches=this._touches=this._touchIds=this._taps=null}});q("extend-esri")&&(r.PointerEvents=h);return h});