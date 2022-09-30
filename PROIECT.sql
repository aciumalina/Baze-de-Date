CREATE TABLE COMPANIE
(id_companie NUMBER(5),
nume VARCHAR2(30),
an_infiintare NUMBER(4),
CONSTRAINT primary_key_companie PRIMARY KEY (id_companie));

ALTER TABLE COMPANIE
MODIFY nume NOT NULL;

CREATE TABLE TABARA
(id_tabara NUMBER(5),
data_inceput DATE CONSTRAINT data_inceput_nn NOT NULL,
data_final DATE CONSTRAINT data_final_nn NOT NULL,
locatie VARCHAR2(20) CONSTRAINT locatie_nn NOT NULL,
CONSTRAINT primary_key_tabara PRIMARY KEY (id_tabara));

ALTER TABLE TABARA
ADD CONSTRAINT date_tabara CHECK (data_inceput < data_final);

CREATE TABLE SPECIALIST
(id_specialist NUMBER(5),
nume VARCHAR2(20) NOT NULL,
prenume VARCHAR2(30) NOT NULL,
specializare VARCHAR2(20) NOT NULL,
ani_experienta NUMBER(2),
salariu NUMBER (4),
CONSTRAINT primary_key_specialist PRIMARY KEY (id_specialist));

CREATE TABLE SESIUNE
(id_sesiune NUMBER(5),
data_sesiune DATE NOT NULL,
durata number(1) NOT NULL,
id_tabara NUMBER(5),
CONSTRAINT primary_key_sesiune PRIMARY KEY (id_sesiune));

ALTER TABLE SESIUNE
ADD CONSTRAINT id_tabara_fk FOREIGN KEY(id_tabara) REFERENCES TABARA(id_tabara);

CREATE TABLE INVITAT
(id_invitat NUMBER(5),
nume VARCHAR2(20) NOT NULL,
prenume VARCHAR2(30) NOT NULL,
ocupatie VARCHAR2(20),
id_sesiune NUMBER(5),
CONSTRAINT primaty_key_invitat PRIMARY KEY (id_invitat));

ALTER TABLE INVITAT
ADD CONSTRAINT id_sesiune_fk FOREIGN KEY(id_sesiune) REFERENCES SESIUNE(id_sesiune);

CREATE TABLE GRUPA
(id_grupa NUMBER(5),
numar_liceeni NUMBER(1) NOT NULL,
CONSTRAINT primary_key_grupa PRIMARY KEY(id_grupa));

CREATE TABLE ATELIER
(id_atelier NUMBER(5),
nume VARCHAR2(20) NOT NULL,
ore_total NUMBER(2),
materie VARCHAR2(20),
id_tabara NUMBER(5),
id_specialist NUMBER(5),
CONSTRAINT primaty_key_atelier PRIMARY KEY (id_atelier));

ALTER TABLE ATELIER
ADD CONSTRAINT id_tabara_fk_atelier FOREIGN KEY(id_tabara) REFERENCES TABARA(id_tabara);

ALTER TABLE ATELIER
ADD CONSTRAINT id_specialist_fk_atelier FOREIGN KEY(id_specialist) REFERENCES SPECIALIST(id_specialist);

CREATE TABLE LICEAN
(id_licean NUMBER(5),
nume VARCHAR2(20) NOT NULL,
prenume VARCHAR2(30) NOT NULL,
clasa NUMBER(2) CONSTRAINT clasa_nr CHECK(clasa >= 9 and clasa <= 12),
liceu VARCHAR2(30),
id_tabara NUMBER(5),
id_grupa NUMBER(5),
id_specialist NUMBER(5),
CONSTRAINT primary_key_licean PRIMARY KEY (id_licean));

ALTER TABLE LICEAN
ADD CONSTRAINT id_tabara_fk_licean FOREIGN KEY(id_tabara) REFERENCES TABARA(id_tabara);

ALTER TABLE LICEAN
ADD CONSTRAINT id_grupa_fk_licean FOREIGN KEY(id_grupa) REFERENCES GRUPA(id_grupa);

ALTER TABLE LICEAN
ADD CONSTRAINT id_specialist_fk_licean FOREIGN KEY(id_specialist) REFERENCES SPECIALIST(id_specialist);

CREATE TABLE VOLUNTAR
(id_voluntar NUMBER(5),
nume VARCHAR2(20) NOT NULL,
prenume VARCHAR2(30) NOT NULL,
data_nasterii DATE,
id_atelier NUMBER(5),
CONSTRAINT primary_key_voluntar PRIMARY KEY (id_voluntar));

ALTER TABLE VOLUNTAR
ADD CONSTRAINT id_atelier_fk_voluntar FOREIGN KEY(id_atelier) REFERENCES ATELIER(id_atelier);

CREATE TABLE PROIECT
(id_proiect NUMBER (5),
titlu VARCHAR2(20) NOT NULL,
materie VARCHAR2(20),
id_licean NUMBER(5),
CONSTRAINT primary_key_proiect PRIMARY KEY (id_proiect));

ALTER TABLE PROIECT
ADD CONSTRAINT  id_licean_fk_proiect FOREIGN KEY (id_licean) REFERENCES LICEAN(id_licean);


