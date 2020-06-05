using com.or.assistant as db from '../db/data-model';

service AdmissionService  @(path:'/admission') {
    
    entity Patients
        as SELECT from db.Persons {
            *,
            null as medicalAid : db.RoleName
        } where Persons.roles.role.category = 'PA';
    annotate Patients with @odata.draft.enabled;

    entity Person_Role as projection on db.Person_Role;
    
    entity Roles as projection on db.Roles;
    
    entity DS_MedAid as projection on db.DS_MedAid;
    
    
}