//@ui5-bundle mik/mostimportantkpis/Component-preload.js
jQuery.sap.registerPreloadedModules({
"version":"2.0",
"modules":{
	"mik/mostimportantkpis/Component.js":function(){sap.ui.define(["sap/ovp/app/Component"],function(t){"use strict";return t.extend("mik.mostimportantkpis.Component",{metadata:{manifest:"json"}})});
},
	"mik/mostimportantkpis/ext/Test Card/Component.js":function(){sap.ui.define(["sap/ovp/cards/custom/Component","jquery.sap.global"],function(e,t){"use strict";return e.extend("mik.mostimportantkpis.ext.Test Card.Component",{metadata:{properties:{contentFragment:{type:"string",defaultValue:"mik.mostimportantkpis.ext.Test Card.t"},headerFragment:{type:"string",defaultValue:""},footerFragment:{type:"string",defaultValue:""}},version:"0.0.1",library:"sap.ovp",includes:[],dependencies:{libs:["sap.m"],components:[]},config:{},customizing:{"sap.ui.controllerExtensions":{"sap.ovp.cards.generic.Card":{controllerName:"mik.mostimportantkpis.ext.Test Card.te"}}}}})});
},
	"mik/mostimportantkpis/ext/Test Card/t.fragment.xml":'<core:FragmentDefinition xmlns="sap.m" xmlns:core="sap.ui.core" xmlns:ovp="sap.ovp.ui"\nxmlns:template="http://schemas.sap.com/sapui5/extension/sap.ui.core.template/1"></core:FragmentDefinition>',
	"mik/mostimportantkpis/ext/Test Card/te.controller.js":function(){(function(){"use strict";sap.ui.define([],function(){return{onInit:function(){},onAfterRendering:function(){},onExit:function(){}}})})();
},
	"mik/mostimportantkpis/i18n/i18n.properties":'# This is the resource bundle for mik.mostimportantkpis\n\n#Texts for manifest.json\n\n#XTIT: Application name\nappTitle=Most Important KPIs\n\n#YDES: Application description\nappDescription=A Fiori application.',
	"mik/mostimportantkpis/manifest.json":'{"_version":"1.49.0","sap.app":{"id":"mik.mostimportantkpis","type":"application","i18n":"i18n/i18n.properties","applicationVersion":{"version":"0.0.1"},"title":"Manager Dashboard","description":"{{appDescription}}","resources":"resources.json","sourceTemplate":{"id":"@sap/generator-fiori:ovp","version":"1.8.5","toolsId":"35d2ac51-ad46-43a4-85c9-b4b58759a360"},"crossNavigation":{"inbounds":{"learnerbehavior-display":{"signature":{"parameters":{},"additionalParameters":"allowed"},"semanticObject":"mostimportantkpis","action":"display"}}},"dataSources":{"mainService":{"uri":"user/","type":"OData","settings":{"annotations":["annotation"],"localUri":"localService/metadata.xml","odataVersion":"4.0"}},"annotation":{"type":"ODataAnnotation","uri":"annotations/annotation.xml","settings":{"localUri":"annotations/annotation.xml"}}}},"sap.ui":{"technology":"UI5","icons":{"icon":"","favIcon":"","phone":"","phone@2":"","tablet":"","tablet@2":""},"deviceTypes":{"desktop":true,"tablet":true,"phone":true}},"sap.ui5":{"flexEnabled":true,"dependencies":{"minUI5Version":"1.109.3","libs":{"sap.m":{},"sap.ui.core":{},"sap.ushell":{},"sap.fe.templates":{},"sap.ovp":{},"sap.ui.rta":{},"sap.ui.layout":{}}},"contentDensities":{"compact":true,"cozy":true},"models":{"i18n":{"type":"sap.ui.model.resource.ResourceModel","settings":{"bundleName":"mik.mostimportantkpis.i18n.i18n"}},"mainModel":{"dataSource":"mainService","preload":true,"settings":{"synchronizationMode":"None","operationMode":"Server","autoExpandSelect":true,"earlyRequests":true}},"@i18n":{"type":"sap.ui.model.resource.ResourceModel","uri":"i18n/i18n.properties"}},"resources":{"css":[]},"routing":{"config":{},"routes":[],"targets":{}}},"sap.ovp":{"globalFilterModel":"mainModel","globalFilterEntityType":"mostImportantKPIs","containerLayout":"resizable","enableLiveFilter":true,"considerAnalyticalParameters":true,"cards":{"card01":{"model":"mainModel","template":"sap.ovp.cards.v4.charts.analytical","settings":{"title":"Number of Courses","entitySet":"mostImportantKPIs","dataPointAnnotationPath":"com.sap.vocabularies.UI.v1.DataPoint#numberofcoursesDP","kpiAnnotationPath":"com.sap.vocabularies.UI.v1.KPI#numberofcoursesKPI","subTitle":"by Business Unit","presentationAnnotationPath":"com.sap.vocabularies.UI.v1.PresentationVariant#numberofcoursesPV","chartAnnotationPath":"com.sap.vocabularies.UI.v1.Chart#numberofcourseskpichart","identificationAnnotationPath":"com.sap.vocabularies.UI.v1.Identification#numberofcoursesId","addODataSelect":true}},"card02":{"model":"mainModel","template":"sap.ovp.cards.table","settings":{"dataPointAnnotationPath":"com.sap.vocabularies.UI.v1.DataPoint#numberoflearners","kpiAnnotationPath":"com.sap.vocabularies.UI.v1.KPI#numberoflearnersKPI","addODataSelect":true,"title":"Learner Table","entitySet":"mostImportantKPIs","presentationAnnotationPath":"com.sap.vocabularies.UI.v1.PresentationVariant#numberoflearnersPV","annotationPath":"com.sap.vocabularies.UI.v1.KPI#numberoflearnersKPI","defaultSpan":"auto","listFlavor":"standard","listType":"extended","selectionPresentationAnnotationPath":"com.sap.vocabularies.UI.v1.SelectionVatiant#numberoflearnersSV"}}},"globalFilterControlType":"MacroFilterBar","imageSupported":true,"showBasicSearch":true,"chartSettings":{"showDataLabel":true},"refreshIntervalInMinutes":0.1},"sap.fiori":{"registrationIds":[],"archeType":"analytical"},"sap.cloud":{"public":true,"service":"cpapp.service"}}'
}});