using { sapanalytics.db as db } from '../db/schema';
@OData.publish: true

@path: 'user'
service UserService {

    entity Manager as projection on db.Manager;
    annotate Manager with @odata.draft.enabled;
    entity Learner as projection on db.Learner;
    annotate Learner with @odata.draft.enabled;
    entity EnrolledIn as projection on db.EnrolledIn;
    annotate EnrolledIn with @odata.draft.enabled;
    /*@readonly
    entity Test as select from db.Learner as LI
    inner join db.EnrolledIn as CourseInfo on LI.ID = CourseInfo.learnerID {
        ID,
        name,
        role,
        visitedDate,
        
        count(*) as numberofcourses:Integer
    } group by ID, name, role, visitedDate;*/
}