CREATE TABLE USERS 
(
  ID NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
  NOM VARCHAR2(50),
  PHRASE VARCHAR2(50),
  MOTDEPASS VARCHAR2(50),
  COULEUR VARCHAR2(50),
  PRIMARY KEY (ID)
);


CREATE TABLE parties 
(
  ID NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
  JOUEUR1 VARCHAR2(50),
  JOUEUR2 VARCHAR2(50),
  PRIMARY KEY (ID)
);


INSERT INTO USERS
(NOM,PHRASE,MOTDEPASS,COULEUR)
VALUES
('richard','maPhrase','b','rouge');


INSERT INTO parties
(JOUEUR1,JOUEUR2)
VALUES
('Dav','richard');




SELECT * FROM USERS;
SELECT * FROM parties;

drop table users;

commit;


SELECT * from USERS WHERE NOM = 'Dav';

SELECT * FROM USERS WHERE NOM = 'Dav';
