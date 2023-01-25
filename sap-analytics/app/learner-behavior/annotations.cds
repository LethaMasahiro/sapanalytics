using UserService as service from '../../srv/user-service';

annotate service.UserAnalysis with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : firstName,
            Label : 'First Name',
        },
        {
            $Type : 'UI.DataField',
            Value : lastName,
            Label : 'Last Name',
        },
        {
            $Type : 'UI.DataField',
            Value : email,
            Label : 'Email',
        },
        {
            $Type : 'UI.DataField',
            Value : businessUnit,
            Label : 'Business Unit',
        },
        {
            $Type : 'UI.DataField',
            Value : lastVisit,
            Label : 'Last Visit',
        },
        {
            $Type : 'UI.DataField',
            Value : country,
            Label : 'Country',
        },
        {
            $Type : 'UI.DataField',
            Value : role,
            Label : 'Role',
        },
        {
            $Type : 'UI.DataField',
            Value : visitedDate,
            Label : 'Visited Date',
        },
        {
            $Type : 'UI.DataField',
            Value : numberofcourses,
            Label : 'Number Of Courses',
        },
        {
            $Type : 'UI.DataField',
            Value : numberofcompletedcourses,
            Label : 'Number Of Completed Courses',
        },
        {
            $Type : 'UI.DataField',
            Value : numberofstartedcourses,
            Label : 'Number Of Started Courses',
        },
        {
            $Type : 'UI.DataField',
            Value : averagecompletionrate,
            Label : 'Average Completion Rate',
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
            businessUnit,
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
            Value : ID,
        },
        ImageUrl : businessUnit,
    }
);
annotate service.UserAnalysis with @(
    UI.DataPoint #firstName : {
        $Type : 'UI.DataPointType',
        Value : firstName,
        Title : 'Email',
    },
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'ID',
            Target : '@UI.DataPoint#ID',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'firstName',
            Target : '@UI.DataPoint#firstName1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'lastName',
            Target : '@UI.DataPoint#lastName',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'role',
            Target : '@UI.DataPoint#role',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'businessUnit',
            Target : '@UI.DataPoint#businessUnit1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'country',
            Target : '@UI.DataPoint#country1',
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
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'email',
            Target : '@UI.DataPoint#email',
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
        Title : 'Average Completion Rate',
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
    UI.DataPoint #country : {
        $Type : 'UI.DataPointType',
        Value : country,
        Title : 'Country',
    },
    UI.DataPoint #businessUnit : {
        $Type : 'UI.DataPointType',
        Value : businessUnit,
        Title : 'Business Unit',
    },
    UI.DataPoint #role : {
        $Type : 'UI.DataPointType',
        Value : role,
        Title : 'Role',
    },
    UI.DataPoint #lastVisit : {
        $Type : 'UI.DataPointType',
        Value : lastVisit,
        Title : 'Last Visit',
    },
    UI.DataPoint #ID : {
        $Type : 'UI.DataPointType',
        Value : ID,
        Title : 'ID',
    },
    UI.DataPoint #numberofcourses : {
        $Type : 'UI.DataPointType',
        Value : ID,
        Title : 'Number of Courses',
    },
    UI.DataPoint #numberofstartedcourses : {
        $Type : 'UI.DataPointType',
        Value : ID,
        Title : 'Number of Started Courses',
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
                Label : 'Average Completion Rate',
            },],
    }
);
annotate service.EnrolledIn with @(
    UI.LineItem #EnrolledCourses : [
        {
            $Type : 'UI.DataField',
            Value : courseID,
            Label : 'Course ID',
        },
        {
            $Type : 'UI.DataField',
            Value : courseTitle,
            Label : 'courseTitle',
        },{
            $Type : 'UI.DataField',
            Value : enrolledDate,
            Label : 'Enrolled Date',
        },{
            $Type : 'UI.DataField',
            Value : startedDate,
            Label : 'Started Date',
        },{
            $Type : 'UI.DataField',
            Value : completionDate,
            Label : 'Completion Date',
        },{
            $Type : 'UI.DataField',
            Value : lastAccessedDate,
            Label : 'Last Accessed Date',
        },{
            $Type : 'UI.DataField',
            Value : completionRate,
            Label : 'Completion Rate',
        },/*{
            $Type : 'UI.DataField',
            Value : completedCourseItem,
            Label : 'Completed Course Items',
        },*/]
);
annotate service.UserAnalysis with @(
    UI.SelectionFields : [
        businessUnit,
        country,
        role
    ]
);
annotate service.UserAnalysis with {
    businessUnit @Common.Label : 'Business Unit';
    numberofstartedcourses @Common.Label : 'Number of Started Courses';
    numberofcompletedcourses @Common.Label : 'Number of Completed Courses';
    numberofcourses @Common.Label : 'Number of Courses';
    averagecompletionrate @Common.Label : 'Average Completion Rate';
    visitedDate @Common.Label : 'Visited Days';
    role @Common.Label : 'Role';
    name @Common.Label : 'Name';
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
        },
    ]
    }   
);
annotate service.UserAnalysis with @(
    UI.Chart #visualFilter : {
        $Type : 'UI.ChartDefinitionType',
        ChartType : #Bar,
        Dimensions : [
            businessUnit
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
    Label : 'Number of Started Courses',
    CollectionPath : 'UserAnalysis',
    SearchSupported : false,
    PresentationVariantQualifier : 'visualFilter',
    SelectionVariantQualifier : 'SVForStatus',
    Parameters : [
        {
            $Type : 'Common.ValueListParameterInOut',
            LocalDataProperty : numberofstartedcourses,
            ValueListProperty : 'numberofstartedcourses'
        }
    ]
  }
  numberofstartedcourses
};

