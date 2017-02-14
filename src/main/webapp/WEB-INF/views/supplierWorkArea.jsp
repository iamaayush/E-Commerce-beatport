<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.min.js"></script>
<script type="text/javascript" src="resources/js/supplierWorkArea.js"></script>
<link rel="stylesheet" href="<c:url value="/css/login.css"/>" />
<title>Music Producer Home Page</title>
<style>

/* body{
background: url('../resources/images/h12.jpg');
}
 */
.logOutBut {
	margin-left: 70%;
	color: black;
}

.bground {
	width: 100%;
	height: 100%;
	position: absolute;
}

.topDiv {
	background-color: white;
	opacity: 0.8;
	color: black;
}
</style>
<script>
	function myUploadFunction() {
		var x = document.getElementById("image").value;
		var y = document.getElementById("sample").value;

		if ((x == "") || (y == "")) {
			alert("Invalid upload. Please try again");
			return;
		}
		/*     document.getElementById("putImage").innerHTML = x;
		 document.getElementById("putSample").innerHTML = y;
		 */
		$('#putImage').val(x);

		$('#putSample').val(y);

		document.getElementById("submit").disabled = false;
	}
</script>


</head>
<body>
	<img class="bground" src="resources/images/9.jpg">
	<div class="container">
		<div class="row topDiv">
			<div
				class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
				<form action="logMeOut.do" method="get" class="logOutBut">
					<input type="submit" class="btn" value="Logout" />
				</form>
				<form role="form" name="addProduct" class="topDiv"
					action="addMusicToCategory.do" method="post"
					enctype="multipart/form-data">
					<h2>Enter New Product!</h2>
					<div> <p id="errormsg" class="text-danger"></p></div>
					<br> <input type="hidden" name="supplierName"
						value="${supplierName}" />
					<div class="form-group">
						<div class="input-group input-group-lg center-block">
							<label class="control-label col-sm-5" for="category">Category*
							</label>
						</div>


						<select name="selectedGenre">
							<c:forEach var="item" items="${listGenre}">

								<option value="${item}">${item}</option>
								<br>
								<br>
								<br>
							</c:forEach>
						</select>
					</div>

					<div class="form-group">
						<div class="input-group input-group-lg center-block">
							<label class="control-label col-sm-5" for="productName">Product
								Name* </label> <input type="text" name="name" class=""
								onblur="validateaddProduct()" maxlength="40" tabindex="1" /><br />
							<p id="addProductError" class="text-danger col-sm-12"></p>
						</div>
					</div>

					<div class="form-group">
						<div class="input-group input-group-lg center-block">
							<label class="control-label col-sm-5" for="description">Product
								Description </label> <input type="text" name="description" class=""
								onblur="validateDescription()" maxlength="240" tabindex="2" /><br />
							<p id="descriptionError" class="text-danger col-sm-12"></p>
						</div>
					</div>
					<div class="form-group">
						<div class="input-group input-group-lg center-block">
							<label class="control-label col-sm-5" for="price">Product
								Price* </label> <input type="text" maxlength= "5" name="price" class=""
								onblur="validatePrice()" maxlength="40" tabindex="3" /><br />
							<p id="priceError" class="text-danger col-sm-12"></p>
						</div>
					</div>
					<div class="form-group">
						<div class="input-group input-group-lg center-block">
							<label class="control-label col-sm-5" for="quantity">Quantity*
							</label> <input type="text" maxlength= "3" name="quantity" class=""
								onblur="validateQuantity()" maxlength="40" tabindex="4" /><br />
							<p id="quantityError" class="text-danger col-sm-12"></p>
						</div>
					</div>

					<div class="form-group">
						<div class="input-group input-group-lg center-block">
							<label class="control-label col-sm-5" for="image">Upload
								Picture* </label> <input type="file" name="image" id="image" class="col-sm-3"
								onblur="validateUpload()" /> <input type="text" id="putImage"
								name="putImage" placeHolder="File not uploaded yet." /><br />
							<p id="uploadError" class="text-danger col-sm-12"></p>
						</div>

					</div>


					<div class="form-group">
						<div class="input-group input-group-lg center-block">
							<label class="control-label col-sm-5" for="sample">Upload
								Sample* </label> <input type="file" name="sample" id="sample" class="col-sm-3"
								onblur="validateUpload()" /> <input type="text" id="putSample"
								name="putSample" placeHolder="File not uploaded yet." /><br />
							<p id="uploadError" class="text-danger col-sm-12"></p>
						</div>

					</div>

					<div>
						<input type="button" onclick="myUploadFunction()"
							value="Upload Files" />
					</div>

					<hr class="colorgraph">
					<div class="row">
						<div class="col-xs-12 col-md-6">
							<input type="submit" id="submit" value="Add Product"
								onclick="return validate()"
								class="btn btn-primary btn-block btn-lg" tabindex="4" disabled>
						</div>

					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>



