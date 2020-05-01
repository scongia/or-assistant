using AdminService from '../../../srv/admin-service';

annotate AdminService.Roles with @(
    UI:{
        HeaderInfo: {
            TypeName: '{i18n>Role}', TypeNamePlural: '{i18n>Roles}',
            Title: { Value: roleName },
            Description: { Value: ID } 
        },
		HeaderFacets: [
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>Category}', Target: '@UI.FieldGroup#Category'},
		],
		Facets: [
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>Description}', Target: '@UI.FieldGroup#Description'},
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>Assignments}', Target: 'Assignments/@UI.LineItem'}
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
		SelectionFields: [ ID, roleName, category ],
		LineItem: [
			{Value: ID},
			{Value: roleName},
			{Value: category}
        ]
    }
);

