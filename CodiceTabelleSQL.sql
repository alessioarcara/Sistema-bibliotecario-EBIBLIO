/* CREAZIONE TABELLE */
/*                   */

CREATE TABLE BIBLIOTECA (
	Nome VARCHAR(100) PRIMARY KEY,
	Indirizzo VARCHAR(50) NOT NULL,
	Email VARCHAR(50) NOT NULL,
	SitoWeb VARCHAR(50) NOT NULL,
	Lat DECIMAL(10, 8) NOT NULL,
	Long DECIMAL(10, 8) NOT NULL
);

CREATE TABLE RECAPITOTELEFONICO (
	Numero VARCHAR(20) PRIMARY KEY,
	NomeBiblioteca VARCHAR(50) NOT NULL,
	
	FOREIGN KEY (NomeBiblioteca) REFERENCES BIBLIOTECA (Nome) ON DELETE CASCADE 
														      ON UPDATE CASCADE
);

CREATE TABLE IMMAGINE (
	IdImmagine CHAR(10) PRIMARY KEY,
	NomeBiblioteca VARCHAR(100) NOT NULL,
	
	FOREIGN KEY (NomeBiblioteca) REFERENCES BIBLIOTECA (Nome) ON DELETE CASCADE
													          ON UPDATE CASCADE
);

CREATE TABLE POSTOLETTURA (
	Numero SMALLINT,
	NomeBiblioteca VARCHAR(100),
	PresaCorrente BOOLEAN NOT NULL,
	PresaEthernet BOOLEAN NOT NULL,
	
	PRIMARY KEY (Numero, NomeBiblioteca),
	FOREIGN KEY (NomeBiblioteca) REFERENCES BIBLIOTECA (Nome) ON DELETE CASCADE
															  ON UPDATE CASCADE
);

CREATE TABLE LIBRO (
	CodiceLibro CHAR(10) PRIMARY KEY,
	Titolo VARCHAR(30) NOT NULL,
	NomeEdizione VARCHAR(30) NOT NULL,
	AnnoPubblicazione SMALLINT NOT NULL,
	Genere VARCHAR(30) NOT NULL,
	NomeBiblioteca VARCHAR(100) NOT NULL,
	
	FOREIGN KEY (NomeBiblioteca) REFERENCES BIBLIOTECA (Nome) ON DELETE CASCADE
															  ON UPDATE CASCADE
);

CREATE TABLE AUTORE (
	CodiceAutore CHAR(10) PRIMARY KEY,
	Nome VARCHAR(20) NOT NULL,
	Cognome VARCHAR(20) NOT NULL
);

--CREATE TYPE PRESTITO AS ENUM ('DISPONIBILE', 'PRENOTATO', 'CONSEGNATO');
--CREATE TYPE CONSERVAZIONE AS ENUM ('OTTIMO', 'BUONO', 'NON BUONO', 'SCADENTE');

CREATE TABLE LIBROCARTACEO (
	CodiceLibroCartaceo CHAR(10) PRIMARY KEY,
	StatoPrestito PRESTITO NOT NULL,
	StatoConservazione CONSERVAZIONE NOT NULL,
	NumPagine SMALLINT NOT NULL,
	NumScaffale SMALLINT NOT NULL,
	
	FOREIGN KEY (CodiceLibroCartaceo) REFERENCES LIBRO (CodiceLibro) ON DELETE CASCADE
																	 ON UPDATE CASCADE
);

CREATE TABLE EBOOK (
	CodiceEbook CHAR(10) PRIMARY KEY,
	Dimensione FLOAT NOT NULL,
	PDF VARCHAR(100) NOT NULL,
	NumAccessiScheda INT NOT NULL,
	
	FOREIGN KEY (CodiceEbook) REFERENCES LIBRO (CodiceLibro) ON DELETE CASCADE
														     ON UPDATE CASCADE
);


CREATE TABLE UTENTE (
    EmailUtente VARCHAR(50) PRIMARY KEY,
    Password VARCHAR(20) NOT NULL,
    Nome VARCHAR(20) NOT NULL,
    Cognome VARCHAR(20) NOT NULL,
    DataDiNascita DATE NOT NULL,
    LuogoDiNascita VARCHAR(20) NOT NULL,
    RecapitoTelefonico VARCHAR(20) NOT NULL
);

CREATE TABLE AMMINISTRATORE (
    EmailAmministratore VARCHAR(50) PRIMARY KEY,
    Qualifica VARCHAR(10) NOT NULL,
    NomeBiblioteca VARCHAR(100),
    FOREIGN KEY (EmailAmministratore) REFERENCES UTENTE(EmailUtente) ON DELETE CASCADE
    							   									 ON UPDATE CASCADE,
    FOREIGN KEY (NomeBiblioteca) REFERENCES BIBLIOTECA(Nome) ON DELETE CASCADE
    														 ON UPDATE CASCADE
);

--CREATE TYPE MEZZO AS ENUM ('Piedi','Bici','Auto');

CREATE TABLE VOLONTARIO (
    EmailVolontario VARCHAR(50) PRIMARY KEY,
    MezzoDiTrasporto MEZZO,
    FOREIGN KEY (EmailVolontario) REFERENCES UTENTE(EmailUtente) ON DELETE CASCADE
    															 ON UPDATE CASCADE
);

--CREATE TYPE STATO AS ENUM ('ATTIVO', 'SOSPESO');

