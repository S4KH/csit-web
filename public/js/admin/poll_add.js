/**
 * 
 */
var n=0;
$(document).ready(function() {
	$("#addVote" ).click(function() {
		$('#ansbox').append('<option value="'+n+'">'+$('#vote').val()+'</option>');
		$('#answers').val($('#answers').val()+$('#vote').val()+'&^');
		n++;
	});
});
