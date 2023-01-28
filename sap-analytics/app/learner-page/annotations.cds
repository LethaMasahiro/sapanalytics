using UserService as service from '../../srv/user-service';

annotate service.LearnerObject with @(
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
                Value : 'Vuk.Verovic@msg-global.com',
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
                Label : 'completionRate',
                Value : completionRate,
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
annotate service.LearnerObject with @(
    UI.HeaderInfo : {
        TypeName : 'email',
        TypeNamePlural : 'emails',
        Title : {
            $Type : 'UI.DataField',
            Value : email,
        },
        Description : {
            $Type : 'UI.DataField',
            Value : firstName,
        },
    }
);
annotate service.LearnerObject with {
    completionRate @Common.FieldControl : #ReadOnly
};
