// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.11/esri/copyright.txt for details.
//>>built
define("../../Component ../../Buttons/Toggle ../../Dropdowns/Ago2018Dropdown dojo/i18n!../../Dropdowns/SortDropdown/nls/resources ../../Buttons/IconButton ../../Modals/MobileWrap".split(" "),function(g,h,m,n,p,q){return function(e){function c(a){if(b[a])return b[a].exports;var d=b[a]={i:a,l:!1,exports:{}};return e[a].call(d.exports,d,d.exports,c),d.l=!0,d.exports}var b={};return c.m=e,c.c=b,c.d=function(a,d,b){c.o(a,d)||Object.defineProperty(a,d,{enumerable:!0,get:b})},c.r=function(a){"undefined"!=
typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(a,Symbol.toStringTag,{value:"Module"});Object.defineProperty(a,"__esModule",{value:!0})},c.t=function(a,d){if((1&d&&(a=c(a)),8&d)||4&d&&"object"==typeof a&&a&&a.__esModule)return a;var b=Object.create(null);if(c.r(b),Object.defineProperty(b,"default",{enumerable:!0,value:a}),2&d&&"string"!=typeof a)for(var e in a)c.d(b,e,function(d){return a[d]}.bind(null,e));return b},c.n=function(a){var d=a&&a.__esModule?function(){return a.default}:function(){return a};
return c.d(d,"a",d),d},c.o=function(a,d){return Object.prototype.hasOwnProperty.call(a,d)},c.p="",c(c.s=373)}({0:function(e,c,b){function a(a,b){function c(){this.constructor=a}d(a,b);a.prototype=null===b?Object.create(b):(c.prototype=b.prototype,new c)}b.d(c,"b",function(){return a});b.d(c,"a",function(){return f});var d=function(a,b){return(d=Object.setPrototypeOf||{__proto__:[]}instanceof Array&&function(a,b){a.__proto__=b}||function(a,b){for(var d in b)b.hasOwnProperty(d)&&(a[d]=b[d])})(a,b)},
f=function(){return(f=Object.assign||function(a){for(var b,d=1,c=arguments.length;d<c;d++)for(var e in b=arguments[d])Object.prototype.hasOwnProperty.call(b,e)&&(a[e]=b[e]);return a}).apply(this,arguments)}},103:function(e,c){e.exports=q},26:function(e,c){e.exports=h},373:function(e,c,b){b.r(c);var a=b(0),d=b(78);e=b(4);var f=b(91),l=b.n(f),f=b(26),k=b.n(f),f=b(54),g=b.n(f),f=b(103),h=b.n(f);b=function(b){function c(a){a=b.call(this,a)||this;return a.handleSortClick=a.handleSortClick.bind(a),a.handleFieldChange=
a.handleFieldChange.bind(a),a.handleOrderChange=a.handleOrderChange.bind(a),a.handleMobileWrapClose=a.handleMobileWrapClose.bind(a),a}return a.b(c,b),c.prototype.render=function(a){var b=this,c=[a("div",{class:"drp-sort__menu-section",role:"tree"},a("h3",{class:"drp-sort__menu-title"},d.sortBy),this.props.availableFields.map(function(c){return a(k.a,{key:c,name:d[c],value:c,onToggleClick:b.handleFieldChange,selectedToggle:b.props.field})})),a("div",{class:"drp-sort__menu-section",role:"tree"},a("h3",
{class:"drp-sort__menu-title drp-sort__menu-direction"},d.sortDir),a(k.a,{key:"ascending-toggle",name:d.ascending[this.props.field],value:"asc",onToggleClick:this.handleOrderChange,selectedToggle:this.props.order}),a(k.a,{key:"descending-toggle",name:d.descending[this.props.field],value:"desc",onToggleClick:this.handleOrderChange,selectedToggle:this.props.order}))];return window.matchMedia("(max-width: 860px)").matches?[a(l.a,{key:"gb-sort-btn-mobile",active:this.props.active,handleClick:this.handleSortClick},
a("div",{class:"drp-sort__btn-body"},a("svg",{width:"16px",height:"16px",viewBox:"0 0 16 16"},a("g",{stroke:"none","stroke-width":"1"},a("g",{id:"sort-1px-16"},a("path",{d:"M1,1 L15,1 L15,2 L1,2 L1,1 Z M4,5 L15,5 L15,6 L4,6 L4,5 Z M7,9 L15,9 L15,10 L7,10 L7,9 Z M11,13 L15,13 L15,14 L11,14 L11,13 Z"})))),a("span",{class:"drp-sort__btn-label"},d[this.props.field]))),a(h.a,{key:"sort-mobile-wrap",title:d.sort,open:this.props.active,onClose:this.handleMobileWrapClose},c)]:a(g.a,{key:"sort-dropdown",active:this.props.active,
onToggle:this.handleSortClick},a(l.a,{key:"gb-sort-btn",active:this.props.active,handleClick:this.stub,tabindex:-1},a("div",{class:"drp-sort__btn-body"},a("svg",{width:"16px",height:"16px",viewBox:"0 0 16 16"},a("g",{stroke:"none","stroke-width":"1"},a("g",{id:"sort-1px-16"},a("path",{d:"M1,1 L15,1 L15,2 L1,2 L1,1 Z M4,5 L15,5 L15,6 L4,6 L4,5 Z M7,9 L15,9 L15,10 L7,10 L7,9 Z M11,13 L15,13 L15,14 L11,14 L11,13 Z"})))),a("span",{class:"drp-sort__btn-label"},d[this.props.field]))),a("div",{class:"drp-sort__menu-container"},
c))},c.prototype.stub=function(){},c.prototype.handleSortClick=function(){this.props.onClick&&this.props.onClick()},c.prototype.handleFieldChange=function(a){a!==this.props.field&&this.props.onFieldChange&&this.props.onFieldChange(a)},c.prototype.handleOrderChange=function(a){a!==this.props.order&&this.props.onOrderChange&&this.props.onOrderChange(a)},c.prototype.handleMobileWrapClose=function(){this.props.onClick&&this.props.onClick()},c}(e.Component);c.default=b},4:function(e,c){e.exports=g},54:function(e,
c){e.exports=m},78:function(e,c){e.exports=n},91:function(e,c){e.exports=p}})});