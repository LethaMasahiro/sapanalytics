
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