using { sapanalytics.db as db } from '../db/schema';
using { UserService } from './user-service';

@AbapCatalog.sqlViewName: 'ZDIMEAIRLINE'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Airline'

extend service UserService {
    entity Test as select from db.Learner
    {
        ID,
        name,
        role,
        businessUnit,
        count(enrolledCourses.courseID) as numberofcourses:Integer,
        count(enrolledCourses.startedDate) as numberofstartedcourses:Integer,
        count(enrolledCourses.completionDate) as numberofcompletedcourses:Integer,
        avg(enrolledCourses.completionRate) as averagecompletionrate:Double,
    } where enrolledCourses.learnerID = ID group by ID, name, role, businessUnit;
    
}

extend UserService.Learner with @cds.redirection.target;