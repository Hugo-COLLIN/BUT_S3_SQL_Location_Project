drop table client;

drop table empUL;

rollback;
commit;

SELECT *
FROM all_objects
WHERE OWNER = upper('collin174u');

DROP SYNONYM categorie; /*VIEW*/


/*---UNUSED---*/
CREATE TABLE Categorie (
    codecat varchar(2) PRIMARY KEY,
    libelle varchar(30),
    nbPers number(2),
    typepermis varchar(2)
    );
    
CREATE TABLE Tarif (
    typepermis varchar(2),
    compsem number(5,2),
    compjours number(5,2),
    tarifkilom number(5,2),
    we500 number(5,2),
    we800 number(5,2),
    assu number(5,2)
    );
    
CREATE TABLE Vehicule (
    immat varchar(8) PRIMARY KEY,
    marque varchar(30),
    modele varchar(30),
    couleur varchar(15),
    dateachat date,
    kilom number(5),
    codecat varchar(2) FOREIGN KEY REFERENCES Categorie(codecat),
    agence varchar(30) FOREIGN KEY REFERENCES Agence(ville)
    );
    
CREATE TABLE Agence (
    codeA number(4)
    ville varchar(15)
    pays varchar(15)
    adresse varchar(80)
    numtel varchar(10),
    responsable varchar(30)
    );
    
CRETAE TABLE Client (
    codeCli varchar(8) PRIMARY KEY,
    nom varchar(30),
    prenom varchar(30),
    adresse varchar(80)
    );
    
CREATE TABLE Dossier (
    id number(4),
    datedebut date,
    dateretour date,
    typepermis varchar(2) FOREIGN KEY REFERENCES Categorie(typepermis),
    codeCli  varchar(8) FOREIGN KEY REFERENCES Client(CodeCli),
    vehicule varchar(8) FOREIGN KEY REFERENCES Vehicule(immat),
    agencedemande varchar(15),
    agenceretrait varchar(15),
    agenceretour varchar(15),
    
    