using ManagerService as service from './manager-analysis-service';

annotate service.ManagerAnalysis with {
    ID          @ID: 'ID';
	name       @title: 'Name';
	descr       @title: 'Description';
    createdAt   @title: 'Creation Date';
    courses @title: 'Courses';
    occupation @title: 'Occupation';
    visiteddays @title: 'Visited Days';
    numberofcourses @title: 'Number of Courses';
    role @title: 'Role';
};

annotate service.ManagerAnalysis with @(
    Common.SemanticKey  : [ID],
    UI.LineItem : {
        $value : [
            {
                $Type               : 'UI.DataField',
                Value               : name,
                ![@UI.Importance]   : #High,
            },
            {
                $Type               : 'UI.DataField',
                Value               : occupation,
                ![@UI.Importance]   : #High,
            },
            {
                $Type               : 'UI.DataField',
                Value               : visiteddays,
                ![@UI.Importance]   : #High,
            },
            {
                $Type               : 'UI.DataField',
                Value               : numberofcourses,
                ![@UI.Importance]   : #High,
            },
            {
                $Type               : 'UI.DataField',
                Value               : createdAt,
                ![@UI.Importance]   : #High,
            },
            {
                $Type               : 'UI.DataField',
                Value               : role,
                ![@UI.Importance]   : #High,
            },
        ],
    },
);

annotate service.ManagerAnalysis with @(
    UI : {
        SelectionFields  : [
            occupation,
            role
        ],
    }
);

annotate service.ManagerAnalysis with @(
    Aggregation.ApplySupported : {
        Transformations          : [
            'aggregate',
            'topcount',
            'bottomcount',
            'identity',
            'concat',
            'groupby',
            'filter',
            'expand',
            'top',
            'skip',
            'orderby',
            'search'
        ],
        Rollup                   : #None,
        PropertyRestrictions     : true,
        GroupableProperties : [
            occupation,
            role,
            name,
            createdAt,
            numberofcourses
        ],
        AggregatableProperties : [
            {
                Property : numberofcourses,
            },
            {
                Property : visiteddays,
            },
        ],
    }
);

annotate service.ManagerAnalysis with @(
    Analytics.AggregatedProperties : [
        {
            Name                 : 'countCourses',
            AggregationMethod    : 'countdistinct',
            AggregatableProperty : 'numberofcourses',
            ![@Common.Label]     : 'Total Number of Courses'
        },
        {
            Name                 : 'sumVisits',
            AggregationMethod    : 'sum',
            AggregatableProperty : 'visiteddays',
            ![@Common.Label]     : 'Number of Visited Days'
        },
        {
            Name                 : 'countOccupation',
            AggregationMethod    : 'countdistinct',
            AggregatableProperty : 'occupation',
            ![@Common.Label]     : 'Number of different occupations'
        },
        {
            Name                 : 'countRoles',
            AggregationMethod    : 'countdistinct',
            AggregatableProperty : 'role',
            ![@Common.Label]     : 'Number of different roles'
        },
        {
            Name                 : 'minAmount',
            AggregationMethod    : 'min',
            AggregatableProperty : 'numberofcourses',
            ![@Common.Label]     : 'Minimal Courses'
        },
        {
            Name                 : 'maxAmount',
            AggregationMethod    : 'max',
            AggregatableProperty : 'numberofcourses',
            ![@Common.Label]     : 'Maximal Courses'
        },
        {
            Name                 : 'avgAmount',
            AggregationMethod    : 'average',
            AggregatableProperty : 'numberofcourses',
            ![@Common.Label]     : 'Average Courses'
        },
    ],
);

annotate service.ManagerAnalysis with @(
    UI.Chart : {
        Title : 'Courses per Occupation',
        ChartType : #Column,
        Measures :  [avgAmount],
        Dimensions : [occupation],
        MeasureAttributes   : [{
                $Type   : 'UI.ChartMeasureAttributeType',
                Measure : avgAmount,
                Role    : #Axis1
        }],
        DimensionAttributes : [
            {
                $Type     : 'UI.ChartDimensionAttributeType',
                Dimension : occupation,
                Role      : #Category
            },
        ],
    }, 
    
);


