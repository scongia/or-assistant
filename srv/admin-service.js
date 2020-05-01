module.exports = (srv) => {

	const { Roles, Persons } = srv.entities ('com.or.assistant')

	// Populate Role.Allocations navigation
	srv.before (['READ'], 'Roles', (req) => {
		const tx = cds.transaction(req), roleID = req.data
	})

	// Populate Role.Allocations navigation
	srv.before (['READ'], 'Roles/Assignments', (req) => {
		const tx = cds.transaction(req), roleID = req.data
	})

}
