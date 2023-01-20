sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'lb/learnerbehavior/test/integration/FirstJourney',
		'lb/learnerbehavior/test/integration/pages/TestList',
		'lb/learnerbehavior/test/integration/pages/TestObjectPage'
    ],
    function(JourneyRunner, opaJourney, TestList, TestObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('lb/learnerbehavior') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheTestList: TestList,
					onTheTestObjectPage: TestObjectPage
                }
            },
            opaJourney.run
        );
    }
);