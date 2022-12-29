// using { sapanalytics.db as db } from '../db/schema';

// service ProjectsService {

//     //unbound
//     action endProject(projectId: UUID);
//     function hasProjectEnded(projectID: UUID) returns Boolean;

//     entity Projects as projection on db.Projects actions
//     {
//         action end();
//         function hasEnded() returns Boolean;
//     };
//     @readonly entity Customers as projection on db.Customers {name, ID, country};
// }
using { sapanalytics.db as db } from '../db/schema.cds';
//using {cuid, managed, sap.common.CodeList} from '@sap/cds/common';

service ProjectsService {

    //unbound
    action endProject(projectId: UUID);
    function hasProjectEnded(projectID: UUID) returns Boolean;

    entity Projects as projection on db.Projects {ID, createdAt,createdBy, modifiedAt, modifiedBy, name, startDate,endDate,description,customer, type };

    // entity Projects as projection on db.Projects actions
    // {
    //     action end();
    //     function hasEnded() returns Boolean;
    // };
//change
//    entity Customers as projection on db.Customers {name, ID, industry, country};

    entity Customers as projection on db.Customers {ID, createdBy, modifiedAt, modifiedBy,name,  createdAt, industry, country, projects};
    entity ProjectTypes as projection on db.ProjectTypes {code,name,descr};
}