CREATE TABLE SPONSORIZEAZA
(id_companie NUMBER(5),
id_tabara NUMBER(5),
suma NUMBER (6),
CONSTRAINT primary_key_sponsorizeaza PRIMARY KEY (id_companie, id_tabara));

ALTER TABLE SPONSORIZEAZA
ADD CONSTRAINT id_companie_fk_sponsor FOREIGN KEY(id_companie) REFERENCES COMPANIE(id_companie);

ALTER TABLE SPONSORIZEAZA
ADD CONSTRAINT id_tabara_fk_sponsor FOREIGN KEY(id_tabara) REFERENCES TABARA(id_tabara);

ALTER TABLE SPONSORIZEAZA
MODIFY suma NOT NULL;

drop table sponsorizeaza;


CREATE TABLE SUPERVIZEAZA
(id_voluntar NUMBER(5),
id_licean NUMBER(5),
nr_de_ore NUMBER(1) not null,
CONSTRAINT primary_key_supervizeaza PRIMARY KEY (id_voluntar, id_licean),
CONSTRAINT id_voluntar_fk_super FOREIGN KEY (id_voluntar) REFERENCES VOLUNTAR(id_voluntar),
CONSTRAINT id_licean_fk_super FOREIGN KEY(id_licean) REFERENCES LICEAN(id_licean));

CREATE TABLE SE_INSCRIE
(id_licean NUMBER(5),
id_atelier NUMBER(5),
data_inscriere DATE NOT NULL,
CONSTRAINT primary_key_inscrie PRIMARY KEY(id_licean, id_atelier),
CONSTRAINT id_licean_fk_inscrie FOREIGN KEY (id_licean) REFERENCES LICEAN(id_licean),
CONSTRAINT id_atelier_fk_inscrie FOREIGN Key(id_atelier) REFERENCES ATELIER(id_atelier));

CREATE SEQUENCE SEQ_GRUPA3
INCREMENT BY 10
START WITH 10
MAXVALUE 1000
NOCYCLE;

--EXERCITIU 13 CU SECVENTE
INSERT INTO GRUPA
VALUES(SEQ_GRUPA3.NEXTVAL, 3);

INSERT INTO GRUPA
VALUES(SEQ_GRUPA3.NEXTVAL, 5);

INSERT INTO GRUPA
VALUES(SEQ_GRUPA3.NEXTVAL, 5);

INSERT INTO GRUPA
VALUES(SEQ_GRUPA3.NEXTVAL, 4);

INSERT INTO GRUPA
VALUES(SEQ_GRUPA3.NEXTVAL, 5);

CREATE SEQUENCE SEQ_TABARA3
INCREMENT BY 10
START WITH 10
MAXVALUE 10000
NOCYCLE;

INSERT INTO TABARA
VALUES(SEQ_TABARA3.NEXTVAL, TO_DATE('05-11-2018', 'DD-MM-YYYY'), TO_DATE('09-11-2018', 'DD-MM-YYYY'), 'ARAD');

INSERT INTO TABARA
VALUES(SEQ_TABARA3.NEXTVAL, TO_DATE('13-04-2019', 'DD-MM-YYYY'), TO_DATE('18-04-2019', 'DD-MM-YYYY'), 'BUCURESTI');

INSERT INTO TABARA
VALUES(SEQ_TABARA3.NEXTVAL, TO_DATE('12-08-2019', 'DD-MM-YYYY'), TO_DATE('18-08-2019', 'DD-MM-YYYY'), 'SIBIU');

INSERT INTO TABARA
VALUES(SEQ_TABARA3.NEXTVAL, TO_DATE('10-02-2020', 'DD-MM-YYYY'), TO_DATE('14-02-2020', 'DD-MM-YYYY'), 'CLUJ-NAPOCA');

INSERT INTO TABARA
VALUES(SEQ_TABARA3.NEXTVAL, TO_DATE('11-09-2020', 'DD-MM-YYYY'), TO_DATE('18-09-2020', 'DD-MM-YYYY'), 'BUCURESTI');

INSERT INTO TABARA
VALUES(SEQ_TABARA3.NEXTVAL, TO_DATE('04-03-2018', 'DD-MM-YYYY'), TO_DATE('09-03-2018', 'DD-MM-YYYY'), 'TIMISOARA');

INSERT INTO TABARA
VALUES(SEQ_TABARA3.NEXTVAL, TO_DATE('05-08-2019', 'DD-MM-YYYY'), TO_DATE('09-08-2019', 'DD-MM-YYYY'), 'IASI');

INSERT INTO TABARA
VALUES(SEQ_TABARA3.NEXTVAL, TO_DATE('05-11-2017', 'DD-MM-YYYY'), TO_DATE('09-11-2017', 'DD-MM-YYYY'), 'GALATI');

INSERT INTO TABARA
VALUES(SEQ_TABARA3.NEXTVAL, TO_DATE('02-06-2017', 'DD-MM-YYYY'), TO_DATE('08-06-2017', 'DD-MM-YYYY'), 'IASI');

SELECT * FROM TABARA;

--REVENIRE EXERCITIU 10
INSERT INTO COMPANIE
VALUES(10, 'AQUACARPATICA.SRL', 2002);

INSERT INTO COMPANIE
VALUES(20, 'SUPERBET.SRL', 2004);

