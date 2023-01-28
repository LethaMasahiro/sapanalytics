using UserService as service from '../../srv/user-service';

annotate service.mostImportantKPIs with @(
    UI.DataPoint #numberoflearners : {
        $Type : 'UI.DataPointType',
        Title : 'Learner Number',
        Value : kpinumberoflearners,
    }
);

annotate service.mostImportantKPIs with @(
    UI.KPI #numberoflearnersKPI : {
        $Type : 'UI.KPIType',
        Detail : {
            $Type : 'UI.KPIDetailType',
            DefaultPresentationVariant : ![@UI.PresentationVariant#numberoflearnersPV],
            SemanticObject : 'Action',
            Action : 'toappnavsample'
        },
        SelectionVariant : ![@UI.SelectionVariant#numberoflearnersSV],
        DataPoint : ![@UI.DataPoint#numberoflearners],
        ID : 'String for KPI Annotation'
    },
    
);

annotate service.mostImportantKPIs with @(
    UI.DataPoint #ID : {
        $Type : 'UI.DataPointType',
        Title : 'ID',
        Value : ID,
    },
    UI.DataPoint #businessUnit : {
        $Type : 'UI.DataPointType',
        Title : 'Business Unit',
        Value : BusinessUnit,
    },
    UI.DataPoint #numberofcoursesDP : {
        $Type : 'UI.DataPointType',
        Title : 'Number of Courses Datapoint',
        Description : 'by Business Unit',
        Value : kpinumberofcourses,
    },
    UI.KPI #numberofcoursesKPI : {
        $Type : 'UI.KPIType',
        Detail : {
            $Type : 'UI.KPIDetailType',
            DefaultPresentationVariant : ![@UI.PresentationVariant#numberofcoursesPV],
            SemanticObject : 'Action',
            Action : 'toappnavsample'
        },
        SelectionVariant : ![@UI.SelectionVariant#numberofcoursesSV],
        DataPoint : ![@UI.DataPoint#numberofcoursesDP],
        ID : 'String for KPI Annotation'
    },
    UI.Chart #numberofcourseskpichart : {
        Title : 'Chart Info',

        $Type : 'UI.ChartDefinitionType',
        ChartType : #Column,
        Description : 'per Business Unit',
        MeasureAttributes : [
            {
                Measure : kpinumberofcourses,
                Role : #Axis1
            }
        ],
        DimensionAttributes : [
            {
                Dimension : BusinessUnit,
                Role : #Category
            }
        ]
    },
    UI.PresentationVariant #numberofcoursesPV : {
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
        '@UI.Chart#numberofcourseskpichart'
    ]
    },
    UI.PresentationVariant #numberoflearnersPV : {
        MaxItems : 5,
        GroupBy : [
            BusinessUnit
        ],
        SortOrder : [
            {
                Property : kpinumberoflearners,
                Descending : true
            },
        ],
        Visualizations : [
            '@UI.Table'
        ],
},
);



annotate service.mostImportantKPIs with @(
    UI.SelectionFields : [
        BusinessUnit
    ],
    
    UI.SelectionVariant #numberofcoursesSV : {
    
    SelectOptions : [
        {
            $Type : 'UI.SelectOptionType',
            PropertyName : kpinumberofcourses,
            Ranges : [
                {
                    $Type : 'UI.SelectionRangeType',
                    Sign : #E,
                    Option : #EQ,
                    Low : 'D'
                }
            ]
        }]
    },
    UI.SelectionVariant #numberoflearnersSV : {
    
        SelectOptions : [
            {
                PropertyName : kpinumberoflearners,
                Ranges : [
                    {
                        Sign : #I,
                        Option : #EQ,
                        Low : 'IN'
                    }
                ]
            }
    
        ]
    }
);

annotate service.mostImportantKPIs with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Business Unit',
            Value : BusinessUnit
        },
        {
            $Type : 'UI.DataField',
            Label : 'Number of Learners',
            Value : kpinumberoflearners
        },
    ]
);



