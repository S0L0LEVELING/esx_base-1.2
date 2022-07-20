$(document).ready(function(){
    $(".container").hide();
    $(".aangiftescherm").hide();
    $(".aangiftescherm-specifiek").hide();
    $(".aangiftescherm-aanmaken").hide();
    $(".inbeslagname-voertuig").hide();
    $(".kledingkamer").hide();
    $(".boss-actions-user").hide();
    $(".proces-verbaal").hide();
    $(".boss-actions").hide();
    $(".boss-actions-kluis").hide();
    $(".amount-notify").hide(100);
    $(".boss-actions-personeel").hide();
    $(".job-notify").hide();
    $(".add-user-container").hide();
    window.addEventListener('message', function(event){
        switch(event.data.action) {
            case "Wapenkameropen":
                OpenWapenKamer(event.data.wapens);
                break;
            break;
            case "Aangifteopen": 
                OpenAangiftescherm(event.data.aangiftes, event.data.steamnaam)
            break;
            case "bekijkaangifte": 
                OpenAangifteSpecifiek(event.data.data, event.data.steamnaam)
            break;
            case "maakaangifte": 
                Nieuwaangiftemaken()
            break;
            case "inbeslagnamevoertuig":
                InbeslagnameOpenen(event.data)
            break;
            case "Kledingkamer":
                OpenKledingkamer(event.data.kleding)
            break;
            case "bekeuren":
                OpenBekeuringen(event.data)
            break;
            case "bossmenu":
                OpenBossMenu();
            break;
        }
    });
});


function OpenBossMenu() {
    $(".boss-actions").fadeIn();
}


$(".kluis").click(function(){
    $(".boss-actions").fadeOut();
    $(".boss-actions-kluis").fadeIn();
    $.post("http://mn-policejob/GetSafeAmount", null, function(amount){
        $(".boss-actions-kluis").fadeIn();
        $("#kluis-amount").text("€" + amount)
    });
})



$(".personeel").click(function(){
    $(".boss-actions").fadeOut();
    $(".boss-actions-personeel").fadeIn();


    $.post("http://mn-policejob/GetAllEmployees",null , function(Employees) {
        str = JSON.stringify(Employees, null, 4); // (Optional) beautiful indented output.
        console.log(str); // Logs output to dev tools console.
        for (i = 0; Employees.length; i++) 
        {
            if (Employees[i].profilepic === "default") {
                var k = (`<div class="user-info"><div class="user-picture"><img id="user-picture" src="./img/default.png" alt="" width="50px" height="50px"></div><div class="user-titel"><h1>`+ Employees[i].voornaam + ` `+ Employees[i].achternaam +`</h1></div><div class="user-job"><p>`+ Employees[i].job +` - `+ Employees[i].grade +`</p></div><div class="user-btn"><button onclick="BekijkPersoneel(`+ Employees[i].id +`)" class="button"><span>Bekijk </span></button></div></div>`);
                $(".boss-actions-personeel-grid").append(k).fadeIn();
            }
            else {
                var k = (`<div class="user-info"><div class="user-picture"><img id="user-picture" src="`+ Employees[i].profilepic + `" alt="" width="50px" height="50px"></div><div class="user-titel"><h1>`+ Employees[i].voornaam + ` `+ Employees[i].achternaam +`</h1></div><div class="user-job"><p>`+ Employees[i].job +` - `+ Employees[i].grade +`</p></div><div class="user-btn"><button onclick="BekijkPersoneel(`+ Employees[i].id +`)" class="button"><span>Bekijk </span></button></div></div>`);
                $(".boss-actions-personeel-grid").append(k).fadeIn();
            }
        }
    })
})



function BekijkPersoneel(id) {
    $.post("http://mn-policejob/GetEmployee",JSON.stringify({id: id}) , function(EmployeeData) {
        $(".boss-actions-user").fadeIn();
        $(".boss-actions-personeel").fadeOut();
        $("#boss-actions-user-pic").attr("src",EmployeeData.profilepic);
        $("#user-voornaam").text(EmployeeData.voornaam + " " + EmployeeData.achternaam);
        $("#user-job-text").text(EmployeeData.job + " - " + EmployeeData.grade);
        $("#user-voornaam2").text("Voornaam: " + EmployeeData.voornaam);
        $("#user-lastname").text("Achternaam: " + EmployeeData.achternaam);
        $("#user-fingerprint").text("Vingerafruk-id: " + EmployeeData.fingerprint);
        $("#user-bsn").text("BSN nummer: " + EmployeeData.citizenid);
    });
}

