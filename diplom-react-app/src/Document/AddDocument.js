import React from 'react';
import InputForm from '../Forms/InputForm';
import AddDocumentRequest from '../Requests/AddDocumentRequest'

const AddDocument = ()=> <InputForm addDocumentMethod={ AddDocumentRequest }/>

export default AddDocument;