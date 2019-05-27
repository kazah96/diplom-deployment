import React, { Component } from 'react';
import PropTypes from 'prop-types';
import AddDocument from '../Document/AddDocument';
import GetDocument from '../Document/GetDocument';

class MenuItem extends Component {
	constructor() {
		super();

		this.state = { 
			isToggleOn: true
		};
		this.menuItemClick = this.menuItemClick.bind(this);
	}
	sdfsdf
	menuItemClick() {
		if(this.state.isToggleOn){
			if(this.props.clickID === 'addDocument'){
				this.props.updateData(<AddDocument/>);
			}
			if(this.props.clickID === 'deleteDocument'){
				this.props.updateData(<h1>Удалить документ</h1>);
			}
			if(this.props.clickID === 'editDocument'){
				this.props.updateData(<h1>Редактировать документ</h1>);
			}
			if(this.props.clickID === 'showListDocument'){
				this.props.updateData(<GetDocument/>);
			}
		}else{
			this.props.updateData(null);
		}

		this.setState(state => ({
		  isToggleOn: !state.isToggleOn
		}));
	}
	
	render() {
		return (
			<div>
				<button 
					type="button"
					className={ this.state.isMouseInside ? 'list-group-item list-group-item-action active' : 'list-group-item list-group-item-action' }
					onClick={ this.menuItemClick }
				>
					{ this.props.name }
				</button>
			</div>
		);
	}
};

MenuItem.propTypes = {
	clickID: PropTypes.string,
	name: PropTypes.string,
	updateData : PropTypes.func
};

export default MenuItem;