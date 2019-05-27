const GetPositionsRequest = async () =>
	await fetch('/api/Position')
		.then(res => res.json());

export default GetPositionsRequest;