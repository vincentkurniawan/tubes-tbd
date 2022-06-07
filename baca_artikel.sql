/*
Member_Baca_Artikel
param : tanggal_baca (get current date), id_member yg membaca, dan id_artikel yg dipilih untuk dibaca
todo  : insert entry ke tabel membaca artikel (log baca)
return: - / isi log baca artikel
*/

CREATE PROCEDURE baca_artikel (
	@tanggal_baca DATE,
	@id_member INT,
	@id_artikel INT
)
AS
	INSERT INTO Membaca (tanggal_baca, id_member, id_artikel) 
	VALUES (@tanggal_baca, @id_member, @id_artikel)
GO

--EXEC baca_artikel GETDATE(), 2, 1