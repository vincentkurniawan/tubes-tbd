/*member mampu mengedit keterangan diri pada profilenya*/

GO
USE Perpustakaan

GO
CREATE PROCEDURE member_update_data (
	@username VARCHAR(255), 
	@pass VARCHAR(255), 
	@nama VARCHAR(255), 
	@email VARCHAR(255), 
	@telp VARCHAR(255), 
	@alamat VARCHAR(255),
	@nama_kota VARCHAR(255)
)
AS
	DECLARE 
	@id_pengguna INT,
	@id_kota INT

	SET @id_pengguna = (SELECT id_pengguna FROM Pengguna WHERE Pengguna.username = @username)

	IF @pass IS NOT NULL
	BEGIN 
		UPDATE Pengguna
		SET pass = @pass
		WHERE id_pengguna = @id_pengguna
	END

	IF @nama IS NOT NULL
	BEGIN
		UPDATE Member
		SET nama = @nama
		WHERE id_pengguna = @id_pengguna
	END
	
	IF @email IS NOT NULL
	BEGIN
		UPDATE Member
		SET email = @email
		WHERE id_pengguna = @id_pengguna
	END
	
	IF @telp IS NOT NULL
	BEGIN
		UPDATE Member
		SET telp = @telp
		WHERE id_pengguna = @id_pengguna
	END
	
	IF @alamat IS NOT NULL
	BEGIN
		UPDATE Member
		SET alamat = @alamat
		WHERE id_pengguna = @id_pengguna
	END
	
	IF @nama_kota IS NOT NULL
	BEGIN
		--cari id kota
		SELECT @id_kota = id_kota
		FROM Kota
		WHERE nama_kota = @nama_kota

		UPDATE Member
		SET id_kota = @id_kota
		WHERE id_pengguna = @id_pengguna
	END
GO
EXEC member_update_data 'zira', 'ziraaaaa', 'Charles Hotskot', 'kopisejuk@yahoo.com', '021447722', 'Jl. jalan santai', 'Tokyo'

SELECT *
FROM Pengguna

SELECT *
FROM Member