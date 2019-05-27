const GetUserAuthorizRequest = async (userName, password) =>
	await fetch(`/api/authorizInfo/${ userName }/${ password }`)
		.then(res => res.status !== 200 ? null : res.json())

export default GetUserAuthorizRequest;