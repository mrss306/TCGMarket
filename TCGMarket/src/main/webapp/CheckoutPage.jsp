<%@page import="model.AddressDAO"%>
<%@page import="model.AddressBean"%>
<%@page import="java.util.List"%>
<%@page import="model.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout</title>
</head>
<body>
	<%
	UserBean user = (UserBean) session.getAttribute("currentSessionUser");
	%>
	<div class=indirizzo>
		<h3>Indirizzo di consegna</h3>
<%
if (user != null) {
		
		List<AddressBean> addresses = AddressDAO.getAddresses(user);
		for (AddressBean address : addresses) {
		
	}
	}
%>
	</div>
</body>
</html>