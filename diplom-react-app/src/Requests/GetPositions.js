const GetPositionsRequest = async (component) =>
	await fetch('https://localhost:5001/api/Position')
		.then(res => res.json());

export default GetPositionsRequest;