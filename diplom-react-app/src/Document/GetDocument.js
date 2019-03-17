import React, { Component } from 'react';
import GetDocumentRequest from '../Requests/GetDocumentRequest'
import { Options } from '../BootstrapConfig/TableConfig'
import { BootstrapTable, TableHeaderColumn } from 'react-bootstrap-table-plus';

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
		console.warn(JSON.stringify(items));

		return (
			<div class="container">
				<BootstrapTable 
					data={ items }  
					pagination 
					deleteRow={ true }  
					insertRow={ true } 
					search={ true } 
					selectRow={ { mode: 'checkbox' } } 
					options={ Options }
				>
					<TableHeaderColumn dataField="documentId" isKey dataSort>ID документа</TableHeaderColumn>
					<TableHeaderColumn dataField="name"  dataSort>Имя документа</TableHeaderColumn>
					<TableHeaderColumn dataField="shortDiscription"  dataSort>Краткое описание</TableHeaderColumn>
					<TableHeaderColumn dataField="creationDate"  dataSort>Дата создания</TableHeaderColumn>
					<TableHeaderColumn dataField="path"  dataSort>Путь к файлу</TableHeaderColumn>
					<TableHeaderColumn dataField="status"  dataSort>Статус</TableHeaderColumn>
					<TableHeaderColumn dataField="size"  dataSort>Размер</TableHeaderColumn>
					<TableHeaderColumn dataField="editsAndChanges"  dataSort>Редактирование и изменение</TableHeaderColumn>
					<TableHeaderColumn dataField="documentTypeId"  dataSort>Тип документа</TableHeaderColumn>
				</BootstrapTable>
			</div>
		);
	}
}

export default GetDocument;