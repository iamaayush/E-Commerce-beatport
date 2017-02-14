function validateaddProduct() {

	var productName = document.forms["addProduct"]["name"].value;

	if (productName.trim() == null || productName.trim() == "") {
		document.getElementById('addProductError').innerHTML = "product name is mandatory";
	} else {
		document.getElementById('addProductError').innerHTML = "";
	}
}
function validatePrice() {
	var price = document.forms["addProduct"]["price"].value;
	var patt1 = /^\d+(\.\d{0,2})?$/g;
	if (price.trim() == null || price.trim() == "") {
		document.getElementById('priceError').innerHTML = "Price is mandatory";
	} else if (!price.match(patt1)) {
		document.getElementById('priceError').innerHTML = "Invalid Price";
	} else {
		document.getElementById('priceError').innerHTML = "";
	}
}
function validateQuantity() {
	var qty = document.forms["addProduct"]["quantity"].value;
	var patt1 = /^\d+$/g;
	if (qty.trim() == null || qty.trim() == "") {
		document.getElementById('quantityError').innerHTML = "Quantity is mandatory";
	} else if (!qty.match(patt1)) {
		document.getElementById('quantityError').innerHTML = "Invalid Quantity";
	} else {
		document.getElementById('quantityError').innerHTML = "";
	}
}
function validate() {

	var productName = document.forms["addProduct"]["name"].value;
	var price = document.forms["addProduct"]["price"].value;
	var qty = document.forms["addProduct"]["quantity"].value;
	var patt1 = /^\d+(\.\d{0,2})?$/g;
	var patt2 = /^\d+$/g;
	if (productName.trim() == null || productName.trim() == ""
			|| price.trim() == null || price.trim() == ""
			|| (!price.match(patt1)) || qty.trim() == null || qty.trim() == ""
			|| (!qty.match(patt2))) {
		document.getElementById('errormsg').innerHTML = "All fields are mandatory!";
		return false;
	} else {
		return true;
	}
}
$(document).ready(function() {
	$("#singlebutton").click(function() {

	});
});
