using com.or.assistant as db from '../db/data-model';

service AdminService  @(path:'/admin') {
    entity Persons as projection on db.Persons;
    annotate Persons with @odata.draft.enabled;
    
    //------- auto-exposed --------
    //entity Person_Role as projection on db.Person_Role;
    //> these shall be removed but this would break the Fiori UI

	// qmacro approach from https://blogs.sap.com/2019/08/21/computed-field-example-in-cap/
	// Results in error "SQLITE_ERROR: no such column: roleName"
	// Does not conflict with auto-exposure, but requires logic in Srv to insert as 
	entity Person_Role as select from db.Person_Role{
        *,
        null as roleName : db.RoleName
    };

	// Pierre Dominique approach in "Answers section of" https://blogs.sap.com/2019/08/21/computed-field-example-in-cap/
	// Note: Conflicts with auto-exposed from @odata.draft.enabled
	//
    // entity Person_Role as select from db.Person_Role, db.Roles {
    //     Person_Role.ID,
    //     Person_Role.parent,
    //     Person_Role.role,
    //     Roles.roleName
    // } where Person_Role.ID = Roles.ID;

    entity Roles as projection on db.Roles;


    // entity Address as projection on db.Addresses;
}