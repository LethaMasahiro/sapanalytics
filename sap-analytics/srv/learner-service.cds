using { sapanalytics.db as db } from '../db/schema';
@OData.publish: true

@path: 'learner'
// @(requires : ['User'])
service LearnerService {
  
    // entity LearnersInfo as projection on db.LearnersInfo;
    entity Courses as projection on db.Courses{ID,  title, platform};
    annotate Courses with @odata.draft.enabled;

    annotate LearnerInfo with @odata.draft.enabled;
    entity LearnerInfo as select from db.Learner {
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
        count(enrolledCourses.courseID) as numberofcourses : Integer,
        count(enrolledCourses.startedDate) as numberofstartedcourses : Integer,
        count(enrolledCourses.completionDate) as numberofcompletedcourses : Integer,
        avg(enrolledCourses.completionRate) as averagecompletionrate : Double,
    } where enrolledCourses.learner.email = email
    group by ID, firstName, lastName, role, country, email, visitedDate, lastVisit, businessUnit;
}