INSERT INTO COMPANIE
VALUES(30, 'EUROSTAR STUDIOS.SRL', 2002);

INSERT INTO COMPANIE
VALUES(40, 'KAUFLAND.SRL', 1999);

INSERT INTO COMPANIE
VALUES(50, 'FLOWERS DESIGN.SRL', 2009);

INSERT INTO SPECIALIST
VALUES(10, 'Pop', 'Alexandra', 'biologie moleculara', 12, 1800);

INSERT INTO SPECIALIST
VALUES(20, 'Pop', 'Matei', 'matematica', 12, 3000);

INSERT INTO SPECIALIST
VALUES(30, 'Popa', 'Ion', 'biologie', 8, 2500);

INSERT INTO SPECIALIST
VALUES(40, 'Munteanu', 'Diana', 'informatica', 15, 3300);

INSERT INTO SPECIALIST
VALUES(50, 'Anton', 'Maria', 'engleza', 8, 2000);

INSERT INTO SPECIALIST
VALUES(60, 'Bejan', 'Andrei', 'matematica', 14, 3250);


INSERT INTO ATELIER
VALUES (10, 'Bazele biologiei', 12, 'biologie', 30, 30);

INSERT INTO ATELIER
VALUES (20, 'Literatura engleza', 12, 'engleza', 20, 50);

INSERT INTO ATELIER
VALUES (30, 'Matematica avansata', 12, 'matematica', 30, 60);

INSERT INTO ATELIER
VALUES (40, 'Algoritmi de baza', 12, 'informatica', 40, 40);

INSERT INTO ATELIER
VALUES (50, 'Bazele biologiei II', 10, 'biologie', 30, 10);

INSERT INTO ATELIER
VALUES (60, 'Biologie moleculara', 12, 'biologie moleculara', 50, 10);

INSERT INTO ATELIER
VALUES (70, 'Structuri de date', 14, 'informatica', 60, 40);

INSERT INTO ATELIER
VALUES (80, 'Engleza avansata', 9, 'engleza', 70, 50);

INSERT INTO ATELIER
VALUES (90, 'Fizica aplicata', 12, 'fizica', 80, 60);

INSERT INTO ATELIER
VALUES (100, 'Fizica si mate', 14, 'fizica', 90, 20);

INSERT INTO ATELIER
VALUES (110, 'Informatica', 15, 'informatica', 100, 40);


INSERT INTO VOLUNTAR
VALUES(10, 'Popescu', 'Clara', TO_DATE('26-11-2002', 'dd-mm-yyyy'), 30);

INSERT INTO VOLUNTAR
VALUES(20, 'Marin', 'Andreea', TO_DATE('14-09-2000', 'dd-mm-yyyy'), 40);

INSERT INTO VOLUNTAR
VALUES(30, 'Mircea', 'Ana', TO_DATE('06-04-2001', 'dd-mm-yyyy'), 50);

INSERT INTO VOLUNTAR
VALUES(40, 'Marinescu', 'Larisa', TO_DATE('24-01-2002', 'dd-mm-yyyy'), 60);

INSERT INTO VOLUNTAR
VALUES(50, 'Popescu', 'Clara', TO_DATE('26-11-2002', 'dd-mm-yyyy'), 10);

INSERT INTO VOLUNTAR
VALUES(60, 'Popescu', 'Clara', TO_DATE('26-11-2002', 'dd-mm-yyyy'), 20);

UPDATE VOLUNTAR
SET NUME = 'Ciurea' , PRENUME = 'Bianca'
WHERE id_voluntar = 50;

UPDATE VOLUNTAR
SET NUME = 'Bogdan' , PRENUME = 'Ioana'
WHERE id_voluntar = 60;

UPDATE VOLUNTAR
SET data_nasterii = TO_DATE('02-08-2001', 'dd-mm-yyyy')
WHERE id_voluntar = 50;

UPDATE VOLUNTAR
SET data_nasterii = TO_DATE('03-09-2001', 'dd-mm-yyyy')
WHERE id_voluntar = 60;

INSERT INTO VOLUNTAR
VALUES(70, 'Baciu', 'Otilia', TO_DATE('22-04-2000', 'dd-mm-yyyy'),30);

INSERT INTO VOLUNTAR
VALUES(80, 'Vladici', 'Sara', TO_DATE('02-04-2000', 'dd-mm-yyyy'),10);

INSERT INTO VOLUNTAR
VALUES(90, 'Bob', 'Alice', TO_DATE('21-06-2000', 'dd-mm-yyyy'), 30);

INSERT INTO VOLUNTAR
VALUES(100, 'Bran', 'Alexandru', TO_DATE('12-09-2001', 'dd-mm-yyyy'), 20);

INSERT INTO VOLUNTAR
VALUES(110, 'Costea', 'Mihail', TO_DATE('20-12-2000', 'dd-mm-yyyy'), 60);

INSERT INTO VOLUNTAR
VALUES(120, 'Corolescu', 'Catalin', TO_DATE('29-01-2002', 'dd-mm-yyyy'), 60);

INSERT INTO VOLUNTAR
VALUES(130, 'Mihai', 'Violeta', TO_DATE('28-08-2000', 'dd-mm-yyyy'), 50);

