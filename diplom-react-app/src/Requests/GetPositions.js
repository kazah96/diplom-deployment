const GetPositionsRequest = async () =>
	await fetch('http://localhost:5000/api/Position')
		.then(res => res.json());

export default GetPositionsRequest;