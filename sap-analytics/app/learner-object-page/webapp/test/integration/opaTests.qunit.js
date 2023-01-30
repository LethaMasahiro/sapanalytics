sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'lop/learnerobjectpage/test/integration/FirstJourney',
		'lop/learnerobjectpage/test/integration/pages/LearnerInfoList',
		'lop/learnerobjectpage/test/integration/pages/LearnerInfoObjectPage'
    ],
    function(JourneyRunner, opaJourney, LearnerInfoList, LearnerInfoObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('lop/learnerobjectpage') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheLearnerInfoList: LearnerInfoList,
					onTheLearnerInfoObjectPage: LearnerInfoObjectPage
                }
            },
            opaJourney.run
        );
    }
);