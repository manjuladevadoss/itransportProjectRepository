// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.11/esri/copyright.txt for details.
//>>built
define("require exports ../core/tsSupport/declareExtendsHelper ../core/tsSupport/decorateHelper dojo/i18n!./Bookmarks/nls/Bookmarks ../core/Handles ../core/watchUtils ../core/accessorSupport/decorators ./Widget ./Bookmarks/BookmarksViewModel ./support/widget".split(" "),function(q,r,l,d,f,m,g,e,n,h,c){return function(k){function a(b){b=k.call(this)||this;b._handles=new m;b.bookmarks=null;b.goToOverride=null;b.iconClass="esri-icon-bookmark";b.label=f.widgetLabel;b.view=null;b.viewModel=new h;return b}
l(a,k);a.prototype.postInitialize=function(){var b=this;this.own([g.on(this,"viewModel.bookmarks","change",function(){return b._bookmarksChanged()}),g.init(this,"viewModel.bookmarks",function(){return b._bookmarksChanged()})])};a.prototype.destroy=function(){this._handles.destroy();this._handles=null};a.prototype.goTo=function(b){return null};a.prototype.render=function(){var b,a=this.viewModel.state,p="disabled"===a?this._renderDisabled():"loading"===a?this._renderLoading():this._renderBookmarks(),
a=(b={},b["esri-disabled"]="disabled"===a,b);return c.tsx("div",{class:this.classes(a,"esri-bookmarks esri-widget--panel","esri-widget")},p)};a.prototype._renderLoading=function(){return c.tsx("div",{class:"esri-bookmarks__loader-container",key:"loader"},c.tsx("div",{class:"esri-bookmarks__loader"}))};a.prototype._renderDisabled=function(){return c.tsx("div",{key:"bookmarks-disabled",class:this.classes("esri-widget__content--empty","esri-bookmarks__disabled-container")},c.tsx("h1",{class:"esri-widget__heading"},
f.disabledHeading),c.tsx("p",{class:"esri-bookmarks__disabled-description"},f.disabledDescription))};a.prototype._renderNoBookmarksContainer=function(){return c.tsx("div",{class:"esri-widget__content--empty",key:"no-bookmarks"},c.tsx("svg",{class:"esri-widget__content-icon--empty",xmlns:"http://www.w3.org/2000/svg",viewBox:"0 0 32 32"},c.tsx("path",{fill:"currentColor",d:"M26 30.435L16.5 24.1 7 30.435V1h19zm-9.5-7.536l8.5 5.666V2H8v26.565z"})),c.tsx("h1",{class:this.classes("esri-widget__heading",
"esri-bookmarks__no-bookmarks-heading")},f.noBookmarksHeading),c.tsx("p",{class:"esri-bookmarks__no-bookmarks-description"},f.noBookmarksDescription))};a.prototype._renderBookmarksContainer=function(b){var a=this;return c.tsx("ul",{key:"bookmark-list","aria-label":f.widgetLabel,class:"esri-bookmarks__list"},b.map(function(b){return a._renderBookmark(b)}).toArray())};a.prototype._renderBookmarks=function(){var b=this.viewModel.bookmarks.filter(Boolean);return b.length?this._renderBookmarksContainer(b):
this._renderNoBookmarksContainer()};a.prototype._renderBookmark=function(b){var a,d=this.viewModel.activeBookmark,e=b.name,g=b.thumbnail,d=(a={},a["esri-bookmarks__bookmark--active"]=d===b,a);a=(a=g&&g.url||"")?c.tsx("div",{class:"esri-bookmarks__bookmark-container"},c.tsx("img",{src:a,alt:e,class:"esri-bookmarks__image"})):c.tsx("span",{"aria-hidden":"true",class:this.classes("esri-bookmarks__bookmark-icon","esri-icon-bookmark")});return c.tsx("li",{bind:this,"data-bookmark-item":b,class:this.classes("esri-bookmarks__bookmark",
d),onclick:this._goToBookmark,onkeydown:this._goToBookmark,tabIndex:0,role:"button",title:f.goToBookmark,"aria-label":e},a,c.tsx("span",{class:"esri-bookmarks__bookmark-name"},e))};a.prototype._bookmarksChanged=function(){var a=this,c=this.viewModel.bookmarks,d=this._handles;d.remove("items");c=c.map(function(b){return g.watch(b,["active","name","thumbnail.url"],function(){return a.scheduleRender()})});d.add(c,"items");this.scheduleRender()};a.prototype._goToBookmark=function(a){this.viewModel.goTo(a.currentTarget["data-bookmark-item"])};
d([e.aliasOf("viewModel.bookmarks")],a.prototype,"bookmarks",void 0);d([e.aliasOf("viewModel.goToOverride")],a.prototype,"goToOverride",void 0);d([e.property()],a.prototype,"iconClass",void 0);d([e.property()],a.prototype,"label",void 0);d([e.aliasOf("viewModel.view")],a.prototype,"view",void 0);d([e.property({type:h}),c.renderable(["activeBookmark","state"]),c.vmEvent(["select-bookmark"])],a.prototype,"viewModel",void 0);d([e.aliasOf("viewModel.goTo")],a.prototype,"goTo",null);d([c.accessibleHandler()],
a.prototype,"_goToBookmark",null);return a=d([e.subclass("esri.widgets.Bookmarks")],a)}(e.declared(n))});