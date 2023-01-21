using { sapanalytics.db as db } from '../db/schema';

using { ManagerService } from './manager-service';

annotate LearnersInfo
{
    visiteddays
        @Aggregation.default : #sum;
}

annotate LearnersInfo with @Aggregation.ApplySupported : 
{
    $Type : 'Aggregation.ApplySupportedType',
    GroupableProperties :
    [
        createdAt,
        createdBy,
        modifiedAt,
        modifiedBy,
        ID,
        role,
        name,
        email,
        isDeactivated,
        password,
        occupation,
        lastvisit
    ],
    AggregatableProperties :
    [
        {
            Property : visiteddays
        }
    ]
};

annotate ManagerService.LearnersInfo with @cds.redirection.target;

@Aggregation.CustomAggregate#visiteddays : 'Edm.Int32'
entity LearnersInfo as projection on ManagerService.LearnersInfo
{
    *,
    visiteddays
};
