DROP FUNCTION IF EXISTS GetPrenotazioniUtente;
CREATE FUNCTION GetPrenotazioniUtente (EmailUtente TEXT)
RETURNS TABLE(
  Codice CHAR(10),
  DataAvvioPrenotazione DATE,
  DataFinePrenotazione DATE,
  CodiceLibro CHAR(10)
)
AS $$
BEGIN
  RETURN QUERY
    SELECT CodicePrenotazione, DataAvvio, DataFine, CodiceLibroCartaceo
    FROM PRENOTAZIONE
    WHERE EmailUtilizzatore = EmailUtente;
END; $$
LANGUAGE 'plpgsql';