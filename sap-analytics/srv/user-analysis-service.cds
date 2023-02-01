using { sapanalytics.db as db } from '../db/schema';
using { UserService } from './user-service';

@(requires : ['RiskManager'])
extend service UserService {
    /*entity UserAnalysis as select from db.Learner
    {
        ID,
        name,
        role,
        occupation,
        businessUnit,
        visitedDate,
        lastVisit,
        enrolledCourses,
        count(enrolledCourses.courseID) as numberofcourses:Integer,
        count(enrolledCourses.startedDate) as numberofstartedcourses:Integer,
        count(enrolledCourses.completionDate) as numberofcompletedcourses:Integer,
        avg(enrolledCourses.completionRate) as averagecompletionrate:Double,
    } where enrolledCourses.learnerID = ID group by ID, name, role, occupation, businessUnit, visitedDate, lastVisit;*/

    /*@readonly
    entity Test2 as projection on db.TestLearner {
        @UI.Hidden: false
        learnerUUID as ID,
        enrolledCourses.courseID,
        businessUnit.id as businessUnitID,

        name,
        visitedDays,
    };*/

}

extend UserService.Learner with @cds.redirection.target;