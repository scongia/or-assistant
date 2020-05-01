
using from './webapp/persons-admin/fiori-service';
using from './webapp/roles-admin/fiori-service';

using com.or.assistant as db from '../db/data-model';

////////////////////////////////////////////////////////////////////////////
//    Persons List
annotate db.Persons with @(
    UI:{
        Identification: [{Value:firstName}],
        SelectionFields: [ firstName, lastName, gender, Roles.role],
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
	role @title:'{i18n>role}';
}

////////////////////////////////////////////////////////////////////////////
//    Practitioners
annotate db.Practitioners with {
	practiceNo @title:'{i18n>PracticeNumber}';
}