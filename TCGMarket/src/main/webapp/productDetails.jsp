<%@ page contentType="text/html; charset=ISO-8859-1" import="java.util.*,model.ProductBean,model.Cart, model.ItemOrder"%>
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
    
<%
	
	ProductBean product = (ProductBean) request.getAttribute("product");
	
	Cart cart = (Cart) request.getAttribute("cart");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="./style/style.css" rel="stylesheet" type="text/css">
<title>Dettagli</title>

</head>

<body>
		<h2>Dettagli</h2>
	<%
		if (product != null) {
	%>
	
	<div class=details>
	<table>
	<thead class=details>
		<tr>
			<th>Nome</th>
			<th>Prezzo</th>
			<th>Saldo</th>
			<th>Data di uscita</th>
			<th>Descrizione</th>
			<th>Quantit�</th>
		</tr>
		</thead>
		
		<tbody class=details>
		<tr>
			<td><%=product.getNome()%></td>
			<td><%=String.format("%.2f", product.getPrezzo())   %> &euro;</td>
			<td><%=product.getSaldo()%></td>
			<td><%=product.getData_uscita()%></td>
			<td><%=product.getDescrizione()%></td>
			<td><%=product.getQuantit�()%></td>
		</tr>
		</tbody>
	</table>
	
	<br>
	
	<div class="wrapper">
	<form class=details action="product?action=addC&id=<%=product.getId()%>" method="post" id="checkout">
	<button class=btn type="submit">Aggiungi al carrello</button>
	</form>
	</div>
	</div>

<%
	}
%>
	
</body>
<%@ include file="./fragments/footer.html"%>
</html>