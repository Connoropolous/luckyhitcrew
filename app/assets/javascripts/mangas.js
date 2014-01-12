$(document).ready(function(){

	$('#delete-confirm').on('show', function() {
	  var $submit = $(this).find('.btn-danger'),
	      href = $submit.attr('href');
	  
	  $submit.attr('href', href.replace('pony', $(this).data('id')));
	});

	$('.delete-confirm').click(function(e) {
	  e.preventDefault();
	  $('#delete-confirm').data('id', $(this).data('id')).modal('show');
	});

	$('.auto-submit-star').rating({
		callback: function(value, link){
			$.ajax({
				type: 'post',
				url: 'mangas/rate',
				dataType: 'json',
				data: { manga_rating: value }
			});
		}
	});

});