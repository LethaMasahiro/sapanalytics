using { sapanalytics.db as db } from '../db/schema';

@path: 'service/risk'
service RiskService {
  entity Risks as projection on db.Risks;
//   @(restrict : [
//             {
//                 grant : [ 'READ' ],
//                 to : [ 'RiskViewer' ]
//             },
//             {
//                 grant : [ '*' ],
//                 to : [ 'RiskManager' ]
//             }
//         ]) 
//         as projection on db.Risks;
    annotate Risks with @odata.draft.enabled;
  entity Mitigations @(restrict : [
            {
                grant : [ 'READ' ],
                to : [ 'RiskViewer' ]
            },
            {
                grant : [ '*' ],
                to : [ 'RiskManager' ]
            }
        ]) 
        as projection on db.Mitigations;
    annotate Mitigations with @odata.draft.enabled;
}