using com.or.assistant as db from '../db/data-model';

service AdminService  @(path:'/admin') {
    entity Persons as projection on db.Persons;
    annotate Persons with @odata.draft.enabled;
    
    //------- auto-exposed --------
    entity Person_Role as projection on db.Person_Role;
    //> these shall be removed but this would break the Fiori UI

    entity Roles as projection on db.Roles;

    entity Address as projection on db.Addresses;
}