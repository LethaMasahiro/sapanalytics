using UserService as service from '../../srv/user-service';


//List Columns for the Analytical List
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




//Big Pie Chart on the list page
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

//Header Info
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

//Header Facets
annotate service.UserAnalysis with @(
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'ID',
            Target : '@UI.DataPoint#ID',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'firstName',
            Target : '@UI.DataPoint#firstName',
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
            Target : '@UI.DataPoint#businessUnit',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'country',
            Target : '@UI.DataPoint#country',
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
);

//Progress Bar on the learner obect page
annotate service.UserAnalysis with @(
    UI.DataPoint #progress : {
        $Type : 'UI.DataPointType',
        Value : averagecompletionrate,
        Title : 'Average Completion Rate',
        TargetValue : 100,
        Visualization : #Progress,
    },
);

//data points for the learner detail page
annotate service.UserAnalysis with @(
    UI.DataPoint #firstName : {
        $Type : 'UI.DataPointType',
        Value : firstName,
        Title : 'First Name',
    },
    UI.DataPoint #lastName : {
        $Type : 'UI.DataPointType',
        Value : lastName,
        Title : 'Last Name',
    },
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
    UI.DataPoint #email : {
        $Type : 'UI.DataPointType',
        Value : email,
        Title : 'Email',
    },
    UI.DataPoint #numberofcourses : {
        $Type : 'UI.DataPointType',
        Value : numberofcourses,
        Title : 'Number of Courses',
    },
    UI.DataPoint #numberofstartedcourses : {
        $Type : 'UI.DataPointType',
        Value : numberofstartedcourses,
        Title : 'Number of Started Courses',
    },
    UI.DataPoint #numberofcompletedcourses : {
        $Type : 'UI.DataPointType',
        Value : numberofcompletedcourses,
        Title : 'Number of Completed Courses',
    },
    UI.DataPoint #avgcompletionrate : {
        $Type : 'UI.DataPointType',
        Value : averagecompletionrate,
        Title : 'Average Completion Rate',
    },
    UI.DataPoint #numberofminutesconsumed : {
        $Type : 'UI.DataPointType',
        Value : minutesvideoconsumed,
        Title : 'Consumed Video Minutes',
    }
);


//learner object page list column names
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
        },{
            $Type : 'UI.DataField',
            Value : minutesVideoConsumed,
            Label : 'Minutes Video Consumed',
        },]
);

//available filters
annotate service.UserAnalysis with @(
    UI.SelectionFields : [
        businessUnit,
        country,
        role,
        platform
    ]
);

//renaming of the data fields
annotate service.UserAnalysis with {
    businessUnit @Common.Label : 'Business Unit';
    numberofstartedcourses @Common.Label : 'Number of Started Courses';
    numberofcompletedcourses @Common.Label : 'Number of Completed Courses';
    numberofcourses @Common.Label : 'Number of Courses';
    averagecompletionrate @Common.Label : 'Average Completion Rate';
    visitedDate @Common.Label : 'Visited Days';
    role @Common.Label : 'Role';
    firstName @Common.Label : 'First Name';
    lastName @Common.Label : 'Last Name';
    country @Common.Label : 'Country';
    platform @Common.Label: 'Platform';
};


//visual filter started courses
annotate service.UserAnalysis with @(
    UI.Chart #numberofstartedcoursesChart : {
        $Type : 'UI.ChartDefinitionType',
        ChartType : #Bar,
        Dimensions : [
            businessUnit
        ],
        Measures : [
            numberofstartedcourses,
        ],
    },
    UI.PresentationVariant #numberofstartedcoursesPV : {
        $Type : 'UI.PresentationVariantType',
        Visualizations : [
            '@UI.Chart#numberofstartedcoursesChart',
        ],
    },
    UI.SelectionVariant #numberofstartedcoursesSV : {
        Parameters : [],
        SelectOptions : [
            {
                $Type : 'UI.SelectOptionType',
                PropertyName : businessUnit,
                Ranges : [
                    {
                        $Type : 'UI.SelectionRangeType',
                        Sign : #E,
                        Option : #EQ,
                        Low : 'mgs.O.BU.CoreInsurance.INT'
                    }
                ]
            },
            {
                $Type : 'UI.SelectOptionType',
                PropertyName : businessUnit,
                Ranges : [
                    {
                        $Type : 'UI.SelectionRangeType',
                        Sign : #E,
                        Option : #EQ,
                        Low : 'mgs.O.BU.Finance.INT'
                    }
                ]
            },
            {
                $Type : 'UI.SelectOptionType',
                PropertyName : businessUnit,
                Ranges : [
                    {
                        $Type : 'UI.SelectionRangeType',
                        Sign : #E,
                        Option : #EQ,
                        Low : 'mgs.O.BU.Analytics.INT'
                    }
                ]
            }
        ]
    }
);

