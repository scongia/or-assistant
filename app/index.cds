
using from './webapp/persons-admin/fiori-service';
using from './webapp/roles-admin/fiori-service';
using from './webapp/patients-admission/fiori-service';

using com.sercon.common as db from '../db/schema';

////////////////////////////////////////////////////////////////////////////
//    Persons List
annotate db.Persons with @(
    UI:{
        Identification: [{Value:firstName}],
        SelectionFields: [ firstName, lastName, gender, roles.role_ID],
        LineItem: [
            {Value: title},
            {Value: lastName},
            {Value: firstName}
        ]
    }
);

////////////////////////////////////////////////////////////////////////////
//    Persons Details
annotate db.Persons with @(
    UI:{
        HeaderInfo: {
            TypeName: '{i18n>Person}', TypeNamePlural: '{i18n>Persons}',
            Title: { Value: lastName },
            Description: { Value: firstName }
        }
    }
);
////////////////////////////////////////////////////////////////////////////
//    Persons Elements
annotate db.Persons with {
	ID @title:'{i18n>ID}';
	title @title:'{i18n>Title}';
    firstName @title:'{i18n>FirstName}';
    lastName @title:'{i18n>LastName}';
    dateOfBirth @title:'{i18n>DoB}';
    idNumber @title:'{i18n>IDNum}';
    eMail @title:'{i18n>Email}';
}

annotate db.Person_Role with {
    role_ID @(
		Label: '{i18n>Role}' ,
        title:'{i18n>role}',
		ValueList.entity:'Roles',
	);
}

annotate db.Roles with {
	role_ID @title:'{i18n>roleID}';
    roleName @title:'{i18n>roleName}';
    category @title:'{i18n>roleCategory}';
}

annotate db.Insurances with {
    provider @title:'{i18n>provider}';
	policyNumber @title:'{i18n>policyNumber}';
    planType @title:'{i18n>planType}';
    status @title:'{i18n>status}';
}