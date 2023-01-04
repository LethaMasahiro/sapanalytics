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
            visiteddays,
            numberofcourses,
            createdAt
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
        Measures :  [countCourses],
        Dimensions : [occupation],
        MeasureAttributes   : [{
                $Type   : 'UI.ChartMeasureAttributeType',
                Measure : countCourses,
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

/*annotate service.ManagerAnalysis with @(
    UI.Chart #visitedchart: {
        Title : 'Visited days per Role',
        ChartType : #Column,
        Measures :  [visiteddays],
        Dimensions : [role],
        MeasureAttributes   : [{
                $Type   : 'UI.ChartMeasureAttributeType',
                Measure : visiteddays,
                Role    : #Axis1
        }],
        DimensionAttributes : [
            {
                $Type     : 'UI.ChartDimensionAttributeType',
                Dimension : role,
                Role      : #Category
            },
        ],
    },
);*/


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
){
    visiteddays @(
        Common.ValueList #vlvisiteddays: {
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
            ]
        }
    );
};


/*annotate service.ManagerAnalysis with @(
    UI.PresentationVariant #pvPrio : {
        SortOrder : [
            {
                $Type : 'Common.SortOrderType',
                Property : numberofcourses,
                Descending : true
            },
        ],
        Visualizations : [
            '@UI.Chart#chartPrio'
        ]
    },
    UI.SelectionVariant #svPrio : {
        SelectOptions : [
            {
                $Type : 'UI.SelectOptionType',
                PropertyName : numberofcourses,
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
    UI.Chart #chartPrio : {
        $Type : 'UI.ChartDefinitionType',
        ChartType : #Bar,
        Dimensions : [
            visiteddays
        ],
        DimensionAttributes : [
            {
                $Type : 'UI.ChartDimensionAttributeType',
                Dimension : visiteddays,
                Role : #Category
            }
        ],
        Measures : [
            countVisits
        ],
        MeasureAttributes : [
            {
                $Type : 'UI.ChartMeasureAttributeType',
                Measure : countVisits,
                Role : #Axis1,
                DataPoint : '@UI.DataPoint#dpPrio',
            }
        ]
    },
    UI.DataPoint #dpPrio              : {
        Value       : visiteddays,
        Title       : 'Visited Days'
    },
) {
    /*prio @(
        Common.ValueList #vlPrio: {
            Label : 'Priority',
            CollectionPath : 'RisksAnalysis',
            SearchSupported : true,
            PresentationVariantQualifier : 'pvPrio',
            SelectionVariantQualifier : 'svPrio',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : prio,
                    ValueListProperty : 'prio'
                },
            ]
        }
    );
};

annotate service.ManagerAnalysis with @(
    UI.PresentationVariant #pvPeriod : {
        Text : 'FilterCoursenumberOverPeriodPV',
        SortOrder : [
            {
                $Type : 'Common.SortOrderType',
                Property : createdAt,
                Descending : true
            },
        ],
        Visualizations : [
            '@UI.Chart#chartPeriod'
        ]
    },
    UI.Chart #chartPeriod : {
        $Type : 'UI.ChartDefinitionType',
        Title : 'Course Number Over Period',
        ChartType : #Line,
        Dimensions : [
            createdAt
        ],
        DimensionAttributes : [
            {
                $Type : 'UI.ChartDimensionAttributeType',
                Dimension : createdAt,
                Role : #Category
            }
        ],
        Measures : [
            countCourses
        ],
        MeasureAttributes : [
            {
                $Type : 'UI.ChartMeasureAttributeType',
                Measure : countCourses,
                Role : #Axis1,
                DataPoint : '@UI.DataPoint#dpPeriod',
            }
        ]
    },
    UI.DataPoint #dpPeriod : {
        Value       : createdAt,
        Title       : 'Creation Date'
    },
) {
    createdAt @(
        Common.ValueList #vlcreatedAt: {
            Label : 'Creation Date',
            CollectionPath : 'ManagerAnalysis',
            SearchSupported : true,
            PresentationVariantQualifier : 'pvPeriod',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : createdAt,
                    ValueListProperty : 'createdAt'
                },
            ]
        }
    );
};*/
