/*
member dapat melihat history log artikel yang sudah pernah dibaca
return tabel daftar artikel yang sudah pernah dibaca
*/

GO
USE Perpustakaan

GO
CREATE PROCEDURE member_lihat_log_baca_artikel(
	@id_member INT
)
AS
	SELECT DISTINCT
		Membaca.tanggal_baca, Artikel.nama_artikel
	FROM
		Membaca INNER JOIN Artikel ON Membaca.id_artikel = Artikel.id_artikel
	WHERE
		Membaca.id_member = @id_member
GO

GO
EXEC member_lihat_log_baca_artikel @id_member = 1

