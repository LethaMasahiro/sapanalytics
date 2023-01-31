using ManagerService as service from '../../srv/manager-service';

annotate service.Courses with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'ID',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'title',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Label : 'category',
            Value : category,
        },
        {
            $Type : 'UI.DataField',
            Label : 'duration',
            Value : duration,
        },
        {
            $Type : 'UI.DataField',
            Label : 'completionRate',
            Value : completionRate,
        },
        {
            $Type : 'UI.DataField',
            Label : 'platform',
            Value : platform,
        },
    ]
);
annotate service.Courses with @(
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
                Label : 'title',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Label : 'category',
                Value : category,
            },
            {
                $Type : 'UI.DataField',
                Label : 'duration',
                Value : duration,
            },
            {
                $Type : 'UI.DataField',
                Label : 'completionRate',
                Value : completionRate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'platform',
                Value : platform,
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
