--Member_Favorit_Artikel
--param : id_member, id_artikel, tanggal_favorit
--todo  : cek apakah id_member tsb sdh pernah memfavoritkan artikel dengan id_artikel tsb? kalau belum, insert new entry di tabel favorit, sedangkan kalau sudah, cari entry di tabel favorit yang memiliki id member dan id artikel sesuai dengan yg di parameter, lalu hapus entrynya.
--return: true (0) jika berhasil difavoritkan, dan false (1) jika berhasil di non-favoritkan

CREATE PROCEDURE favorite_artikel (
	@id_member INT, 
	@id_artikel INT, 
	@tanggal_favorit DATE
)
AS
	DECLARE @is_favorite BIT
	IF EXISTS (SELECT * FROM Favorit WHERE id_member = @id_member AND id_artikel = @id_artikel)
    BEGIN
		--update hapus dari favorit
		DELETE FROM Favorit WHERE id_member = @id_member AND id_artikel = @id_artikel
		SET @is_favorite = 1 --dinon-favoritkan
    END
    ELSE
	BEGIN
		--update tambah ke favorit
		INSERT INTO Favorit(tanggal_favorit, id_member, id_artikel)
		VALUES (@tanggal_favorit, @id_member, @id_artikel)
		SET @is_favorite = 0 --difavoritkan
	END
GO

EXEC favorite_artikel 3, 4, '20220602'