using { sapanalytics.db as db } from '../db/schema';
@OData.publish: true

@path: 'manager'
@(requires : ['User'])
service ManagerService {
  
    // entity LearnersInfo as projection on db.LearnersInfo;
    
    @cds.redirection.target
    entity Courses as projection on db.Courses;
    annotate Courses with @odata.draft.enabled;
}