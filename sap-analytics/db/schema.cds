
namespace sapanalytics.db;

using {cuid, managed, sap.common.CodeList} from '@sap/cds/common';



  entity Courses {
    key ID      : String  @(Core.Computed : true);
    title        : String;
    category    : String;
    duration: Double;
    completionRate: Double;
    platform: String;
    enrolledLearners: Association to many EnrolledIn on enrolledLearners.courseID = $self.ID;
  }

  entity Manager {
    ID      : UUID  @(Core.Computed : true);
    name        : String;
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
    numberOfEnrolledCourses: Integer;
    numberOfStartedCourses: Integer;
    numberOfCompletedCourses: Integer;
    visitedDate: Integer;
    lastVisit: Date;
  }


  entity EnrolledIn {
    key ID : String @(Core.Computed : true);
    learnerID: String;
    courseTitle: String;
    courseID: String;
    platform: String;
    completionRate: Double;
    enrolledDate: Date;
    startedDate: Date;
    completionDate: Date;
    lastAccessedDate: Date;
    course: Association to Courses on course.ID=courseID;
    learner: Association to Learner on learner.ID = learnerID;
    minutesVideoConsumed: Double;
  }
