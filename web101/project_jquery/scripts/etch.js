var userNumber = prompt("Select a canvas size:");

if(userNumber < 10) {
	userNumber = 10;
}
else if(userNumber > 30) {
	userNumber = 30;
}
else if(isNaN(userNumber)) {
	userNumber = 20;
};

var grid = userNumber*userNumber;
var penColor = "pink";

console.log("hello");

$(document).ready(function() {
	for(i = 0; i < grid; i++) {
	$("#canvas").append("<div class='canvasBox'></div>");
		if(((i-1) % userNumber) === 0){
			$("div.canvasBox:nth-child(" + i + ")").css("clear","both");
		};
	};


	$("div.canvasBox").hover(function(){
		$(this).css("background-color",penColor);
	});


	$('div.colorPick').click(function() {
    	var x = $(this).css('backgroundColor');
    	hexc(x);
	});

	function hexc(colorval) {
    	var parts = colorval.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);
    	delete(parts[0]);
    	for (var i = 1; i <= 3; ++i) {
        	parts[i] = parseInt(parts[i]).toString(16);
        	if (parts[i].length == 1) parts[i] = '0' + parts[i];
    	}
    	penColor = '#' + parts.join('');
	};


});



