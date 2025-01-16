<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,model.ProductBean,model.Cart, model.ItemOrder"%>
    
<%
	
	
	ProductBean product = (ProductBean) request.getAttribute("product");
	
	Cart cart = (Cart) request.getAttribute("cart");
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Dettagli</title>
</head>
<body>
		<h2>Dettagli</h2>
	<%
		if (product != null) {
	%>
	<table border="1">
		<tr>
			<th>Id</th>
			<th>Nome</th>
			<th>Prezzo</th>
			<th>Saldo</th>
			<th>Data di uscita</th>
			<th>Descrizione</th>
			<th>Quantità</th>
		</tr>
		<tr>
			<td><%=product.getId()%></td>
			<td><%=product.getNome()%></td>
			<td><%=product.getPrezzo()%></td>
			<td><%=product.getSaldo()%></td>
			<td><%=product.getData_uscita()%></td>
			<td><%=product.getDescrizione()%></td>
			<td><%=product.getQuantità()%></td>
			<td><a href="product?action=addC&id=<%=product.getId()%>">Aggiungi al carrello</a></td>
		</tr>
	</table>
	<%
		}
	%>
</body>
</html>