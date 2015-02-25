$(document).on("ready page:load", function() {
	$("#search-form").submit(function(event) {
		event.preventDefault();
		var searchValue = $("#search").val();

		/* 
		jQuery AJAX Version

		$.ajax({
			url: "/products?search=" + searchValue,
			type: "GET",
			dataType: "html"
		}).done(function(data) {
			$("#products").html(data);
		});*/

		/* 
		// inside the submit event callback, replace the $.ajax portion with the following
    $.get("/products?search=" + searchValue)
    	.done(function(data) {
    		console.log(data);
    		$("#products").html(data);
    	});*/
	});
});