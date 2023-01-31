using UserService as service from '../../srv/user-service';

annotate service.mostImportantKPIs with {
    BusinessUnit @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'learnerBusinessUnits',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : BusinessUnit,
                    ValueListProperty : 'businessUnit',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};

annotate service.mostImportantKPIs with {
    Role @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'learnerRoles',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : Role,
                    ValueListProperty : 'role',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};

annotate service.mostImportantKPIs with {
    Country @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'learnerCountries',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : Country,
                    ValueListProperty : 'country',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};

annotate service.mostImportantKPIs with {
    Platform @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'coursePlatform',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : Platform,
                    ValueListProperty : 'platform',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};



annotate service.mostImportantKPIs with @(
    /*UI.DataPoint #ID : {
        $Type : 'UI.DataPointType',
        Title : 'ID',
        Value : ID,
    },*/
    UI.DataPoint #businessUnit : {
        $Type : 'UI.DataPointType',
        Title : 'Business Unit',
        Value : BusinessUnit,
    },
    UI.DataPoint #numberofcoursesDP : {
        $Type : 'UI.DataPointType',
        Title : 'Number of Courses Datapoint',
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
        Measures: [
            kpinumberofcourses
        ],
        Dimensions: [
            BusinessUnit
        ],
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
    UI.SelectionFields : [
        BusinessUnit,
        Role,
        Country,
        Platform
    ],
    
    UI.SelectionVariant #numberofcoursesSV : {
    
        SelectOptions : [
            {
                $Type : 'UI.SelectOptionType',
                PropertyName : BusinessUnit,
                Ranges : [
                    {
                        $Type : 'UI.SelectionRangeType',
                        Sign : #E,
                        Option : #EQ,
                        Low : 'NA'
                    }
                ]
            }
        ]
    },
);

annotate service.mostImportantKPIs with @(
    UI.DataPoint #numberofstartedcourses : {
        $Type : 'UI.DataPointType',
        Title : 'Number of Started Courses',
        Value : kpinumberofstartedcourses,
    },
    UI.Chart #numberofstartedcourseskpichart : {
        Title : 'Chart Info',

        $Type : 'UI.ChartDefinitionType',
        ChartType : #Column,
        Description : 'per Business Unit',
        Measures: [
            kpinumberofstartedcourses
        ],
        Dimensions: [
            BusinessUnit
        ],
        MeasureAttributes : [
            {
                Measure : kpinumberofstartedcourses,
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
    UI.PresentationVariant #numberofstartedcoursesPV : {
    MaxItems : 5,
    SortOrder : [
        {
            Property : kpinumberofstartedcourses,
            Descending : true
        },
    ],
    Visualizations : [
        '@UI.Chart#numberofstartedcourseskpichart'
    ]
    },
);

annotate service.mostImportantKPIs with @(
    UI.DataPoint #numberofcompletedcourses : {
        $Type : 'UI.DataPointType',
        Title : 'Number of Completed Courses',
        Value : kpinumberofcompletedcourses,
    },
    UI.Chart #numberofcompletedcourseschart : {
        Title : 'Chart Info',

        $Type : 'UI.ChartDefinitionType',
        ChartType : #Column,
        Description : 'per Business Unit',
        Measures: [
            kpinumberofcompletedcourses
        ],
        Dimensions: [
            BusinessUnit
        ],
        MeasureAttributes : [
            {
                Measure : kpinumberofcompletedcourses,
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
    UI.PresentationVariant #numberofcompletedcoursesPV : {
    MaxItems : 2,
    SortOrder : [
        {
            Property : kpinumberofcompletedcourses,
            Descending : true
        },
    ],
    Visualizations : [
        '@UI.Chart#numberofcompletedcourseschart'
    ]
    },
);

annotate service.mostImportantKPIs with @(
    UI.DataPoint #numberoflearners : {
        $Type : 'UI.DataPointType',
        Title : 'Number of Learners',
        Value : kpinumberoflearners,
    },
    UI.Chart #numberoflearnerschart : {
        Title : 'Chart Info',

        $Type : 'UI.ChartDefinitionType',
        ChartType : #Column,
        Description : 'per Business Unit',
        Measures: [
            kpinumberoflearners
        ],
        Dimensions: [
            BusinessUnit
        ],
        MeasureAttributes : [
            {
                Measure : kpinumberoflearners,
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
    UI.PresentationVariant #numberoflearnersPV : {
    MaxItems : 2,
    SortOrder : [
        {
            Property : kpinumberoflearners,
            Descending : true
        },
    ],
    Visualizations : [
        '@UI.Chart#numberoflearnerschart'
    ]
    },
);

annotate service.mostImportantKPIs with @(
    UI.DataPoint #averagecompletionrateDP : {
        $Type : 'UI.DataPointType',
        Title : 'Average Course Completion Rate',
        Value : kpiaveragecompletionrate,
    },
    UI.Chart #averagecompletionratechart : {
        Title : 'Chart Info',

        $Type : 'UI.ChartDefinitionType',
        ChartType : #Column,
        Description : 'per Business Unit',
        Measures: [
            kpiaveragecompletionrate
        ],
        Dimensions: [
            BusinessUnit
        ],
        MeasureAttributes : [
            {
                Measure : kpiaveragecompletionrate,
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
    UI.PresentationVariant #averagecompletionratePV : {
    MaxItems : 2,
    SortOrder : [
        {
            Property : kpiaveragecompletionrate,
            Descending : true
        },
    ],
    Visualizations : [
        '@UI.Chart#averagecompletionratechart'
    ]
    },
);




