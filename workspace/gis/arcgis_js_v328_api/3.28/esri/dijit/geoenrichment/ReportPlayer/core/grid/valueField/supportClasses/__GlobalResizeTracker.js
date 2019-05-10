// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See http://js.arcgis.com/3.28/esri/copyright.txt for details.
//>>built
define("esri/dijit/geoenrichment/ReportPlayer/core/grid/valueField/supportClasses/__GlobalResizeTracker",["dojo/dom-class"],function(b){return{_grid:null,_timeoutHandle:null,setIsBeingResized:function(a,c){this._cleanUp();c&&a.parentGrid&&a.parentGrid.domNode&&(this._grid=a.parentGrid,b.add(this._grid.domNode,"isBeingResized"),this._timeoutHandle=setTimeout(this._cleanUp.bind(this),1E4))},_cleanUp:function(){clearTimeout(this._timeoutHandle);this._grid&&this._grid.domNode&&b.remove(this._grid.domNode,
"isBeingResized");this._grid=null}}});