<%-- <html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<title>Music Producer Home Page</title>
</head>
<body>

	<form:form method="post" commandName="fileUpload" modelAttribute="fileUpload"
		action="aMTC.do" name="addMusic">
		<fieldset>

			<!-- Form Name -->
			<legend>Add Music</legend>

			<!-- Select Basic -->
			<div class="form-group">
				<div id="info">
					<p id="errormsg" class="text-danger"></p>
				</div>
				<label class=" control-label" for="selectbasic">Select
					Category</label>
				<div class="">
					<select id="selectbasic" name="selectedGenre" class="form-control">
						<option value="1">Option one</option>
						<option value="2">Option two</option>
					</select>
				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class=" control-label" for="musicName">Painting
					Name</label>
				<div class="">
					<form:input path="musicName" id="musicName"
						name="musicName" class="form-control input-md" type="text"
						maxlength="100" onblur="validateMusicName()" />
					<p id="musicNameError" class="text-danger"></p>
				</div>
			</div>

			<!-- Textarea -->
			<div class="form-group">
				<label class="control-label" for="description">Description</label>
				<div class="">
					<form:input path="description" id="description" name="description"
						class="form-control input-md" type="text" maxlength="100" />

				</div>
			</div>


			<!-- Price input-->
			<div class="form-group">
				<label class=" control-label" for="price">Price</label>
				<div class="">
					<form:input path="price" id="price" name="price"
						class="form-control input-md" type="text" onblur="validatePrice()" />
					<p id="priceError" class="text-danger"></p>
				</div>
			</div>



			<!-- File Button -->
			<div class="form-group">
				<label class=" control-label" for="filebutton">Upload
					Picture</label>
				<div class="">
					<form:input path="image" id="filebutton" name="filebutton"
						class="input-file" type="file" />
				</div>
			</div>

			<div class="form-group">
				<label class=" control-label" for="filebutton">Upload Sample</label>
				<div class="">
					<form:input path="sample" id="filesample" name="filesample"
						class="input-file" type="file" />
				</div>
			</div>

			<!-- Button -->
			<div class="form-group">
				<div class="">
					<!-- <input type = "submit" class="btn" id="singlebutton" name="signup" value="Sign Up Me!" onclick = "return validate()"/> -->
					<button id="singlebutton" name="singlebutton"
						class="btn btn-primary" onclick="return validate()">Add
						and Save</button>
				</div>
			</div>


		</fieldset>
	</form:form>
</body>
</html> --%>





<%-- THIS IS LATEST vvvvvvvvvvvvv 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<title>Music Producer Home page</title>
<style>
html, body {
	height: 100%;
	width: 100%;
	background-image: url("images/21.jpg");
	background:cover;
}

.well {
	padding: 0px 25px 0px 25px;
	background-color: black;
	 /* opacity: 0.5;  */
	border-radius: 5px;

	
}

#big-form{
	/* width:40%; */
}


