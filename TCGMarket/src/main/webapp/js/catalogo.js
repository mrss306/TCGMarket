/**
 * 
 */
console.log("ready");

$(document).ready(function(event) {
	console.log("ready");
	$("input[type=checkbox]").change(function(event) {
		console.log("ready");
		$.post("./Visibility", { "id": $(this).val(), "visible": $(this).is(':checked') }, function(data) {


		}, 'JSON');
	});

	$(".btn-det").click(function(event) {
		var row = $(this).closest('tr');
		var Newid = row.find('.new').val();
		var Oldid=row.find('.old').val();
		var nome = row.find('.nome').val();
		var prezzo = row.find('.prezzo').val();
		var quantita = row.find('.quantita').val();
		var saldo = row.find('.saldo').val();
		var data = row.find('.data').val();
		var descrizione = row.find('.descrizione').val();
		
console.log(Newid);
console.log(Oldid);


		$.post("./CatalogueUpdate", {
			"Newid": Newid, "nome": nome,
			"prezzo": prezzo, "quantita": quantita, 
			"saldo": saldo, "data": data, "descrizione": descrizione,
			"Oldid":Oldid
		}, function(data) {



		});




	})


}
)