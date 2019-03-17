import React, { Component } from 'react';
import GetDocumentRequest from '../Requests/GetDocumentRequest'

class GetDocument extends Component {
	constructor(props) {

		super(props);

		this.state = {
			items: [],
			isLoaded: false
		};
	}

	componentDidMount() {	
		GetDocumentRequest(this);
	}

	render() {
		const { isLoaded, items } = this.state;

		if (!isLoaded) {
			return <div>Loading...</div>;
		}

		return (
			<ul className="list-group" key={ items }>
				{items.map(item => (
					<li className="list-group-item" key={ item.documentId }>
						{JSON.stringify(item)}
					</li>
				))}
			</ul>
		);
	}
}

export default GetDocument;