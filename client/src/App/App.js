import React, { Component } from 'react';
import PropTypes from 'prop-types';
import Header from '../Header/Header';
import Login from '../Register/Login';
import './App.css';
import 'bootstrap/dist/css/bootstrap.css';

class App extends Component {
	constructor() {
		super();

		this.state = {
			logIn: false,
			userInfo: {}
		};
	}

	updateData = (value) => {
		this.setState({ 
			logIn: value.logIn, 
			userInfo: value.userInfo 
		})
	}

	headerUpdateData = (value) => {
		this.setState({ logIn: value.userLogin });
	}

	render() {
		return(
			<div className="App">
				{
					this.state.logIn 
						? <Header userInfo={ this.state.userInfo } headerUpdateData={ this.headerUpdateData }/> 
						: <Login  updateData={ this.updateData }/>
				}
			</div>
		)
	}
}

App.propTypes = {
	logIn: PropTypes.bool
};

export default App;
