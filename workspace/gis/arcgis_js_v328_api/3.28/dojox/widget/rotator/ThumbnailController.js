//>>built
define("dojox/widget/rotator/ThumbnailController","dojo/_base/declare dojo/_base/connect dojo/_base/lang dojo/_base/event dojo/aspect dojo/dom-attr dojo/dom-class dojo/dom-construct dojo/query".split(" "),function(l,r,f,m,n,e,p,g,q){return l("dojox.widget.rotator.ThumbnailController",null,{rotator:null,constructor:function(a,b){f.mixin(this,a);this._domNode=b;var c=this.rotator;if(c){for(;b.firstChild;)b.removeChild(b.firstChild);for(a=0;a<c.panes.length;a++){var d=c.panes[a].node,h=e.get(d,"thumbsrc")||
e.get(d,"src"),k=e.get(d,"alt")||"";/img/i.test(d.tagName)&&function(a){g.create("a",{classname:"dojoxRotatorThumb dojoxRotatorThumb"+a+" "+(a==c.idx?"dojoxRotatorThumbSelected":""),href:h,onclick:function(b){m.stop(b);c&&c.control.apply(c,["go",a])},title:k,innerHTML:'\x3cimg src\x3d"'+h+'" alt\x3d"'+k+'"/\x3e'},b)}(a)}n.after(c,"onUpdate",f.hitch(this,"_onUpdate"),!0)}},destroy:function(){g.destroy(this._domNode)},_onUpdate:function(a){var b=this.rotator;"onAfterTransition"==a&&(a=q(".dojoxRotatorThumb",
this._domNode).removeClass("dojoxRotatorThumbSelected"),b.idx<a.length&&p.add(a[b.idx],"dojoxRotatorThumbSelected"))}})});