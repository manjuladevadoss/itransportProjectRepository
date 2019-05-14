//>>built
define("dojox/grid/enhanced/plugins/AutoScroll","dojo/_base/declare dojo/_base/array dojo/_base/lang dojo/_base/html dojo/_base/window ../_Plugin ../../_RowSelector ../../EnhancedGrid".split(" "),function(h,m,n,k,p,q,r,t){h=h("dojox.grid.enhanced.plugins.AutoScroll",q,{name:"autoScroll",autoScrollInterval:1E3,autoScrollMargin:30,constructor:function(b,a){this.grid=b;this._scrolling=this.readyForAutoScroll=!1;a=n.isObject(a)?a:{};"interval"in a&&(this.autoScrollInterval=a.interval);"margin"in a&&(this.autoScrollMargin=
a.margin);this._initEvents();this._mixinGrid()},_initEvents:function(){var b=this.grid;this.connect(b,"onCellMouseDown",function(){this.readyForAutoScroll=!0});this.connect(b,"onHeaderCellMouseDown",function(){this.readyForAutoScroll=!0});this.connect(b,"onRowSelectorMouseDown",function(){this.readyForAutoScroll=!0});this.connect(p.doc,"onmouseup",function(a){this._manageAutoScroll(!0);this.readyForAutoScroll=!1});this.connect(p.doc,"onmousemove",function(a){if(this.readyForAutoScroll){this._event=
a;var c=k.position(b.domNode),g=b._getHeaderHeight(),f=this.autoScrollMargin,d=a.clientY,e=a.clientX;a=c.y;var h=c.x,l=c.h,c=c.w;if(e>=h&&e<=h+c){if(d>=a+g&&d<a+g+f){this._manageAutoScroll(!1,!0,!1);return}if(d>a+l-f&&d<=a+l){this._manageAutoScroll(!1,!0,!0);return}if(d>=a&&d<=a+l&&m.some(b.views.views,function(a,b){if(a instanceof r)return!1;b=k.position(a.domNode);return e<b.x+f&&e>=b.x?(this._manageAutoScroll(!1,!1,!1,a),!0):e>b.x+b.w-f&&e<b.x+b.w?(this._manageAutoScroll(!1,!1,!0,a),!0):!1},this))return}this._manageAutoScroll(!0)}})},
_mixinGrid:function(){var b=this.grid;b.onStartAutoScroll=function(){};b.onEndAutoScroll=function(){}},_fireEvent:function(b,a){var c=this.grid;switch(b){case "start":c.onStartAutoScroll.apply(c,a);break;case "end":c.onEndAutoScroll.apply(c,a)}},_manageAutoScroll:function(b,a,c,g){b?(this._scrolling=!1,clearInterval(this._handler)):this._scrolling||(this._scrolling=!0,this._fireEvent("start",[a,c,g]),this._autoScroll(a,c,g),this._handler=setInterval(n.hitch(this,"_autoScroll",a,c,g),this.autoScrollInterval))},
_autoScroll:function(b,a,c){var g=this.grid,f=null;if(b){var d=g.scroller.firstVisibleRow+(a?1:-1);0<=d&&d<g.rowCount&&(g.scrollToRow(d),f=d)}else f=this._scrollColumn(a,c);null!==f&&this._fireEvent("end",[b,a,c,f,this._event])},_scrollColumn:function(b,a){var c=a.scrollboxNode,g=null;if(c.clientWidth<c.scrollWidth){var f=m.filter(this.grid.layout.cells,function(a){return!a.hidden});a=k.position(a.domNode);var d,e;if(b)for(b=c.clientWidth,e=0;e<f.length;++e){if(d=k.position(f[e].getHeaderNode()),
d=d.x-a.x+d.w,d>b){g=f[e].index;c.scrollLeft+=d-b+10;break}}else for(b=0,e=f.length-1;0<=e;--e)if(d=k.position(f[e].getHeaderNode()),d=d.x-a.x,d<b){g=f[e].index;c.scrollLeft+=d-b-10;break}}return g}});t.registerPlugin(h);return h});