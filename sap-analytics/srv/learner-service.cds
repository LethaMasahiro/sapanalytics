using { sapanalytics.db as db } from '../db/schema';
@OData.publish: true

@path: 'learner'
// @(requires : ['User'])
service LearnerService {
  
    // entity LearnersInfo as projection on db.LearnersInfo;
    entity Courses as projection on db.Courses{ID,  title, platform};
    annotate Courses with @odata.draft.enabled;

    entity LearnerInfo as select from db.Learner {
        email
    } where email = 'ga83qum@mytum.de';
}