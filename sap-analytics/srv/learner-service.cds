using { sapanalytics.db as db } from '../db/schema';

service LearnerService {
  
    entity Learners as projection on db.Learners {name, ID, country};
}