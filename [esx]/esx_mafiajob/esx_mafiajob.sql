INSERT INTO `addon_account` (name, label, shared) VALUES 
	('society_mafia','Mafia',1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
	('society_mafia','Mafia',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES 
	('society_mafia', 'Mafia', 1)
;

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('mafia', '💸 Bratva Nostra', 1);


INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('mafia', 0, 'Peaky', 'Lid', 0, '{}', '{}'),
('mafia', 2, 'Bratva', 'Lid', 0, '{}', '{}'),
('mafia', 3, 'Humble', 'Lid', 0, '{}', '{}'),
('mafia', 4, 'Gang Naam', 'Lid', 0, '{}', '{}'),
('mafia', 5, 'Gang Naam', 'Lid', 0, '{}', '{}'),
('mafia', 6, 'Gang Naam', 'Lid', 0, '{}', '{}');