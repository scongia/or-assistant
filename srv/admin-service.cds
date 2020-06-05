using com.or.assistant as db from '../db/data-model';

service AdminService  @(path:'/admin') {
    entity Persons as projection on db.Persons;
    annotate Persons with @odata.draft.enabled;
    
    //------- auto-exposed --------
    //entity Person_Role as projection on db.Person_Role;
    //> these shall be removed but this would break the Fiori UI
    entity Person_Role as select from db.Person_Role;
	// entity Person_Role as select from db.Person_Role{
    //     *,
    //     null as roleName : db.RoleName
    // };

    entity Roles as projection on db.Roles;
    annotate Roles with @odata.draft.enabled;

}