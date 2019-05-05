const AddEmployeeRequest = async (e) => {
	e.preventDefault();
	await fetch('https://localhost:5001/api/Document', {
		method: 'POST',
		headers: {
			'Accept': 'application/json',
			'Content-Type': 'application/json',
		},
		body: JSON.stringify({
			name: e.employeeNameRegistration,
			surname: e.employeeFNameRegistration,
			middleName: '',
			telephoneNumber: '',
			email: e.emailRegistration,
			positionId: e.positionRegistration,
			subdivisionId: e.subdivisionRegistration,
			companyId: '1',
			password: e.passwordRegistrationOne
		})
	})
		.then(()=> alert('Документ был успешно добавлен!'))
		.catch(() => alert('Внимание! Документ не был добавлен!'))
}
export default AddEmployeeRequest;