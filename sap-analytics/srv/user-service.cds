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

    @cds.redirection.target
    entity Learner as
        projection on db.Learner;

    entity EnrolledIn as
        select from db.EnrolledIn;

    entity Courses as
        projection on db.Courses;

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

    entity learnerRoles as select distinct role from db.Learner;

    entity learnerCountries as select distinct country from db.Learner;

    entity learnerBusinessUnits as select distinct businessUnit from db.Learner;

    entity mostImportantKPIs as select from EnrolledIn
    {
        count (courseID) as numberofcourses: Integer,
        count (completionDate) as numberofcompletedcourses: Integer, //doesn't work as expected
        count (startedDate) as numberofstartedcourses: Integer, //doesn't work as expected
        avg(course.completionRate) as averagecompletionrate: Double,
        count(learnerID) as numberoflearners: Integer,
        avg(course.duration) as avgcourseduration: Double
    };
}
