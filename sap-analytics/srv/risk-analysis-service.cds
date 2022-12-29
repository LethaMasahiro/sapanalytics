using { sapanalytics.db as db } from '../db/schema';
using { RiskService } from './risk-service';

extend service RiskService {
  @readonly
  entity RisksAnalysis @(restrict : [
            {
                grant : [ 'READ' ],
                to : [ 'RiskManager' ]
            }
        ]) as projection on db.Risks {
    *,
    substring(createdAt,1,4) as riskyear:String,
    cast (substring(createdAt,1,10) as Date) as createdAt
  };
}

// Fix ambiguity in Mitigations.risk association ensuring it points to Risks
extend RiskService.Risks with @cds.redirection.target;