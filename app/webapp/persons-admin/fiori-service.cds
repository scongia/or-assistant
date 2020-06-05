using AdminService from '../../../srv/admin-service';

////////////////////////////////////////////////////////////////////////////
//	Persons Object Page
annotate AdminService.Persons with @(
	UI: {
		Facets: [
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>General}', Target: '@UI.FieldGroup#General'},
            {$Type: 'UI.ReferenceFacet', Label: '{i18n>Roles}', Target: 'roles/@UI.LineItem'},
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>Admin}', Target: '@UI.FieldGroup#Admin'},
		],
		FieldGroup#General: {
			Data: [
				{Value: title},
				{Value: firstName},
				{Value: lastName},
                {Value: dateOfBirth},
                {Value: idNumber},
				{Value: gender},
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

annotate AdminService.Person_Role with @(
	UI: {
		HeaderInfo: {
			TypeName: '{i18n>Role}', TypeNamePlural: '{i18n>Roles}',
			Title: { Value: role }
		},
		Facets: [
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>General}', Target: '@UI.FieldGroup#General'}
		],

		FieldGroup#General: {
			Data: [
				{Value: role}  //Should be read only
			]
		},
		LineItem: [
			{ Value: role_ID, Label: '{i18n>Role}' },
			{ Value: role.roleName, Lable: '{i18n>RoleName}'},
			{ Value: role.category, Lable: '{i18n>RoleCategory}'}
		]
	}
);

annotate AdminService.Person_Role with @(
	Capabilities: {
			InsertRestrictions: {Insertable: true},
			DeleteRestrictions: {Deletable: true}
		}
	){
	role_ID @(
		Label: '{i18n>Role}' ,
		Common: {
			FieldControl: #Mandatory
		},
		ValueList.entity:'Roles',
	);
};

annotate AdminService.Persons with @(
	Capabilities: {
			InsertRestrictions: {Insertable: true},
			DeleteRestrictions: {Deletable: true}
		}
);

