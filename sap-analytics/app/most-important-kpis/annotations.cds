using UserService as service from '../../srv/user-service';

annotate service.mostImportantKPIs with @(
    UI.DataPoint #numberofcourses : {
        $Type : 'UI.DataPointType',
        Title : 'Number of Courses',
        Value : kpinumberofcourses
    },
    UI.DataPoint #businessUnit : {
        $Type : 'UI.DataPointType',
        Title : 'Business Unit',
        Value : BusinessUnit
    }
);

annotate service.mostImportantKPIs with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : BusinessUnit,
            Label : 'Business Unit',
        },
        {
            $Type : 'UI.DataField',
            Value : kpinumberofcourses,
            Label : 'Number of Courses',
        }
    ]
);

annotate service.mostImportantKPIs with @(
    UI.Chart #numberofcourseskpichart : {
        $Type : 'UI.ChartDefinitionType',
        ChartType : #Bar,
        Dimensions : [
            BusinessUnit
        ],
        Measures : [
            kpinumberofcourses,
        ],
    },
);


annotate service.mostImportantKPIs with @(
    $Type : 'UI.KPIType',
    Detail : {
        $Type : 'UI.KPIDetailType',
        DefaultPresentationVariant : ![@UI.PresentationVariant#numberofcourseskpiPV],
        AlternativePresentationVariants : [
            ![@UI.PresentationVariant#numberofcoursesPV]
        ],
        SemanticObject : 'Action',
        Action : 'toappnavsample',
    },
    SelectionVariant : ![@UI.SelectionVariant#numberofcourseskpiSV],
    DataPoint : ![@UI.DataPoint#numberofcourses],
    ID : 'String for KPI Annotation'
);

annotate service.mostImportantKPIs with @(
    UI.PresentationVariant #numberofcourseskpiPV : {
    MaxItems : 5,
    GroupBy : [
        BusinessUnit
    ],
    SortOrder : [
        {
            Property : kpinumberofcourses,
            Descending : true
        },
    ],
    Visualizations : [
        '@UI.LineItem'
    ]
},
);

annotate service.mostImportantKPIs with @(
    UI.SelectionVariant #numberofcourseskpiSV : {
    SelectOptions : [
        {
            PropertyName : BusinessUnit,
            Ranges : [
                {
                    Sign : #I,
                    Option : #EQ,
                    Low : 'IN'
                }
            ]
        },
        // {
        //     PropertyName : kpinumberofcourses,
        //     Ranges : [
        //         {
        //             Sign : #I,
        //             Option : #EQ,
        //             Low : 'IN'
        //         }
        //     ]
        // }
    ],
},
);


