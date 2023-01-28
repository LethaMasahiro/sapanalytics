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

    annotate mostImportantKPIs
    {
        kpiaveragecompletionrate
            @Aggregation.default : #average;
        kpiavgcourseduration
            @Aggregation.default : #average;
        kpinumberofcompletedcourses
            @Aggregation.default : #countdistinct;
        kpinumberofcourses
            @Aggregation.default : #countdistinct;
        //kpinumberoflearners
          //  @Aggregation.default : #countdistinct;
        kpinumberofstartedcourses
            @Aggregation.default : #countdistinct;
    }

    annotate mostImportantKPIs with @Aggregation.ApplySupported : 
    {
        $Type : 'Aggregation.ApplySupportedType',
        GroupableProperties :
        [
            BusinessUnit,
            ID
        ],
        AggregatableProperties :
        [
            {
                Property : kpiaveragecompletionrate
            },
            {
                Property : kpiavgcourseduration
            },
            {
                Property : kpinumberofcompletedcourses
            },
            {
                Property : kpinumberofcourses
            },
            {
                Property : kpinumberoflearners
            },
            {
                Property : kpinumberofstartedcourses
            }
        ]
    };

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


    @Aggregation.CustomAggregate#kpiavgcourseduration : 'Edm.Decimal'
    @Aggregation.CustomAggregate#kpiaveragecompletionrate : 'Edm.Decimal'
    @Aggregation.CustomAggregate#kpinumberofcompletedcourses : 'Edm.Int64'
    @Aggregation.CustomAggregate#kpinumberofcourses : 'Edm.Int64'
    @Aggregation.CustomAggregate#kpinumberoflearners : 'Edm.Int32'
    @Aggregation.CustomAggregate#kpinumberofstartedcourses : 'Edm.Int32'
    entity mostImportantKPIs as select from Learner
    {
        ID,
        businessUnit as BusinessUnit,
        count (enrolledCourses.courseID) as kpinumberofcourses: Integer,
        count (enrolledCourses.completionDate) as kpinumberofcompletedcourses: Integer, //doesn't work as expected
        count (enrolledCourses.startedDate) as kpinumberofstartedcourses: Integer, //doesn't work as expected
        avg(enrolledCourses.completionRate) as kpiaveragecompletionrate: Double,
        count(ID) as kpinumberoflearners: Integer,
        avg(enrolledCourses.course.duration) as kpiavgcourseduration: Double
    } group by  ID, businessUnit;

    /* @Aggregation.CustomAggregate#kpiavgcourseduration : 'Edm.Decimal'
    @Aggregation.CustomAggregate#kpiaveragecompletionrate : 'Edm.Decimal'
    @Aggregation.CustomAggregate#kpinumberofcompletedcourses : 'Edm.Int64'
    @Aggregation.CustomAggregate#kpinumberofcourses : 'Edm.Int64'
    @Aggregation.CustomAggregate#kpinumberoflearners : 'Edm.Int32'
    @Aggregation.CustomAggregate#kpinumberofstartedcourses : 'Edm.Int32'
    entity mostImportantKPIs as select from EnrolledIn
    {
        learner.ID as ID,
        learner.businessUnit as BusinessUnit,
        count (courseID) as kpinumberofcourses: Integer,
        count (completionDate) as kpinumberofcompletedcourses: Integer, //doesn't work as expected
        count (startedDate) as kpinumberofstartedcourses: Integer, //doesn't work as expected
        avg(course.completionRate) as kpiaveragecompletionrate: Double,
        count(learnerID) as kpinumberoflearners: Integer,
        avg(course.duration) as kpiavgcourseduration: Double
    } where learner.ID = learnerID 
    group by learner.businessUnit, learner.ID;*/
}
