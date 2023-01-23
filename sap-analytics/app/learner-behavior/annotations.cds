using UserService as service from '../../srv/user-service';

annotate service.UserAnalysis with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : '{i18n>Id}',
        },
        {
            $Type : 'UI.DataField',
            Value : lastVisit,
            Label : '{i18n>Lastvisit}',
        },
        {
            $Type : 'UI.DataField',
            Value : name,
            Label : '{i18n>Name1}',
        },
        {
            $Type : 'UI.DataField',
            Value : numberofcompletedcourses,
            Label : '{i18n>Numberofcompletedcourses}',
        },
        {
            $Type : 'UI.DataField',
            Value : numberofcourses,
            Label : '{i18n>Numberofcourses}',
        },
        {
            $Type : 'UI.DataField',
            Value : numberofstartedcourses,
            Label : '{i18n>Numberofstartedcourses}',
        },
        {
            $Type : 'UI.DataField',
            Value : occupation,
            Label : '{i18n>Occupation}',
        },
        {
            $Type : 'UI.DataField',
            Value : role,
            Label : '{i18n>Role}',
        },
        {
            $Type : 'UI.DataField',
            Value : visitedDate,
            Label : '{i18n>Visiteddate}',
        },
        {
            $Type : 'UI.DataField',
            Value : averagecompletionrate,
            Label : '{i18n>Averagecompletionrate}',
        },
    ]
);
annotate service.UserAnalysis with @(
    UI.DataPoint #averagecompletionrate : {
        Value : averagecompletionrate,
        Visualization : #Progress,
        TargetValue : 100,
    }
);
annotate service.UserAnalysis with @(
    UI.Chart #alpChart : {
        $Type : 'UI.ChartDefinitionType',
        ChartType : #Pie,
        Dimensions : [
            role,
        ],
        Measures : [
            numberofcourses,
        ],
        Title : '{i18n>NumberOfCourses}',
    }
);
annotate service.UserAnalysis with @(
    UI.HeaderInfo : {
        TypeName : '{i18n>Learner}',
        TypeNamePlural : '{i18n>Learners}',
        Title : {
            $Type : 'UI.DataField',
            Value : name,
        },
        ImageUrl : businessUnit.id,
    }
);
annotate service.UserAnalysis with @(
    UI.DataPoint #name : {
        $Type : 'UI.DataPointType',
        Value : name,
        Title : '{i18n>Name2}',
    },
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'ID',
            Target : '@UI.DataPoint#ID',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'name',
            Target : '@UI.DataPoint#name',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'role',
            Target : '@UI.DataPoint#role',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'occupation',
            Target : '@UI.DataPoint#occupation',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'averagecompletionrate',
            Target : '@UI.DataPoint#progress',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'lastVisit',
            Target : '@UI.DataPoint#lastVisit',
        },
    ]
);
annotate service.UserAnalysis with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Enrolled Courses',
            ID : 'EnrolledCourses',
            Target : 'enrolledCourses/@UI.LineItem#EnrolledCourses',
        },],
    UI.FieldGroup #Helloooo : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    }
);
annotate service.UserAnalysis with @(
    UI.DataPoint #progress : {
        $Type : 'UI.DataPointType',
        Value : averagecompletionrate,
        Title : 'averagecompletionrate',
        TargetValue : 100,
        Visualization : #Progress,
    }
);
annotate service.EnrolledIn with @(
    UI.DataPoint #completionRate : {
        Value : completionRate,
    },
    UI.Chart #completionRate : {
        ChartType : #Line,
        Title : 'completionRate',
        Measures : [
            completionRate,
        ],
        MeasureAttributes : [
            {
                DataPoint : '@UI.DataPoint#completionRate',
                Role : #Axis1,
                Measure : completionRate,
            },
        ],
        Dimensions : [
            completionRate,
        ],
    }
);
annotate service.UserAnalysis with @(
    UI.DataPoint #occupation : {
        $Type : 'UI.DataPointType',
        Value : occupation,
        Title : 'occupation',
    },
    UI.DataPoint #role : {
        $Type : 'UI.DataPointType',
        Value : role,
        Title : 'role',
    },
    UI.DataPoint #lastVisit : {
        $Type : 'UI.DataPointType',
        Value : lastVisit,
        Title : 'lastVisit',
    },
    UI.DataPoint #ID : {
        $Type : 'UI.DataPointType',
        Value : ID,
        Title : 'ID',
    }
);
annotate service.UserAnalysis with @(
    UI.Identification : [
    ]
);
annotate service.UserAnalysis with @(
    UI.FieldGroup #Progressbar : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : averagecompletionrate,
                Label : 'averagecompletionrate',
            },],
    }
);
annotate service.EnrolledIn with @(
    UI.LineItem #EnrolledCourses : [
        {
            $Type : 'UI.DataField',
            Value : courseID,
            Label : 'courseID',
        },{
            $Type : 'UI.DataField',
            Value : enrolledDate,
            Label : 'enrolledDate',
        },{
            $Type : 'UI.DataField',
            Value : startedDate,
            Label : 'startedDate',
        },{
            $Type : 'UI.DataField',
            Value : completionDate,
            Label : 'completionDate',
        },{
            $Type : 'UI.DataField',
            Value : lastAccessedDate,
            Label : 'lastAccessedDate',
        },{
            $Type : 'UI.DataField',
            Value : completionRate,
            Label : 'completionRate',
        },{
            $Type : 'UI.DataField',
            Value : completedCourseItem,
            Label : 'completedCourseItem',
        },]
);
annotate service.UserAnalysis with @(
    UI.SelectionFields : [
        role,
        occupation
    ]
);
annotate service.UserAnalysis with {
    role @Common.Label : 'role'
};

