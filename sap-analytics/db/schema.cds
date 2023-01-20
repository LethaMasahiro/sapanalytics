
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
    enrolledCourses: Association [*]  to EnrolledIn on enrolledCourses.learnerID = $self.ID;
    startedCourses: Association [*] to EnrolledIn on startedCourses.learnerID = $self.ID and startedCourses.startedDate != null ;
    completedCourses: Association [*] to EnrolledIn on completedCourses.learnerID = $self.ID and completedCourses.startedDate != null;
    visitedDate: Integer;
    lastVisit: Date;
    businessUnit: Association to BusinessUnit {name};
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

  entity BusinessUnit {
    description: String;
    name: String;
    key id: String;

  }

  entity TestLearner {
    key learnerUUID: UUID;
    name: String;
    email: String;
    role: String;
    visitedDays: Integer;
    lastVisit: Date;
    businessUnit: Association to BusinessUnit;
    enrolledCourses: Association [*] to  TestEnrolled on enrolledCourses.learnerID = $self.learnerUUID;
  }

  entity TestEnrolled {
    key courseID: String;
    learnerID : String;
    learner: Association to one TestLearner;
    name: String;
  }

  entity T_Travel {
    key BookingUUID   : UUID;
    BookingID         : Integer @Core.Computed;
    BookingDate       : Date;
    ConnectionID      : String(4);
    FlightDate        : Date;
    FlightPrice       : Decimal(16, 3);
    to_Customer       : Association to T_Passenger;
    BookingStatus     : Association to T_BookingStatus;
  }

  entity T_Passenger {
    CustomerID: UUID;
    FirstName: String;
    LastName: String;
  }

  entity T_BookingStatus : CodeList {
  key code : String enum {
    New      = 'N';
    Booked   = 'B';
    Canceled = 'X';
  };
};