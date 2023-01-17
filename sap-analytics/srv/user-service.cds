using { sapanalytics.db as db } from '../db/schema';
@OData.publish: true

@path: 'user'
service UserService {

    entity Manager as projection on db.Manager;
    entity Learner as projection on db.Learner;
    entity EnolledIn as projection on db.EnrolledIn;
}