CREATE TABLE UTILIZZATORE (
    EmailUtilizzatore VARCHAR(50) PRIMARY KEY,
    Professione VARCHAR(40) NOT NULL,
    DataCreazioneAccount DATE NOT NULL,
    StatoAccount STATO,
    FOREIGN KEY (EmailUtilizzatore) REFERENCES UTENTE(EmailUtente) ON DELETE CASCADE
    															   ON UPDATE CASCADE
);

CREATE TABLE MESSAGGIO (
    IdMessaggio CHAR(10) PRIMARY KEY,
    Titolo VARCHAR(30) NOT NULL,
    Testo VARCHAR(80) NOT NULL,
    Date DATE NOT NULL,
    EmailAmministratore VARCHAR(50) NOT NULL,
    EmailUtilizzatore VARCHAR(50) NOT NULL,
    FOREIGN KEY (EmailAmministratore) REFERENCES AMMINISTRATORE(EmailAmministratore) ON DELETE CASCADE
    																				 ON UPDATE CASCADE,
    FOREIGN KEY (EmailUtilizzatore) REFERENCES UTILIZZATORE(EmailUtilizzatore) ON DELETE CASCADE
    																		   ON UPDATE CASCADE
);

CREATE TABLE SEGNALAZIONE (
    IdMessaggio CHAR(10) PRIMARY KEY,
    Testo VARCHAR(80),
    Date DATE NOT NULL,
    EmailAmministratore VARCHAR(50) NOT NULL,
    EmailUtilizzatore VARCHAR(50) NOT NULL,
    FOREIGN KEY (EmailAmministratore) REFERENCES AMMINISTRATORE(EmailAmministratore) ON DELETE CASCADE
    																				 ON UPDATE CASCADE,
    FOREIGN KEY (EmailUtilizzatore) REFERENCES UTILIZZATORE(EmailUtilizzatore) ON DELETE CASCADE
  																			   ON UPDATE CASCADE
);

CREATE TABLE LISTA (
    CodiceAutore CHAR(10),
    CodiceLibro CHAR(10),
    PRIMARY KEY (CodiceAutore, CodiceLibro),
    FOREIGN KEY (CodiceAutore) REFERENCES AUTORE(CodiceAutore) ON DELETE CASCADE
    														   ON UPDATE CASCADE,	
    FOREIGN KEY (CodiceLibro) REFERENCES LIBRO(CodiceLibro) ON DELETE CASCADE
    														ON UPDATE CASCADE
);

CREATE TABLE VISITA (
	IdVisita CHAR(10) PRIMARY KEY,
	EmailUtilizzatore VARCHAR(50) NOT NULL,
	CodiceEbook CHAR(10) NOT NULL,
	
	FOREIGN KEY (EmailUtilizzatore) REFERENCES UTILIZZATORE (EmailUtilizzatore) ON DELETE CASCADE
																				ON UPDATE CASCADE,
	FOREIGN KEY (CodiceEbook) REFERENCES EBOOK (CodiceEbook) ON DELETE CASCADE
															 ON UPDATE CASCADE
);



CREATE TABLE REGISTRAZIONE (
	IdRegistrazione CHAR(10) PRIMARY KEY,
	Data DATE NOT NULL,
	OraInizio TIME NOT NULL,
	OraFine TIME NOT NULL,
	EmailUtilizzatore VARCHAR(50) NOT NULL,
	NumeroPostoLettura SMALLINT NOT NULL,
	NomeBiblioteca VARCHAR(100) NOT NULL,
	
	FOREIGN KEY (EmailUtilizzatore) REFERENCES UTILIZZATORE (EmailUtilizzatore) ON DELETE CASCADE
																				ON UPDATE CASCADE,
	FOREIGN KEY (NumeroPostoLettura, NomeBiblioteca) REFERENCES POSTOLETTURA (Numero, NomeBiblioteca) ON DELETE CASCADE
																	                                  ON UPDATE CASCADE
);

CREATE TABLE PRENOTAZIONE (
    CodicePrenotazione CHAR(10) PRIMARY KEY,
    DataAvvio DATE,
    DataFine DATE,
    EmailUtilizzatore VARCHAR(50) NOT NULL,
    CodiceLibroCartaceo CHAR(10) NOT NULL,
    FOREIGN KEY (EmailUtilizzatore) REFERENCES UTILIZZATORE(EmailUtilizzatore) ON DELETE CASCADE
    																		   ON UPDATE CASCADE,
    FOREIGN KEY (CodiceLibroCartaceo) REFERENCES LIBROCARTACEO(CodiceLibroCartaceo) ON DELETE CASCADE
    																				ON UPDATE CASCADE
);

--CREATE TYPE TIPOLOGIA AS ENUM ('Restituzione','Affidamento');

CREATE TABLE CONSEGNA (
    CodiceConsegna CHAR(10) PRIMARY KEY,
    Note VARCHAR(200) NOT NULL,
    Data DATE NOT NULL,
    Tipo TIPOLOGIA,
    CodicePrenotazione CHAR(10) NOT NULL,
    EmailVolontario VARCHAR(50) NOT NULL,
    FOREIGN KEY (CodicePrenotazione) REFERENCES PRENOTAZIONE(CodicePrenotazione) ON DELETE CASCADE
    																			 ON UPDATE CASCADE,
    FOREIGN KEY (EmailVolontario) REFERENCES VOLONTARIO(EmailVolontario) ON DELETE CASCADE
    																	 ON UPDATE CASCADE
);  





