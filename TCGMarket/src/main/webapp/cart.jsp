<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="java.util.*,model.ProductBean,model.Cart,model.ItemOrder"
	pageEncoding="ISO-8859-1"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Carrello</title>
</head>
<body>

<%
	
	Cart cart = (Cart) session.getAttribute("cart");
%>

<%
if (cart != null) {
%>
	<h2>Carrello</h2>
	<table border="1">
	<tr>
		<th>Articolo:</th>
		<th>Prezzo:</th>
		<th>Numero:</th>
		<th>Azioni</th>
	</tr>
	<%
			List<ItemOrder> prodcart = cart.getProducts();
			for (ItemOrder beancart : prodcart) {
		%>
	<tr>
		<td><%=beancart.getNome()%></td>
		<td><%=beancart.getPrezzo()%> Euro</td>
		<td>  <input type=number value=<%=beancart.getNumItems() %>></td>
		<td><a href="product?action=deleteC&id=<%=beancart.getId()%>">Elimina
				dal carrello</a></td>
	</tr>
	<%
	}
	%>
</table>
<%
}
%>
</body>