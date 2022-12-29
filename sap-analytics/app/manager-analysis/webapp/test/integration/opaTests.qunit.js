sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'ns/manageranalysis/test/integration/FirstJourney',
		'ns/manageranalysis/test/integration/pages/RisksAnalysisList',
		'ns/manageranalysis/test/integration/pages/RisksAnalysisObjectPage'
    ],
    function(JourneyRunner, opaJourney, RisksAnalysisList, RisksAnalysisObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('ns/manageranalysis') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheRisksAnalysisList: RisksAnalysisList,
					onTheRisksAnalysisObjectPage: RisksAnalysisObjectPage
                }
            },
            opaJourney.run
        );
    }
);