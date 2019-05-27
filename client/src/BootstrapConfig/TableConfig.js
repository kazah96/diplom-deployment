function onAfterDeleteRow(rowKeys) {
	// alert('The rowkey you drop: ' + rowKeys);
}

function onAfterInsertRow(row) {
	// let newRowStr = '';

	// for (const prop in row) {
	// 	newRowStr += prop + ': ' + row[ prop ] + ' \n';
	// }
	// alert('The new row is:\n ' + newRowStr);
}

function afterSearch(searchText, result) {
	// console.log('Your search text is ' + searchText);
	// console.log('Result is:');
	// for (let i = 0; i < result.length; i++) {
	// 	console.log('Fruit: ' + result[ i ].id + ', ' + result[ i ].name + ', ' + result[ i ].price);
	// }
}

const Options = {
	afterDeleteRow: onAfterDeleteRow,
	afterSearch: afterSearch,
	afterInsertRow: onAfterInsertRow
};

export { Options };