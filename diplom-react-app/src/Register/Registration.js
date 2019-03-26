import React, { Component } from 'react';
import PropTypes from 'prop-types';
import InputForm from './InputForm';

class Registration extends Component {
	constructor(props) {
		super(props);

		this.state = { 
			inputFormValue: '',
			validInputForms: {
				'userNameRegistration' : false,
				'emailRegistration' : false,
				'passwordRegistrationOne' : false,
				'passwordRegistrationTwo' : false
			},
			allFormsValid: false
		};
		this.registrationClick = this.registrationClick.bind(this);
		this.areadyRegistrationClick = this.areadyRegistrationClick.bind(this);
		this.regClick = this.regClick.bind(this);
	}
  
	registrationClick() {
		this.props.updateData({ registrationClick: true, areadyRegistrationClick: true });
	}

	areadyRegistrationClick() {
		this.props.updateData({ registrationClick: false, areadyRegistrationClick: false });
	}

	inputFormValue = (value) => {
		this.setState({ inputFormValue: value })
	}

	validInputForm = (value) => {
		
		const inputFormsObj= this.state.validInputForms;
		let validFlag = true;

		Object.keys(inputFormsObj).forEach(key => {
			if (key === value[ 0 ]){
				inputFormsObj[ key ] = value[ 1 ];
			}
			if(!inputFormsObj[ key ]){
				validFlag = false;
			}
		})

		this.setState({ validInputForms: inputFormsObj, allFormsValid: validFlag })
	}

	regClick() {
		if(this.state.allFormsValid){ 
			this.registrationClick()
		}else{			
			alert('Все поля должны быть верно заполнены')
		}
	}

	render() {
		return(
			<form className="text-center border border-light p-5">   
				<p className="h4 mb-4">Регистрация</p>
				<InputForm 
					type="text"
					id="userNameRegistration" 
					placeholder="Имя пользователя" 
					idHelp="userNamelHelp"
					textHelp="Логин должен быть от 5 до 15 латинских символов и не содержать специальных символов"
					validInputForm={ this.validInputForm }
				/>
				<InputForm 
					type="email"
					id="emailRegistration" 
					placeholder="E-mail" 
					idHelp="emailHelp"
					textHelp="Некорректный Email"
					validInputForm={ this.validInputForm }
				/>
				<InputForm 
					type="password"
					id="passwordRegistrationOne" 
					placeholder="Пароль" 
					idHelp="passwordHelpOne"
					textHelp="Пароль должен быть длиннее 6 символов и иметь: заглавную и строчную буквы, цифру, специальный символ"
					inputFormValue={ this.inputFormValue }
					validInputForm={ this.validInputForm }
				/>
				<InputForm 
					type="password"
					id="passwordRegistrationTwo" 
					placeholder="Подтвердите пароль" 
					idHelp="passwordHelpTwo"
					textHelp="Пароли должны совпадать"
					passwordOne={ this.state.inputFormValue }
					validInputForm={ this.validInputForm }
				/>
				<div className="d-flex justify-content-around"/>
				<button className="btn btn-info btn-block my-4" type="button" onClick={ this.regClick }>Зарегистрироваться</button>
				<p>Уже зарегестрированы?
					<button type="button" className="btn btn-link" onClick={ this.areadyRegistrationClick }>Жми</button>
				</p>
			</form>
		);
	}
}

Registration.propTypes = {
	updateData: PropTypes.func,
	validInputForm: PropTypes.bool
};

export default Registration