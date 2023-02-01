using { sapanalytics.db as db } from '../db/schema';

@OData.publish
@path : 'user'
service UserService
{
    annotate UserAnalysis
    {
        visitedDate
            @Aggregation.default : #sum;
        numberofcourses
            @Aggregation.default : #countdistinct;
        numberofstartedcourses
            @Aggregation.default : #countdistinct;
        numberofcompletedcourses
            @Aggregation.default : #countdistinct;
        averagecompletionrate
            @Aggregation.default : #average;
    }

    annotate UserAnalysis with @Aggregation.ApplySupported : 
    {
        $Type : 'Aggregation.ApplySupportedType',
        GroupableProperties :
        [
            role,
            country,
            businessUnit,
            platform
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

    annotate mostImportantKPIs
    {
        kpinumberofcourses
            @Aggregation.default : #countdistinct;
        kpinumberofcompletedcourses
            @Aggregation.default : #countdistinct;
        kpinumberofstartedcourses
            @Aggregation.default : #countdistinct;
        kpiaveragecompletionrate
            @Aggregation.default : #average;
    }

    annotate mostImportantKPIs with @Aggregation.ApplySupported : 
    {
        $Type : 'Aggregation.ApplySupportedType',
        GroupableProperties :
        [
            BusinessUnit,
            Role,
            Country,
            Platform
        ],
        AggregatableProperties :
        [
            {
                Property : kpinumberofcourses
            },
            {
                Property : kpinumberofcompletedcourses
            },
            {
                Property : kpinumberofstartedcourses
            },
            {
                Property : kpiaveragecompletionrate
            },
            {
                Property : kpinumberoflearners
            }
        ]
    };

    @odata.draft.enabled
    entity LearnerObject as select
    from db.Learner
    {
        ID,
        firstName,
        lastName,
        role,
        country,
        email,
        enrolledCourses,
        lastVisit,
        businessUnit,
        avg(enrolledCourses.completionRate) as completionRate : Double
    }
    group by ID, firstName, lastName, role, country, email, lastVisit, businessUnit;

    @odata.draft.enabled
    entity Manager as
        projection on db.Manager;

    @cds.redirection.target
    entity Learner as
        projection on db.Learner;

    entity EnrolledIn as
        select
        from db.EnrolledIn;

    @cds.redirection.target
    entity Courses as
        projection on db.Courses;

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
        enrolledCourses.course.platform as platform: String,
        count(distinct enrolledCourses.courseID) as numberofcourses : Integer,
        count(enrolledCourses.startedDate) as numberofstartedcourses : Integer,
        count(enrolledCourses.completionDate) as numberofcompletedcourses : Integer,
        avg(enrolledCourses.completionRate) as averagecompletionrate : Double,
    }
    where enrolledCourses.learnerID = ID
    group by ID, firstName, lastName, role, country, email, businessUnit, visitedDate, lastVisit, enrolledCourses.course.platform;

    entity UserAnalysisProjection as projection on UserAnalysis
    {
        *,
        visitedDate,
        numberofcourses,
        numberofstartedcourses,
        numberofcompletedcourses,
        averagecompletionrate
    };

    entity learnerRoles as
        select distinct role
        from db.Learner;

    entity learnerCountries as
        select distinct country
        from db.Learner;

    entity learnerBusinessUnits as
        select distinct businessUnit
        from db.Learner;

    entity learnerNumber as
        select distinct email
        from db.Learner;

    entity coursePlatform as select distinct platform from db.Courses;

    @Aggregation.CustomAggregate#kpiaveragecompletionrate : 'Edm.Decimal'
    @Aggregation.CustomAggregate#kpiavgcourseduration : 'Edm.Decimal'
    @Aggregation.CustomAggregate#kpinumberofcompletedcourses : 'Edm.Int32'
    @Aggregation.CustomAggregate#kpinumberofcourses : 'Edm.Int32'
    @Aggregation.CustomAggregate#kpinumberoflearners : 'Edm.Int32'
    @Aggregation.CustomAggregate#kpinumberofstartedcourses : 'Edm.Int32'
    entity mostImportantKPIs as select
    from EnrolledIn
    {
        learner.role as Role,
        learner.country as Country,
        learner.businessUnit as BusinessUnit,
        course.platform as Platform,
        count(courseID) as kpinumberofcourses : Integer,
        count(completionDate) as kpinumberofcompletedcourses : Integer,
        count(startedDate) as kpinumberofstartedcourses : Integer,
        avg(completionRate) as kpiaveragecompletionrate : Double,
        count(distinct learner.email) as kpinumberoflearners : Integer,
    }
    group by learner.businessUnit, learner.role, learner.country, course.platform;

}
