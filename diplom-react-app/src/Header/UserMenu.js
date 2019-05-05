import React from 'react';
import PropTypes from 'prop-types';

class UserMenu extends React.Component {
	constructor() {
		super();

  	this.state = {
			isOpen: false,
			userInfo: {}
		};
	}
	
	componentWillMount(){
		this.setState({ userInfo: this.props.userInfo });
	}

	toggleOpen = () => this.setState({ isOpen: !this.state.isOpen });

	render() {
		const menuClass = `dropdown-menu-right dropdown-menu${ this.state.isOpen ? ' show' : '' }`;
		return (
			<div className="dropdown" onClick={ this.toggleOpen }>
				<button
					className="btn btn-primary dropdown-toggle"
  				type="button"
  				id="dropdownMenuButton"
  				data-toggle="dropdown"
					aria-haspopup="true"
				>
					Пользователь: { this.props.userInfo.name }
				</button>			
				<div className={ menuClass } aria-labelledby="dropdownMenuButton">
					<button className="dropdown-item">
						Настройки аккаунта
					</button>
					<button className="dropdown-item">
						Сменить пользователя
					</button>
					<button className="dropdown-item">
						Выйти
					</button>
				</div>
			</div>
		);
	}
}

UserMenu.propTypes = {
	userInfo: PropTypes.object,
};

UserMenu.defaultProps = {
	userInfo: {}
};

export default UserMenu;