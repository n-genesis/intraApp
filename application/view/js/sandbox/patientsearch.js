/**
 * @author andrewnite
 * 
 * ***************************
 * NOT USED AT THIS TIME!!!!!
 * ***************************
 */

/* Search */
$('#search input[name=\'search\']').parent().find('button').on('click', function() {
	var url = $('base').attr('href') + 'index.php?route=product/search';

	var value = $('header input[name=\'search\']').val();

	if (value) {
		url += '&search=' + encodeURIComponent(value);
	}

	location = url;
});

$('#search input[name=\'search\']').on('keydown', function(e) {
	if (e.keyCode == 13) {
		$('header input[name=\'search\']').parent().find('button').trigger('click');
	}
}); 