annotate service.UserAnalysis with @(
    UI.SelectionVariant #SVForStatus : {
    
    SelectOptions : [
        {
            $Type : 'UI.SelectOptionType',
            PropertyName : numberofstartedcourses,
            Ranges : [
                {
                    $Type : 'UI.SelectionRangeType',
                    Sign : #E,
                    Option : #EQ,
                    Low : 'D'
                }
            ]
        },
        {
            $Type : 'UI.SelectOptionType',
            PropertyName : numberofcompletedcourses,
            Ranges : [
                {
                    $Type : 'UI.SelectionRangeType',
                    Sign : #E,
                    Option : #EQ,
                    Low : 'HT-1502'
                }
            ]
        }
    ]
    }   
);
annotate service.UserAnalysis with @(
    UI.Chart #visualFilter : {
        $Type : 'UI.ChartDefinitionType',
        ChartType : #Bar,
        Dimensions : [
            role,
            occupation
        ],
        Measures : [
            numberofstartedcourses,
        ],
    },
    UI.PresentationVariant #visualFilter : {
        $Type : 'UI.PresentationVariantType',
        Visualizations : [
            '@UI.Chart#visualFilter',
        ],
    }
);
annotate service.UserAnalysis with {
  @Common.ValueList #VisualFilter : {
    Label : 'numberofstartedcourses',
    CollectionPath : 'UserAnalysis',
    SearchSupported : false,
    PresentationVariantQualifier : 'visualFilter',
    SelectionVariantQualifier : 'SVForStatus',
    Parameters : [
        {
            $Type : 'Common.ValueListParameterInOut',
            LocalDataProperty : numberofstartedcourses,
            ValueListProperty : 'role'
        }
    ]
  }
  numberofstartedcourses
};

annotate service.UserAnalysis with {
    numberofstartedcourses @Common.ValueList #visualFilter : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'UserAnalysis',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : numberofstartedcourses,
                ValueListProperty : 'role',
            },
        ],
        PresentationVariantQualifier : 'visualFilter',
    }
};
annotate service.UserAnalysis with @(
    UI.Chart #visualFilter1 : {
        $Type : 'UI.ChartDefinitionType',
        ChartType : #Bar,
        Dimensions : [
            role,
        ],
        Measures : [
            numberofcompletedcourses,
        ],
    },
    UI.PresentationVariant #visualFilter1 : {
        $Type : 'UI.PresentationVariantType',
        Visualizations : [
            '@UI.Chart#visualFilter1',
        ],
    }
);
annotate service.UserAnalysis with {
    numberofcompletedcourses @Common.ValueList #visualFilter : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'UserAnalysis',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : numberofcompletedcourses,
                ValueListProperty : 'role',
            },
        ],
        PresentationVariantQualifier : 'visualFilter1',
    }
};
annotate service.UserAnalysis with @(
    UI.Chart #visualFilter2 : {
        $Type : 'UI.ChartDefinitionType',
        ChartType : #Bar,
        Dimensions : [
            role,
        ],
        Measures : [
            averagecompletionrate,
        ],
    },
    UI.PresentationVariant #visualFilter2 : {
        $Type : 'UI.PresentationVariantType',
        Visualizations : [
            '@UI.Chart#visualFilter2',
        ],
    }
);
annotate service.UserAnalysis with {
    averagecompletionrate @Common.ValueList #visualFilter : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'UserAnalysis',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : averagecompletionrate,
                ValueListProperty : 'role',
            },
        ],
        PresentationVariantQualifier : 'visualFilter2',
    }
};
annotate service.UserAnalysis with @(
    UI.Chart #visualFilter3 : {
        $Type : 'UI.ChartDefinitionType',
        ChartType : #Bar,
        Dimensions : [
            role,
        ],
        Measures : [
            visitedDate,
        ],
    },
    UI.PresentationVariant #visualFilter3 : {
        $Type : 'UI.PresentationVariantType',
        Visualizations : [
            '@UI.Chart#visualFilter3',
        ],
    }
);
annotate service.UserAnalysis with {
    visitedDate @Common.ValueList #visualFilter : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'UserAnalysis',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : visitedDate,
                ValueListProperty : 'role',
            },
        ],
        PresentationVariantQualifier : 'visualFilter3',
    }
};
