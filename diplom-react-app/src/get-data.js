import React, { Component } from 'react';

class GetData extends Component {

    constructor(props){
        super(props);
        this.state = {
            items: [],
            isLoaded: false
        }
    }
  
    componentDidMount(){
        fetch('https://localhost:5001/api/Employee')
            .then(res => res.json())
            .then(json => {
                this.setState({
                    isLoaded: true,
                    items: json
                })
            })
    }

    render() {
        const {isLoaded, items} = this.state;

        if(!isLoaded){
            return <div>Loading...</div>;
        }

        return (
            <ul>
            {items.map(item => (
                <li key ={item.id}>
                    {JSON.stringify(item)}
                </li>
            ))}
            </ul>
        );
    }
}

export default GetData;