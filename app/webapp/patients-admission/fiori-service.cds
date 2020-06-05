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
            {$Type: 'UI.ReferenceFacet', Label: '{i18n>MedicalAid}', Target: 'dataset_1/medicalAid/@UI.LineItem'},
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

annotate AdmissionService.DS_MedAid with @(
	UI: {
		LineItem: [
			{ Value: medicalAid, Label: '{i18n>medicalAid}' },
			{ Value: medicalAidNo, Lable: '{i18n>medicalAidNo}'},
			{ Value: medicalAidPlan, Lable: '{i18n>medicalAidPlan}'}
		]
	}
);