INSERT INTO VOLUNTAR
VALUES(140, 'Manea', 'Tudor', TO_DATE('17-05-2000', 'dd-mm-yyyy'), 30);

INSERT INTO VOLUNTAR
VALUES(150, 'Sorescu', 'Teodor', TO_DATE('13-10-2001', 'dd-mm-yyyy'), 20);


INSERT INTO SESIUNE
VALUES(10, TO_DATE('06-11-2018', 'DD-MM-YYYY'), 3, 20);

INSERT INTO SESIUNE
VALUES(20, TO_DATE('15-04-2019', 'DD-MM-YYYY'), 2, 30);

INSERT INTO SESIUNE
VALUES(30, TO_DATE('13-08-2019', 'DD-MM-YYYY'), 3, 40);

INSERT INTO SESIUNE
VALUES(40, TO_DATE('13-02-2020', 'DD-MM-YYYY'), 3, 50);

INSERT INTO SESIUNE
VALUES(50, TO_DATE('17-09-2020', 'DD-MM-YYYY'), 3, 60);

INSERT INTO SESIUNE
VALUES(60, TO_DATE('04-03-2018', 'DD-MM-YYYY'), 3, 70);

INSERT INTO SESIUNE
VALUES(70, TO_DATE('07-08-2019', 'DD-MM-YYYY'), 3, 80);

INSERT INTO SESIUNE
VALUES(80, TO_DATE('06-11-2017', 'DD-MM-YYYY'), 3, 90);

INSERT INTO SESIUNE
VALUES(90, TO_DATE('06-06-2017', 'DD-MM-YYYY'), 3, 100);




INSERT INTO INVITAT
VALUES(10, 'Anghel', 'Sorana', 'antreprenor', 10);

INSERT INTO INVITAT
VALUES(20, 'Angelescu', 'Bogdan', 'atlet', 20);

INSERT INTO INVITAT
VALUES(30, 'Milu', 'Alexandru', 'atlet', 30);

INSERT INTO INVITAT
VALUES(40, 'Barbu', 'Simona', 'psiholog', 40);

INSERT INTO INVITAT
VALUES(50, 'Antonescu', 'Alina', 'politician', 50);

INSERT INTO INVITAT
VALUES(60, 'Mircescu', 'Vlad', 'antreprenor', 60);

INSERT INTO INVITAT
VALUES(70, 'Manea', 'Bogdan', 'antreprenor', 70);

INSERT INTO INVITAT
VALUES(80, 'Begu', 'Briana', 'psiholog', 80);

INSERT INTO INVITAT
VALUES(90, 'Carstea', 'Marian', 'antreprenor', 90);

INSERT INTO INVITAT
VALUES(100, 'Deaconu', 'Razvan', 'filantrop', 70);


INSERT INTO LICEAN
VALUES(10, 'Popa', 'Alexandra', 10, 'Colegiul National Unirea', 20, 20, 10);

INSERT INTO LICEAN
VALUES(20, 'Minea', 'Alin', 9, 'CN Mihai Eminescu', 30, 30, 20);

INSERT INTO LICEAN
VALUES(30, 'Pelea', 'Mihail', 12, 'CN Ion Luca Caragiale', 40, 20, 10);

INSERT INTO LICEAN
VALUES(40, 'Manea', 'Sandra', 10, 'CN A.I. Cuza', 50, 30, 40);

INSERT INTO LICEAN
VALUES(50, 'Banciu', 'Maria', 11, 'CN Tehnologic Buzau', 60, 40, 50);

INSERT INTO LICEAN
VALUES(60, 'Vasiliu', 'Catalin', 10, 'CN Pedagogic Zalau', 70, 40, 50);

INSERT INTO LICEAN
VALUES(70, 'Neacsu', 'Teodora', 12, 'Liceul Teoretic Nr.1 Vaslui', 80, 20, 60);

INSERT INTO LICEAN
VALUES(80, 'Velea', 'Miruna', 9, 'CN Marin Preda', 90, 30, 10);

INSERT INTO LICEAN
VALUES(90, 'Popescu', 'Lavinia', 10, 'Colegiul National Unirea', 100, 20, 60);

INSERT INTO LICEAN
VALUES(100, 'Nicolae', 'Daria', 9, 'CN Constantin Noica', 20, 20, 20);

INSERT INTO LICEAN
VALUES(110, 'Nania', 'Alexandra', 10, 'CN Tehnologic Nr.2 Braila', 20, 40, 10);

INSERT INTO LICEAN
VALUES(120, 'Popa', 'Mircea', 11, 'Liceul Teoretic Nr.4 Bucuresti', 20, 50, 10);

INSERT INTO LICEAN
VALUES(130, 'Barbu', 'Laurentiu', 12, 'CN Pedagogic Alexandria', 20, 50, 30);

INSERT INTO LICEAN
VALUES(140, 'Chircu', 'Alex', 12, 'CN Stefan Cel Mare', 20, 50, 30);

INSERT INTO LICEAN
VALUES(150, 'Minea', 'Valeria', 12, 'CN Marin Preda', 80, 40, 30);

INSERT INTO LICEAN
VALUES(160, 'Badea', 'Marina', 11, 'Liceul Teoretic Nr.2 Braila', 80, 40, 20);

