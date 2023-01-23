
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

  entity T_Learner: managed {
    key ID      : UUID  @(Core.Computed : true);
    name : String;
    isDeactivated : String;
    email : String;
    password : String;
  }

  entity T_EnrolledIn: managed {
    key courseID: UUID @(Core.Computed : true);
    learnerID: String;
    completionRate: String;
  }

  entity Manager {
    key ID      : UUID  @(Core.Computed : true);
    key name        : String;
    key email       : String;
    isDeactivated: Boolean;
    password    : String;
    role: String;
    enrolledCourses: Association  to many EnrolledIn on enrolledCourses.learnerID = $self.ID;
  }

  entity Learner  {
    key ID      : String  @(Core.Computed : true);
    name        : String;
    email       : String;
    isDeactivated: String;
    //password: String;
    role: String;
    occupation: String;
    enrolledCourses: Association  to many EnrolledIn on enrolledCourses.learnerID = $self.ID;
    startedCourses: Association to many EnrolledIn on startedCourses.learnerID = $self.ID and startedCourses.startedDate != null ;
    completedCourses: Association to many EnrolledIn on completedCourses.learnerID = $self.ID and completedCourses.startedDate != null;
    visitedDate: Integer;
    lastVisit: Date;
    businessUnit: Association to BusinessUnit {name};
  }


  entity EnrolledIn {
    //key ID : String @(Core.Computed : true);
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

  /*entity T_Travel {
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
};*/