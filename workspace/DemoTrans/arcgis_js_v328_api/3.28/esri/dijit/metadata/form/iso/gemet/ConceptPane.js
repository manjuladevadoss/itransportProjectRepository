// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See http://js.arcgis.com/3.28/esri/copyright.txt for details.
//>>built
require({cache:{"url:esri/dijit/metadata/form/iso/gemet/templates/ConceptPane.html":'\x3cdiv class\x3d"gxeGemetPane"\x3e\r\n\r\n  \x3cdiv class\x3d"gxeTop" data-dojo-attach-point\x3d"topNode"\x3e\r\n    \x3cdiv class\x3d"gxeLeft gxeFloatLeft"\x3e\r\n      \x3cselect data-dojo-attach-point\x3d"languageSelect" \r\n        data-dojo-attach-event\x3d"onchange: _onLanguageChange"\x3e\x3c/select\x3e\r\n    \x3c/div\x3e\r\n    \x3cdiv class\x3d"gxeRight gxeFloatRight"\x3e\r\n      \x3clabel for\x3d"${id}_searchText"\x3e${i18nIso.gemet.concept.searchLabel}\x3c/label\x3e\r\n      \x3cinput id\x3d"${id}_searchText" type\x3d"text" size\x3d"30" data-dojo-attach-point\x3d"searchText"\x3e\r\n      \x3cdiv class\x3d"gxeIconSearch" title\x3d"${i18nIso.gemet.concept.searchTip}"\r\n        data-dojo-attach-event\x3d"onclick: _onSearchClick"\x3e\x3c/div\x3e\r\n    \x3c/div\x3e\r\n    \x3cdiv class\x3d"gxeClear"\x3e\x3c/div\x3e\r\n  \x3c/div\x3e\r\n  \r\n  \x3cdiv class\x3d"gxeOptions" data-dojo-attach-point\x3d"resultsNode"\x3e\x3c/div\x3e\r\n  \r\n  \x3cdiv class\x3d"gxeDialogActionBar" data-dojo-attach-point\x3d"bottomNode"\x3e\r\n    \x3cdiv class\x3d"gxeLeft gxeFloatLeft"\x3e\r\n      \x3cspan class\x3d"gxeMessage" data-dojo-attach-point\x3d"workingNode"\x3e${i18nIso.gemet.searching}\x3c/span\x3e\r\n    \x3c/div\x3e\r\n    \x3cdiv class\x3d"gxeRight gxeFloatRight gxeButtons"\x3e\r\n      \x3cbutton class\x3d"gxeButton" data-dojo-attach-point\x3d"cancelButton"\r\n        data-dojo-attach-event\x3d"onclick: _onCancelClick"\x3e${i18nBase.general.cancel}\x3c/button\x3e\r\n    \x3c/div\x3e\r\n    \x3cdiv class\x3d"gxeClear"\x3e\x3c/div\x3e\r\n  \x3c/div\x3e\r\n   \r\n\x3c/div\x3e'}});
define("esri/dijit/metadata/form/iso/gemet/ConceptPane","dojo/_base/declare dojo/_base/lang dojo/_base/array dojo/on dojo/keys dojo/dom-construct dojo/has ../../../base/Templated dojo/text!./templates/ConceptPane.html dojo/i18n!../../../nls/i18nBase dojo/i18n!../../../nls/i18nIso ../../../base/etc/docUtil ./gemet ../../../../../request ../../../../../kernel".split(" "),function(h,g,m,n,p,d,q,r,t,u,l,k,f,v,w){h=h([r],{dialogBroker:null,gxeDocument:null,initialValue:null,i18nBase:u,i18nIso:l,templateString:t,
gemetUrl:null,gemetConceptThesaurus:null,initialLanguage:null,_activePromise:null,postCreate:function(){this.inherited(arguments);this.workingNode.style.display="none";var a=this.gxeDocument.gxeContext;this.gemetUrl=a.gemetUrl;this.gemetConceptThesaurus=a.gemetConceptThesaurus;f.populateLanguages(this.gxeDocument,this.languageSelect);this.initialLanguage=f.getSelectedLanguage(this.languageSelect);this.searchText.value=f.getSessionConceptQuery();this._query();this.own(n(this.searchText,"keyup",g.hitch(this,
function(a){a.keyCode==p.ENTER&&this._query()})))},_addOption:function(a,b,c){var e="Unknown";b=null;a.preferredLabel&&"string"===typeof a.preferredLabel.string&&(e=g.trim(a.preferredLabel.string));a.definition&&"string"===typeof a.definition.string&&(b=g.trim(a.definition.string),0===b.length&&(b=null));var f=e,h=this;a=d.create("div",{"class":"gxeOption"},c);c=d.create("div",{"class":"gxeClickableText",onclick:function(){h._onSelect(f)}},a);k.setNodeText(c,e);null!==b&&0<b.length&&(e=d.create("div",
{"class":"gxeDescription gxeSmallText"},a),k.setNodeText(e,b))},_fetch:function(a,b){var c=this.gemetUrl+"/getConceptsMatchingRegexByThesaurus",c=c+("?thesaurus_uri\x3d"+encodeURIComponent(this.gemetConceptThesaurus)),c=c+("\x26language\x3d"+encodeURIComponent(a)),c=c+("\x26regex\x3d"+encodeURIComponent(b));return v({url:c,handleAs:"json",callbackParamName:"jsonp"},{})},_getSearchText:function(){return g.trim(this.searchText.value)},_handleError:function(a){this.workingNode.style.display="none";console.error(a);
a=l.gemet.ioerror.replace("{url}",this.gemetUrl);d.empty(this.resultsNode);var b=d.create("div",{"class":"gxeMessagePane"},this.resultsNode);d.create("div",{"class":"gxeIcon gxeIconError"},b);b=d.create("div",{"class":"gxeMessageText"},b);k.setNodeText(b,a)},_onCancelClick:function(a){this.onCancelClick(a)},onCancelClick:function(a){},_onLanguageChange:function(a){this._query()},_onSearchClick:function(a){this._query()},_onSelect:function(a){var b=f.getSelectedLanguage(this.languageSelect);this.initialLanguage!==
b&&f.saveSessionLanguage(b);this.onSelect(a)},onSelect:function(a){},_query:function(){var a=f.getSelectedLanguage(this.languageSelect),b=this._getSearchText();null!==b&&0!==b.length&&null===this._activePromise&&(this.workingNode.style.display="inline-block",d.empty(this.resultsNode),(this._activePromise=this._fetch(a,b)).then(g.hitch(this,function(a){this._activePromise=null;try{this._render(a,b)}catch(e){this._handleError(e)}}),g.hitch(this,function(a){this._activePromise=null;this._handleError(a)})))},
_render:function(a,b){var c=0,e=this.resultsNode;d.empty(e);m.forEach(a,function(a,b){c++;this._addOption(a,b,e)},this);this.workingNode.style.display="none";0===c?(d.empty(e),a=d.create("div",{"class":"gxeMessagePane"},this.resultsNode),d.create("div",{"class":"gxeIcon gxeIconWarning"},a),a=d.create("div",{"class":"gxeMessageText"},a),k.setNodeText(a,l.gemet.noMatch)):f.saveSessionConceptQuery(b)}});q("extend-esri")&&g.setObject("dijit.metadata.form.iso.gemet.ConceptPane",h,w);return h});