INSERT INTO LICEAN
VALUES(170, 'Badescu', 'Gina', 9, 'CN Vasile Alecsandri', 100, 50, 50);

INSERT INTO LICEAN
VALUES(180, 'Horea', 'Iulia', 10, 'CN Stefan Cel Mare', 90, 20, 40);

INSERT INTO LICEAN
VALUES(190, 'Bordei', 'Isabela', 10, 'CN Al. I. Cuza', 60, 50, 50);

INSERT INTO LICEAN
VALUES(200, 'Patrascu', 'Andra', 12, 'Liceul Tehnologic Nr.2 Iasi', 20, 50, 20);

INSERT INTO PROIECT
VALUES(10, 'Fizica de azi', 'fizica', 100);

INSERT INTO PROIECT
VALUES(20, 'Mate aplicata', 'matematica', 30);

INSERT INTO PROIECT
VALUES(30, 'Biologie aprofundata', 'biologie moleculara', 40);

INSERT INTO PROIECT
VALUES(40, 'Probleme informatica', 'informatica', 50);

INSERT INTO PROIECT
VALUES(50, 'Literatura engleza', 'engleza', 60);

INSERT INTO PROIECT
VALUES(60, 'Aplicatii', 'matematica', 10);

INSERT INTO PROIECT
VALUES(70, 'Fizica moderna', 'fizica', 20);

INSERT INTO PROIECT
VALUES(80, 'Sub microscop', 'biologie moleculara', 70);

INSERT INTO PROIECT
VALUES(90, 'Arta cuvintelor', 'engleza', 80);

INSERT INTO PROIECT
VALUES(100, 'Fizica altfel', 'fizica', 110);

INSERT INTO PROIECT
VALUES(110, 'Studiul molecular', 'biologie moleculara', 90);

INSERT INTO PROIECT
VALUES(120,'Probleme reale', 'matematica', 120);

INSERT INTO PROIECT
VALUES(130, 'O noua abordare', 'informatica', 130);

INSERT INTO PROIECT
VALUES(140, 'Aplicatii utile', 'informatica', 140);

INSERT INTO PROIECT
VALUES(150, 'Teoria informatiei', 'informatica', 150);

INSERT INTO PROIECT
VALUES(160, 'English Tenses', 'engleza', 160);

INSERT INTO PROIECT
VALUES(170, 'US History', 'engleza', 170);

INSERT INTO PROIECT
VALUES(180, 'Multimea nr reale', 'matematica', 180);

INSERT INTO PROIECT
VALUES(190, 'Regnul animal', 'biologie', 190);

INSERT INTO PROIECT
VALUES(200, 'Legile lui Newton', 'fizica', 200);


INSERT INTO SPONSORIZEAZA
VALUES(20,20, 15000);

INSERT INTO SPONSORIZEAZA
VALUES(10,20, 12000);

INSERT INTO SPONSORIZEAZA
VALUES(20,30, 15000);

INSERT INTO SPONSORIZEAZA
VALUES(20,70, 20000);

INSERT INTO SPONSORIZEAZA
VALUES(30,20, 5000);

INSERT INTO SPONSORIZEAZA
VALUES(40,40, 15000);

INSERT INTO SPONSORIZEAZA
VALUES(50,50, 70000);

INSERT INTO SPONSORIZEAZA
VALUES(20,60, 15000);

INSERT INTO SPONSORIZEAZA
VALUES(10,70, 65000);

INSERT INTO SPONSORIZEAZA
VALUES(30,80, 24500);

INSERT INTO SPONSORIZEAZA
VALUES(20,90, 15000);

INSERT INTO SPONSORIZEAZA
VALUES(30,100, 100000);

INSERT INTO SPONSORIZEAZA
VALUES(40,100, 1800);

INSERT INTO SPONSORIZEAZA
VALUES(10,90, 29000);

INSERT INTO SPONSORIZEAZA
VALUES(40,80, 17000);

SELECT * FROM SPONSORIZEAZA;
commit;

INSERT INTO SUPERVIZEAZA
VALUES(10, 20, 8);

INSERT INTO SUPERVIZEAZA
VALUES(20,10, 3);

INSERT INTO SUPERVIZEAZA
VALUES(30,10, 2);

INSERT INTO SUPERVIZEAZA
VALUES(40,30, 5);

INSERT INTO SUPERVIZEAZA
VALUES(50,40, 5);

INSERT INTO SUPERVIZEAZA
VALUES(60,10, 1);

INSERT INTO SUPERVIZEAZA
VALUES(70,50, 4);

INSERT INTO SUPERVIZEAZA
VALUES(70,60, 4);

INSERT INTO SUPERVIZEAZA
VALUES(40,20, 3);

INSERT INTO SUPERVIZEAZA
VALUES(30,30, 5);

INSERT INTO SUPERVIZEAZA
VALUES(60,90, 3);

INSERT INTO SUPERVIZEAZA
VALUES(20,100, 3);

INSERT INTO SUPERVIZEAZA
VALUES(70,120, 5);

INSERT INTO SUPERVIZEAZA
VALUES(10,110, 6);

INSERT INTO SUPERVIZEAZA
VALUES(20,130, 3);