function Notify(method) {
    if (method == "opnemen" || method == "storten") {
        $(".amount-notify").animate({bottom: "80%"}, 1, function(){
            $(".amount-notify").fadeIn(100);
            $(".boss-actions").fadeOut();
            $(".boss-actions-kluis").fadeOut();
            $(".amount-notify").css("bottom","80");
            $(".amount-notify").animate({bottom: "0%"}, 1000, function(){
                    var k = (`<div class="notity-input"><input type="number" placeholder="amount..." id="notify-amount"></br></br><button id="button-input" style="padding: 10px; background-color: #004682; border: none; border-radius: 10px; font-family: 'Acrom-Bold'; color: white;" onclick="NotifyButtonPressed('`+ method +`')">Confirm</button></div>`)
                    $(".amount-notify").append(k).fadeIn();
            })
        })
    }
    else if (method == "bonus") {
        $(".amount-notify").animate({bottom: "80%"}, 1, function(){
            $(".amount-notify").fadeIn(100);
            $(".boss-actions").fadeOut();
            $(".boss-actions-user").fadeOut();
            $(".amount-notify").css("bottom","80");
            $(".amount-notify").animate({bottom: "0%"}, 1000, function(){
                    var k = (`<div class="notity-input"><input type="number" placeholder="amount..." id="notify-amount"></br></br><button id="button-input" style="padding: 10px; background-color: #004682; border: none; border-radius: 10px; font-family: 'Acrom-Bold'; color: white;" onclick="NotifyButtonPressed('`+ method +`')">Confirm</button></div>`)
                    $(".amount-notify").append(k).fadeIn();
            })
        })
    }
    else if (method == "job") {
        $(".job-notify").animate({bottom: "80%"}, 1, function(){
            $(".job-notify").fadeIn(100);
            $(".amount-job").fadeIn(100);
            $(".boss-actions").fadeOut();
            $(".boss-actions-user").fadeOut();
            $(".job-notify").css("bottom","80");
            $(".job-notify").animate({bottom: "0%"}, 1000, function(){
                $.post("http://mn-policejob/GetJobGrades", null , function(Grades) {
                    for (i=0; i < Grades.length; i++) {
                        var ddl  = $("#job_grades")
                        var x = (`<option value="`+ Grades[i].grade +`">`+ Grades[i].label +`</option>`);
                        ddl.append(x).fadeIn();
                    }
                })
            })
        })
    }
}


function Ontslaan() {
    CloseEverything();
    $.post("http://mn-policejob/OntslaPersoneel")
}

function OpenAannemen() {
    CloseEverything();
    $(".boss-actions-personeel").fadeOut();
    $(".add-user-container").fadeIn();
    $.post("http://mn-policejob/GetPlayers", null, function(players) {
        for (i=0; i < players.length; i++) {
            var ddl  = $("#players");
            var x = (`<option value="`+ players[i].id +`">`+ players[i].name +`</option>`);
            ddl.append(x).fadeIn();  
        }
    })
}

function NeemAan() {
    const id = $('#players').find(":selected").val();
    $.post("http://mn-policejob/NeemPersoonAan", JSON.stringify({
        id: id
    }))
    CloseEverything();
}

function NotifyButtonPressed(type) {
    var val = $("#notify-amount").val();

    if (type == "opnemen") {
        if (val > 0) {
            $(".amount-notify").animate({bottom: "80%"}, 1000, function(){
                $(".amount-notify").fadeOut();
                $(".notity-input").remove();
                $.post("http://mn-policejob/RemoveMoneyToSafe",  JSON.stringify({
                    amount: val,
                    serverevent: "mn-policejob:server:removetoSafe"
                }), function(amount){
                    $(".boss-actions-kluis").fadeIn();
                    $("#kluis-amount").text("€" + amount)
                });
            })
        }
    }
    else if (type == "storten") {
        if (val > 0) {
            $(".amount-notify").animate({bottom: "80%"}, 1000, function(){
                $(".amount-notify").fadeOut();
                $(".notity-input").remove();
                $.post("http://mn-policejob/AddMoneyToSafe", JSON.stringify({
                    amount: val,
                    serverevent: "mn-policejob:server:addtoSafe"
                }), function(amount){
                    $(".boss-actions-kluis").fadeIn();
                    $("#kluis-amount").text("€" + amount)
                });
            })
        }
    }
    else if (type =="bonus") {
        if (val > 0) {
            $(".amount-notify").animate({bottom: "80%"}, 1000, function(){
                $(".amount-notify").fadeOut();
                $(".notity-input").remove();
                $.post("http://mn-policejob/geefBonus", JSON.stringify({
                    amount: val,
                }), function(amount){
                    $(".boss-actions-user").fadeOut();
                });
            })
        }
    }

    else if (type == "job") {
        const job_grade = $('#job_grades').find(":selected").val();
        $.post("http://mn-policejob/SetPlayerGrade", JSON.stringify({
            grade : job_grade
        }))
        CloseEverything();
    }
}


