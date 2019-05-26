const GetSubdivisionsRequest = async () =>
	await fetch('http://localhost:5000/api/Subdivision')
		.then(res => res.json());
		
export default GetSubdivisionsRequest;