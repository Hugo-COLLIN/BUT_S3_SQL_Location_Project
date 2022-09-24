create table agence  (
  code_ag varchar2(10),
  nomresp varchar2(30) not null,
  numtel varchar2(12) not null,
  rue varchar2(40),
  ville varchar2(25),
  codpostal varchar2(5),
  pays  varchar2(20),
  primary key (code_ag)
  )
/
