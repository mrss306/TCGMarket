<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="./fragments/header.jsp" %>

<%
Collection<?> products = (Collection<?>) request.getAttribute("products");
if (products == null) {
	response.sendRedirect("./product");
	return;
}
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*,model.ProductBean,model.Cart, model.ItemOrder"%>
	

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="./style/style.css" rel="stylesheet" type="text/css">
<title>TCGMarket</title>

</head>

<body>


	<h2>Prodotti</h2>

	<table>
		<thead class=catalogo>
			<tr>
				<th><a href="product?sort=id">Id </a></th>
				<th><a href="product?sort=nome">Nome</a></th>
				<th><a href="product?sort=prezzo">Prezzo</a></th>
				<th><a href="product?sort=quantita">Quantita'</a></th>
				<th>Azioni</th>
			</tr>
		</thead>
		<tbody class=catalogo>
			<%
			if (products != null && products.size() != 0) {
				Iterator<?> it = products.iterator();
				while (it.hasNext()) {
					ProductBean bean = (ProductBean) it.next();
			%>
			<tr>
				<td><%=bean.getId()%></td>
				<td><%=bean.getNome()%></td>
				<td><%=bean.getPrezzo()%> &euro;</td>
				<td><%=bean.getQuantità()%></td>
				<td><a href="product?action=read&id=<%=bean.getId()%>">Dettagli</a><br>
					<a href="product?action=addC&id=<%=bean.getId()%>">Aggiungi al
						carrello</a></td>
			</tr>

			<%
			}
			} else {
			%>
			<tr>
				<td colspan="6">Nessun prodotto disponibile</td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>



</body>

<%@ include file="./fragments/footer.html" %>
</html>