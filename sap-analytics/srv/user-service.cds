using { sapanalytics.db as db } from '../db/schema';

@OData.publish
@path : 'user'
service UserService
{
    

    annotate UserAnalysis
    {
        averagecompletionrate
            @Aggregation.default : #average;
        numberofcompletedcourses
            @Aggregation.default : #countdistinct;
        numberofcourses
            @Aggregation.default : #countdistinct;
        numberofstartedcourses
            @Aggregation.default : #countdistinct;
        visitedDate
            @Aggregation.default : #sum;

            
    }

    annotate UserAnalysis with @Aggregation.ApplySupported : 
    {
        $Type : 'Aggregation.ApplySupportedType',
        GroupableProperties :
        [
            role,
            country,
            businessUnit
        ],
        AggregatableProperties :
        [
            {
                Property : visitedDate
            },
            {
                Property : numberofcourses
            },
            {
                Property : numberofstartedcourses
            },
            {
                Property : numberofcompletedcourses
            },
            {
                Property : averagecompletionrate
            }
        ]
    };

    @odata.draft.enabled
    entity Manager as
        projection on db.Manager;

    entity Learner as
        projection on db.Learner;

    entity EnrolledIn as
        projection on db.EnrolledIn;

    // entity businessUnit as
    //     projection on db.BusinessUnit;

    @Aggregation.CustomAggregate#averagecompletionrate : 'Edm.Decimal'
    @Aggregation.CustomAggregate#numberofcompletedcourses : 'Edm.Int64'
    @Aggregation.CustomAggregate#numberofcourses : 'Edm.Int64'
    @Aggregation.CustomAggregate#numberofstartedcourses : 'Edm.Int64'
    @Aggregation.CustomAggregate#visitedDate : 'Edm.Int32'
    entity UserAnalysis as select
    from db.Learner
    {
        ID,
        firstName,
        lastName,
        role,
        country,
        email,
        enrolledCourses,
        startedCourses,
        completedCourses,
        visitedDate,
        lastVisit,
        businessUnit,
        count(enrolledCourses.courseID) as numberofcourses : Integer,
        count(enrolledCourses.startedDate) as numberofstartedcourses : Integer,
        count(enrolledCourses.completionDate) as numberofcompletedcourses : Integer,
        avg(enrolledCourses.completionRate) as averagecompletionrate : Double,
    }
    where enrolledCourses.learnerID = ID
    group by ID,  firstName, lastName, role, country, email, businessUnit, visitedDate, lastVisit;

    @Aggregation.CustomAggregate#averagecompletionrate : 'Edm.Decimal'
    @Aggregation.CustomAggregate#numberofcompletedcourses : 'Edm.Int64'
    @Aggregation.CustomAggregate#numberofcourses : 'Edm.Int64'
    @Aggregation.CustomAggregate#numberofstartedcourses : 'Edm.Int64'
    @Aggregation.CustomAggregate#visitedDate : 'Edm.Int32'
    entity UserAnalysisProjection as projection on UserAnalysis
    {
        *,
        visitedDate,
        numberofcourses,
        numberofstartedcourses,
        numberofcompletedcourses,
        averagecompletionrate
    };
}
