using AdminService from '../../../srv/admin-service';

annotate AdminService.Roles with @(
    UI:{
        HeaderInfo: {
            TypeName: '{i18n>Role}', TypeNamePlural: '{i18n>Roles}',
            Title: { Value: roleName },
            Description: { Value: role_ID } 
        },
		HeaderFacets: [
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>Category}', Target: '@UI.FieldGroup#Category'},
		],
		Facets: [
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>Description}', Target: '@UI.FieldGroup#Description'},
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>Assignments}', Target: 'assignments/@UI.LineItem'}
		],
		FieldGroup#Category: {
			Data: [
				{Value: category}
			]
		},
		FieldGroup#Description: {
			Data: [
				{Value: description}
			]
		}
    }
);

annotate AdminService.Roles with @(
	UI:{
		Identification: [{Value:roleName}],
		SelectionFields: [ role_ID, roleName, category ],
		LineItem: [
			{Value: role_ID},
			{Value: roleName},
			{Value: category}
        ]
    }
);