create table categorie  (
  code_categ varchar2(3),
  libelle varchar2(30) not null,
  nbpers number(2) not null,
  type_permis varchar2(2) check(type_permis in ('a','a1','b','c','d','e_b','e_c','e_d'))
        not null,
  code_tarif varchar2(3),
  primary key (code_categ)
  )
/
