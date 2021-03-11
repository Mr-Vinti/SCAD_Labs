CREATE  TABLE Studenti
( 
     Matricol NUMBER(5) NOT NULL ,
     Nume VARCHAR2(50) NULL ,
     Cnp VARCHAR2(15) NULL ,
     Data_nastere DATE NULL ,
     Adresa VARCHAR2(50) NULL ,
     Telefon VARCHAR2(10) NULL      ,
     CONSTRAINT PK_Studenti PRIMARY KEY (Matricol) NOT DEFERRABLE Initially IMMEDIATE
     USING INDEX
     PCTFREE 10
     INITRANS 2
     MAXTRANS 255
     STORAGE
     (
       INITIAL 64K
       NEXT 0K
       MINEXTENTS 1
       MAXEXTENTS 2147483645
       PCTINCREASE 0
     )
)
     PCTFREE 10
     PCTUSED 40
     INITRANS 1
     MAXTRANS 255
     STORAGE
     (
       INITIAL 64K
       NEXT 0K
       MINEXTENTS 1
       MAXEXTENTS 2147483645
       PCTINCREASE 0
     )
/

CREATE  TABLE Comp_grupe
( 
     Cod_grupa VARCHAR2(5) NOT NULL ,
     Seria VARCHAR2(5) NOT NULL ,
     An_univ VARCHAR2(10) NOT NULL ,
     Matricol NUMBER(5) NOT NULL ,
     Restantier VARCHAR2(2) NULL ,
     Obs VARCHAR2(50) NULL      ,
     CONSTRAINT PK_Comp_grupe PRIMARY KEY (Cod_grupa,Seria,An_univ,Matricol) NOT DEFERRABLE Initially IMMEDIATE
     USING INDEX
     PCTFREE 10
     INITRANS 2
     MAXTRANS 255
     STORAGE
     (
       INITIAL 64K
       NEXT 0K
       MINEXTENTS 1
       MAXEXTENTS 2147483645
       PCTINCREASE 0
     )
)
     PCTFREE 10
     PCTUSED 40
     INITRANS 1
     MAXTRANS 255
     STORAGE
     (
       INITIAL 64K
       NEXT 0K
       MINEXTENTS 1
       MAXEXTENTS 2147483645
       PCTINCREASE 0
     )
/

CREATE  TABLE Inmatriculari
( 
     Matricol NUMBER(5) NOT NULL ,
     An_univ VARCHAR2(10) NOT NULL ,
     An_studio NUMBER(1) NULL ,
     Seria VARCHAR2(5) NULL ,
     Cod_grupa VARCHAR2(5) NULL ,
     Taxa VARCHAR2(2) NULL      ,
     CONSTRAINT PK_Inmatriculari PRIMARY KEY (Matricol,An_univ) NOT DEFERRABLE Initially IMMEDIATE
     USING INDEX
     PCTFREE 10
     INITRANS 2
     MAXTRANS 255
     STORAGE
     (
       INITIAL 64K
       NEXT 0K
       MINEXTENTS 1
       MAXEXTENTS 2147483645
       PCTINCREASE 0
     )
)
     PCTFREE 10
     PCTUSED 40
     INITRANS 1
     MAXTRANS 255
     STORAGE
     (
       INITIAL 64K
       NEXT 0K
       MINEXTENTS 1
       MAXEXTENTS 2147483645
       PCTINCREASE 0
     )
/

CREATE  TABLE Grupe
( 
     Cod_grupa VARCHAR2(5) NOT NULL ,
     Seria VARCHAR2(5) NOT NULL ,
     An_studiu NUMBER(1) NULL      ,
     CONSTRAINT PK_Grupe PRIMARY KEY (Cod_grupa,Seria) NOT DEFERRABLE Initially IMMEDIATE
     USING INDEX
     PCTFREE 10
     INITRANS 2
     MAXTRANS 255
     STORAGE
     (
       INITIAL 64K
       NEXT 0K
       MINEXTENTS 1
       MAXEXTENTS 2147483645
       PCTINCREASE 0
     )
)
     PCTFREE 10
     PCTUSED 40
     INITRANS 1
     MAXTRANS 255
     STORAGE
     (
       INITIAL 64K
       NEXT 0K
       MINEXTENTS 1
       MAXEXTENTS 2147483645
       PCTINCREASE 0
     )
/

ALTER TABLE Comp_grupe ADD
(
     CONSTRAINT FK_grupe_comp FOREIGN KEY
     ( Cod_grupa , Seria )
     REFERENCES Grupe
     ( Cod_grupa , Seria )
     NOT DEFERRABLE Initially IMMEDIATE
)
/

ALTER TABLE Inmatriculari ADD
(
     CONSTRAINT FK_stud_inmatr FOREIGN KEY
     ( Matricol )
     REFERENCES Studenti
     ( Matricol )
     NOT DEFERRABLE Initially IMMEDIATE
)
/

CREATE OR REPLACE FORCE VIEW V_stud_taxa
AS SELECT ALL  Inmatriculari.An_univ ,  Inmatriculari.Cod_grupa ,  Inmatriculari.Matricol ,  
       Inmatriculari.Seria 
   FROM  Inmatriculari Inmatriculari 
   WHERE Inmatriculari.An_univ='2020/2021' and Inmatriculari.Taxa='DA'
/

