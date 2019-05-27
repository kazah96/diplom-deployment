import React, { Component } from 'react';
import PropTypes from 'prop-types';

class InputForm extends Component {
	render() {
		return (
			<form onSubmit={ this.props.addDocumentMethod }>
				<div className="container">
				asdasdasw
					<div className="row">
						<input type="text" className="form-control" name="name" placeholder="Название документа"/>              
						<input type="text" className="form-control" name="shortDiscription" placeholder="Краткое описание документа"/>
						<input type="text" className="form-control" name="path" placeholder="Путь"/>
						<input type="text" className="form-control" name="status" placeholder="Статус"/>
						<input type="text" className="form-control" name="size" placeholder="Размер"/>
						<input type="text" className="form-control" name="editsAndChanges" placeholder="Редактирование и изменения"/>
						<input type="text" className="form-control" name="documentTypeId" placeholder="ID документа"/>
						<button type="submit" className="btn btn-primary">Добавить документ</button>
					</div>
				</div>
			</form>
		);
	}
}

InputForm.propTypes = {
	addDocumentMethod: PropTypes.func
};

export default InputForm;