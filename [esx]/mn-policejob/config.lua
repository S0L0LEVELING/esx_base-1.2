MN = {}



MN.Policejob = "police"
MN.Bossrank = "boss"
MN.DefaultJob = "unemployed"


MN.AmbulanceReviveTrigger = "esx_ambulancejob:revive"

MN.Rijbewijs = "bread"

MN.Rijbewijsitem = false -- Moet een Speler ook echt een fysiek item in zijn inventory hebben als idkaart?

MN.Servernaam = "MiddelveenRP"


MN.InbeslagnameVoertuigspawn = {x = 436.41, y = -1019.41, z= 28.8, h = 91.86}

--MN.DrugsInterval = 5 -- Hoeveel procent drugs percentage er van iemand af gaat

--MN.alcoholInterval = 5 -- Hoeveel procent alcohol percentage er van iemand af gaat

--[[MN.Useableitems = {
    {label = "Weed", itemname = "bread", effectiveness = 100, type = "drug"}, 
    {label = "Weed", itemname = "water", effectiveness = 100, type = "alcohol"}, 
}]] -- Soon

MN.Admins = {
    "license:1884df4db1128ba239a00566272091bc6e4b8404"
}

MN.WapenKamer = {
    [1] = {
        spawnname = "pistol",
        ammo = 250,
        label = "Combat Pistol"
    }
}

MN.Objects = {
	{label = 'Pion',  			value = 'prop_roadcone02a'},
    {label = 'Hek',  			value = 'prop_mp_barrier_02b'},
	{label = 'Tent',						value = 'prop_gazebo_02'},
}

MN.Markers = {
    [1] = {
        x = 461.97, 
        y = -981.17, 
        z = 30.69,
        trigger = 'mn-policejob-client-OpenWeaponVault',
        text = "~b~ E ~w~· Wapen kluis openen",
        key = 38,
    },
    [2] = {
        x = 458.46, 
        y = -983.18, 
        z = 30.69,
        trigger = 'mn-policejob-client-RemoveallWeapons',
        text = "~b~ E ~w~· Wapens wegleggen",
        key = 38,
    },
    [3] = {
        x = 469.39, 
        y = -988.64, 
        z = 24.92,
        trigger = 'mn-policejob-client-Inbeslagname',
        text = "~b~ E ~w~· Inbeslagname openen",
        key = 38,
    },
    [4] = {
        x = 480.03,
        y = -991.22,
        z = 24.27,
        trigger = 'mn-policejob-client-Vingerafdruk',
        text = "~b~ E ~w~· Vingerafdruk opnemen",
        key = 38,
    },
    [5] = {
        x = 441.62,
        y = -978.96,
        z = 30.69,
        trigger = 'mn-policejob-client-openaangifte',
        text = "~b~ E ~w~· Aangiftes bekijken",
        key = 38,
    },
    [6] = {
        x = 440.78,
        y = -981.06,
        z = 30.69,
        trigger = 'mn-policejob-client-maakaangifte',
        text = "~b~ E ~w~· Aangiftes aanmaken",
        key = 38,
    },
    [7] = {
        x = 436.44,
        y = -996.43,
        z = 25.77,
        trigger = 'mn-policejob-client-Bekijkinbeslagname',
        text = "~b~ E ~w~· Bekijk Inbeslagenomen voertuigen",
        key = 38,
    },
    [8] = {
        x = 452.25,
        y = -993.38,
        z = 30.69,
        trigger = 'mn-policejob-client-Kleedkamer',
        text = "~b~ E ~w~· Kleedkamer",
        key = 38,
    },
    [9] = {
        x = 449.6,
        y = -974.23,
        z = 30.69,
        trigger = 'mn-policejob-client-bossmenu',
        text = "~b~ E ~w~· Baas acties",
        key = 38,
    },
}


MN.Blips = {
    ["Politie HB"] = {
        sprite = 60,
        color = 38,
        scale = 0.8,
        enabled = false,
        x = 444.1,
        y = -983.76,
        z = 30.69
    }
}


MN.Garages = {
    [1] = {
        label = "Politie Garage",
        loc = {x = 450.06, y = -1018.86, z = 28.5, h = 88.56},
        deleter = {x = 463.41, y = -1019.68, z = 28.11, h = 88.56},
        job = "police",
        type = "car"
    },
    [2] = {
        label = "Politie Garage",
        loc = {x = 449.26, y = -981.17, z = 43.69, h = 177.2},
        deleter = {x = 449.26, y = -981.17, z = 43.69, h = 177.2},
        job = "police",
        type = "air"
    }
}


MN.Voertuigen = {
    ["police"] = {   -- Dit moet gelijk zijn aan jobname wat hierboven staat!!!!!!!!!
        [1] = {
            label = "Audi A6",
            model = "polaudi",
            type = "car", ------------------ Type Kan je kiezen uit : "car", "air", "boat" ---------------------------
        },
        [2] = {
            label = "blista",
            model = "blista",
            type = "car", ------------------ Type Kan je kiezen uit : "car", "air", "boat" ---------------------------
        },
        [3] = {
            label = "buzzard", 
            model = "buzzard",
            type = "air",
        }
    } 
}



