const GetDocumentRequest = async (component) =>
	await fetch('https://localhost:5001/api/Document')
		.then(res => res.json())
		.then(json => {
			component.setState({
				isLoaded: true,
				items: json
			});
		});

export default GetDocumentRequest;