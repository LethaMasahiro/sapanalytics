sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'mv/manageranalytics/test/integration/FirstJourney',
		'mv/manageranalytics/test/integration/pages/LearnersInfoList',
		'mv/manageranalytics/test/integration/pages/LearnersInfoObjectPage'
    ],
    function(JourneyRunner, opaJourney, LearnersInfoList, LearnersInfoObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('mv/manageranalytics') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheLearnersInfoList: LearnersInfoList,
					onTheLearnersInfoObjectPage: LearnersInfoObjectPage
                }
            },
            opaJourney.run
        );
    }
);