sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'lop.learnerobjectpage',
            componentId: 'LearnerInfoList',
            entitySet: 'LearnerInfo'
        },
        CustomPageDefinitions
    );
});