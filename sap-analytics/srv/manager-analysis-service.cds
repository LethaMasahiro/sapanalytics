using { sapanalytics.db as db } from '../db/schema';
using { ManagerService } from './manager-service';

extend service ManagerService {
  @readonly
  entity ManagerAnalysis as select from db.LearnersInfo {
    *,
    count(courses.ID) as numberofcourses:Integer,
  } where courses.learner_ID = ID group by ID;
}

// Fix ambiguity in Mitigations.risk association ensuring it points to Risks
extend ManagerService.LearnersInfo with @cds.redirection.target;