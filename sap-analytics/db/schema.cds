
namespace sapanalytics.db;

using {cuid, managed, sap.common.CodeList} from '@sap/cds/common';



entity Learners: cuid, managed{
    key name: String not null;
    industry: String;
    country: String;
}

entity LearnersInfo : managed {
    key ID      : UUID  @(Core.Computed : true);
    role        : String;
    key name        : String;
    key email       : String;
    isDeactivated: Boolean;
    password    : String;
    occupation  : String;
    courses: Association to many Courses on courses.learner_ID = $self.ID;
    visiteddays : Integer;
    lastvisit   : Date;
  }

  entity Courses : managed {
    key ID      : UUID  @(Core.Computed : true);
    key name        : String;
    learner_ID    : String;
  }

  entity Manager {
    key ID      : UUID  @(Core.Computed : true);
    key name        : String;
    key email       : String;
    isDeactivated: Boolean;
    password    : String;
    role: String;
  }

    entity Learner  {
    ID      : UUID  @(Core.Computed : true);
    name        : String;
    email       : String;
    isDeactivated: String;
    //password: String;
    role: String;
    occupation: String;
    //enrolledCourses: Association to many EnrolledIn on enrolledCourses.learnerID = $self.ID;
    //startedCourses: Association to many EnrolledIn on startedCourses.learnerID = $self.ID and startedCourses.startedDate != null;
    //completedCourses: Association to many EnrolledIn on completedCourses.learnerID = $self.ID and completedCourses.learnerID != null;
    visitedDate: Integer;
    lastVisit: Date;
  }

  entity EnrolledIn {
    courseID: String;
    learnerID: String;
    completionRate: Double;
    enrolledDate: Date;
    startedDate: Date;
    completionDate: Date;
    lastAccessedDate: Date;
    completedCourseItem: Integer;
  }

@Odata.publish:true
  define view Number_Of_Courses as select from EnrolledIn {
    learnerID,
    count(*) as numberofcourses:Integer
  } group by learnerID;