INSERT INTO SUPERVIZEAZA
VALUES(40,140, 7);

INSERT INTO SUPERVIZEAZA
VALUES(50,70, 3);

INSERT INTO SUPERVIZEAZA
VALUES(20,80, 3);

INSERT INTO SUPERVIZEAZA
VALUES(70,130, 5);

INSERT INTO SUPERVIZEAZA
VALUES(20,140, 3);

INSERT INTO SUPERVIZEAZA
VALUES(20,150, 2);

INSERT INTO SUPERVIZEAZA
VALUES(40,160, 3);

INSERT INTO SUPERVIZEAZA
VALUES(10,170, 2);

INSERT INTO SUPERVIZEAZA
VALUES(50,180, 4);

INSERT INTO SUPERVIZEAZA
VALUES(10,190, 3);

INSERT INTO SUPERVIZEAZA
VALUES(20,200, 1);

INSERT INTO SUPERVIZEAZA
VALUES(20,20, 1);

INSERT INTO SUPERVIZEAZA
VALUES(40,10, 4);

INSERT INTO SUPERVIZEAZA
VALUES(20,30, 1);


INSERT INTO SE_INSCRIE
VALUES(10, 10, TO_DATE('12-03-2018', 'DD-MM-YYYY'));

INSERT INTO SE_INSCRIE
VALUES(20, 10, TO_DATE('13-03-2018', 'DD-MM-YYYY'));

INSERT INTO SE_INSCRIE
VALUES(30, 20, TO_DATE('12-09-2018', 'DD-MM-YYYY'));

INSERT INTO SE_INSCRIE
VALUES(40, 30, TO_DATE('02-03-2019', 'DD-MM-YYYY'));

INSERT INTO SE_INSCRIE
VALUES(50, 40, TO_DATE('12-11-2019', 'DD-MM-YYYY'));

INSERT INTO SE_INSCRIE
VALUES(60, 50, TO_DATE('12-03-2020', 'DD-MM-YYYY'));

INSERT INTO SE_INSCRIE
VALUES(70, 60, TO_DATE('04-06-2020', 'DD-MM-YYYY'));

INSERT INTO SE_INSCRIE
VALUES(80, 10, TO_DATE('12-03-2018', 'DD-MM-YYYY'));

INSERT INTO SE_INSCRIE
VALUES(90, 30, TO_DATE('01-04-2019', 'DD-MM-YYYY'));

INSERT INTO SE_INSCRIE
VALUES(100, 40, TO_DATE('30-11-2019', 'DD-MM-YYYY'));

INSERT INTO SE_INSCRIE
VALUES(110, 50, TO_DATE('11-06-2020', 'DD-MM-YYYY'));

INSERT INTO SE_INSCRIE
VALUES(120, 60, TO_DATE('17-06-2020', 'DD-MM-YYYY'));

INSERT INTO SE_INSCRIE
VALUES(130, 20, TO_DATE('09-09-2018', 'DD-MM-YYYY'));

INSERT INTO SE_INSCRIE
VALUES(140, 20, TO_DATE('17-09-2018', 'DD-MM-YYYY'));

INSERT INTO SE_INSCRIE
VALUES(140, 10, TO_DATE('10-03-2018', 'DD-MM-YYYY'));

INSERT INTO SE_INSCRIE
VALUES(110, 40, TO_DATE('12-11-2019', 'DD-MM-YYYY'));

INSERT INTO SE_INSCRIE
VALUES(90, 50, TO_DATE('12-06-2020', 'DD-MM-YYYY'));

INSERT INTO SE_INSCRIE
VALUES(150, 50, TO_DATE('12-06-2020', 'DD-MM-YYYY'));

INSERT INTO SE_INSCRIE
VALUES(160, 10, TO_DATE('11-03-2018', 'DD-MM-YYYY'));

INSERT INTO SE_INSCRIE
VALUES(170, 40, TO_DATE('12-11-2019', 'DD-MM-YYYY'));

INSERT INTO SE_INSCRIE
VALUES(180, 20, TO_DATE('16-09-2018', 'DD-MM-YYYY'));

INSERT INTO SE_INSCRIE
VALUES(190, 60, TO_DATE('12-06-2020', 'DD-MM-YYYY'));

INSERT INTO SE_INSCRIE
VALUES(200, 60, TO_DATE('10-06-2020', 'DD-MM-YYYY'));

INSERT INTO SE_INSCRIE
VALUES(10, 20, TO_DATE('10-09-2018', 'DD-MM-YYYY'));

INSERT INTO SE_INSCRIE
VALUES(20, 20, TO_DATE('11-09-2018', 'DD-MM-YYYY'));

SELECT * FROM se_inscrie;

ALTER TABLE LICEAN
ADD Cheltuieli_transport NUMBER(3);


UPDATE LICEAN
SET CHELTUIELI_TRANSPORT = 50
WHERE (ID_LICEAN = 10 OR ID_LICEAN = 20);

UPDATE LICEAN
SET CHELTUIELI_TRANSPORT = 97
WHERE (ID_LICEAN = 40 OR ID_LICEAN = 120);

UPDATE LICEAN
SET CHELTUIELI_TRANSPORT = 70
WHERE (ID_LICEAN = 60 OR ID_LICEAN = 70 OR ID_LICEAN = 150);

