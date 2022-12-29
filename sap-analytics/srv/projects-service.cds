using { sapanalytics.db as db } from '../db/schema';

service ProjectsService {

    //unbound
    action endProject(projectId: UUID);
    function hasProjectEnded(projectID: UUID) returns Boolean;

    entity Projects as projection on db.Projects actions
    {
        action end();
        function hasEnded() returns Boolean;
    };
    entity Customers as projection on db.Customers {name, ID, country};
}