using ManagerService as service from '../../srv/manager-service';

annotate service.LearnersInfo with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'role',
            Value : role,
        },
        {
            $Type : 'UI.DataField',
            Label : 'name',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'email',
            Value : email,
        },
        {
            $Type : 'UI.DataField',
            Label : 'isDeactivated',
            Value : isDeactivated,
        },
        {
            $Type : 'UI.DataField',
            Label : 'password',
            Value : password,
        },
    ]
);
annotate service.LearnersInfo with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'role',
                Value : role,
            },
            {
                $Type : 'UI.DataField',
                Label : 'name',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'email',
                Value : email,
            },
            {
                $Type : 'UI.DataField',
                Label : 'isDeactivated',
                Value : isDeactivated,
            },
            {
                $Type : 'UI.DataField',
                Label : 'password',
                Value : password,
            },
            {
                $Type : 'UI.DataField',
                Label : 'occupation',
                Value : occupation,
            },
            {
                $Type : 'UI.DataField',
                Label : 'coursenumber',
                Value : coursenumber,
            },
            {
                $Type : 'UI.DataField',
                Label : 'visiteddays',
                Value : visiteddays,
            },
            {
                $Type : 'UI.DataField',
                Label : 'lastvisit',
                Value : lastvisit,
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