function OpenBekeuringen(data) {
    $(".proces-verbaal").fadeIn(250);
    $("#proces-text").val("");
    $("#boetes").append("<optgroup id='verkeers-boetes' label='Verkeers bekeuringen'></optgroup>")
    $("#boetes").append("<optgroup id='licht-boetes' label='Lichte overtredingen'></optgroup>")
    $("#boetes").append("<optgroup id='middel-boetes' label='Middel overtredingen'></optgroup>")
    $("#boetes").append("<optgroup id='zware-overtredingen' label='Zware Overtreding'></optgroup>")
    for (i=0; i < data.verkeers.length; i++) {
        var ddl = $("#verkeers-boetes");   
        const id = i + 1;
        ddl.append("<option value='Verkeers'>" + data.verkeers[i].label + "</option>");
    }

    for (i=0; i < data.lichte.length; i++) {
        var ddl = $("#licht-boetes");   
        const id = i + 1;
        ddl.append("<option value='lichte'>" + data.lichte[i].label + "</option>");
    }
    for (i=0; i < data.middel.length; i++) {
        var ddl = $("#middel-boetes");   
        const id = i + 1;
        ddl.append("<option value='middel'>" + data.middel[i].label + "</option>");
    }
    for (i=0; i < data.zwaar.length; i++) {
        var ddl = $("#zware-overtredingen");   
        const id = i + 1;
        ddl.append("<option value='zwaar'>" + data.zwaar[i].label + "</option>");
    }
}

function OpenAangiftescherm(data, steamnaam) {
    $(".nav-item-back").text("Welkom " + steamnaam)
    $(".aangiftescherm").fadeIn();
    for (i=0; i < data.length; i++) {
        var x = (`<div class='aangifte'><div class='aangifte-info'><h1 class='aangifte-titel'>`+ data[i].Titel + `</h1><p id='aangifte-infotekst'>Datum: `+ data[i].datum + `</p><p id='aangifte-infotekst'>Opgemaakt door: `+ data[i].steamnaam +`</p><p id='aangifte-infotekst'>Aangever: `+ data[i].aangevernaam +`</p> </div><div class='aangifte-button'><button onclick='Bekijkaangifte(`+data[i].id+`)' class='aangifte-but' value='Bekijk Aangifte'>Bekijk Aangifte</button></div></div>`);
        $(".aangiftescontainer").append(x).fadeIn(400);
    }
}

function OpenKledingkamer(data) {
    $(".kledingkamer").fadeIn();
    var defaultt = (`<div class="kledingstuk"><h1 style="color: #004682; font-family: 'Acrom-Bold'; font-size: xx-large; text-align: center;">Default Outfit</h1><div class="kledingstuk-btn" style="text-align: center;"><button onclick='TrekOutfitAan("default_outje")' style="align-self: center; padding: 15px; background-color: #004682; border-style: none; color: white;"  value='Outfit Aantrekken'>Outfit Aantrekken</button></div></div>`);
    $(".kleding-display").append(defaultt).fadeIn(400);
    for (i=0; i < data.length; i++) {
        const id = i + 1 
        var x = (`<div class="kledingstuk"><h1 style="color: #004682; font-family: 'Acrom-Bold'; font-size: xx-large; text-align: center;">`+ data[i].title + `</h1><div class="kledingstuk-btn" style="text-align: center;"><button onclick='TrekOutfitAan(` + id+ `)' style="align-self: center; padding: 15px; background-color: #004682; border-style: none; color: white;"  value='Outfit Aantrekken'>Outfit Aantrekken</button></div></div>`);
        $(".kleding-display").append(x).fadeIn(400);
    }
}

function TrekOutfitAan(id) {
    $.post('http://mn-policejob/TrekOutfitaan', JSON.stringify({
        id: id
    }))  
    CloseEverything();
}

function Bekijkaangifte(id) {
    $.post('http://mn-policejob/Bekijkaangifte', JSON.stringify({
        id: id, 
    })) 
    CloseEverything();
}



function Nieuwaangiftemaken() {
    $(".aangiftescherm-aanmaken").fadeIn();
    $(".invoervelden-aangifte").val("");
    $(".invoervelden-aangifte-big").val("");
}

function InbeslagnameOpenen(data) {
    $(".inbeslagname-voertuig").fadeIn();
    $("#model").val(data.model);
    $("#eigenaar").val(data.naam);
    $("#kenteken").val(data.plate);
    $("#hiddenidentifier").val(data.owner);
    $(".voertuigreden").val("");
}


