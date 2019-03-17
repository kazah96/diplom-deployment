import React, { Component } from 'react';
import './index.css'
import MenuItem from '../Forms/MenuItem';

class Header extends Component {
	constructor() {

		super();
		
		this.state = { 
			open: false,
			isMouseInside: false,
			menuItemElement : null
		};
	}

	updateData = (value) => {
		this.setState({ menuItemElement: value })
	 }
	
	toggle() {
		this.setState({
			open: !this.state.open
		});
	}
	
	render() {
		return (
			<div>
				<div>
					<header>
						<nav className="navbar navbar-light bg-light">
							<div>
								<h5 className="text-center">Меню</h5>
								<button 
									className="navbar-toggler" 
									type="button" 
									onClick={ this.toggle.bind(this) } 
									data-toggle="collapse" 
									data-target="#navbarText" 
									aria-controls="navbarText" 
									aria-expanded="false" 
									aria-label="Toggle navigation"
								>
									<span className="navbar-toggler-icon"></span>
								</button>
							</div>
							<div id="navbarText">
								<h3 className="text-center">DocFlow</h3>
							</div>
							<button type="button" className="btn btn-primary">Пользователь</button>
						</nav>
					</header>
				</div>
				{this.state.open 
					? <div className="list-group">
						<MenuItem name = 'Добавить документ' clickID = 'addDocument' updateData={ this.updateData }/>
						<MenuItem name = 'Удалить документ' clickID = 'deleteDocument' updateData={ this.updateData }/>
						<MenuItem name = 'Редактировать документ' clickID = 'editDocument' updateData={ this.updateData }/>
						<MenuItem name = 'Просмотреть список документов' clickID = 'showListDocument' updateData={ this.updateData }/>
					</div>
					: null
				}
				{this.state.menuItemElement}
			</div>
		);
	}
};

export default Header;