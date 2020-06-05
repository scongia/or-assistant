module.exports = (srv) => {

	const { Roles, Persons } = srv.entities

  	srv.before('CREATE','Persons', req => {

        var Persons = req.data

	})

	// Fill Person_Role.roleName from from Role.roleName 
	// srv.after (['READ'], 'Person_Role', (person_roles, req) => {
	// 	return Promise.all (person_roles.map(async person_role => {
	// 		const roles = await cds.transaction(req).run(
	// 		  SELECT.from(Roles).where({ ID: person_role.role })
	// 		)
	// 		person_role.roleName = roles[0].roleName
	// 	  }))
	// })

	// // Populate Role.Allocations navigation
	// srv.before (['READ'], 'Roles/Assignments', (req) => {
	// 	console.log("before READ - Roles/Assignments - req.data: " + JSON.stringify(req.data))
	// 	console.log("before READ - Roles/Assignments - req.query.cqn: " + JSON.stringify(req.query.cqn))
	// 	// const tx = cds.transaction(req), roleID = req.params[0]
	// 	// req.query.SELECT.where
	// 	// const newQuery = SELECT.from
	// })

}
