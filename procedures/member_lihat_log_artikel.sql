ALTER PROCEDURE member_lihat_log_artikel(
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

EXEC member_lihat_log_artikel @id_member = 1

