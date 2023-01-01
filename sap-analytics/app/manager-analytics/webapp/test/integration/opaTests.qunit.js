sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'ma/manageranalytics/test/integration/FirstJourney',
		'ma/manageranalytics/test/integration/pages/ManagerAnalysisList',
		'ma/manageranalytics/test/integration/pages/ManagerAnalysisObjectPage'
    ],
    function(JourneyRunner, opaJourney, ManagerAnalysisList, ManagerAnalysisObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('ma/manageranalytics') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheManagerAnalysisList: ManagerAnalysisList,
					onTheManagerAnalysisObjectPage: ManagerAnalysisObjectPage
                }
            },
            opaJourney.run
        );
    }
);