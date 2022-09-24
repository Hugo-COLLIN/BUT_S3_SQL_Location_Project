create table vehicule  (
  no_imm varchar2(10),
  marque varchar2(20) not null,
  modele varchar2(20) not null,
  couleur varchar2(20),
  date_achat date check(to_char(date_achat,'yyyy')>1998),
  kilometres number(6) check(kilometres>=0),
  code_categ varchar2(3),
  code_ag varchar2(10),
  primary key (no_imm)
  )
/
