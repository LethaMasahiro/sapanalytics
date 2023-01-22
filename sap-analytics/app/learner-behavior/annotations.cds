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
        TypeName : '{i18n>Hello}',
        TypeNamePlural : '{i18n>Hellos}',
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
            ID : 'name',
            Target : '@UI.DataPoint#name',
        },
    ]
);
annotate service.UserAnalysis with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Helloooo}',
            ID : 'Helloooo',
            Target : '@UI.FieldGroup#Helloooo',
        },
    ],
    UI.FieldGroup #Helloooo : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    }
);
