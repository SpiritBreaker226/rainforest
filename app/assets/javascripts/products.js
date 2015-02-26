$(document).on("ready page:load", function() {
	$("#search-form").submit(function(event) {
		event.preventDefault();
		var searchValue = $("#search").val();

		// inside the submit event callback, replace the $.get portion with the following
		$.getScript("/products?search=" + searchValue);
	});

	if ($(".pagination").length) {
		$(window).scroll(function() {
			var url = $(".pagination span.next > a").attr("href");

			if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
				$(".pagination").text("Fetching more products...");
				return $.getScript(url);
			}
		});
	}
});