annotate service.UserAnalysis with {
    numberofstartedcourses @Common.ValueList #visualFilter : {
        Label : 'Number of Started Courses',
        $Type : 'Common.ValueListType',
        CollectionPath : 'UserAnalysis',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : numberofstartedcourses,
                ValueListProperty : 'numberofstartedcourses',
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
            businessUnit
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
                $Type : 'Common.ValueListParameterOut',
                LocalDataProperty : numberofcompletedcourses,
                ValueListProperty : 'numberofcompletedcourses',
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
            businessUnit
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
                ValueListProperty : 'businessUnit',
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
            businessUnit
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
                $Type : 'Common.ValueListParameterIn',
                LocalDataProperty : visitedDate,
                ValueListProperty : 'visitedDate',
            },
            {
                $Type : 'Common.ValueListParameterOut',
                LocalDataProperty : businessUnit,
                ValueListProperty : 'businessUnit',
            },
        ],
        PresentationVariantQualifier : 'visualFilter3',
    }
};
annotate service.UserAnalysis with @(
    UI.FieldGroup #LastName : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    }
);
annotate service.UserAnalysis with @(
    UI.FieldGroup #Email : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    }
);
annotate service.UserAnalysis with @(
    UI.DataPoint #country1 : {
        $Type : 'UI.DataPointType',
        Value : country,
        Title : 'Country',
    }
);
annotate service.UserAnalysis with @(
    UI.DataPoint #lastName : {
        $Type : 'UI.DataPointType',
        Value : lastName,
        Title : 'Last Name',
    }
);
annotate service.UserAnalysis with @(
    UI.DataPoint #email : {
        $Type : 'UI.DataPointType',
        Value : email,
        Title : 'Email',
    },
    UI.DataPoint #businessUnit1 : {
        $Type : 'UI.DataPointType',
        Value : businessUnit,
        Title : 'Business Unit',
    }
);
annotate service.UserAnalysis with @(
    UI.DataPoint #firstName1 : {
        $Type : 'UI.DataPointType',
        Value : firstName,
        Title : 'First Name',
    }
);
annotate service.UserAnalysis with {
    country @Common.Label : 'Country'
};
annotate service.UserAnalysis with {
    role @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'learnerRoles',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : role,
                    ValueListProperty : 'role',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.UserAnalysis with {
    country @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'learnerCountries',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : country,
                    ValueListProperty : 'country',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.UserAnalysis with {
    businessUnit @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'learnerBusinessUnits',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : businessUnit,
                    ValueListProperty : 'businessUnit',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};

annotate service.UserAnalysis with {
    role @Common.Text : {
            $value : ID,
            ![@UI.TextArrangement] : #TextSeparate,
        }
};
annotate service.learnerRoles with {
    ID @Common.Text : role
};
annotate service.EnrolledIn with @(
    UI.DataPoint #courseID : {
        $Type : 'UI.DataPointType',
        Value : courseID,
        Title : 'Course ID',
    },
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'courseID',
            Target : '@UI.DataPoint#courseID',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'title',
            Target : 'course/@UI.DataPoint#title1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'category',
            Target : 'course/@UI.DataPoint#category1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'duration',
            Target : 'course/@UI.DataPoint#duration1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'platform',
            Target : 'course/@UI.DataPoint#platform1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'completionRate',
            Target : 'course/@UI.DataPoint#progress',
        },
    ]
);
annotate service.Courses with @(
    UI.DataPoint #category : {
        $Type : 'UI.DataPointType',
        Value : category,
        Title : 'category',
    },
    UI.DataPoint #completionRate : {
        $Type : 'UI.DataPointType',
        Value : completionRate,
        Title : 'completionRate',
    },
    UI.DataPoint #duration : {
        $Type : 'UI.DataPointType',
        Value : duration,
        Title : 'duration',
    },
    UI.DataPoint #platform : {
        $Type : 'UI.DataPointType',
        Value : platform,
        Title : 'platform',
    },
    UI.DataPoint #title : {
        $Type : 'UI.DataPointType',
        Value : title,
        Title : 'title',
    }
);
annotate service.Courses with @(
    UI.DataPoint #platform1 : {
        $Type : 'UI.DataPointType',
        Value : platform,
        Title : 'Platform',
    }
);
annotate service.Courses with @(
    UI.DataPoint #category1 : {
        $Type : 'UI.DataPointType',
        Value : category,
        Title : 'Category',
    },
    UI.DataPoint #duration1 : {
        $Type : 'UI.DataPointType',
        Value : duration,
        Title : 'Duration',
    },
    UI.DataPoint #ID : {
        $Type : 'UI.DataPointType',
        Value : ID,
        Title : 'ID',
    },
    UI.DataPoint #title1 : {
        $Type : 'UI.DataPointType',
        Value : title,
        Title : 'Title',
    }
);
annotate service.Courses with @(
    UI.DataPoint #progress : {
        $Type : 'UI.DataPointType',
        Value : completionRate,
        Title : 'Completion Rate',
        TargetValue : 100,
        Visualization : #Progress,
    }
);