UPDATE LICEAN
SET CHELTUIELI_TRANSPORT = 110
WHERE (ID_LICEAN = 200);

UPDATE LICEAN
SET CHELTUIELI_TRANSPORT = 120
WHERE (ID_LICEAN = 100);

UPDATE LICEAN
SET CHELTUIELI_TRANSPORT = 100
WHERE (ID_LICEAN = 50);

UPDATE LICEAN
SET CHELTUIELI_TRANSPORT = 125
WHERE (ID_LICEAN = 30);

UPDATE LICEAN
SET CHELTUIELI_TRANSPORT = 30
WHERE (ID_LICEAN = 190);


commit;
--CERINTA 11
--Sã se afi?eze id-ul, numele, prenumele, cheltuielile de transport asigurate, numele ?i prenumele
--specialistului care îi îndrumã pentru proiect, titlul proiectului realizat precum ?i locatia taberei
--la care au participat pentru liceeni
--din ciclul superior(clasele 11 si 12) care sunt îndruma?i de un specialist al cãrui nume
--începe cu litera P sau are litera D în componen?a prenumelui. De asemenea, sã se afi?eze datele
--cerute doar pt liceeni care au participat la tabere din ultimii 5 ani fa?ã de data curentã.
--Coloanele se vor numi corespunzãtor, numele ?i prenumele se vor concatena atât pt licean cât ?i pentru
--specialist, iar datele vor fi afi?ate dupã numele liceanului.

select lic.id_licean as "Id_licean", concat(lic.nume, ' ')||lic.prenume as "Nume Licean",
        nvl(cheltuieli_transport, 0) "Cheltuieli acoperite", concat(spec.nume, ' ')||spec.prenume as "Nume Specialist",
        pr.titlu as "Titlu Proiect", tab.locatie as "Locatie Tabara"
from licean lic join specialist spec on (lic.id_specialist = spec.id_specialist)
                join proiect pr on (lic.id_licean = pr.id_licean)
                join tabara tab on (lic.id_tabara = tab.id_tabara)
where(lic.clasa >= 11) and (spec.nume like 'P%' or UPPER(spec.prenume) like '%D%') and
     months_between(sysdate, tab.data_final) < 60
order by "Nume Licean";

--Am folosit opera?ia JOIN pe 4 tabele, filtrare la nivel de linii, ordonare dupã nume,
--3 func?ii pentru ?iruri de caractere (UPPER, CONCAT, LIKE)
--2 func?ii pentru date calendaristice(sysdate ?i months_between)
--am folosit NVL


--Pentru taberele în care transportul maxim asigurat este mai mare sau egal cu 70
--?i transportul minim mai mic sau egal cu 50
--sã se afi?eze fiecare companie care a facut o sponsorizare, suma oferitã, dar si suma minimã ?i maximã oferitã drept decont pentru transport.
--Nu se ?ine cont de valorile null.

select id_companie, comp.nume, id_tabara, locatie, suma, MAX(cheltuieli_transport), min(cheltuieli_transport)
from licean join tabara using (id_tabara)
            join sponsorizeaza using(id_tabara)
            join companie comp using(id_companie)
group by id_companie, id_tabara, suma, locatie, comp.nume
having MAX(cheltuieli_transport) >= 70 and min(cheltuieli_transport) <= 50;

--Am folosit func?ii grup(max, min), filtrare la nivel de grupuri ?i grupãri de date.


--Sa se afiseze id-ul, numele si prenumele voluntarilor care au organizat atelierele la care 
--a participat liceanul cu id-ul 110, in ordine alfabetica.

select id_voluntar, nume, prenume
from voluntar
where id_atelier in (
        select id_atelier from atelier where id_atelier in (
        select id_atelier from se_inscrie where id_licean in (
        select id_licean from se_inscrie where id_licean = 110)))
order by nume;

--Am folosit subcereri nesinronizate pe 4 tabele si order by

--Pentru fiecare tabara, sa se afiseze suma totala a sponsorizarilor primite de la companii, precum si id-ul taberei.
--Sã se adauge o nouã coloanã numitã Balant Sponsorizari care sã con?inã, dupa caz, mesajele:
--Dacã totalul de sponsorizari este cel putin 70.000: 'AU FOST ATRASE SPONSORIZARI MARI'
--Dacã totalul este sub 70.000, dar peste 30.000: 'SPONSORIZARILE AU FOST MEDII'
--Altfel: 'SPONSORIZARILE SUNT IN VALOARE MICA'

with sponsorizari as(select id_tabara, sum(suma) TOTAL
    from sponsorizeaza
    group by id_tabara 
    order by TOTAL desc)
    select id_tabara, TOTAL, 
case when TOTAL >= 70000 then 'AU FOST ATRASE SPONSORIZARI MARI'
when TOTAL < 70000 and TOTAL >= 30000 then 'SPONSORIZARILE AU FOST MEDII'
else 'SPONSORIZARILE SUNT IN VALOARE MICA'
END "Balant Sponsorizari"
from sponsorizari;

-- am folosit WITH, group by, ordonare descrescatoare, CASE

