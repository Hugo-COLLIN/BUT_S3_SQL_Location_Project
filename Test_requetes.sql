SELECT distinct Vehicule.no_imm, Vehicule.modele 
FROM Vehicule, Dossier
WHERE code_categ = 'c1'
    AND (date_retrait < '10/10/15' OR dossier.date_retour > '16/10/15')
    /*AND NOT (date_retrait > '10/10/15' AND dossier.date_retour < '13/10/15')*/
    AND Vehicule.no_imm = Dossier.no_imm;
    
    
    
    
    
UPDATE Calendrier
SET paslibre = 'x'
WHERE no_imm IN(
        SELECT no_imm
        FROM Dossier
        WHERE no_imm = '1234ya54'
    )
    AND datejour BETWEEN '01/10/15' AND '03/10/15'
;
/*WHERE Dossier.no_imm IN Dossier AND Dossier.no_imm = Calendrier.no_imm ;*/

UPDATE Calendrier
SET paslibre = 'x'
WHERE no_imm = '1234ya54'
    AND datejour BETWEEN '01/10/15' AND '03/10/15'
;

UPDATE Calendrier
SET paslibre = 'x'
WHERE no_imm = '1234ya54'
    AND datejour BETWEEN
        (SELECT date_retrait
            FROM Dossier
            WHERE no_imm = '1234ya54' 
                AND (date_retrait < '01/10/15' OR dossier.date_retour > '03/10/15')
        )
        AND
        (SELECT date_retrait
            FROM Dossier
            WHERE no_imm = '1234ya54' 
                AND (date_retrait < '01/10/15' OR dossier.date_retour > '03/10/15')
        );
    
    BETWEEN '01/10/15' AND '03/10/15'
;


UPDATE Calendrier 
SET paslibre = 'x'
WHERE no_imm = '1234ya54'
    AND datejour BETWEEN '01/10/15' AND '03/10/15';

rollback;
    
    
    
UPDATE Dossier
SET date_retrait = '01/08/20', date_retour = '03/08/20';






/*3*/
SELECT tarif.code_tarif, tarif_jour*dossier.nbjour_fact from dossier, tarif
WHERE dossier.type_tarif = tarif.code_tarif;


SELECT tarif.code_tarif, tarif_jour*3 from tarif
;
 
SELECT categorie.code_tarif FROM Vehicule, Categorie
WHERE vehicule.modele = 'saxo1.1'
    AND Vehicule.code_categ = categorie.code_categ; 



SELECT tarif.code_tarif, tarif_jour * 3, tarif_hebdo * CEIL(3/7) from tarif
WHERE tarif.code_tarif = (
    SELECT categorie.code_tarif FROM Vehicule, Categorie
    WHERE vehicule.modele = 'saxo1.1'
        AND Vehicule.code_categ = categorie.code_categ
);


SELECT tarif.code_tarif, tarif_jour * MOD(8,7) + tarif_hebdo * FLOOR(8/7) AS Montant_location 
FROM tarif
WHERE tarif.code_tarif = (
    SELECT categorie.code_tarif FROM Vehicule, Categorie
    WHERE vehicule.modele = 'saxo1.1'
        AND Vehicule.code_categ = categorie.code_categ
);


/*4*/
SELECT Agence.code_ag FROM Agence, Vehicule
WHERE Agence.code_ag = vehicule.code_ag
    AND vehicule.modele IN (
        SELECT modele FROM Vehicule
        WHERE 
);

SELECT count(code_ag) FROM Agence
GROUP BY code_ag;


WHERE count(modele) = MAX (
    SELECT 
    ;

UPDATE Vehicule
SET code_ag = 'Strasbourg'
WHERE modele = 'xantia2.0';

    
/*vvvv*/
SELECT max(count(code_ag)) FROM Vehicule
GROUP BY code_ag;
/*^^^^*/
/*vvvv*/
SELECT code_ag FROM Vehicule
HAVING count(code_ag) = (
    SELECT max(count(code_ag)) FROM Vehicule
    GROUP BY code_ag
)
GROUP BY code_ag
;
/*^^^^*/

/*vvvv*/
SELECT code_ag FROM Vehicule
HAVING count(modele) = (
    SELECT max(count(*)) FROM Vehicule
    GROUP BY code_ag
)
GROUP BY code_ag
;
/*^^^^*/


SELECT code_ag FROM Vehicule
HAVING count(modele) = max(count(modele))
GROUP BY code_ag
;


/*5*/
SELECT nom, ville, codpostal
FROM Client, Dossier
WHERE Client.code_cli = Dossier.code_cli;


SELECT nom, ville, codpostal
FROM Client, Dossier, Vehicule
WHERE Client.code_cli = Dossier.code_cli
    AND Dossier.no_imm = Vehicule.no_imm
GROUP BY nom, ville, codpostal, modele
HAVING count(modele) = 2
;
    

/*FROM RAPHAEL, MODIFIED (doesn't work) :*/
SELECT distinct nom, ville, codpostal FROM Client, Dossier d1, Dossier d2, Vehicule v1
WHERE d1.code_cli = client.code_cli 
    AND d1.no_imm = v1.no_imm 
    AND v1.no_imm NOT IN (
        SELECT d2.no_imm FROM vehicule v2, dossier d2 
        WHERE v2.no_imm = d2.no_imm
            AND d1.code_cli = d2.code_cli
        );
    
    
INSERT INTO Dossier
VALUES (
    11,
    to_date('22/10/15', 'DD/MM/YYYY'),
    to_date('28/10/15', 'DD/MM/YYYY'),
    null,
    null,
    null,
    't1',
    null,
    null,
    null,
    null,
    'dumon001',
    '2569yp54',
    'Nancy',
    'Nancy',
    'Nancy'
    );
    
    commit;