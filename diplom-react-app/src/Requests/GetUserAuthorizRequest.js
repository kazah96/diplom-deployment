const GetUserAuthorizRequest = async (userName, password) =>
	await fetch(`http://localhost:5000/api/authorizInfo/${ userName }/${ password }`)
		.then(res => res.status !== 200 ? null : res.json())

export default GetUserAuthorizRequest;