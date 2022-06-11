--Member_Tulis_Artikel (ON GOING BY K)
--param : path pdf artikel, status keanggotaan penulis, tanggal_tulis, nama_artikel, id penulis
--todo  : insert entry baru ke dalam tabel Artikel berdasarkan param yang telah diperoleh, dengan status_validasi 0 dan id admin validator 0 (default)
--return: true jika artikel berhasil diinsert

-- NOTE : Tanggal tulis boleh di NULL. Kalau di null in artinya pake tanggal hari ini.
GO
USE Perpustakaan

GO
CREATE PROCEDURE tulis_artikel(
	@path_artikel VARCHAR(500), --path_artikel di tabel artikel
	@status_keanggotaan INT, --status_keanggotaan di member
	@tanggal_tulis DATE, --tanggal tulis di artikel
	@nama_artikel VARCHAR(500), --nama artikel  di tabel artikel
	@id_penulis INT, --id_member di tabel Member
	@id_kategori_s VARCHAR(500) --ini isinya id-id kategori, tapi karena satu artikel bisa punya banyak kategori jadi ntar di split string aja
)
AS
	DECLARE @is_premium INT
	IF (@status_keanggotaan = 1) BEGIN
		SET @is_premium = 0
	END ELSE BEGIN
		SET @is_premium = 1
	END
	--cek ada tanggal nya ga
	If (@tanggal_tulis IS NULL) BEGIN
		SET @tanggal_tulis = CONVERT(VARCHAR(8), GETDATE(), 112)
	END

	--split string id kategori
	DECLARE @tabel_id_k TABLE(
		idk INT
	)
	INSERT INTO @tabel_id_k SELECT * FROM string_split(@id_kategori_s, ',');
	
	--urus dulu insert ke tabel artikel nya
	DECLARE @id_artikel INT 
	
	INSERT INTO Artikel(is_premium, nama_artikel, path_artikel, status_validasi, tanggal_tulis, id_penulis, id_admin)
	VALUES (@is_premium, @nama_artikel, @path_artikel, 0, @tanggal_tulis, @id_penulis, NULL)

	SET @id_artikel = SCOPE_IDENTITY();

	--lanjut ke tabel artikel-kategori (Many to Many)
	INSERT INTO Artikel_Kategori SELECT @id_artikel, idk FROM @tabel_id_k
GO

--tes, ini member udah VIP, kalo hari ini tanggal nya di null in aja
EXEC tulis_artikel 'C:\Users\LENOVO\Downloads\TubesTBD\10.pdf', 2, NULL, 'Diary of A Wimpy Kid', '1', '1,2,3,4'
SELECT * FROM artikel;
SELECT * FROM Artikel_Kategori;