MN.Verkeersboetes = {
    {label = "Fout parkeren", prijs = 500},
    {label = "Rood stoplicht negeren", prijs = 600},
    {label = "Spookrijden", prijs = 600},
    {label = "Verkeerd voorsorteren", prijs = 380},
    {label = "Rijden zonder rijbewijs", prijs = 650},
    {label = "Rijden met een WOK status", prijs = 350},
    {label = "Snelheid overtreding < 10km", prijs = 200},
    {label = "Snelheid overtreding 10 - 20km", prijs = 300},
    {label = "Snelheid overtreding 20 - 50km", prijs = 550},
    {label = "Snelheid overtreding > 50km", prijs = 650},
    {label = "Onnodig claxoneren", prijs = 180},
    {label = "Stilstaan in een tunnel", prijs = 240},
    {label = "Stilstaan op een overweg", prijs = 260},
    {label = "Stilstaan op een kruispunt", prijs = 300},
    {label = "Rijden of stilstaan op het trottoir", prijs = 300},
    {label = "Gevaarlijk rijgedrag", prijs = 580},
    {label = "Vluchten van politie in voertuig", prijs = 560},


}

MN.Boetes = { 
    ["Verkeersboetes"] = {
        {label = "Door Rood rijden | 500 euro", prijs = 500}, 
        {label = "Rood stoplicht negeren", prijs = 600},
        {label = "Spookrijden", prijs = 600},
        {label = "Verkeerd voorsorteren", prijs = 380},
        {label = "Rijden zonder rijbewijs", prijs = 650},
        {label = "Rijden met een WOK status", prijs = 350},
        {label = "Snelheid overtreding < 10km", prijs = 200},
        {label = "Snelheid overtreding 10 - 20km", prijs = 300},
        {label = "Snelheid overtreding 20 - 50km", prijs = 550},
        {label = "Snelheid overtreding > 50km", prijs = 650},
        {label = "Onnodig claxoneren", prijs = 180},
        {label = "Stilstaan in een tunnel", prijs = 240},
        {label = "Stilstaan op een overweg", prijs = 260},
        {label = "Stilstaan op een kruispunt", prijs = 300},
        {label = "Rijden of stilstaan op het trottoir", prijs = 300},
        {label = "Gevaarlijk rijgedrag", prijs = 580},
        {label = "Vluchten van politie in voertuig", prijs = 560},
    },
    ["Lichte boetes"] = {
        {label = "Diefstal", prijs = 1250}, 
        {label = "Geluidsoverlast openbare ruimte", prijs = 220},
        {label = "Drugshandel", prijs = 1800},
        {label = "Openbare dronkenschap", prijs = 800},
        {label = "Wanordelijk gedrag", prijs = 500},
        {label = "Hulpdiensten hinderen", prijs = 800},
        {label = "Belediging ambtenaar in functie", prijs = 480},
        {label = "Bedreiging", prijs = 720},
    },
    ["Middelmatige boetes"] = {
        {label = "Illegaal steekwapenbezit", prijs = 740},
        {label = "Illegaal munitiebezit", prijs = 1300},
        {label = "Illegaal wapen bezit", prijs = 4200},
        {label = "Illegaal drugsbezit", prijs = 3600},
        {label = "Witwassen van geld", prijs = 2900},
        {label = "Stalking", prijs = 1100},
        {label = "Overval van een burger", prijs = 840},
        {label = "Poging moord ambtenaar in functie", prijs = 5000},
        {label = "Voertuigdiefstal", prijs = 2350},
        {label = "Vluchten politie", prijs = 2350},
    },
    ["Zware boetes"] = {
        {label = "Mishandeling burger", prijs = 1800},
        {label = "Mishandeling Ambtenaar in functie", prijs = 2400},
        {label = "Witwassen van geld", prijs = 2700},
        {label = "Plegen bankoverval", prijs = 5000},
        {label = "Plegen juwelieroverval", prijs = 3500},
        {label = "Plegen winkeloverval", prijs = 2000},
        {label = "Gijzeling 1 persoon", prijs = 7500},
        {label = "Gijzeling meerdere personen", prijs = 7500},
        {label = "Moord ambtenaar in functie", prijs = 7500},
    }
}


