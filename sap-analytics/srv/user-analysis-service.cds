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
        occupation,
        businessUnit,
        visitedDate,
        lastVisit,
        count(enrolledCourses.courseID) as numberofcourses:Integer,
        count(enrolledCourses.startedDate) as numberofstartedcourses:Integer,
        count(enrolledCourses.completionDate) as numberofcompletedcourses:Integer,
        avg(enrolledCourses.completionRate) as averagecompletionrate:Double,
    } where enrolledCourses.learnerID = ID group by ID, name, role, occupation, businessUnit, visitedDate, lastVisit;

    @readonly
    entity Test2 as projection on db.TestLearner {
        @UI.Hidden: false
        learnerUUID as ID,
        enrolledCourses.courseID,
        businessUnit.id as businessUnitID,

        name,
        visitedDays,
    };

     @readonly
    entity Bookings as projection on db.T_Travel {
    @UI.Hidden: false
    BookingUUID as ID,
    BookingID,

    ConnectionID,
    FlightDate,
    FlightPrice as price,
    BookingDate,
    
    @title: '{i18n>BookingStatus}'
    @Common.Text: statusName @Common.TextArrangement: #TextOnly
    BookingStatus.code   as status,
    BookingStatus.name   as statusName,

    };
}

extend UserService.Learner with @cds.redirection.target;