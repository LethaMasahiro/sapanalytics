
namespace sapanalytics.db;

using {cuid, managed, sap.common.CodeList} from '@sap/cds/common';



// entity Learners: cuid, managed{
//     key name: String not null;
//     industry: String;
//     country: String;
// }

// entity LearnersInfo : managed {
//     key ID      : UUID  @(Core.Computed : true);
//     role        : String;
//     key name        : String;
//     key email       : String;
//     isDeactivated: Boolean;
//     password    : String;
//     occupation  : String;
//     courses: Association to many Courses on courses.learner_ID = $self.ID;
//     visiteddays : Integer;
//     lastvisit   : Date;
//   }

  entity Courses : managed {
    key ID      : String  @(Core.Computed : true);
    title        : String;
    learner_ID    : String;
  }

  // entity T_Learner: managed {
  //   key ID      : UUID  @(Core.Computed : true);
  //   name : String;
  //   isDeactivated : String;
  //   email : String;
  //   password : String;
  // }

  // entity T_EnrolledIn: managed {
  //   key courseID: UUID @(Core.Computed : true);
  //   learnerID: String;
  //   completionRate: String;
//}

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
    key email       : String @(Core.Computed: true);
    ID      : String  @(Core.Computed : true);
    firstName        : String;
    lastName: String;
    isDeactivated: String;
    role: String;
    businessUnit: String;
    country: String;
    enrolledCourses: Association  to many EnrolledIn on enrolledCourses.learnerID = $self.ID;
    startedCourses: Association to many EnrolledIn on startedCourses.learnerID = $self.ID and startedCourses.startedDate != null ;
    completedCourses: Association to many EnrolledIn on completedCourses.learnerID = $self.ID and completedCourses.startedDate != null;
    visitedDate: Integer;
    lastVisit: Date;
    //businessUnit: Association to BusinessUnit {name};
  }


  entity EnrolledIn {
    key ID : String @(Core.Computed : true);
    courseID: String;
    learnerID: String;
    completionRate: Double;
    enrolledDate: Date;
    startedDate: Date;
    completionDate: Date;
    lastAccessedDate: Date;
    completedCourseItem: Integer;
  }

  // entity BusinessUnit {
  //   description: String;
  //   name: String;
  //   key id: String;

  // }

