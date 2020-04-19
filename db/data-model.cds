namespace com.or.assistant;

using { managed, temporal, cuid } from '@sap/cds/common';

type Role : String(10);

entity Persons: cuid, managed {
    phoneNumber	    : String(20);
    firstName		: String(200);
    lastName		: String(200);
    title			: String(4);
    dateOfBirth	    : Date;
    idNumber		: String(50);
    eMail			: String(100);
    Addresses		: Composition of many Addresses on Addresses.parent=$self;
    Roles           : Composition of many Person_Role on Roles.parent=$self;
};

entity Addresses: cuid, managed {
    parent          : Association to Persons;
    isDefault       : Boolean;
    city            : String(60) @( title: 'City', );
    street          : String(60) @( title: 'Street', );
    postalCode		: String(50);
    building		: String(100);
    country			: String(5);
    region			: String(4);
};

entity Roles : managed{
    key ID          : Role        @( title: 'Role ID', ); 
    roleName        : String(255) @( title: 'Role Name', );
    description     : String      @( title: 'Description', );
};

entity Person_Role : cuid{
	parent	        : Association to Persons;
	role			: Role;
};





// //[01] - Medical Practitioner
// entity Practitioners : managed {
//     key Persons	        : Association to Persons;
// 		PracticeNo		: String(50);
//         SubDiscipline	: Association to SubDisciplines;
// }

// //[02] - Patient
// entity Patients : managed {
//     key	Persons	        : Association to Persons;
// 		MedicalAid		: String(50);
// 		MedicalAidNo	: String(10);
// 		Admissions		: Association to many Admissions on Admissions.Patient=$self;
// }

// //Admission
// entity Admissions: cuid, temporal{
//         Patient			: Association to Patients;
//         Practitioner	: Association to Practitioners;
// 		Procedure		: String(200);
// 		Ward			: String(50);
// 		Discharged		: Boolean;
// }

// //Lookup
// entity Disciplines {
//     key DisciplineID	: String(4);
// 		Description		: String(100);
// 		SubDisciplines	: Association to many SubDisciplines on SubDisciplines.Discipline=$self;
// };

// entity SubDisciplines {
//     key DisciplineID	: String(4);
//     key SubDisciplineID	: String(4);
//     	Discipline		: Association to Disciplines on Discipline.DisciplineID = DisciplineID;
//         Description		: String(100);
//         Title			: String(150);
// };