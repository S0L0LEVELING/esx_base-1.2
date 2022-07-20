var dumpdata; 
var counter = 1; 

function keyPressed(e) {
	var key; 
	const enterKey = 13; 
	const textinput = document.getElementById("terminalinput").value; 

	if (window.event) {
		key = e.keyCode; 
		if (key == enterKey) { 
			if (counter == 1) { 
				$.post("https://boomba-hackingsystem/commandentered", JSON.stringify({ textinput }))
			} 
			if (key == enterKey && counter == 2) { 
				document.querySelector("#terminalinput").value = "C:\Program Files: ";
				counter = 1  
			} 
		}
	}
	return e.keyCode != 13;
}

$(function(){
	function display(bool) {
        if (bool) {
            $("#container").show();
        } else {
            $("#container").hide();
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
    })
    // if the person uses the escape key, it will exit the resource
    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post('https://boomba-hackingsystem/exit', JSON.stringify({}));
            return
        }
    };
    $("#close").click(function () {
        $.post('https://boomba-hackingsystem/exit', JSON.stringify({}));
        return
    })
	window.addEventListener('message', (event) => {
		var item = event.data;
		if (item !== undefined && item.type === "datadump") {
			dumpdata = event.data.dump 
			if (document.querySelector("#terminalinput").value = "C:\Program Files: sudo") {
				document.querySelector("#terminalinput").value = "C:\Program Files: " + dumpdata; 
				counter = 2
			}
		}
	}); 
})


