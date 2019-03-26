import React, { Component } from 'react';
import PropTypes from 'prop-types';

class InputForm extends Component {
	constructor() {
		super();

		this.state = { 
			validForm: true
		};
	}
  
	handleChange (event) {
		let result = false;
		const id = this.props.id;

		if(id === 'userNameRegistration'){
			result =  validateLogin(event.target.value);
		}   
		if(id === 'emailRegistration'){
			result = validateEmail(event.target.value);
		}
		if(id === 'passwordRegistrationOne'){
			result = validatePassword(event.target.value);
			this.props.inputFormValue(event.target.value);
		}
		if(id === 'passwordRegistrationTwo'){  
			result = comparePasswords(this.props.passwordOne, event.target.value);
		}

		if(result){
			this.setState({	validForm: true });
		}else{
			this.setState({ validForm: false });
		}
		
		this.props.validInputForm([ id, result ]);
	}

	render() {
		return(
			<div>
				<div className="form-group row">
					<input 
						type={ this.props.type } 
						id={ this.props.id } 
						className={ this.state.validForm ? 'form-control ' : 'form-control is-invalid' }   
						autoComplete="on" 
						placeholder={ this.props.placeholder }
						onChange={ event => this.handleChange(event) } 
					/>
					{
						!this.state.validForm?
							<small id={ this.props.idHelp }  className="text-danger">
								{ this.props.textHelp }
							</small>
							: null
					}
				</div>
			</div>
		);
	}
}

InputForm.propTypes = {
	type: PropTypes.string,
	id: PropTypes.string,
	placeholder: PropTypes.string,
	idHelp: PropTypes.string,
	textHelp: PropTypes.string,
	inputFormValue: PropTypes.func,
	passwordOne: PropTypes.string,
	validInputForm: PropTypes.func
};

function validateLogin(login) {
	return !/[~`!#$%^&*+=\-[\]\\';,/{}|\\":<>?]/g.test(login) && /^[a-zA-Z]+$/.test(login) && login.length > 4 && login.length < 16;
}

function validateEmail(email) {
	const regular = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  
	return regular.test(String(email).toLowerCase());
}

function validatePassword(password) {
	return /[A-Z]/.test(password) && /[a-z]/.test(password) && /[0-9]/.test(password) &&
   /[^A-Za-z0-9]/.test(password) && password.length > 7;
}

function comparePasswords(passwordOne, passwordTwo) {
	return passwordOne === passwordTwo;
}

export default InputForm