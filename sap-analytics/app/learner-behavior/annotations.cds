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
            Value : lastVisit,
            Label : 'lastVisit',
        },
        {
            $Type : 'UI.DataField',
            Value : name,
            Label : 'name',
        },
        {
            $Type : 'UI.DataField',
            Value : numberofcompletedcourses,
            Label : 'numberofcompletedcourses',
        },
        {
            $Type : 'UI.DataField',
            Value : numberofcourses,
            Label : 'numberofcourses',
        },
        {
            $Type : 'UI.DataField',
            Value : numberofstartedcourses,
            Label : 'numberofstartedcourses',
        },
        {
            $Type : 'UI.DataField',
            Value : occupation,
            Label : 'occupation',
        },
        {
            $Type : 'UI.DataField',
            Value : role,
            Label : 'role',
        },
        {
            $Type : 'UI.DataField',
            Value : visitedDate,
            Label : 'visitedDate',
        },
        {
            $Type : 'UI.DataField',
            Value : averagecompletionrate,
            Label : 'averagecompletionrate',
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
        Title : 'Number of courses',
    }
);
