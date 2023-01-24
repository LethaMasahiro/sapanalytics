using { sapanalytics.db as db } from '../db/schema';
@OData.publish: true

@path: 'manager'
service ManagerService {
  
    // entity LearnersInfo as projection on db.LearnersInfo;
    annotate LearnersInfo with @odata.draft.enabled;
    @cds.redirection.target
    entity Courses as projection on db.Courses;
    annotate Courses with @odata.draft.enabled;
}