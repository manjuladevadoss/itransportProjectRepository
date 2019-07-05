//>>built
define("dojox/grid/cells/dijit","dojo/_base/kernel ../../main dojo/_base/declare dojo/_base/array dojo/_base/lang dojo/_base/json dojo/_base/connect dojo/_base/sniff dojo/dom dojo/dom-attr dojo/dom-construct dojo/dom-style dojo/dom-geometry dojo/data/ItemFileReadStore dijit/form/DateTextBox dijit/form/TimeTextBox dijit/form/ComboBox dijit/form/CheckBox dijit/form/TextBox dijit/form/NumberSpinner dijit/form/NumberTextBox dijit/form/CurrencyTextBox dijit/form/HorizontalSlider dijit/form/_TextBoxMixin dijit/Editor ../util ./_base".split(" "),
function(p,f,g,v,d,q,C,r,w,h,x,y,D,z,k,E,l,m,A,F,G,H,I,B,n,t,u){f={};var e=f._Widget=g("dojox.grid.cells._Widget",u,{widgetClass:A,constructor:function(a){this.widget=null;"string"==typeof this.widgetClass&&(p.deprecated("Passing a string to widgetClass is deprecated","pass the widget class object instead","2.0"),this.widgetClass=d.getObject(this.widgetClass))},formatEditing:function(a,b){this.needFormatNode(a,b);return"\x3cdiv\x3e\x3c/div\x3e"},getValue:function(a){return this.widget.get("value")},
_unescapeHTML:function(a){return a&&a.replace&&this.grid.escapeHTMLInData?a.replace(/&lt;/g,"\x3c").replace(/&amp;/g,"\x26"):a},setValue:function(a,b){if(this.widget&&this.widget.set)if(b=this._unescapeHTML(b),this.widget.onLoadDeferred){var c=this;this.widget.onLoadDeferred.addCallback(function(){c.widget.set("value",null===b?"":b)})}else this.widget.set("value",b);else this.inherited(arguments)},getWidgetProps:function(a){return d.mixin({dir:this.dir,lang:this.lang},this.widgetProps||{},{constraints:d.mixin({},
this.constraint)||{},required:(this.constraint||{}).required,value:this._unescapeHTML(a)})},createWidget:function(a,b,c){return new this.widgetClass(this.getWidgetProps(b),a)},attachWidget:function(a,b,c){a.appendChild(this.widget.domNode);this.setValue(c,b)},formatNode:function(a,b,c){if(!this.widgetClass)return b;this.widget?this.attachWidget.apply(this,arguments):this.widget=this.createWidget.apply(this,arguments);this.sizeWidget.apply(this,arguments);this.grid.views.renormalizeRow(c);this.grid.scroller.rowHeightChanged(c,
!0);this.focus()},sizeWidget:function(a,b,c){a=this.getNode(c);p.marginBox(this.widget.domNode,{w:y.get(a,"width")})},focus:function(a,b){this.widget&&setTimeout(d.hitch(this.widget,function(){t.fire(this,"focus");this.focusNode&&"INPUT"===this.focusNode.tagName&&B.selectInputText(this.focusNode)}),0)},_finish:function(a){this.inherited(arguments);t.removeNode(this.widget.domNode);r("ie")&&w.setSelectable(this.widget.domNode,!0)}});e.markupFactory=function(a,b){u.markupFactory(a,b);var c=d.trim(h.get(a,
"widgetProps")||""),e=d.trim(h.get(a,"constraint")||"");a=d.trim(h.get(a,"widgetClass")||"");c&&(b.widgetProps=q.fromJson(c));e&&(b.constraint=q.fromJson(e));a&&(b.widgetClass=d.getObject(a))};l=f.ComboBox=g("dojox.grid.cells.ComboBox",e,{widgetClass:l,getWidgetProps:function(a){var b=[];v.forEach(this.options,function(a){b.push({name:a,value:a})});var c=new z({data:{identifier:"name",items:b}});return d.mixin({},this.widgetProps||{},{value:a,store:c})},getValue:function(){var a=this.widget;a.set("displayedValue",
a.get("displayedValue"));return a.get("value")}});l.markupFactory=function(a,b){e.markupFactory(a,b);if(a=d.trim(h.get(a,"options")||"")){var c=a.split(",");c[0]!=a&&(b.options=c)}};k=f.DateTextBox=g("dojox.grid.cells.DateTextBox",e,{widgetClass:k,setValue:function(a,b){this.widget?this.widget.set("value",new Date(b)):this.inherited(arguments)},getWidgetProps:function(a){return d.mixin(this.inherited(arguments),{value:new Date(a)})}});k.markupFactory=function(a,b){e.markupFactory(a,b)};m=f.CheckBox=
g("dojox.grid.cells.CheckBox",e,{widgetClass:m,getValue:function(){return this.widget.checked},setValue:function(a,b){this.widget&&this.widget.attributeMap.checked?this.widget.set("checked",b):this.inherited(arguments)},sizeWidget:function(a,b,c){}});m.markupFactory=function(a,b){e.markupFactory(a,b)};n=f.Editor=g("dojox.grid.cells.Editor",e,{widgetClass:n,getWidgetProps:function(a){return d.mixin({},this.widgetProps||{},{height:this.widgetHeight||"100px"})},createWidget:function(a,b,c){a=new this.widgetClass(this.getWidgetProps(b),
a);a.onLoadDeferred.then(d.hitch(this,"populateEditor"));return a},formatNode:function(a,b,c){this.content=b;this.inherited(arguments);if(r("mozilla")){var d=this.widget;d.open();this.widgetToolbar&&x.place(d.toolbar.domNode,d.editingArea,"before")}},populateEditor:function(){this.widget.set("value",this.content);this.widget.placeCursorAtEnd()}});n.markupFactory=function(a,b){e.markupFactory(a,b);if(a=d.trim(h.get(a,"widgetHeight")||""))"auto"!=a&&"em"!=a.substr(-2)&&(a=parseInt(a,10)+"px"),b.widgetHeight=
a};return f});