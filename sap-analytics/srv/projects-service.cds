using { sapanalytics.db as db } from '../db/schema';

service ProjectsService {
    entity Projects as projection on db.Projects;
}
