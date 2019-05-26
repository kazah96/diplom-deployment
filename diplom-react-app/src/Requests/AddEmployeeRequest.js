const AddEmployeeRequest = async (e) => {
	return await fetch('http://localhost:5000/api/Employee', {
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
}
export default AddEmployeeRequest;