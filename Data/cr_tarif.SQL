create table tarif  (
  code_tarif varchar2(3),
  tarif_jour number(6,2) not null,
  tarif_hebdo number(6,2) not null,
  tarif_kil number(4,2) not null,
  tarif_w500 number(6,2) not null,
  tarif_w800 number(6,2) not null,
  tarif_asur number(6,2) not null,
  primary key (code_tarif)
  )
/
