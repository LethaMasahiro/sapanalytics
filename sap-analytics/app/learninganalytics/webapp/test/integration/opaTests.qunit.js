sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'learninganalytics/learninganalytics/test/integration/FirstJourney',
		'learninganalytics/learninganalytics/test/integration/pages/LearnersList',
		'learninganalytics/learninganalytics/test/integration/pages/LearnersObjectPage'
    ],
    function(JourneyRunner, opaJourney, LearnersList, LearnersObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('learninganalytics/learninganalytics') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheLearnersList: LearnersList,
					onTheLearnersObjectPage: LearnersObjectPage
                }
            },
            opaJourney.run
        );
    }
);