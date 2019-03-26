import React, { Component } from 'react';
import PropTypes from 'prop-types';
import Registration from './Registration'

class Login extends Component {
	constructor() {
		super();

		this.state = { 
			clickedButton: false,
			registrationMode: false
		};
		this.enterClick = this.enterClick.bind(this);
		this.registrationClick = this.registrationClick.bind(this);
	}

	enterClick() {
		this.props.updateData(true);
	}

	registrationClick() {
		
		this.setState({ registrationMode: true });
	}

	updateData = (value) => {
		this.setState({ registrationMode: value.areadyRegistrationClick })
		this.props.updateData(value.registrationClick);
	}

	render() {
		return(
			<div className = "container">
				{this.state.registrationMode 
					? < Registration updateData={ this.updateData }/> 
					: <form className="text-center border border-light p-5">
						<p className="h4 mb-4">Авторизация</p>
						<input type="email" id="emailLogin" className="form-control mb-4" autoComplete="on" placeholder="E-mail"/>
						<input type="password" id="passwordLogin" className="form-control mb-4" autoComplete="on" placeholder="Пароль"/>
						<div className="d-flex justify-content-around">
							<div>
								<div className="custom-control custom-checkbox">
									<input type="checkbox" className="custom-control-input" id="defaultLoginFormRemember"/>
									<label className="custom-control-label" htmlFor="defaultLoginFormRemember">Запомнить меня</label>
								</div>
							</div>
						</div>
						<button className="btn btn-info btn-block my-4" type="button" onClick={ this.enterClick } >Вход</button>
						<p>Не зарегистрированы?
							<button type="button" className="btn btn-link" onClick={ this.registrationClick } >Регистрация</button>
						</p>
					</form>
				}
			</div>
		);
	}
}

Login.propTypes = {
	clickedButton: PropTypes.bool,
	updateData : PropTypes.func,
	registrationMode : PropTypes.bool
};

export default Login