using ManagerService as service from './manager-analysis-service';

annotate service.ManagerAnalysis with {
    ID          @ID: 'ID';
	title       @title: 'Title';
	descr       @title: 'Description';
    createdAt   @title: 'Creation Date';
    courses @title: 'Courses';
    occupation @title: 'Occupation';
    visiteddays @title: 'Visited Days';
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
                Value               : createdAt,
                ![@UI.Importance]   : #High,
            },
            {
                $Type               : 'UI.DataField',
                Value               : visiteddays,
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
            name,
            createdAt,
            occupation,
        ],
        AggregatableProperties : [
            {
                Property : numberofcourses,
            },
            {
                Property : visiteddays,
            },
            {
                Property : createdAt,
            },
            {
                Property : ID,
            }
        ],
    }
);

annotate service.RisksAnalysis with @(
    Analytics.AggregatedProperties : [
        {
            Name                 : 'minAmount',
            AggregationMethod    : 'min',
            AggregatableProperty : 'impact',
            ![@Common.Label]     : 'Minimal Impact'
        },
        {
            Name                 : 'maxAmount',
            AggregationMethod    : 'max',
            AggregatableProperty : 'impact',
            ![@Common.Label]     : 'Maximal Impact'
        },
        {
            Name                 : 'avgAmount',
            AggregationMethod    : 'average',
            AggregatableProperty : 'impact',
            ![@Common.Label]     : 'Average Impact'
        },
        {
            Name                 : 'sumImpact',
            AggregationMethod    : 'sum',
            AggregatableProperty : 'impact',
            ![@Common.Label]     : 'Total Cost Impact'
        },
        {
            Name                 : 'countRisk',
            AggregationMethod    : 'countdistinct',
            AggregatableProperty : 'ID',
            ![@Common.Label]     : 'Number of Risks'
        },
        {
            Name                 : 'countRiskYear',
            AggregationMethod    : 'countdistinct',
            AggregatableProperty : 'riskyear',
            ![@Common.Label]     : 'Number of Risks Per Year'
        },
    ],
);

annotate service.RisksAnalysis with @(
    UI.Chart : {
        Title : 'Risk Impacts',
        ChartType : #Column,
        Measures :  [sumImpact],
        Dimensions : [riskyear],
        MeasureAttributes   : [{
                $Type   : 'UI.ChartMeasureAttributeType',
                Measure : sumImpact,
                Role    : #Axis1
        }],
        DimensionAttributes : [
            {
                $Type     : 'UI.ChartDimensionAttributeType',
                Dimension : riskyear,
                Role      : #Category
            },
            {
                $Type     : 'UI.ChartDimensionAttributeType',
                Dimension : prio,
                Role      : #Category
            },
        ],
    },
);

annotate service.RisksAnalysis with @(
    UI.PresentationVariant #pvPrio : {
        SortOrder : [
            {
                $Type : 'Common.SortOrderType',
                Property : impact,
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
                PropertyName : impact,
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
        ChartType : #Donut,
        Dimensions : [
            prio
        ],
        DimensionAttributes : [
            {
                $Type : 'UI.ChartDimensionAttributeType',
                Dimension : prio,
                Role : #Category
            }
        ],
        Measures : [
            sumImpact
        ],
        MeasureAttributes : [
            {
                $Type : 'UI.ChartMeasureAttributeType',
                Measure : sumImpact,
                Role : #Axis1,
                DataPoint : '@UI.DataPoint#dpPrio',
            }
        ]
    },
    UI.DataPoint #dpPrio              : {
        Value       : impact,
        Title       : 'Impact'
    },
) {
    prio @(
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

annotate service.RisksAnalysis with @(
    UI.PresentationVariant #pvPeriod : {
        Text : 'FilterRisksOverPeriodPV',
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
        Title : 'Risks Over Period',
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
            countRisk
        ],
        MeasureAttributes : [
            {
                $Type : 'UI.ChartMeasureAttributeType',
                Measure : countRisk,
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
            CollectionPath : 'RisksAnalysis',
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
};
