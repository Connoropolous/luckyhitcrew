$(document).ready(function(){
	var pages = $('.chapter-page');

	pages.first().attr('data-active', 'true');

	var hide_page = function(page) {
		page.attr('data-active', 'false');
		page.hide();
	};

	var show_page = function(page) {
    $('#last_chapter').hide();
		page.attr('data-active', 'true');
		page.show();
	};

	var hide_all = function(objs) {
		objs.each(function() {
			if ($(this).attr('data-active') == 'false') {
				hide_page($(this));	
			}
		});
	};

// Navigating to another chapter	

	var chapters = $('#chapter-dropdown a');

	$('#last_chapter').hide();
	var current_chapter_title = $('#current_chapter_title').text();
	var current_chapter_dropdown = $('#chapters-dropdown').find("a[data-name='" + current_chapter_title + "']");
	var current_chapter_index = $.inArray(current_chapter_dropdown[0], chapters);
	
	var next_chapter = function(){
		if (chapters[current_chapter_index - 1] == undefined){
			var active = $('[data-active="true"]');
			hide_page(active);
			$('#last_chapter').show(); 
		}
		else {	
			var next_chapter_url = chapters[current_chapter_index - 1].href;
			window.location.href = next_chapter_url			
		}
	};

	var previous_chapter = function(){
		if (chapters[current_chapter_index + 1] == undefined){
			// do nothing
		}
		else {	
			var previous_chapter_url = chapters[current_chapter_index + 1].href;
			window.location.href = previous_chapter_url			
		}
	};
	////////////////////////////////
	
	hide_all(pages);

	var	show_next = function() {
		var active = $('[data-active="true"]');
		var next_page = $('[data-active="true"]').next();
		if (next_page.length < 1 ) {
			next_chapter();
		}
		else {
			hide_page(active);
			show_page(next_page);
		}
	};

	var show_previous = function () {
		var active = $('[data-active="true"]');
		var previous = $('[data-active="true"]').prev();
		if (previous.length < 1 ) {
			previous_chapter();
		}
		else {
			hide_page(active);
			show_page(previous);
		}

	};

	pages.click(function (){
		show_next();
    event.preventDefault();
	});
  
  $("#chapters > a").click(function(event) {
    $("#pages ul").hide();
    $("#chapters ul").show();
    event.preventDefault();
    event.stopPropagation();
  });
  $("#pages > a").click(function(event) {
    $("#chapters ul").hide();
    $("#pages ul").show();
    event.preventDefault();
    event.stopPropagation();
  });

	$("#chapter-previous-page").click(function(event) {
		show_previous();
    event.preventDefault();
	});

	$("#chapter-next-page").click(function(event) {
		show_next();
    event.preventDefault();
	});

	$("body").keydown(
		function(event){
			if (event.which == 39 ) { show_next(); }
			else if (event.which == 37 ) { show_previous(); }
		});
   
  $("html").click(function() {
    $("#chapters ul, #pages ul").hide();
  });

	$("li.page-dropdown a").click(function(event){
    $("#chapters ul, #pages ul").hide();
		var active = $('[data-active="true"]');
		var n = parseInt($(this).text());
		var nextPage = $("div[id*='" + n + "']");
		hide_page(active);
		show_page(nextPage);
    event.preventDefault();
	});

	$('.edit-chapter-pages').on('ajax:success', 'a', function(event, data){
		pageToRemove = "img[src*='" + data.pagename + "']" 
		$(pageToRemove).parent().remove();
	});


});