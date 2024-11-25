sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'app1/test/integration/FirstJourney',
		'app1/test/integration/pages/DataSetList',
		'app1/test/integration/pages/DataSetObjectPage'
    ],
    function(JourneyRunner, opaJourney, DataSetList, DataSetObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('app1') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheDataSetList: DataSetList,
					onTheDataSetObjectPage: DataSetObjectPage
                }
            },
            opaJourney.run
        );
    }
);