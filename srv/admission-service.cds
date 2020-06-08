using com.sercon.common as db from '../db/schema';

service AdmissionService  @(path:'/admission') {
    
    entity Patients
        as SELECT from db.Persons where Persons.roles.role.category = 'PA';
    annotate Patients with @odata.draft.enabled;

    entity Person_Role as projection on db.Person_Role;
    
    entity Roles as projection on db.Roles;
    
    entity Insurances as projection on db.Insurances;
}