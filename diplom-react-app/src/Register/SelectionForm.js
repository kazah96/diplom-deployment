import React, { Component } from 'react';
import PropTypes from 'prop-types';
import GetPositions from '../Requests/GetPositions'
import GetSubdivisionsRequest from '../Requests/GetSubdivisionsRequest'

class SelectionForm extends Component {
	constructor() {
		super();

		this.state = { 
			items: {},
			validForm: true
		};
	}
  
	componentDidMount() {
		const id = this.props.id;
		let firstElementFlag = true;

		if(id === 'positionRegistration'){
			GetPositions(this).then(items => {
				this.setState({
					validForm: true,
					items: items.map(item => {
						if(firstElementFlag){
							this.props.inputFormValues({ id: id, result: item.shortDescription });
							firstElementFlag = false;
						}
						this.props.validInputForm({ id: id, result: true });
						return { id: item.positionId,  showName: item.shortDescription }
					})
				})
			});
		}

		if(id === 'subdivisionRegistration'){
			GetSubdivisionsRequest(this).then(items => {
				this.setState({
					validForm: true,
					items: items.map(item => {
						if(firstElementFlag){
							this.props.inputFormValues({ id: id, result: item.name });
							firstElementFlag = false;
						}
						this.props.validInputForm({ id: id, result: true });
						return { id: item.subdivisionId,  showName: item.name }
					})
				});
			});
		}
	}

	handleChange (event) {
		let result = false;
		const id = this.props.id;

		this.props.inputFormValues({ id: id, result: event.target.value });
		if(id === 'positionRegistration' || id === 'subdivisionRegistration'){
			result = event.target.value !== '';
		}

		if(result){
			this.setState({	validForm: true });
		}else{
			this.setState({ validForm: false });
		}
		
		this.props.validInputForm({ id: id, result: result });
	}

	render() {
		return(
			<div>
				<div className="form-group row">
					<select 
						className="form-control"  
						id={ this.props.id }
						onChange={ event => this.handleChange(event) }
						ref="imageType"
					>
						<option disabled defaultValue>{ this.props.placeholder }</option>
						{
							Object.keys(this.state.items).map(key => {
								return(
									<option key={ this.state.items[ key ].id }>
										{ this.state.items[ key ].showName }
									</option>)
							})
						}
					</select>
				</div>
			</div>
		);
	}
}

SelectionForm.propTypes = {
	id: PropTypes.string,
	placeholder: PropTypes.string,
	items: PropTypes.object,
	validInputForm: PropTypes.func,
	inputFormValues: PropTypes.func
};

SelectionForm.defaultProps = {
};

export default SelectionForm