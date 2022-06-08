/*
Member_Baca_Artikel
param : tanggal_baca (get current date), id_member yg membaca, dan id_artikel yg dipilih untuk dibaca
todo  : insert entry ke tabel membaca artikel (log baca)
return: - / isi log baca artikel
*/

CREATE PROCEDURE member_baca_artikel (
	--@tanggal_baca DATE, -> gajadi parameter
	@id_member INT,
	@id_artikel INT
)
AS
	DECLARE @tanggal_baca DATETIME = CONVERT(DATE, GETDATE())
	INSERT INTO Membaca (tanggal_baca, id_member, id_artikel) 
	VALUES (@tanggal_baca, @id_member, @id_artikel)
GO

EXEC member_baca_artikel 1, 6