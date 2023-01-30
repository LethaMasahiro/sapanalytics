using LearnerService as service from '../../srv/learner-service';

annotate service.LearnerInfo with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'email',
            Value : email,
        },
        {
            $Type : 'UI.DataField',
            Label : 'ID',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'firstName',
            Value : firstName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'lastName',
            Value : lastName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'role',
            Value : role,
        },
    ]
);
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
                Label : 'firstName',
                Value : firstName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'lastName',
                Value : lastName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'role',
                Value : role,
            },
            {
                $Type : 'UI.DataField',
                Label : 'country',
                Value : country,
            },
            {
                $Type : 'UI.DataField',
                Label : 'email',
                Value : email,
            },
            {
                $Type : 'UI.DataField',
                Label : 'visitedDate',
                Value : visitedDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'lastVisit',
                Value : lastVisit,
            },
            {
                $Type : 'UI.DataField',
                Label : 'businessUnit',
                Value : businessUnit,
            },
            {
                $Type : 'UI.DataField',
                Label : 'numberofcourses',
                Value : numberofcourses,
            },
            {
                $Type : 'UI.DataField',
                Label : 'numberofstartedcourses',
                Value : numberofstartedcourses,
            },
            {
                $Type : 'UI.DataField',
                Label : 'numberofcompletedcourses',
                Value : numberofcompletedcourses,
            },
            {
                $Type : 'UI.DataField',
                Label : 'averagecompletionrate',
                Value : averagecompletionrate,
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
    ]
);