annotate service.UserAnalysis with {
    numberofstartedcourses @Common.ValueList #numberofstartedcoursesFilter : {
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
        PresentationVariantQualifier : 'numberofstartedcoursesPV',
        SelectionVariantQualifier : 'numberofstartedcoursesSV'
    }
};


//completed courses visual filter
annotate service.UserAnalysis with @(
    UI.Chart #numberofcompletedcoursesChart : {
        $Type : 'UI.ChartDefinitionType',
        ChartType : #Bar,
        Dimensions : [
            businessUnit
        ],
        Measures : [
            numberofcompletedcourses,
        ],
    },
    UI.PresentationVariant #numberofcompletedcoursesPV : {
        $Type : 'UI.PresentationVariantType',
        Visualizations : [
            '@UI.Chart#numberofcompletedcoursesChart',
        ],
    },
    UI.SelectionVariant #numberofcompletedcoursesSV : {
    Parameters : [],
    SelectOptions : [
        {
            $Type : 'UI.SelectOptionType',
            PropertyName : businessUnit,
            Ranges : [
                {
                    $Type : 'UI.SelectionRangeType',
                    Sign : #E,
                    Option : #EQ,
                    Low : 'mgs.O.BU.CoreInsurance.INT'
                }
            ]
        },
        {
            $Type : 'UI.SelectOptionType',
            PropertyName : businessUnit,
            Ranges : [
                {
                    $Type : 'UI.SelectionRangeType',
                    Sign : #E,
                    Option : #EQ,
                    Low : 'mgs.O.BU.Finance.INT'
                }
            ]
        },
        {
            $Type : 'UI.SelectOptionType',
            PropertyName : businessUnit,
            Ranges : [
                {
                    $Type : 'UI.SelectionRangeType',
                    Sign : #E,
                    Option : #EQ,
                    Low : 'mgs.O.BU.Analytics.INT'
                }
            ]
        }
    ]
}
);

annotate service.UserAnalysis with {
    numberofcompletedcourses @Common.ValueList #numberofcompletedcoursesFilter : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'UserAnalysis',
        SearchSupported : false,
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : numberofcompletedcourses,
                ValueListProperty : 'numberofcompletedcourses',
            },
        ],
        PresentationVariantQualifier : 'numberofcompletedcoursesPV',
        SelectionVariantQualifier : 'numberofcompletedcoursesSV'
    }
};