</style>
</head>
<body>

	<div class="container auth">
		<h1 class="text-center">
			Boom Box
		</h1>
		<div id="big-form" class="well auth-box opaque">
			<form name="addMusic" class="myform" action="addMusicToCategory.do" method="post" enctype="multipart/form-data">
				<fieldset>

					<!-- Form Name -->
					<legend>Add Music</legend>

					<!-- Select Basic -->
					<div class="form-group">
						<div id="info">
							<p id="errormsg" class="text-danger"></p>
						</div>
						<label class=" control-label" for="selectedGenre">Select
							Category</label>
						<div class="">
							<select id="selectedGenre" name="selectedGenre" class="form-control">
								<c:forEach var="item" items="${listGenre}">
									<option value="${item}">${item.name}</option><br>
								</c:forEach>
							</select>
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class=" control-label" for="musicName">Music Name</label>
						<div class="">
							<input id="musicName" name="musicName"
								class="form-control input-md" type="text" maxlength="100"
								onblur="validateMusicName()">
							<p id="musicNameError" class="text-danger"></p>
						</div>
					</div>

					<!-- Textarea -->
					<div class="form-group">
						<label class=" control-label" for="textarea">Description</label>
						<div class="">
							<textarea class="form-control" id="description" maxlength="200"
								name="description" placeholder="Add here description"></textarea>
						</div>
					</div>


					<!-- Password input-->
					<div class="form-group">
						<label class=" control-label" for="price">Price</label>
						<div class="">
							<input id="price" name="price" class="form-control input-md"
								type="text" onblur="validatePrice()">
							<p id="priceError" class="text-danger"></p>
						</div>
					</div>
					

					<div class="form-group">
						<label class=" control-label" for="quantity">Quantity</label>
						<div class="">
							<input id="quantity" name="quantity" class="form-control input-md"
								type="text" onblur="validateQuantity()">
							<p id="quantityError" class="text-danger"></p>
						</div>
					</div>


					
	<!-- 				<div class="form-group">
						<label class=" control-label" for="availability">Availability</label>
						<div class="">
							<input id="availability" name="availability" class="form-control input-md"
								type="text" onblur="validateAvailability()">
							<p id="availabilityError" class="text-danger"></p>
						</div>
					</div> -->






					<!--  <div class="form-group">
            <label class=" control-label" for="passwordinput">Quantity</label>
            <div class="">
              <input id="passwordinput" name="passwordinput" class="form-control input-md" type="text">
            </div>
          </div> -->
					<!-- File Button -->
					<div class="form-group">
						<label class=" control-label" for="image">Upload Picture</label>
						<div class="">
							<input id="filebutton" name="image" class="input-file"
								type="file">
						</div>
					</div>
					
					
					<div class="form-group">
						<label class=" control-label" for="sample">Upload Sample</label>
						<div class="">
							<input id="filebutton" name="sample" class="input-file"
								type="file">
						</div>
					</div>
					
					<input type="hidden" name="supplierName" value="${supplierName}" />


					<!-- Button -->
					<div class="form-group">
						<div class="">
							<!-- <input type = "submit" class="btn" id="singlebutton" name="signup" value="Sign Up Me!" onclick = "return validate()"/> -->
							<button id="singlebutton" name="singlebutton"
								class="btn btn-primary" onclick="return validate()">Add
								and Save</button>
						</div>
					</div>


				</fieldset>
			</form>
			<form:form method="post" commandName="music" action="addMusicToCategory.go" name="addMusic">
        <fieldset>

          <!-- Form Name -->
          <legend>Add Music</legend>

		  <!-- Select Basic -->
          <div class="form-group">
           <div id ="info"> <p id="errormsg" class="text-danger"></p></div>
            <label class=" control-label" for="selectGenre">Select Genre</label>
            <div class="">
              <select id="selectGenre" name="selectGenre" class="form-control">
                <option value="1">Option one</option>
                <option value="2">Option two</option>
              </select>
            </div>
          </div>
          
          <!-- Text input-->
          <div class="form-group">
            <label class=" control-label" for="musicName">Painting Name</label>  
            <div class="">
              <form:input path="paintingName" id="paintingName" name="paintingName" class="form-control input-md" type="text" maxlength ="100" onblur="validatePaintingName()"/>
              <p id="musicNameError" class="text-danger"></p>
            </div>
          </div>

			<!-- Textarea -->
          <div class="form-group">
            <label class="control-label" for="description">Description</label>
            <div class=""> 
                <form:input path="description" id="description" name="description" class="form-control input-md" type="text" maxlength ="100"/>
              
            </div>
          </div>
			
			
          <!-- Password input-->
          <div class="form-group">
            <label class=" control-label" for="price">Price</label>
            <div class="">
              <form:input path="price" id="price" name="price" class="form-control input-md" type="text"  onblur="validatePrice()"/>
              <p id="priceError" class="text-danger"></p>
            </div>
          </div>
          
         

           <!-- File Button --> 
          <div class="form-group">
            <label class=" control-label" for="filebutton">Upload Picture</label>
            <div class="">
              <form:input path="image" id="filebutton" name="filebutton" class="input-file" type="file"/>
            </div>
          </div>
          
          <div class="form-group">
            <label class=" control-label" for="filebutton">Upload Sample</label>
            <div class="">
              <form:input path="sample" id="filesample" name="filesample" class="input-file" type="file"/>
            </div>
          </div>
          
         
          <!-- Button -->
          <div class="form-group">
            <div class="">
            <!-- <input type = "submit" class="btn" id="singlebutton" name="signup" value="Sign Up Me!" onclick = "return validate()"/> -->
               <button id="singlebutton" name="singlebutton" class="btn btn-primary"  onclick = "return validate()">Add and Save</button>
            </div>
          </div>
         

        </fieldset>
      </form:form>
		</div>
		<div class="clearfix"></div>
	</div>
</body>
</html> --%>