--Sa se afiseze id-ul, numele ?i prenumele voluntarilor nascuti in anul 2000
--care supervizeaza elevi al caror nume incepe cu aceeasi litera ca numele lor
select v.id_voluntar, v.nume, v.prenume
from voluntar v
where v.id_voluntar in (select id_voluntar from supervizeaza where id_licean in
    (select id_licean from licean lic where substr(v.nume,1,1) = substr(lic.nume,1,1))) and decode(to_char(v.data_nasterii, 'yyyy'), 2000, 'adev') = 'adev';

--am folosit subcereri, decode, func?ia substr

--EXERCITIU 12
--Sa se creasca salariul cu 10% specialistilor care au peste 10 ani de experienta.
UPDATE SPECIALIST
SET SALARIU = SALARIU * 1.1
where(salariu in (select salariu from specialist where ani_experienta >= 10));
rollback;

--Sa se stearga din sistem invitatii care au participat la tabere care s-au terminat cu mai mult de 4 ani in urma
delete from invitat
where (id_sesiune in (select id_sesiune from sesiune where id_tabara in (select id_tabara from tabara where months_between(sysdate, data_final) > 48)));
rollback;

--Pentru atelierele tinute de specialisti in bioloigie, sa se adauge 2 ore in plus la totalul de ore
UPDATE ATELIER
SET ORE_TOTAL = ORE_TOTAL + 2
WHERE ID_SPECIALIST IN (SELECT ID_SPECIALIST FROM SPECIALIST WHERE lower(SPECIALIZARE) LIKE '%biologie%');
rollback;

select * from grupa;
select * from companie;
select * from tabara;
select * from sponsorizeaza;
select * from licean;
select * from atelier;
select * from invitat;
select * from specialist;
select * from voluntar;
select * from supervizeaza;
select * from sesiune;
select * from proiect;
select * from se_inscrie;

--14
--Crea?i o vizualizare care sã con?inã id-ul liceanului, numele, prenumele, clasa, liceul, precum ?i titlul proiectului pe care îl realizeazã ?i materia pe care se bazeazã.
CREATE OR REPLACE VIEW Licean_si_Proiect
as select lic.id_licean, lic.nume, lic.prenume, lic.clasa, lic.liceu, pr.titlu "Titlu Proiect", pr.materie from licean lic join proiect pr
   on lic.id_licean = pr.id_licean;

--Opera?ia de UPDATE urmãtoare îmi permite sã modific câmpurile dintr-un singur tabel.
--operatie MDL permisa:
UPDATE Licean_si_Proiect
SET materie = 'biologie' where nume = 'Pelea'; 
rollback;

--operatie MDL nepermisã:
UPDATE Licean_si_Proiect
SET liceu = 'Liceul Teoretic Nr.2 Vaslui', materie = 'matematica'
where id_licean = 20;
rollback;
select * from licean_si_proiect;


--15
create unique index Cautare_Nume_Clasa on Licean(nume, clasa);
--Cererea: Sã se afi?eze liceeni care sunt în clasa a 11-a ?i al cãror nume începe cu litera P.
select * from licean
where nume like 'P%' and clasa >= 11;

SELECT 
    PLAN_TABLE_OUTPUT 
FROM 
    TABLE(DBMS_XPLAN.DISPLAY());



--16
--Sã se afi?eze numele ?i prenumele tuturor liceenilor, precum ?i id-ul si loca?ia taberei unde au participat,
--titlul proiectului pe care l-au realizat, numele ?i prenumele specialistului care i-a îndrumat.

--OUTER JOIN
select lic.nume, lic.prenume,t.id_tabara, t.locatie "Locatie Tabara", pr.titlu "Titlu Proiect", sp.nume||' ' ||sp.prenume "Nume Specialist" from licean lic
        full outer join proiect pr on (lic.id_licean = pr.id_licean)
        full outer join specialist sp on (lic.id_specialist = sp.id_specialist)
        full outer join tabara t on (lic.id_tabara = t.id_tabara);


--Sã se afi?eze id-ul, numele, prenumele liceenilor care s-au înscris la acelea?i 
--ateliere ca liceanul cu id-ul 140.
select s.id_licean, nume, prenume
from se_inscrie s join licean lic on (s.id_licean = lic.id_licean)
where id_atelier in (select id_atelier from se_inscrie where id_licean = 140)
        and s.id_licean != 140
group by s.id_licean,  nume, prenume
having count(*) = (select count(id_atelier) from se_inscrie where id_licean = 140);

--Sã se afi?eze id-ul, numele, prenumele voluntarilor care supervizeazã aceia?i liceeni pe care îi supervizeazã
--?i voluntarul cu id-ul 30(10,30)

select s.id_voluntar, nume, prenume
from supervizeaza s join voluntar v on (s.id_voluntar = v.id_voluntar)
    where id_licean in (select id_licean from supervizeaza where id_voluntar = 30) 
    and s.id_voluntar != 30
group by s.id_voluntar, nume, prenume
having count(*) = (select count(id_licean) from supervizeaza where id_voluntar = 30);


--Sa se afiseze liceeni care au avut proiecte la engleza
select *
from licean l
where not exists(
(select id_licean
from proiect
where l.id_licean = id_licean)
minus(select id_licean
from proiect
where materie = 'engleza'));














 
            