//average completion rate visual filter
annotate service.UserAnalysis with @(
    UI.Chart #avgcompletionrateChart : {
        $Type : 'UI.ChartDefinitionType',
        ChartType : #Bar,
        Dimensions : [
            businessUnit
        ],
        Measures : [
            averagecompletionrate,
        ],
    },
    UI.PresentationVariant #avgcompletionratePV : {
        $Type : 'UI.PresentationVariantType',
        Visualizations : [
            '@UI.Chart#avgcompletionrateChart',
        ],
    },
    UI.SelectionVariant #avgcompletionrateSV : {
    Parameters : [],
    SelectOptions : [
        {
            $Type : 'UI.SelectOptionType',
            PropertyName : businessUnit,
            Ranges : [
                {
                    $Type : 'UI.SelectionRangeType',
                    Sign : #E,
                    Option : #EQ,
                    Low : 'mgs.O.BU.CoreInsurance.INT'
                }
            ]
        },
        {
            $Type : 'UI.SelectOptionType',
            PropertyName : businessUnit,
            Ranges : [
                {
                    $Type : 'UI.SelectionRangeType',
                    Sign : #E,
                    Option : #EQ,
                    Low : 'mgs.O.BU.Finance.INT'
                }
            ]
        },
        {
            $Type : 'UI.SelectOptionType',
            PropertyName : businessUnit,
            Ranges : [
                {
                    $Type : 'UI.SelectionRangeType',
                    Sign : #E,
                    Option : #EQ,
                    Low : 'mgs.O.BU.Analytics.INT'
                }
            ]
        }
    ]
}
);
annotate service.UserAnalysis with {
    averagecompletionrate @Common.ValueList #avgcompletionrateFilter : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'UserAnalysis',
        SearchSupported : false,
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : averagecompletionrate,
                ValueListProperty : 'averagecompletionrate',
            },
        ],
        PresentationVariantQualifier : 'avgcompletionratePV',
        SelectionVariantQualifier : 'avgcompletionrateSV'
    }
};

//visited date visual filter
annotate service.UserAnalysis with @(
    UI.Chart #visiteddaysChart : {
        $Type : 'UI.ChartDefinitionType',
        ChartType : #Bar,
        Dimensions : [
            businessUnit
        ],
        Measures : [
            visitedDate,
        ],
    },
    UI.PresentationVariant #visiteddaysPV : {
        $Type : 'UI.PresentationVariantType',
        Visualizations : [
            '@UI.Chart#visiteddaysChart',
        ],
    },
    UI.SelectionVariant #visiteddaysSV : {
    Parameters : [],
    SelectOptions : [
        {
            $Type : 'UI.SelectOptionType',
            PropertyName : businessUnit,
            Ranges : [
                {
                    $Type : 'UI.SelectionRangeType',
                    Sign : #E,
                    Option : #EQ,
                    Low : 'mgs.O.BU.CoreInsurance.INT'
                }
            ]
        },
        {
            $Type : 'UI.SelectOptionType',
            PropertyName : businessUnit,
            Ranges : [
                {
                    $Type : 'UI.SelectionRangeType',
                    Sign : #E,
                    Option : #EQ,
                    Low : 'mgs.O.BU.Finance.INT'
                }
            ]
        },
        {
            $Type : 'UI.SelectOptionType',
            PropertyName : businessUnit,
            Ranges : [
                {
                    $Type : 'UI.SelectionRangeType',
                    Sign : #E,
                    Option : #EQ,
                    Low : 'mgs.O.BU.Analytics.INT'
                }
            ]
        }
    ]
}
);
annotate service.UserAnalysis with {
    visitedDate @Common.ValueList #visiteddaysFilter : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'UserAnalysis',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : businessUnit,
                ValueListProperty : 'businessUnit',
            },
        ],
        PresentationVariantQualifier : 'visiteddaysPV',
        SelectionVariantQualifier : 'visiteddaysSV'
    }
};

//filter drop down
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
    platform @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'coursePlatform',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : platform,
                    ValueListProperty : 'platform',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};


//Datapoints for Course detail view
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
            Target : 'course/@UI.DataPoint#title',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'category',
            Target : 'course/@UI.DataPoint#category',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'duration',
            Target : 'course/@UI.DataPoint#duration',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'platform',
            Target : 'course/@UI.DataPoint#platform',
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
        Title : 'Category',
    },
    UI.DataPoint #completionRate : {
        $Type : 'UI.DataPointType',
        Value : completionRate,
        Title : 'Whole Course Completion Rate',
    },
    UI.DataPoint #duration : {
        $Type : 'UI.DataPointType',
        Value : duration,
        Title : 'Course Duration in minutes',
    },
    UI.DataPoint #platform : {
        $Type : 'UI.DataPointType',
        Value : platform,
        Title : 'Platform',
    },
    UI.DataPoint #title : {
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



