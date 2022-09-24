alter table dossier 
  add (constraint fk_codecli foreign key (code_cli) references client(code_cli));
alter table dossier
  add(constraint fk_noimm foreign key (no_imm) references vehicule(no_imm));
alter table dossier
    add(constraint fk_agretrait foreign key (ag_retrait) references agence(code_ag));
alter table dossier
    add (constraint fk_agretour foreign key (ag_retour) references agence(code_ag));
alter table dossier
    add (constraint fk_agreserve foreign key (ag_reserve) references agence(code_ag));
alter table vehicule
  add (constraint fk_codecateg foreign key(code_categ) references categorie(code_categ));
alter table vehicule
    add (constraint fk_codeag foreign key(code_ag) references agence(code_ag));
alter table categorie
  add (constraint fk_codetarif foreign key(code_tarif) references tarif(code_tarif));
alter table calendrier
  add(constraint fk_noimm1 foreign key (no_imm) references vehicule(no_imm))
/
