using AdminService from '../../../srv/admin-service';

////////////////////////////////////////////////////////////////////////////
//	Persons Object Page
annotate AdminService.Persons with @(
	UI: {
		Facets: [
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>General}', Target: '@UI.FieldGroup#General'},
            {$Type: 'UI.ReferenceFacet', Label: '{i18n>Roles}', Target: 'Roles/@UI.LineItem'},
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>Address}', Target: 'Addresses/@UI.LineItem'},
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>Admin}', Target: '@UI.FieldGroup#Admin'},
		],
		FieldGroup#General: {
			Data: [
				{Value: title},
				{Value: firstName},
				{Value: lastName},
                {Value: dateOfBirth},
                {Value: idNumber},
			]
		},
		FieldGroup#Address: {
			Data: [
			// 	{Value: stock},
			// 	{Value: price},
			// 	{Value: currency_code, Label: '{i18n>Currency}'},
			// 	{Value: weight     },
			// 	{Value: height     },
			// 	{Value: width      },
			// 	{Value: visible    },
			// 	{Value: releaseDate},
			// 	{Value: readingTime},
			]
		},
		FieldGroup#Admin: {
			Data: [
				{Value: createdBy},
				{Value: createdAt},
				{Value: modifiedBy},
				{Value: modifiedAt}
			]
		}
	}
);

annotate AdminService.Person_Role with {
	role @(
		Common: {
			FieldControl: #Mandatory
		},
		ValueList.entity:'Roles',
	);
};

annotate AdminService.Person_Role with @(
  UI: {
	SelectionFields: [ role ],

    LineItem: [
      { Value: role, Label: '{i18n>Role}' }
    ],

	HeaderInfo: {
    	Title: { Value: role },
  	}
  }
);

annotate AdminService.Roles with @(
    UI:{
        Identification: [{Value:roleName}],
		SelectionFields: [ ID, roleName ],
        LineItem: [
            {Value: ID},
            {Value: roleName},
            // {Value: description}
        ]
    }
);