using { sapanalytics.db as db } from '../db/schema';

@OData.publish
@path : 'learner'
@Aggregation.CustomAggregate#averagecompletionrate : 'Edm.Decimal'
@Aggregation.CustomAggregate#numberofcompletedcourses : 'Edm.Int64'
@Aggregation.CustomAggregate#numberofcourses : 'Edm.Int64'
@Aggregation.CustomAggregate#numberofstartedcourses : 'Edm.Int64'
@Aggregation.CustomAggregate#visitedDate : 'Edm.Int32'
@(requires : ['User'])
service LearnerService
{
    @odata.draft.enabled
    entity Courses as projection on db.Courses
    {
        ID,
        title,
        platform
    };


    //personal information from the learner that is logged in
    @odata.draft.enabled
    entity LearnerInfo as select
    from db.Learner
    {
        ID,
        firstName,
        lastName,
        role,
        country,
        email,
        visitedDate,
        lastVisit,
        businessUnit,
        enrolledCourses,
        startedCourses,
        completedCourses, 
        enrolledCourses.lastAccessedDate as lastAccessedDate : String,
        count(enrolledCourses.courseID) as numberofcourses : Integer,
        count(enrolledCourses.startedDate) as numberofstartedcourses : Integer,
        count(enrolledCourses.completionDate) as numberofcompletedcourses : Integer,
        avg(enrolledCourses.completionRate) as averagecompletionrate : Double,
        count(enrolledCourses.minutesVideoConsumed) as numberofvideosconsumed : Double
    }
    where email = $user
    group by ID, firstName, lastName, role, country, email, visitedDate, lastVisit, businessUnit, enrolledCourses.lastAccessedDate;

    entity EnrolledIn as
        projection on db.EnrolledIn;
}

//aggregations for the object page
annotate LearnerService with @Aggregation.ApplySupported : 
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
        },
        {
            Property : numberofvideosconsumed
        }
    ]
};
