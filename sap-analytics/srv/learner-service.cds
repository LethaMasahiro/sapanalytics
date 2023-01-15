using { sapanalytics.db as db } from '../db/schema';
@OData.publish: true

@path: 'learner'
// @(requires : ['User'])
service LeanerService {
  
    entity LearnersInfo as projection on db.LearnersInfo;
    annotate LearnersInfo with @odata.draft.enabled;
    entity Courses as projection on db.Courses{ID, name, learner_ID};
    annotate Courses with @odata.draft.enabled;
}