$("#neemvoertuiginbeslag").click(function(){
    var plate = $("#kenteken").val();
    var eigenaar = $("#eigenaar").val();
    var identifier = $("#hiddenidentifier").val();
    var reden =     $(".voertuigreden").val();
    if (eigenaar != "NIET GEVONDEN") {
        $.post('http://mn-policejob/voertuiginbeslagname', JSON.stringify({ 
            kenteken: plate,
            owner: identifier,
            event: "mn-policejob:server:inbeslagnemenvoertuig",
            reden: reden
        }))
        CloseEverything();
    }
    else {
        $.post('http://mn-policejob/voertuiginbeslagname', JSON.stringify({ 
            kenteken: plate,
            owner: null
        }))
        CloseEverything();
    }
})


$(".deleteaangifte").click(function() {
    var eigennaam =  $("#eigennaam").val();
    var aangevernaam =  $("#aangevernaam").val();
    var onderwerpnieuw =  $("#onderwerpnieuw").val();
    var beschrijving =  $("#Beschrijvingaangifte2").val();
    if (eigennaam != "" && aangevernaam != "" && onderwerpnieuw != "" && beschrijving != "") {
        $.post('http://mn-policejob/maakaangifte', JSON.stringify({
            eigennaam: eigennaam, 
            aangevernaam: aangevernaam,
            onderwerp: onderwerpnieuw,
            beschrijving: beschrijving,
            serverevent: "mn-policejob:server:maakaangifte"
        })) 
        CloseEverything();
    }
    CloseEverything();
})

function OpenAangifteSpecifiek(data, steamnaam) {
    $(".nav-item-back").text("Welkom " + steamnaam)
    $(".aangiftescherm-specifiek").fadeIn();
    $("#opgemaakdoor").val(data.steamnaam);
    $("#datum").val(data.datum);
    $("#Beschrijvingaangifte").val(data.info);
    $("#id-aangifte").text("Aangifte Rapport #00" + data.id);
    $("#hiddenid").val(data.id);
}

function OpenWapenKamer(wapens) {
    $(".container").fadeIn();
    var l = (`<div class="wapenkamer"><div class="sec-center"><input class="dropdown" type="checkbox" id="dropdown" name="dropdown"/><label class="for-dropdown" for="dropdown">WapenKamer <i class="uil uil-arrow-down"></i></label><div class="section-dropdown"></div></div></div>`);
    $('.container').append(l).fadeIn();
    for (i=0; i < wapens.length; i++) {
        const id = i + 1;
        var x = (`<button id="pakwapen" onclick='PakWapen(` + id + `)' class="gannoe">`+ wapens[i].label + `</button>`);
        $(".section-dropdown").append(x).fadeIn(400);
    }
}


function PakWapen(id) {
    $.post('http://mn-policejob/PakWapen', JSON.stringify({
        id : id,
        serverevent: "mn-policejob-wapenkamer-pakwapen",
    }))
    CloseEverything();
}


$("#proces-btn").click(function() {  
    const x = document.getElementById("boetes");
    const label = x.value;
    const lbl = x.options[x.selectedIndex].text
    
    $.post("http://mn-policejob/MaakProcesVerbaal", JSON.stringify({
        type: label,
        label: lbl
    }))
    CloseEverything();
})

$("#deleteaangifte").click(function(){
    var id = $("#hiddenid").val();
    $.post('http://mn-policejob/Deleteaangifte', JSON.stringify({
        id: id,
        serverevent: "mn-policejob:server:deleteaangifte"
    }))
    CloseEverything();
})



function CloseEverything() {
    $(".container").fadeOut();
    $(".aangiftescherm").fadeOut();
    $(".aangifte").remove();
    $("#pakwapen").remove();
    $(".kledingstuk").remove();
    $(".aangiftescherm-specifiek").fadeOut();
    $(".aangiftescherm-aanmaken").fadeOut();
    $(".inbeslagname-voertuig").fadeOut();
    $(".kledingkamer").fadeOut();
    $(".proces-verbaal").fadeOut();
    $("#boetes").empty();
    $("#proces-text");
    $(".boss-actions").fadeOut();
    $(".boss-actions-kluis").fadeOut();
    $(".amount-notify").css("bottom","80");
    $(".amount-notify").fadeOut();
    $(".notity-input").remove();
    $(".wapenkamer").remove();
    $(".boss-actions-personeel").fadeOut();
    $(".user-info").remove();
    $(".boss-actions-user").fadeOut();
    $(".job-notify").fadeOut();
    $(".add-user-container").fadeOut();
    $("#players").empty();
    $("#job_grades").empty();
}

$(document).on('keydown', function() {
    switch(event.keyCode) {
        case 27:
            $.post('http://mn-policejob/close', JSON.stringify({}))
            CloseEverything()
        break; 
    }
})