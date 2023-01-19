using { sapanalytics.db as db } from '../db/schema';
@OData.publish: true

@path: 'user'
service UserService {
    annotate Manager with @odata.draft.enabled; //don't know why it doesn't deploy when I delete this but the database data cannot be viewed with this
    entity Manager as projection on db.Manager;
    
    entity Learner as projection on db.Learner;

    entity EnrolledIn as projection on db.EnrolledIn;
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