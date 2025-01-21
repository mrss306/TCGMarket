<%@page import="java.util.List"%>
<%@page import="java.util.LinkedList"%>
<%@page import="model.OrderBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%
if (session == null || session.getAttribute("currentSessionUser") == null) {
%>
<%@ include file="../fragments/header.jsp"%>

<%
} else {
%>
<%@ include file="../fragments/headerlogged.jsp"%>
<%
}
%>
<!DOCTYPE html>
<html>
<head>
<style>


</style>
<link href="./style/style.css" rel="stylesheet" type="text/css">
<title>Archivio ordini admin</title>
</head>
<body>
	<%
	List<OrderBean> ordini = new LinkedList<OrderBean>();
	ordini = (LinkedList<OrderBean>) session.getAttribute("ordini");
	if (ordini != null) {
		for (OrderBean ordine : ordini) {
	%>

	<table>
		<thead>
			<tr>
				<th>Codice ordine:</th>
				<th>Data:</th>
				<th>Importo totale:</th>
				<th>Identificativo:</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><a
					href="Ordine?action=mostradettagli&codice=<%=ordine.getId()%>"><%=ordine.getId()%></a>
				</td>
				<td><%=ordine.getData_ordine()%></td>
				<td><%=ordine.getCosto_totale()%> &euro;</td>
				<td><%=ordine.getUsername()%> </td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<%
	} else {
	%>
	<h2>Nessun ordine registrato</h2>
	<%
	}
	%>
	<div class="date_input">
	<form action=OrderArchive >
		<INPUT type="date" name="startdate"> <INPUT type="date"
			name="enddate"> <INPUT type="submit" value="cerca">
	</form>
</div>

<div>
	<form action=OrderArchive>
		<INPUT type="text" name="username"> <INPUT type="submit"
			value="cerca">
	</form>
	
	</div>
</body>
</html>