module.exports = (srv) => {

    const {Patients, Person_Roles, Roles } = srv.entities

    srv.before('CREATE','Patients', async (req) => {

        var insertQuery = req.query.INSERT
        var patient = insertQuery.entries[0]

        //Get Patient Role via category 'PA'. Assume only one role for now.
        //TODO: provide dialog to select which role in category PA to use. 
        const {SELECT} = cds.ql(req)
        const role = await SELECT.one.from(Roles).where({ category : 'PA' })

        patient = req.data
        patient.roles.push({parent_ID: patient.ID, role_ID: role.role_ID })
    })
}