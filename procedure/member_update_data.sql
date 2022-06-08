--Member_Update_Data (Data Register)

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

	SELECT @id_pengguna = id_pengguna
	FROM Pengguna
	WHERE username = @username

	IF @pass IS NOT NULL
	BEGIN 
		UPDATE Pengguna
		SET pass = @pass
		WHERE id_pengguna = @id_pengguna
	END
	ELSE IF @nama IS NOT NULL
	BEGIN
		UPDATE Member
		SET nama = @nama
		WHERE id_pengguna = @id_pengguna
	END
	ELSE IF @email IS NOT NULL
	BEGIN
		UPDATE Member
		SET email = @email
		WHERE id_pengguna = @id_pengguna
	END
	ELSE IF @telp IS NOT NULL
	BEGIN
		UPDATE Member
		SET telp = @telp
		WHERE id_pengguna = @id_pengguna
	END
	ELSE IF @alamat IS NOT NULL
	BEGIN
		UPDATE Member
		SET alamat = @alamat
		WHERE id_pengguna = @id_pengguna
	END
	ELSE IF @nama_kota IS NOT NULL
	BEGIN
		--cari id kota
		SELECT @id_kota = id_kota
		FROM Kota
		WHERE nama_kota = @nama_kota

		UPDATE Member
		SET id_kota = @id_kota
		WHERE id_pengguna = @id_pengguna
	END

/*
EXEC member_update_data 'icepandabear', 'abcd123', 'Johny Depp', 'kopisejuk@yahoo.com', '021447722', 'Jl. jalan santai', 'Tokyo'
*/