annotate service.ManagerAnalysis with @(
    UI.HeaderInfo: {
        TypeName: 'Learner Info',
        TypeNamePlural: 'Learners Info',
        Title: {
            Value: name,
        },
        Description: {
            Value: role,
        }
    },
    UI.HeaderFacets: [
        {
            $Type: 'UI.ReferenceFacet',
            Label: 'Visited Days',
            ID: 'visiteddays',
            Target: '@UI.DataPoint#dpDays'
        },
        {
            $Type: 'UI.ReferenceFacet',
            Label: 'Number of courses',
            ID: 'numberofcourses',
            Target: '@UI.DataPoint#dpcourses'
        },
        {
            $Type: 'UI.ReferenceFacet',
            Label: 'Occupation',
            ID: 'occupation',
            Target: '@UI.DataPoint#dpocc'
        },
        {
            $Type: 'UI.ReferenceFacet',
            Label: 'Role',
            ID: 'role',
            Target: '@UI.DataPoint#dprole'
        }
    ],
    UI.Facets: [
        {
            $Type: 'UI.ReferenceFacet',
            Target: '@UI.LineItem',
        }
    ]
);

annotate service.LearnerCourses with @(
    UI.Facets: [
        {
            $Type: 'UI.ReferenceFacet',
            Target: '@UI.LineItem'
        }
    ]
);



annotate service.ManagerAnalysis with @(
    

    UI.PresentationVariant #pvvisiteddays : {
        SortOrder : [
            {
                $Type : 'Common.SortOrderType',
                Property : visiteddays,
                Descending : true
            }
        ],
        Visualizations : [
            '@UI.Chart#chartDays'
        ]
    },
    UI.SelectionVariant #svvisiteddays : {
        SelectOptions : [
            {
                $Type : 'UI.SelectOptionType',
                PropertyName : visiteddays,
                Ranges : [
                    {
                        $Type : 'UI.SelectionRangeType',
                        Sign : #I,
                        Option : #GE,
                        Low : 0,
                    },
                ],
            },
        ],
    },
    UI.Chart #chartDays : {
        $Type : 'UI.ChartDefinitionType',
        ChartType : #Bar,
        Dimensions : [
            role
        ],
        DimensionAttributes : [
            {
                $Type : 'UI.ChartDimensionAttributeType',
                Dimension : role,
                Role : #Category
            }
        ],
        Measures : [
            sumVisits
        ],
        MeasureAttributes : [
            {
                $Type : 'UI.ChartMeasureAttributeType',
                Measure : sumVisits,
                Role : #Axis1,
                DataPoint : '@UI.DataPoint#dpDays',
            }
        ]
    },
    UI.DataPoint #dpDays              : {
        Value       : visiteddays,
        Title       : 'Visited Days'
    },
    UI.DataPoint #dpcourses              : {
        Value       : numberofcourses,
        Title       : 'Number of Courses'
    },
    UI.DataPoint #dpocc              : {
        Value       : occupation,
        Title       : 'Occupation'
    },
    UI.DataPoint #dprole              : {
        Value       : role,
        Title       : 'Role'
    },
){
    visiteddays @(
        Common.ValueListWithFixedValues: true,
        Common.ValueList #vlvisiteddays: {
            $Type : 'Common.ValueListType',
            Label : 'Visited Days',
            CollectionPath : 'ManagerAnalysis',
            SearchSupported : true,
            PresentationVariantQualifier : 'pvvisiteddays',
            SelectionVariantQualifier : 'svvisiteddays',
            Parameters : [
                {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : visiteddays,
                ValueListProperty : 'visiteddays'
                },
                /*{
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    //LocalDataProperty : visiteddays,
                    ValueListProperty : 'visiteddays'
                },*/
            ]
        }
    );
};
