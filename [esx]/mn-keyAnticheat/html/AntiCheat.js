window.addEventListener('message', (event) => {
    let item = event.data;
    if (item.action == "open") {
        openSystem(item)
    }
});



const openSystem = (data) => {
    $(".inner").fadeOut(1000)
    $(".container").fadeIn(1000);
    $('.loading').fadeIn(1000, () => {
        setTimeout(() => {
            loadBans(data.bans)
            $(".loading").fadeOut(1000)
            $(".inner").fadeIn(1000)
        }, 2000)
    })
}

function search_identifier() {
    let input = document.getElementById('searchbar').value
    input=input.toLowerCase();
    let x = document.getElementsByClassName('identifier');
      
    for (i = 0; i < x.length; i++) { 
        if (x[i].children[1] != null) {
            if (!x[i].children[1].innerHTML.toLowerCase().includes(input)) {
                x[i].style.display="none";
            }
            else {
                x[i].style.display="";                 
            }
        }
    }
}

const loadBans = (bans) => {
    let id = 1 
    $(".banTable").html("<tr><th>Steamnaam</th><th>SteamIdentifier</th><th>Injected Resource</th><th>Unban</th></tr>")               

    bans.forEach(el => {
        identifierString = el.identifiers[0]
        let x = (`<tr class="identifier"><td>${el.steamname}</td><td class="identifier">${identifierString}</td><td>${el.resource}</td><td class="btn"><Button class="unban-btn" onclick="unban(${id})" >Unban</Button></td>`)
        $(".banTable").append(x);
        id++
    });
}


const unban = (id) => {
    $.post("https://mn-keyAnticheat/unbanPlayer", JSON.stringify({
        id: id
    }))
    $.post('https://mn-keyAnticheat/close', JSON.stringify({}))
    
}





$(document).ready(()  => {
    $(".container").hide();
})


$(document).on('keydown', function() {
    switch(event.keyCode) {
        case 27:
            $.post('https://mn-keyAnticheat/close', JSON.stringify({}))
            $(".inner").fadeOut(1000)
            $(".container").fadeOut(1000);
        break; 
    }
})
  
