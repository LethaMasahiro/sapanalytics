using LeanerService as service from '../../srv/learner-service';
annotate service.Courses with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'name',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'learner_ID',
            Value : learner_ID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'ID',
            Value : ID,
        },
    ]
);
annotate service.Courses with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'name',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'learner_ID',
                Value : learner_ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'ID',
                Value : ID,
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
