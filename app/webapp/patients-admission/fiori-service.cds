using AdmissionService from '../../../srv/admission-service';

////////////////////////////////////////////////////////////////////////////
//	Persons Object Page
annotate AdmissionService.Patients with @(
	UI: {
		 HeaderInfo: {
            TypeName: '{i18n>Patient}', TypeNamePlural: '{i18n>Patients}',
            Title: { Value: lastName },
            Description: { Value: firstName }
        },
		Facets: [
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>General}', Target: '@UI.FieldGroup#General'},
            {$Type: 'UI.ReferenceFacet', Label: '{i18n>MedicalAid}', Target: 'medicalInsurances/@UI.LineItem'},
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

annotate AdmissionService.Insurances with @(
	UI: {
		HeaderInfo: {
			TypeName: '{i18n>MedicalAid}', TypeNamePlural: '{i18n>MedicalAid}',
			Title: { Value: provider }
		},
		Facets: [
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>General}', Target: '@UI.FieldGroup#General'}
		],
		FieldGroup#General: {
			Data: [
				{ Value: provider, Label: '{i18n>provider}' },
				{ Value: policyNumber, Lable: '{i18n>policyNumber}'},
				{ Value: planType, Lable: '{i18n>planType}'},
				{ Value: status, Lable: '{i18n>status}'}
			]
		},
		LineItem: [
			{ Value: provider, Label: '{i18n>provider}' },
			{ Value: policyNumber, Lable: '{i18n>policyNumber}'},
			{ Value: planType, Lable: '{i18n>planType}'},
			{ Value: status, Lable: '{i18n>status}'}
		]
	}
);