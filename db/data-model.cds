namespace com.or.assistant;

using { managed, temporal, cuid } from '@sap/cds/common';

type Role : String(10);
type RoleName : String(255);

entity Persons: cuid, managed {
    phoneNumber   : String(20);
    firstName			: String(200);
    lastName      : String(200);
    initials      : String(10);
    title         : String(4);
    dateOfBirth	  : Date;
    idNumber      : String(50);  
    eMail         : String(100);
    gender        : String(1) 
      @( title: 'Gender', ) enum {
        male    = 'M' @( title: 'Male');
        female  = 'F' @( title: 'Female');
        other   = 'O' @( title: 'Other');
    };
    roles         : Composition of many Person_Role on roles.parent=$self;
    //dataset_1      : Composition of many DataSet_1  on dataset_1.parent=$self;
    //dataset_2      : Composition of many DS_MedAid  on ds_medaid.parent=$self;
};

entity Roles : managed{
    KEY role_ID     : Role        @( title: 'Role ID', ); 
    roleName        : RoleName    @( title: 'Role Name', );
    description     : String      @( title: 'Description', );
    category        : String(2) 
      @( title: 'Category', ) enum {
        medDoctor   = 'MD' @( title: 'Medical Doctor');
        patient     = 'PA' @( title: 'Patient');
        nurse       = 'NU' @( title: 'Nursing');
    };      
};

entity Person_Role : cuid{
	parent	        : Association to Persons;
	//role						: Role;
  role_ID         :  Role;
  role            : Association to Roles on role.role_ID=role_ID;
};

entity MedicalDoctors : cuid, managed {
    parent				: Association to Persons;
		practiceNo		: String(50);
}

// entity DataSet_1 : cuid, {
//     parent				: Association to Persons;
// 		medicalAid		: Composition of many DS_MedAid on medicalAid.parent=$self;
// }

entity DS_MedAid : cuid, managed  {
  parent			    : Association to Persons;
	medicalAid		  : String(50);
	medicalAidNo	  : String(20);
  medicalAidPlan  : String;
  status          : String(1) 
      @( title: 'Status', ) enum {
        male    = 'A' @( title: 'Active');
        female  = 'S' @( title: 'Suspended');
        other   = 'D' @( title: 'Deleted');
    };
}