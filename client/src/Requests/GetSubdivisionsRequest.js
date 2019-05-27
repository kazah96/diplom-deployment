const GetSubdivisionsRequest = async () =>
	await fetch('/api/Subdivision')
		.then(res => res.json());
		
export default GetSubdivisionsRequest;