MN.Kledingkast = {
    [1] = {
        title = "Noodhulp Kort",
        male = {
            ['tshirt_1'] = 37, ['tshirt_2'] = 0,
            ['torso_1'] = 5, ['torso_2'] = 0,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms'] = 0,
            ['pants_1'] = 53, ['pants_2'] = 0,
            ['shoes_1'] = 25, ['shoes_2'] = 0,
            ['chain_1'] = 1, ['chain_2'] = 0,
            ['bproof_1'] = 17, ['bproof_2'] = 0,
            ['bags_1'] = 0, ['bags_2'] = 0,
        },
        female = {
            ['tshirt_1'] = 36, ['tshirt_2'] = 1,
            ['torso_1'] = 48, ['torso_2'] = 0,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms'] = 44,
            ['pants_1'] = 34, ['pants_2'] = 0,
            ['shoes_1'] = 27, ['shoes_2'] = 0,
            ['helmet_1'] = 45, ['helmet_2'] = 0,
            ['chain_1'] = 0, ['chain_2'] = 0,
            ['ears_1'] = 2, ['ears_2'] = 0
        }
    },
    [2] = {
        title = "Noodhulp Lang",
        male = {
            ['tshirt_1'] = 37, ['tshirt_2'] = 0,
            ['torso_1'] = 150, ['torso_2'] = 0,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms'] = 1,
            ['pants_1'] = 53, ['pants_2'] = 0,
            ['shoes_1'] = 25, ['shoes_2'] = 0,
            ['chain_1'] = 1, ['chain_2'] = 0,
            ['bproof_1'] = 17, ['bproof_2'] = 0,
            ['bags_1'] = 0, ['bags_2'] = 0,
        },
        female = {
            ['tshirt_1'] = 36, ['tshirt_2'] = 1,
            ['torso_1'] = 48, ['torso_2'] = 0,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms'] = 44,
            ['pants_1'] = 34, ['pants_2'] = 0,
            ['shoes_1'] = 27, ['shoes_2'] = 0,
            ['helmet_1'] = 45, ['helmet_2'] = 0,
            ['chain_1'] = 0, ['chain_2'] = 0,
            ['ears_1'] = 2, ['ears_2'] = 0
        }
    },
    [3] = {
        title = "Verkeerspolitie Kort",
        male = {
            ['tshirt_1'] = 37, ['tshirt_2'] = 0,
            ['torso_1'] = 5, ['torso_2'] = 0,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms'] = 0,
            ['pants_1'] = 53, ['pants_2'] = 0,
            ['shoes_1'] = 25, ['shoes_2'] = 0,
            ['chain_1'] = 1, ['chain_2'] = 0,
            ['bproof_1'] = 17, ['bproof_2'] = 2,
            ['bags_1'] = 0, ['bags_2'] = 0,
        },
        female = {
            ['tshirt_1'] = 36, ['tshirt_2'] = 1,
            ['torso_1'] = 48, ['torso_2'] = 0,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms'] = 44,
            ['pants_1'] = 34, ['pants_2'] = 0,
            ['shoes_1'] = 27, ['shoes_2'] = 0,
            ['helmet_1'] = 45, ['helmet_2'] = 0,
            ['chain_1'] = 0, ['chain_2'] = 0,
            ['ears_1'] = 2, ['ears_2'] = 0
        }
    },
    [4] = {
        title = "Verkeerspolitie Lang",
        male = {
            ['tshirt_1'] = 37, ['tshirt_2'] = 0,
            ['torso_1'] = 150, ['torso_2'] = 0,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms'] = 1,
            ['pants_1'] = 53, ['pants_2'] = 0,
            ['shoes_1'] = 25, ['shoes_2'] = 0,
            ['chain_1'] = 1, ['chain_2'] = 0,
            ['bproof_1'] = 17, ['bproof_2'] = 2,
            ['bags_1'] = 0, ['bags_2'] = 0,
        },
        female = {
            ['tshirt_1'] = 36, ['tshirt_2'] = 1,
            ['torso_1'] = 48, ['torso_2'] = 0,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms'] = 44,
            ['pants_1'] = 34, ['pants_2'] = 0,
            ['shoes_1'] = 27, ['shoes_2'] = 0,
            ['helmet_1'] = 45, ['helmet_2'] = 0,
            ['chain_1'] = 0, ['chain_2'] = 0,
            ['ears_1'] = 2, ['ears_2'] = 0
        }
    },
    [5] = {
        title = "Ongemarkeerde Eenheid",
        male = {
            ['tshirt_1'] = 37, ['tshirt_2'] = 0,
            ['torso_1'] = 242, ['torso_2'] = 4,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms'] = 0,
            ['pants_1'] = 53, ['pants_2'] = 0,
            ['shoes_1'] = 25, ['shoes_2'] = 0,
            ['chain_1'] = 1, ['chain_2'] = 0,
            ['bproof_1'] = 17, ['bproof_2'] = 1,
            ['bags_1'] = 0, ['bags_2'] = 0,
        },
        female = {
            ['tshirt_1'] = 36, ['tshirt_2'] = 1,
            ['torso_1'] = 48, ['torso_2'] = 0,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms'] = 44,
            ['pants_1'] = 34, ['pants_2'] = 0,
            ['shoes_1'] = 27, ['shoes_2'] = 0,
            ['helmet_1'] = 45, ['helmet_2'] = 0,
            ['chain_1'] = 0, ['chain_2'] = 0,
            ['ears_1'] = 2, ['ears_2'] = 0
        }
    },
    [6] = {
        title = "Bodycam Aan",
        male = {
            ['bags_1'] = 6, ['bags_2'] = 0
        },
        female = {
            ['tshirt_1'] = 36, ['tshirt_2'] = 1
        }
    },
    [7] = {
        title = "Bodycam Uit",
        male = {
            ['bags_1'] = 0, ['bags_2'] = 0
        },
        female = {
            ['tshirt_1'] = 36, ['tshirt_2'] = 1
        }
    }
}