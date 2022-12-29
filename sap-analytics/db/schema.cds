
namespace sapanalytics.db;

using {cuid, managed, sap.common.CodeList} from '@sap/cds/common';

entity Projects: cuid, managed {
    name: String not null;
    startDate: Date not null;
    endDate: Date;
    description: String;
    customer: Association to Customers; //association can be to one/many
    type: Association to ProjectTypes;
}

entity Customers: cuid, managed{
    name: String not null;
    industry: String;
    country: String;
    projects: Association to many Projects on projects.customer = $self;
}

entity ProjectTypes: CodeList {
    key code: String(10);
}

entity Risks : managed {
    key ID      : UUID  @(Core.Computed : true);
    title       : String(100);
    prio        : String(5);
    descr       : String;
    miti        : Association to Mitigations;
    impact      : Integer;
    criticality : Integer;
  }

  entity Mitigations : managed {
    key ID       : UUID  @(Core.Computed : true);
    description  : String;
    owner        : String;
    timeline     : String;
    risks        : Association to many Risks on risks.miti = $self;
  }

entity Learners: cuid, managed{
    name: String not null;
    industry: String;
    country: String;
}

entity Learnersinfo : managed {
    key ID      : UUID  @(Core.Computed : true);
    role        : String;
    name        : String;
    email       : String;
    isDeactivated: Boolean;
    password    : String;
    occupation  : String;
    coursenumber: Integer;
    visiteddays : Integer;
    lastvisit   : Date;
  }