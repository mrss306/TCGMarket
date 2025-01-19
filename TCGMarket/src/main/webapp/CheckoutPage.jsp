<%@page import="org.apache.tomcat.jni.Address"%>
<%@page import= "model.*" %>
<%@page import="model.AddressDAO"%>
<%@page import="model.AddressBean"%>
<%@page import="java.util.*"%>
<%@page import="model.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="NewFile.css" rel="stylesheet" type="text/css">
<title>Checkout</title>
</head>
<body>
	<%
	UserBean user = (UserBean) session.getAttribute("currentSessionUser");
	AddressDAO addressDAO = new AddressDAO();
	PaymentMethodDAO paymentMethodDAO = new PaymentMethodDAO();
	%>
	<h1>Riepilogo dell'ordine</h1>
	
	<div class=checkout>
		<table>
			<thead class=checkout>
				<tr>
					<th>Indirizzo di consegna:</th>
				</tr>
			</thead>
		<% 
		List<AddressBean> addresses = addressDAO.getAddresses(user);
		List<String> indirizzi= new ArrayList<String>();
		for (AddressBean address : addresses) {
		String indirizzo;
		indirizzo=address.getVia()+" " + address.getNumero_civico()+" " +  address.getCitt�()+" " + address.getProvincia()+" " + address.getCap();
		indirizzi.add(indirizzo);	
		}
		%>
		<%for(String indirizzo : indirizzi) 
		{%>
			<tbody>
				<tr>
				<td><%=indirizzo%></td>
				</tr>
			
	
			
			<%}%>
			</tbody>
			</table>
	</div>
	<br>
	<div class=checkout>
		<table class=checkout>
				<tr>
					<th>Metodo di pagamento:</th>
					<td>
					<select name="met_pagamento">
						<option value=1>Carta 0000</option>
						<option value=2>Carta 1111</option>
					</select>
					</td>
				</tr>
		</table>
	</div>
	<br>
	<div class=checkout>
		<table class=checkout>
			<thead>
				<tr>
					<th>Rivedi gli articoli</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>wip</td>
				</tr>
			</tbody>
		</table>
	</div>
	<br>
	
	
	
	
	
	
	<!-- questo tasto serve solo per arrivare alla pagina
		 per inserire un nuovo indirizzo -->
	<div class=wrapper>
		<form action="AddressRegistration.jsp">
		<button class=btn type="submit" formaction="AddressRegistration.jsp">Inserisci un indirizzo</button>
		</form>
	</div>
	
	
	</body>
</html>