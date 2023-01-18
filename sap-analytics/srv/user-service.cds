using { sapanalytics.db as db } from '../db/schema';
@OData.publish: true

@path: 'user'
service UserService {

    entity Manager as projection on db.Manager;
    entity Learner as projection on db.Learner;
    entity EnolledIn as projection on db.EnrolledIn;
    entity NumberOfCourses as projection on db.Number_Of_Courses;
    @cds.redirection.target
    entity Test as select from db.Learner as LI
    inner join db.EnrolledIn as CourseInfo on LI.ID = CourseInfo.learnerID {
        ID,
        name,
        role,
        visitedDate,
        count(*) as numberofcourses:Integer
    } group by ID, name, role, visitedDate;
}