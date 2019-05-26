const GetDocumentRequest = async (component) =>
	await fetch('http://localhost:5000/api/Document')
		.then(res => res.json())
		.then(json => {
			component.setState({
				isLoaded: true,
				items: json
			});
		});

export default GetDocumentRequest;