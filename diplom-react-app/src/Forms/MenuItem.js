import React, { Component } from 'react';
import AddDocument from '../Document/AddDocument';
import GetDocument from '../Document/GetDocument';

class MenuItem extends Component {
	constructor() {
		super();

		this.state = { 
			isToggleOn: true,
			result: null
		};
		this.handleClick = this.handleClick.bind(this);
	}
	
	handleClick() {
		
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
					className={this.state.isMouseInside ? 'list-group-item list-group-item-action active' : 'list-group-item list-group-item-action'}
					onClick={this.handleClick}
				>
					{this.props.name}
				</button>
				<div>
					{this.state.result}
				</div>
			</div>
		);
	}
};	

export default MenuItem;