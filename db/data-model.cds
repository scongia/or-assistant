namespace com.or.assistant;

using { managed, temporal, cuid } from '@sap/cds/common';

type Role : String(10);

entity Persons: cuid, managed {
    phoneNumber	    : String(20);
    firstName		: String(200);
    lastName		: String(200);
    initials        : String(10);
    title			: String(4);
    dateOfBirth	    : Date;
    idNumber		: String(50);  
    eMail			: String(100);
    Addresses		: Composition of many Addresses on Addresses.parent=$self;
    Roles           : Composition of many Person_Role on Roles.parent=$self;

    gender                : String(1) 
      @( title: 'Gender', ) enum {
        male    = 'M' @( title: 'Male');
        female  = 'F' @( title: 'Female');
        other   = 'O' @( title: 'Other');
    };
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

    category        : String(2) 
      @( title: 'Category', ) enum {
        medDoctor   = 'MD' @( title: 'Medical Doctor');
        patient     = 'PA' @( title: 'Patient');
        nurse       = 'NU' @( title: 'Nursing');
    };        
};

entity Person_Role : cuid{
	parent	        : Association to Persons;
	role			: Role;
};