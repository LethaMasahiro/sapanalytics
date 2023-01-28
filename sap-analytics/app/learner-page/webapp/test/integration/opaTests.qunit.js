sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'lp/learnerpage/test/integration/FirstJourney',
		'lp/learnerpage/test/integration/pages/LearnerObjectObjectPage',
		'lp/learnerpage/test/integration/pages/EnrolledInObjectPage'
    ],
    function(JourneyRunner, opaJourney, LearnerObjectObjectPage, EnrolledInObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('lp/learnerpage') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheLearnerObjectObjectPage: LearnerObjectObjectPage,
					onTheEnrolledInObjectPage: EnrolledInObjectPage
                }
            },
            opaJourney.run
        );
    }
);