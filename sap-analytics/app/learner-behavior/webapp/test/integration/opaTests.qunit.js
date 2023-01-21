sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'learnerbehavior/test/integration/FirstJourney',
		'learnerbehavior/test/integration/pages/UserAnalysisList',
		'learnerbehavior/test/integration/pages/UserAnalysisObjectPage',
		'learnerbehavior/test/integration/pages/EnrolledInObjectPage'
    ],
    function(JourneyRunner, opaJourney, UserAnalysisList, UserAnalysisObjectPage, EnrolledInObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('learnerbehavior') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheUserAnalysisList: UserAnalysisList,
					onTheUserAnalysisObjectPage: UserAnalysisObjectPage,
					onTheEnrolledInObjectPage: EnrolledInObjectPage
                }
            },
            opaJourney.run
        );
    }
);