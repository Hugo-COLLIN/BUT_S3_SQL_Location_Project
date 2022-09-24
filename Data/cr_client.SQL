create table client  (
  code_cli varchar2(8),
  nom  varchar2(40) not null,
  rue varchar2(40) not null,
  ville varchar2(25) not null,
  codpostal varchar2(5) not null,
  primary key (code_cli)
  );
/

