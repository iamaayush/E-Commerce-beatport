$(document).ready(function() {

	$("#regSupplier").validate({

		onfocusout : false,
		errorElement : "div",
		errorPlacement : function(error, element) {

			error.appendTo("div#errors1");

		},
		// Specify the validation rules
		rules : {
			firstname : "required",
			lastname : "required",
			username : "required",
			password : {
				required : true,
				minlength : 6
			}

		},

		// Specify the validation error messages
		messages : {
			firstname : "Please enter First name",
			lastname : "Please enter Last name",

			username : "Please enter username",
			password : "Please enter valid password"

		},

		submitHandler : function(form) {
			form.submit();
		}
	});

	$("#addGenreForm").validate({

		onfocusout : false,
		errorElement : "div",
		errorPlacement : function(error, element) {

			error.appendTo("div#error2");
		},
		// Specify the validation rules
		rules : {
			newGenre : "required"

		},

		// Specify the validation error messages
		messages : {
			newGenre : "Please enter Genre name"
		},

		submitHandler : function(form) {
			form.submit();
		}
	});
});