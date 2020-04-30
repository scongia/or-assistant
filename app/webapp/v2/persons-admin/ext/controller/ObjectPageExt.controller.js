sap.ui.controller("v2.persons.admin.ext.controller.ObjectPageExt", {
    onInit: function () { 
      var i = 1;
    },
    onAfterRendering: function(oEvent) {
      var oButton = sap.ui.getCore().byId("v2.persons.admin::sap.suite.ui.generic.template.ObjectPage.view.Details::Persons--CreateRoleAction");
      oButton.bindElement("DraftAdministrativeData");
      oButton.bindProperty("visible", {
          path: "DraftIsCreatedByMe"
      });
  },
  });