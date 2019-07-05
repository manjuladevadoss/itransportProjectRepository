// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.11/esri/copyright.txt for details.
//>>built
define("require exports ../../core/tsSupport/declareExtendsHelper ../../core/tsSupport/decorateHelper ../../core/tsSupport/assignHelper ../../core/tsSupport/generatorHelper ../../core/tsSupport/awaiterHelper ../../core/Accessor ../../core/arrayUtils ../../core/Collection ../../core/Error ../../core/HandleOwner ../../core/Logger ../../core/promiseUtils ../../core/watchUtils ../../core/accessorSupport/decorators ../../layers/GraphicsLayer ../../layers/graphics/editingSupport ../../layers/support/fieldUtils ../../renderers/support/clickToleranceUtils ../../symbols/support/symbolUtils ../../views/2d/layers/support/popupUtils2D ../../views/support/layerViewUtils ./CreateWorkflowData ./Edits ./UpdateWorkflowData ./Workflow ../FeatureForm/FeatureFormViewModel ../FeatureTemplates/FeatureTemplatesViewModel ../Sketch/SketchViewModel".split(" "),
function(ba,ca,C,g,w,h,k,D,p,E,F,G,H,x,r,e,I,J,K,L,M,N,O,P,y,Q,z,R,S,T){function n(d,b,a){U.error(new F(d,b,a))}function V(d){return d&&J.isEditableLayer(d.layer)}function v(d,b){return d&&p.find(d,function(a){return a.layer===b})}function W(d,b){var a=d.layer,c=a.createQuery();c.objectIds=[d.getAttribute(a.objectIdField)];c.outFields=["*"];c.outSpatialReference=b.spatialReference;return a.queryFeatures(c).then(function(a){return a.features[0]})}function X(d,b,a,c,l){d.create(b.layer.geometryType);
var f=d.on("create",function(a){var f=a.state;a=a.graphic;if("cancel"===f)l();else if("complete"===f){var m=a.clone();m.attributes=w({},b.template.prototype.attributes);m.layer=b.layer;d.layer.remove(a);var t=m.symbol;m.symbol=null;M.getDisplayedSymbol(m).then(function(a){m.symbol=a||t;c(m)})}});a.map.add(d.layer);return{remove:function(){f.remove();a.map.remove(d.layer);d.cancel()}}}function A(d,b,a,c){var l=d.clone();b.layer.add(l);var f=function(){var c=d.layer;if("graphics"===c.type)return{remove:function(){}};
var b=d.attributes[c.objectIdField];a.whenLayerView(d.layer).then(function(a){return a.setVisibility(b,!1)});return{remove:function(){a.whenLayerView(d.layer).then(function(a){return a.setVisibility(b,!0)})}}}(),t={multipleSelectionEnabled:!1};b.update(l,t);var u=b.on("update",function(a){var l=a.graphics[0];"cancel"===a.state?b.update(l,t):c(l.clone())});a.map.add(b.layer);return{remove:function(){f.remove();u.remove();a.map.remove(b.layer);b.cancel();b.layer.removeAll()}}}function Y(d){if(1===d.length)if(d=
d[0],"items"in d){if(1===d.items.length)return d.items[0]}else return d}var Z=this,U=H.getLogger("esri.widgets.Editor.EditorViewModel"),B=["create","update"],aa=function(d,b,a){return k(Z,void 0,void 0,function(){var c,l;return h(this,function(f){switch(f.label){case 0:return 0===d.length?[2]:[4,b.hitTest(a)];case 1:c=f.sent();if(0===c.results.length)return[2];l=c.results.map(function(a){return a.graphic.layer});return[2,x.eachAlways(d.items.filter(function(a){var c=a.layer;return-1<a.supports.indexOf("update")&&
-1<l.indexOf(c)}).map(function(c){c=c.layer;var l=L.calculateTolerance(c.renderer),l=N.createQueryGeometry(a.mapPoint,l,b),f=c.displayField,d=[c.objectIdField];K.hasField(c.fields,f)&&d.push(f);return c.queryFeatures({geometry:l,outFields:d}).then(function(a){return a.features})}))]}})})};return function(d){function b(a){a=d.call(this,a)||this;a._sketchGraphicsLayer=new I({listMode:"hide"});a.activeWorkflow=null;a.activityQueue=[];a.failures=[];a.featureFormViewModel=new R;a.featureTemplatesViewModel=
new S;a.layerInfos=null;a.sketchViewModel=new T({layer:a._sketchGraphicsLayer});return a}C(b,d);b.prototype.initialize=function(){var a=this;this.handles.add([r.on(this,"view.allLayerViews","change",function(){return a.notifyChange("editableItems")}),r.watch(this,"editableItems",function(){var c=a.activeWorkflow;if(c){var b=c.stepId;"create"===c.type?(a.updateCreationTemplates(),"awaiting-feature-creation-info"!==b||a.canCreate||a._cancelWorkflow()):"update"===c.type&&("awaiting-feature-to-update"===
b&&!a.canUpdate||"awaiting-update-feature-candidate"===b&&!c.data.candidates.some(function(c){var b=a.editableItems.find(function(a){return a.layer===c.layer});return b&&-1<b.supports.indexOf("update")}))&&a._cancelWorkflow()}})])};b.prototype.destroy=function(){this.view=null;this._cancelWorkflow()};Object.defineProperty(b.prototype,"allowedWorkflows",{get:function(){return this._get("allowedWorkflows")},set:function(a){a&&0!==a.length||(a=B.slice());this._set("allowedWorkflows",a)},enumerable:!0,
configurable:!0});Object.defineProperty(b.prototype,"canCreate",{get:function(){return this.editableItems.some(function(a){return-1<a.supports.indexOf("create")})},enumerable:!0,configurable:!0});Object.defineProperty(b.prototype,"canUpdate",{get:function(){return this.editableItems.some(function(a){return-1<a.supports.indexOf("update")})},enumerable:!0,configurable:!0});Object.defineProperty(b.prototype,"editableItems",{get:function(){var a=this,c=this.get("view.allLayerViews");if(!c)return new E;
this.handles.remove("layer-view-property-watchers");var b=function(){return a.notifyChange("editableItems")};return c.filter(V).map(function(c){a.handles.add(r.watch(c,"suspended",b),"layer-view-property-watchers");var l=c.layer;c=c.suspended;var d=[],f=a.allowedWorkflows,e=l.capabilities.operations,q=v(a.layerInfos,l),f=f.filter(function(a){return q?!1!==q.enabled&&("create"===a&&!1!==q.addEnabled||"update"===a&&!1!==q.updateEnabled):!0});!c&&p.find(f,function(a){return"create"===a})&&e.supportsAdd&&
d.push("create");!c&&p.find(f,function(a){return"update"===a})&&e.supportsUpdate&&d.push("update");!c&&!1!==(q&&q.deleteEnabled)&&e.supportsDelete&&d.push("delete");return{layer:l,supports:d}}).reverse()},enumerable:!0,configurable:!0});Object.defineProperty(b.prototype,"state",{get:function(){if(!this.get("view.ready")||0===this.editableItems.length)return"disabled";var a=this.activeWorkflow;return a?a.stepId:"ready"},enumerable:!0,configurable:!0});Object.defineProperty(b.prototype,"syncing",{get:function(){return 0<
this.activityQueue.length},enumerable:!0,configurable:!0});Object.defineProperty(b.prototype,"view",{set:function(a){a&&"2d"!==a.type?n("editing:unsupported-view","SceneView is not supported"):(this.sketchViewModel.view=a,this._set("view",a))},enumerable:!0,configurable:!0});b.prototype.startCreateWorkflowAtFeatureTypeSelection=function(){return k(this,void 0,void 0,function(){var a;return h(this,function(c){switch(c.label){case 0:return this.canCreate?[4,this._cancelWorkflow()]:(n("editing:unsupported-workflow",
"Create workflow is unsupported or disabled."),[2]);case 1:return c.sent(),a=this._createCreateWorkflow(),[4,a.start()];case 2:return c.sent(),this._set("activeWorkflow",a),[2]}})})};b.prototype.startCreateWorkflowAtFeatureCreation=function(a){return k(this,void 0,void 0,function(){var c;return h(this,function(b){switch(b.label){case 0:return this.canCreate?[4,this._cancelWorkflow()]:(n("editing:unsupported-workflow","Update workflow is unsupported or disabled."),[2]);case 1:return b.sent(),c=this._createCreateWorkflow("awaiting-feature-to-create"),
c.data.creationInfo=a,[4,c.start()];case 2:return b.sent(),this._set("activeWorkflow",c),[2]}})})};b.prototype.startCreateWorkflowAtFeatureEdit=function(a){return k(this,void 0,void 0,function(){var c;return h(this,function(b){switch(b.label){case 0:return this.canCreate?[4,this._cancelWorkflow()]:(n("editing:unsupported-workflow","Update workflow is unsupported or disabled."),[2]);case 1:return b.sent(),c=this._createCreateWorkflow("editing-new-feature"),c.data.edits.feature=a,[4,c.start()];case 2:return b.sent(),
this._set("activeWorkflow",c),[2]}})})};b.prototype.startUpdateWorkflowAtFeatureSelection=function(){return k(this,void 0,void 0,function(){var a;return h(this,function(c){switch(c.label){case 0:return this.canUpdate?[4,this._cancelWorkflow()]:(n("editing:unsupported-workflow","Update workflow is unsupported or disabled."),[2]);case 1:return c.sent(),a=this._createUpdateWorkflow(),[4,a.start()];case 2:return c.sent(),this._set("activeWorkflow",a),[2]}})})};b.prototype.startUpdateWorkflowAtMultipleFeatureSelection=
function(a){return k(this,void 0,void 0,function(){var c;return h(this,function(b){switch(b.label){case 0:return this.canUpdate?[4,this._cancelWorkflow()]:(n("editing:unsupported-workflow","Update workflow is unsupported or disabled."),[2]);case 1:return b.sent(),c=this._createUpdateWorkflow("awaiting-update-feature-candidate"),c.data.candidates=a,[4,c.start()];case 2:return b.sent(),this._set("activeWorkflow",c),[2]}})})};b.prototype.startUpdateWorkflowAtFeatureEdit=function(a){return k(this,void 0,
void 0,function(){var c;return h(this,function(b){switch(b.label){case 0:return this.canUpdate?[4,this._cancelWorkflow()]:(n("editing:unsupported-workflow","Update workflow is unsupported or disabled."),[2]);case 1:return b.sent(),c=this._createUpdateWorkflow("editing-existing-feature"),c.data.edits.feature=a,[4,c.start()];case 2:return b.sent(),this._set("activeWorkflow",c),[2]}})})};b.prototype.deleteFeatureFromWorkflow=function(){return k(this,void 0,void 0,function(){var a;return h(this,function(c){switch(c.label){case 0:a=
this.activeWorkflow;if(!a||"create"===a.type)return n("editing:unsupported-workflow","Deleting requires an active update workflow."),[2];this._delete(a.data.edits.feature);return[4,a.reset()];case 1:return c.sent(),[2]}})})};b.prototype.cancelWorkflow=function(a){return k(this,void 0,void 0,function(){return h(this,function(c){switch(c.label){case 0:return[4,this._cancelWorkflow(w({warn:!0},a))];case 1:return c.sent(),[2]}})})};b.prototype.updateCreationTemplates=function(){this.featureTemplatesViewModel.layers=
this.editableItems.filter(function(a){return-1<a.supports.indexOf("create")}).map(function(a){return a.layer}).toArray()};b.prototype._highlight=function(a){var c=a&&p.find(this.view.allLayerViews.items,function(c){return c.layer===a.layer});O.hasHighlight(c)&&this.handles.add(c.highlight(a),"candidate-highlight")};b.prototype._unhighlight=function(){this.handles.remove("candidate-highlight")};b.prototype._cancelWorkflow=function(a){return k(this,void 0,void 0,function(){var c;return h(this,function(b){switch(b.label){case 0:return c=
this.activeWorkflow,c?[4,c.cancel(a)]:(a&&a.warn&&n("editing:no-active-workflow","There is no active workflow to cancel."),[2]);case 1:return b.sent(),this._set("activeWorkflow",null),[2]}})})};b.prototype._createCreateWorkflow=function(a){var c=this,b=this.handles,d=new P({edits:new y,viewModel:this});return new z({type:"create",data:d,steps:this._createWorkflowStepCreator(d,a),commit:function(){b.remove(c.activeWorkflow.stepId);return c._create(d.edits.feature)}})};b.prototype._createWorkflowStepCreator=
function(a,b){void 0===b&&(b="awaiting-feature-creation-info");var c=a.viewModel.handles,d={"awaiting-feature-creation-info":function(){return{id:"awaiting-feature-creation-info",setUp:function(){return k(this,void 0,void 0,function(){return h(this,function(b){a.creationInfo=null;c.add(a.viewModel.featureTemplatesViewModel.on("select",function(b){b=b.item;a.creationInfo={layer:b.layer,template:b.template};a.viewModel.activeWorkflow.next()}),this.id);return[2]})})},tearDown:function(){return k(this,
void 0,void 0,function(){return h(this,function(a){c.remove(this.id);return[2]})})}}},"awaiting-feature-to-create":function(){return{id:"awaiting-feature-to-create",setUp:function(){return k(this,void 0,void 0,function(){return h(this,function(b){c.add([X(a.viewModel.sketchViewModel,a.creationInfo,a.viewModel.view,function(b){a.edits.feature=b;a.viewModel.activeWorkflow.next()},function(){return a.viewModel.activeWorkflow.previous()})],this.id);return[2]})})},tearDown:function(){return k(this,void 0,
void 0,function(){return h(this,function(a){c.remove(this.id);return[2]})})}}},"editing-new-feature":function(){return{id:"editing-new-feature",setUp:function(){return k(this,void 0,void 0,function(){var b,d,f;return h(this,function(l){b=a.edits.feature;f=(d=v(a.viewModel.layerInfos,b.layer))&&d.fieldConfig;a.viewModel.featureFormViewModel.set({feature:b,fieldConfig:f});c.add([a.viewModel.featureFormViewModel.on("value-change",function(){a.edits.updateAttributes(a.viewModel.featureFormViewModel.getValues())}),
A(b,a.viewModel.sketchViewModel,a.viewModel.view,function(b){return a.edits.updateGeometry(b.geometry)})],this.id);return[2]})})},tearDown:function(){return k(this,void 0,void 0,function(){return h(this,function(b){a.edits.feature=null;a.viewModel.featureFormViewModel.set({feature:null,fieldConfig:null});c.remove(this.id);return[2]})})}}}},e=!1,u=["awaiting-feature-creation-info","awaiting-feature-to-create","editing-new-feature"].filter(function(a){return e?!0:e=a===b}).map(function(a){return d[a]()});
a.viewModel.updateCreationTemplates();var m=Y(a.viewModel.featureTemplatesViewModel.items);m&&(a.creationInfo={layer:m.layer,template:m.template},u.shift());return u};b.prototype._createUpdateWorkflow=function(a){var b=this,d=this.handles,f=new Q({edits:new y,viewModel:this});return new z({type:"update",data:f,steps:this._updateWorkflowStepCreator(f,a),commit:function(){d.remove(b.activeWorkflow.stepId);return b._update(f.edits.feature)}})};b.prototype._updateWorkflowStepCreator=function(a,b){void 0===
b&&(b="awaiting-feature-to-update");var c=a.viewModel.handles,d={"awaiting-feature-to-update":function(){return{id:"awaiting-feature-to-update",setUp:function(){return k(this,void 0,void 0,function(){var b,d,f;return h(this,function(e){b=a.viewModel.view;d=null;c.add({remove:function(){d&&(d.cancel(),d=null)}},this.id);a.edits.feature=null;f=b.on("click",function(c){c.stopPropagation();d&&d.cancel();var f=a.viewModel.editableItems;d=x.create(function(a){return aa(f,b,c).then(a)});d.then(function(b){a.candidates=
b.reduce(function(a,b){return b.error?a:a.concat(b.value)},[]);0!==a.candidates.length&&(1===a.candidates.length?(a.edits.feature=a.candidates[0],a.viewModel.activeWorkflow.go("editing-existing-feature")):a.viewModel.activeWorkflow.next())})});c.add(f,this.id);return[2]})})},tearDown:function(){return k(this,void 0,void 0,function(){return h(this,function(a){c.remove(this.id);return[2]})})}}},"awaiting-update-feature-candidate":function(){return{id:"awaiting-update-feature-candidate",setUp:function(){return k(this,
void 0,void 0,function(){var b,d;return h(this,function(f){b=a.edits;d=a.viewModel;b.feature=null;c.add(r.watch(b,"feature",function(a){d._unhighlight();d._highlight(a)}),this.id);return[2]})})},tearDown:function(){return k(this,void 0,void 0,function(){return h(this,function(b){a.viewModel._unhighlight();c.remove(this.id);return[2]})})}}},"editing-existing-feature":function(){return{id:"editing-existing-feature",setUp:function(){return k(this,void 0,void 0,function(){var b,d=this;return h(this,function(f){b=
a.edits.feature;a.editableItem=a.viewModel.editableItems.find(function(a){return a.layer===b.layer});return[2,W(b,a.viewModel.view).then(function(b){a.edits.updateGeometry(b.geometry);a.edits.updateAttributes(b.attributes);a.edits.trackChanges();var f=v(a.viewModel.layerInfos,b.layer);a.viewModel.featureFormViewModel.set({feature:b,fieldConfig:f&&f.fieldConfig});c.add([A(b,a.viewModel.sketchViewModel,a.viewModel.view,function(b){return a.edits.updateGeometry(b.geometry)}),a.viewModel.featureFormViewModel.on("value-change",
function(){a.edits.updateAttributes(a.viewModel.featureFormViewModel.getValues())})],d.id)})]})})},tearDown:function(){return k(this,void 0,void 0,function(){return h(this,function(b){a.editableItem=null;a.viewModel.featureFormViewModel.set({feature:null,fieldConfig:null});c.remove(this.id);return[2]})})}}}},e=!1;return["awaiting-feature-to-update","awaiting-update-feature-candidate","editing-existing-feature"].filter(function(a){return e?!0:e=a===b}).map(function(a){return d[a]()})};b.prototype._create=
function(a){return this._queueOperation(function(){return a.layer.applyEdits({addFeatures:[a]})})};b.prototype._delete=function(a){return this._queueOperation(function(){return a.layer.applyEdits({deleteFeatures:[a]})})};b.prototype._update=function(a){return this._queueOperation(function(){return a.layer.applyEdits({updateFeatures:[a]})}).then()};b.prototype._queueOperation=function(a){var b=this;this.activityQueue.push(a);this.notifyChange("syncing");var d=function(a,b){a=b.indexOf(a);-1<a&&b.splice(a,
1)};return a().then(function(a){var b=a.deleteFeatureResults,c=a.updateFeatureResults;if(a=p.find(a.addFeatureResults,function(a){return!!a.error})||p.find(c,function(a){return!!a.error})||p.find(b,function(a){return!!a.error}))throw a.error;}).catch(function(c){n("editing:operation-error","An error ocurred.",{error:c});var e={error:c,retry:function(){d(e,b.failures);b._queueOperation(a)},cancel:function(){return d(e,b.failures)}};b._set("failures",b.failures.concat([e]))}).then(function(){d(a,b.activityQueue);
b.notifyChange("syncing")})};g([e.property({readOnly:!0})],b.prototype,"activeWorkflow",void 0);g([e.property({readOnly:!0})],b.prototype,"activityQueue",void 0);g([e.property({value:B.slice()})],b.prototype,"allowedWorkflows",null);g([e.property({readOnly:!0,dependsOn:["editableItems"]})],b.prototype,"canCreate",null);g([e.property({readOnly:!0,dependsOn:["editableItems"]})],b.prototype,"canUpdate",null);g([e.property({dependsOn:["allowedWorkflows","layerInfos","view.allLayerViews","view.ready"],
readOnly:!0})],b.prototype,"editableItems",null);g([e.property({readOnly:!0})],b.prototype,"failures",void 0);g([e.property()],b.prototype,"featureFormViewModel",void 0);g([e.property()],b.prototype,"featureTemplatesViewModel",void 0);g([e.property()],b.prototype,"layerInfos",void 0);g([e.property()],b.prototype,"sketchViewModel",void 0);g([e.property({dependsOn:["editableItems","activeWorkflow.stepId","view.ready"]})],b.prototype,"state",null);g([e.property({readOnly:!0})],b.prototype,"syncing",
null);g([e.property()],b.prototype,"view",null);g([e.property()],b.prototype,"startCreateWorkflowAtFeatureTypeSelection",null);g([e.property()],b.prototype,"startCreateWorkflowAtFeatureCreation",null);g([e.property()],b.prototype,"startCreateWorkflowAtFeatureEdit",null);g([e.property()],b.prototype,"startUpdateWorkflowAtFeatureSelection",null);g([e.property()],b.prototype,"startUpdateWorkflowAtMultipleFeatureSelection",null);g([e.property()],b.prototype,"startUpdateWorkflowAtFeatureEdit",null);g([e.property()],
b.prototype,"deleteFeatureFromWorkflow",null);g([e.property()],b.prototype,"cancelWorkflow",null);return b=g([e.subclass("esri.widgets.Editor.EditorViewModel")],b)}(e.declared(D,G))});