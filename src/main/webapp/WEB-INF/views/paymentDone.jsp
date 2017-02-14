<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment Done successfully</title>
</head>
<body>
<h1><b>Payment details Successfully added to DataBase!<br/>
		You Order will be shipped soon!</b></h1>
		
<form method="get" action="viewPdf.do" >

<input type="hidden" name="orderId" value="${orderId}" />
<input type="hidden" name="paymentId" value="${paymentId}" />


<input type="submit" name="submit" value="Genrate Invoice PDF" />

</form>

<br>
<h4>Click <a href="goToHome.do">here</a> to go back to Home page.</h4>
</body>
</html>