INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_kmar', 'Kmar', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_kmar', 'kmar', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_kmar', 'kmar', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('kmar', 'Kmar')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('kmar',0,'vklasse','4e Klasse',3750,'{}','{}'),
	('kmar',1,'dklasse','3e Klasse',3875,'{}','{}'),
	('kmar',2,'tklasse','2e Klasse',4000,'{}','{}'),
	('kmar',3,'eklasse','1e Klasse',4125,'{}','{}'),
	('kmar',4,'wachtmeester','Wachtmeester',4250,'{}','{}'),
    ('kmar',5,'ewachtmeester','Wachtmeester 1e Klas',4375,'{}','{}'),
    ('kmar',6,'owachtmeester','Opper wachtmeester',4500,'{}','{}'),
    ('kmar',7,'aofficier','Adjudant onderofficier',4625,'{}','{}'),
    ('kmar',8,'kornet','Kornet',4750,'{}','{}'),
	('kmar',9,'tluitenant','2e Luitenant',4875,'{}','{}'),
	('kmar',10,'eluitenant','1e Luitenant',5000,'{}','{}'),
    ('kmar',11,'kapitein','Kapitein',5125,'{}','{}'),
    ('kmar',12,'majoor','Majoor',5250,'{}','{}'),
    ('kmar',13,'lkolonel','Luitenant Kolonel',5375,'{}','{}'),
    ('kmar',14,'kolonel','Kolonel',5500,'{}','{}'),
	('kmar',15,'brigadegenraal','Brigadegeneraal',5750,'{}','{}'),
	('kmar',16,'gmajoor','Generaal majoor',5875,'{}','{}'),
	('kmar',17,'luitenant','Luitenant generaal',6000,'{}','{}')
;