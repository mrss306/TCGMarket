<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*,model.ProductBean,model.Cart,model.ItemOrder"
	pageEncoding="UTF-8"%>
<%
if (session == null || session.getAttribute("currentSessionUser") == null) {
%>
<%@ include file="./fragments/header.jsp"%>
<%
} else {
%>
<%@ include file="./fragments/headerlogged.jsp"%>
<%
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="./style/style.css" rel="stylesheet" type="text/css">
<title>Carrello</title>
</head>
<body>

	<%
	Cart cart = (Cart) session.getAttribute("cart");
	String itemID = request.getParameter("itemID");
	if (itemID != null) {
		String numItemsString = request.getParameter("numItems");
		if (numItemsString != null) {
			int numItems;
			try {
		numItems = Integer.parseInt(numItemsString);
			} catch (NumberFormatException nfe) {
		numItems = 1;
			}
			cart.setNumOrdered(Integer.parseInt(itemID), numItems);

		}

	}
	%>

	<%
	if (cart != null) {
	%>
	<h2>Carrello</h2>
	<div class=details>
	<table >
	<thead class=details>
		<tr>
			<th>Articolo:</th>
			<th>Quantità:</th>
			<th>Prezzo:</th>
			<th>Azioni:</th>
		</tr>
</thead>
		<%
		List<ItemOrder> prodcart = cart.getProducts();
		float prezzo_finale = 0;
		for (ItemOrder beancart : prodcart) {
		%>
	<tbody class=details>
		<tr>
			<td><%=beancart.getNome()%></td>
			<td><form>
					<INPUT type="hidden" name=itemID value=<%=beancart.getId()%>>
					<INPUT TYPE=TEXT NAME=numItems SIZE=3
						VALUE=<%=beancart.getNumItems()%>> <INPUT TYPE=SUBMIT
						VALUE=Update>
				</form></td>
			<td><%= String.format("%.2f", beancart.getTotalCost()) %> &euro;</td>
			<td><a href="product?action=deleteC&id=<%=beancart.getId()%>">Elimina
					dal carrello</a></td>
		</tr>
		</tbody>
		<%
		prezzo_finale += beancart.getTotalCost();
		
		%>
		
		<%
		}
		%>
		<tfoot class=cart> 
		
		<tr>
		<th  colspan=2>Totale: </th>
		<td> <%=String.format("%.2f", prezzo_finale)  %> &euro;</td>
		</tr>
		</tfoot>
	</table>
	<br>
	<%if (!cart.IsEmpty()) {%>
	<div class=wrapper>
	<form class=cart action="./CheckoutPage.jsp" method="get" id="checkout">
	<button class=btn type="submit">Checkout</button>
	</form>
	</div>
	<%} %>
	</div>
	<%
	}
	%>
	
</body>
<%@ include file="./fragments/footer.html" %>
</html>