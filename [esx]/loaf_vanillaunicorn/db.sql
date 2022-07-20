INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES ("society_unicorn", "Vanilla unicorn", 1);
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES ("society_unicorn", "Vanilla unicorn", 1);

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
    ("society_unicorn", "Vanilla unicorn", 1),
    ("unicorn_bar", "Vanilla unicorn - bar", 1);

INSERT INTO `jobs` (`name`, `label`) VALUES ("unicorn", "Vanilla unicorn");

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
    ("unicorn", 0, "bouncer", "Bouncer", 100, "{}", "{}"),
    ("unicorn", 1, "bartender", "Bartender", 125, "{}", "{}"),
    ("unicorn", 2, "dancer", "Stripper", 150, "{}", "{}"),
    ("unicorn", 3, "boss", "Boss", 250, "{}", "{}");

INSERT INTO `items` (`name`, `label`, `weight`) VALUES  
    ("vodka", "Vodka", 1),
    ("cointreau", "Cointreau", 1),
    ("cranberry_juice", "Cranberry juice", 1),
    ("fresh_mix", "Fresh sour mix", 1),
    ("mint", "Mint", 1),
    ("lime", "Lime", 1),
    ("sugar", "Sugar", 1),
    ("ice", "Ice", 1),
    ("white_rum", "White rum", 1),
    ("club_soda", "Club soda", 1),
    ("light_rum", "Light rum", 1),
    ("dark_rum", "Dark rum", 1),
    ("gold_rum", "Gold rum", 1),
    ("curacao", "Orange Curacao liqeur", 1),
    ("syrup", "Orgeat syrup", 1),
    ("water", "Water", 1),
    ("bourbon", "Bourbon", 1),
    ("cachaca", "Cachaca", 1),
    ("limeade", "Limeadge", 1),
    ("tequila", "Tequila", 1),
    ("triple_sec", "Triple sec", 1),
    ("coconut_milk", "Coconut milk", 1),
    ("pineapple_juice", "Pineapple juice", 1),

    ("cosmopolitan", "Cosmopolitan", 2),
    ("mojito", "Mojito", 2),
    ("mai_tai", "Mai Tai", 2),
    ("mint_julep", "Mint Julep", 2),
    ("caipirinha", "Caipirinha", 2),
    ("margarita", "Margarita", 2),
    ("pina_colada", "Pina Colada", 2);