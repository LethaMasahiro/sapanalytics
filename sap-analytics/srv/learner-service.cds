using { sapanalytics.db as db } from '../db/schema';
@OData.publish: true

@path: 'learner'
service LeanerService {
  
    entity LearnersInfo as projection on db.LearnersInfo;
    annotate LearnersInfo with @odata.draft.enabled;
    entity Courses as projection on db.Courses;
    annotate Courses with @odata.draft.enabled;
}