namespace com.sercon.common;

using { managed, temporal, cuid } from '@sap/cds/common';

//--------------------------------------------------------------------------
// Types

type RoleID: String(10);
type EmailAddress : String;
type PhoneNumber  : String;

//--------------------------------------------------------------------------
// Aspects

aspect Person {
  firstName			: String(200);
  lastName      : String(200);
  initials      : String(10);
  title         : String(4);
  dateOfBirth	  : Date;
  idNumber      : String(50);  
  gender        : String(1) 
    @( title: 'Gender', ) enum {
      male    = 'M' @( title: 'Male');
      female  = 'F' @( title: 'Female');
      other   = 'O' @( title: 'Other');
  };
};

aspect ContactOptions {
  email     : String @JSON:[{ kind:String, address: EmailAddress, default:Boolean }];
  phone     : String @JSON:[{ kind:String, number: PhoneNumber, default:Boolean }];
}

aspect MeticalProfessional{
  practiceNo		: String(50);
}

aspect MedicalInsurance {
	provider		    : String(50);
	policyNumber	  : String(20);
  planType        : String;
  status          : String(1) 
      @( title: 'Status', ) enum {
        male    = 'A' @( title: 'Active');
        female  = 'S' @( title: 'Suspended');
        other   = 'D' @( title: 'Deleted');
    };
}

aspect Hospital {
  hospitalName  : String(111);
}

aspect Room {
  roomName    : String (111);
}

//--------------------------------------------------------------------------
// Entities

// Master Data - People
entity Persons: Person, ContactOptions, cuid, managed{
  roles  : Composition of many Person_Role on roles.parent=$self;
}

entity Person_Role : cuid{
	parent	        : Association to Persons;
  role_ID         : RoleID;
  role            : Association to Roles on role.role_ID=role_ID;
};

entity Roles {
    KEY role_ID     : RoleID;
    roleName        : String;
    description     : String @multiline;
    category        : String(2) 
      @( title: 'Category', ) enum {
        medDoctor   = 'MD' @( title: 'Medical Practitioner');
        patient     = 'PA' @( title: 'Patient');
        nurse       = 'NU' @( title: 'Nursing');
    };
    assignments     : Association to many Person_Role on assignments.role_ID = $self.role_ID
};

using {com.sercon.common.Persons as Patients};
extend Patients with {
  medicalInsurances  : Composition of many Insurances on medicalInsurances.parent = $self;
};

entity Insurances : MedicalInsurance, cuid, managed{
  parent            : Association to Patients
};


// Master Data - Hospitals / Rooms
entity Hospitals : Hospital, cuid {
  operatingTheatres : Composition of many OperatingTheatres on operatingTheatres.parent = $self;
};

entity OperatingTheatres : Room, cuid {
  parent            : Association to Hospitals
}

