using { sapanalytics.db as db } from '../db/schema';
using { ManagerService } from './manager-service';

extend service ManagerService {
  @readonly
  entity ManagerAnalysis as projection on db.LearnersInfo {
    *,
    
    count(distinct courses.ID) as numberofcourses:Integer,
  };
}

// Fix ambiguity in Mitigations.risk association ensuring it points to Risks
extend ManagerService.LearnersInfo with @cds.redirection.target;