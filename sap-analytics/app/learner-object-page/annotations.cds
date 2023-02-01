using LearnerService as service from '../../srv/learner-service';


//columns for the first list page
annotate service.LearnerInfo with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Email',
            Value : email,
        },
        {
            $Type : 'UI.DataField',
            Label : 'ID',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'First Name',
            Value : firstName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Last Name',
            Value : lastName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Business Unit',
            Value : businessUnit,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Role',
            Value : role,
        },
    ]
);

//Field groups to display the personal data
annotate service.LearnerInfo with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'ID',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'First Name',
                Value : firstName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Last Name',
                Value : lastName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Role',
                Value : role,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Country',
                Value : country,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Email',
                Value : email,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Number of Visited Days',
                Value : visitedDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Last Visit',
                Value : lastVisit,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Business Unit',
                Value : businessUnit,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Number of Courses',
                Value : numberofcourses,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Number of Started Courses',
                Value : numberofstartedcourses,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Number of Completed Courses',
                Value : numberofcompletedcourses,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Average Completion Rate in Percent',
                Value : averagecompletionrate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Minutes of Videos Consumed',
                Value : numberofvideosconsumed,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'enrolled-courses',
            ID : 'enrolledcourses',
            Target : 'enrolledCourses/@UI.LineItem#enrolledcourses',
        },
    ]
);

//table columns for the learner's course list
annotate service.EnrolledIn with @(
    UI.LineItem #enrolledcourses : [
        {
            $Type : 'UI.DataField',
            Value : courseID,
            Label : 'Course ID',
        },{
            $Type : 'UI.DataField',
            Value : courseTitle,
            Label : 'Course Title',
        },{
            $Type : 'UI.DataField',
            Value : platform,
            Label : 'Platform',
        },
                {
            $Type : 'UI.DataField',
            Value : lastAccessedDate,
            Label : 'Last Accessed Date',
        },
        ]
);