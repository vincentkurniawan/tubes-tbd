/*mencatat keterangan / log kapan suatu artikel dibaca oleh member*/

GO
USE Perpustakaan

GO
CREATE PROCEDURE member_catat_log_baca_artikel (
	--@tanggal_baca DATE, -> gajadi parameter
	@id_member INT,
	@id_artikel INT
)
AS
	DECLARE @tanggal_baca DATETIME = CONVERT(DATE, GETDATE())
	INSERT INTO Membaca (tanggal_baca, id_member, id_artikel) 
	VALUES (@tanggal_baca, @id_member, @id_artikel)
GO

EXEC member_catat_log_baca_artikel 1, 6