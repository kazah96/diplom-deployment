import React, { Component } from 'react';
import InputForm from '../Forms/InputForm';
import 'bootstrap/dist/css/bootstrap.css';

class AddDocument extends Component {

    addDocumentQuery = async (e) => {
        e.preventDefault();

        await fetch('https://localhost:5001/api/Document', {
            method: 'POST',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                name: e.target.elements.name.value,
                shortDiscription: e.target.elements.shortDiscription.value,
                path: e.target.elements.path.value,
                status: e.target.elements.status.value,
                size: e.target.elements.size.value,
                editsAndChanges: e.target.elements.editsAndChanges.value,
                documentTypeId: e.target.elements.documentTypeId.value
            })
        })
        .then(()=> alert('Документ был успешно добавлен!'))
        .catch(() => alert('Внимание! Документ не был добавлен!'))
    }

    render() {
        return (
            <InputForm addDocumentMethod={this.addDocumentQuery}/>
        );
    }
}

export default AddDocument;