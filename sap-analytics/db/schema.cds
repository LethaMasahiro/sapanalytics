
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
