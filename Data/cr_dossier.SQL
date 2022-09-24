create table dossier  (
  no_dossier number(6),
  date_retrait date not null,
  date_retour date not null,
  date_effect date,
  kil_retrait number(6),
  kil_retour number(6),
  type_tarif varchar2(5),
  assur char(1),
  nbjour_fact number(3),
  nbsem_fact number(3),
  remise number(4,2),
  code_cli varchar2(8),
  no_imm varchar2(10),
  ag_retrait varchar2(10),
  ag_retour varchar2(10),
  ag_reserve varchar2(10),
  primary key (no_dossier)
  )
/
