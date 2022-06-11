--Member_Favorit_Artikel
--param : id_member, id_artikel, tanggal_favorit
--todo  : cek apakah id_member tsb sdh pernah memfavoritkan artikel dengan id_artikel tsb? kalau belum, insert new entry di tabel favorit, sedangkan kalau sudah, cari entry di tabel favorit yang memiliki id member dan id artikel sesuai dengan yg di parameter, lalu hapus entrynya.
--return: true (0) jika berhasil difavoritkan, dan false (1) jika berhasil di non-favoritkan
GO
USE Perpustakaan

GO
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
EXEC favorite_artikel 3, 2, '20220607'
EXEC favorite_artikel 42, 68, '20200425'
EXEC favorite_artikel 1, 70, '20210825'
EXEC favorite_artikel 29, 59, '20220213'
EXEC favorite_artikel 15, 6, '20221216'
EXEC favorite_artikel 32, 28, '20210122'
EXEC favorite_artikel 42, 96, '20211213'
EXEC favorite_artikel 28, 37, '20230422'
EXEC favorite_artikel 5, 3, '20200224'
EXEC favorite_artikel 43, 83, '20210522'
EXEC favorite_artikel 17, 19, '20210926'
EXEC favorite_artikel 48, 27, '20210812'
EXEC favorite_artikel 39, 70, '20220313'
EXEC favorite_artikel 18, 100, '20211126'
EXEC favorite_artikel 45, 4, '20221212'
EXEC favorite_artikel 23, 34, '20210724'
EXEC favorite_artikel 15, 42, '20200812'
EXEC favorite_artikel 4, 69, '20220628'
EXEC favorite_artikel 45, 63, '20230818'
EXEC favorite_artikel 38, 60, '20200524'
EXEC favorite_artikel 42, 30, '20200819'
EXEC favorite_artikel 17, 36, '20221211'
EXEC favorite_artikel 43, 89, '20230207'
EXEC favorite_artikel 41, 43, '20210325'
EXEC favorite_artikel 49, 47, '20220906'
EXEC favorite_artikel 41, 30, '20220411'
EXEC favorite_artikel 1, 7, '20231202'
EXEC favorite_artikel 44, 49, '20210730'
EXEC favorite_artikel 24, 85, '20220115'
EXEC favorite_artikel 7, 41, '20200617'
EXEC favorite_artikel 27, 32, '20220409'
EXEC favorite_artikel 45, 40, '20220727'
EXEC favorite_artikel 24, 38, '20220619'
EXEC favorite_artikel 19, 83, '20221130'
EXEC favorite_artikel 42, 34, '20231216'
EXEC favorite_artikel 40, 59, '20220805'
EXEC favorite_artikel 31, 78, '20200407'
EXEC favorite_artikel 24, 87, '20201522'
EXEC favorite_artikel 46, 25, '20211123'
EXEC favorite_artikel 21, 30, '20220818'
EXEC favorite_artikel 24, 98, '20210613'
EXEC favorite_artikel 37, 91, '20201222'
EXEC favorite_artikel 37, 56, '20220818'
EXEC favorite_artikel 6, 75, '20201122'
EXEC favorite_artikel 3, 51, '20201221'
EXEC favorite_artikel 42, 25, '20210417'
EXEC favorite_artikel 31, 8, '20230222'
EXEC favorite_artikel 8, 38, '20210518'
EXEC favorite_artikel 38, 54, '20210424'
EXEC favorite_artikel 46, 10, '20230310'
EXEC favorite_artikel 9, 22, '20210619'
EXEC favorite_artikel 23, 47, '20220607'
EXEC favorite_artikel 31, 14, '20221229'
EXEC favorite_artikel 1, 92, '20210813'
EXEC favorite_artikel 6, 11, '20200401'
EXEC favorite_artikel 25, 38, '20220629'
EXEC favorite_artikel 34, 96, '20200414'
EXEC favorite_artikel 3, 51, '20210322'
EXEC favorite_artikel 37, 75, '20211121'
EXEC favorite_artikel 47, 22, '20220419'
EXEC favorite_artikel 50, 69, '20220515'
EXEC favorite_artikel 32, 35, '20200114'
EXEC favorite_artikel 50, 19, '20220719'
EXEC favorite_artikel 1, 89, '20210228'
EXEC favorite_artikel 18, 29, '20210924'
EXEC favorite_artikel 49, 84, '20210908'
EXEC favorite_artikel 22, 11, '20200718'
EXEC favorite_artikel 14, 15, '20210410'
EXEC favorite_artikel 17, 36, '20210512'
EXEC favorite_artikel 1, 50, '20210620'
EXEC favorite_artikel 7, 99, '20230404'
EXEC favorite_artikel 25, 9, '20200925'
EXEC favorite_artikel 10, 90, '20230803'
EXEC favorite_artikel 46, 86, '20201104'
EXEC favorite_artikel 44, 24, '20200618'
EXEC favorite_artikel 15, 4, '20201219'
EXEC favorite_artikel 1, 59, '20200719'
EXEC favorite_artikel 31, 97, '20210829'
EXEC favorite_artikel 32, 90, '20220519'
EXEC favorite_artikel 10, 58, '20220513'
EXEC favorite_artikel 23, 39, '20210313'
EXEC favorite_artikel 39, 80, '20210211'
EXEC favorite_artikel 8, 59, '20201202'
EXEC favorite_artikel 16, 89, '20210217'
EXEC favorite_artikel 12, 3, '20200715'
EXEC favorite_artikel 23, 56, '20220419'
EXEC favorite_artikel 47, 63, '20200917'
EXEC favorite_artikel 26, 34, '20220917'
EXEC favorite_artikel 43, 45, '20200517'
EXEC favorite_artikel 32, 99, '20210423'
EXEC favorite_artikel 2, 22, '20200810'
EXEC favorite_artikel 8, 77, '20221013'
EXEC favorite_artikel 40, 76, '20210813'
EXEC favorite_artikel 1, 11, '20221104'
EXEC favorite_artikel 20, 62, '20210729'
EXEC favorite_artikel 2, 90, '20210316'
EXEC favorite_artikel 24, 3, '20210626'
EXEC favorite_artikel 33, 86, '20221109'
EXEC favorite_artikel 27, 18, '20221228'
EXEC favorite_artikel 33, 33, '20200417'
EXEC favorite_artikel 5, 22, '20210727'