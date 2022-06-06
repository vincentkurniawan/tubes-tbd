/*
Admin_Update_Daftar_Tipe_Keanggotaan
param : keyword (apakah mau 'tambah' atau 'update'), nama_keanggotaan, harga, durasi_hari, tanggal_berlaku, id_admin
todo  : jika tambah, maka langsung insert aja entry tipe keanggotaannya. sebaliknya kalau update, cari nama keanggotaan yang ingin di update lalu update atribut lainnya sesuai dengan param
return: -
*/

CREATE PROCEDURE update_keanggotaan (
	@keyword VARCHAR(255), --tidak boleh null
	@nama_keanggotaan VARCHAR(255), --tidak boleh null
	@harga INT,
	@durasi_hari INT,
	@tanggal_berlaku DATE,
	@id_admin INT
)
AS
	DECLARE
	@query NVARCHAR(500) = 'SELECT * FROM dbo.Keanggotaan(',
	@check BIT = 0

	IF @keyword = 'Tambah'
	BEGIN
		INSERT INTO Keanggotaan (nama_keanggotaan, harga, durasi_hari, tanggal_berlaku, id_admin)
		VALUES (@nama_keanggotaan, @harga, @durasi_hari, @tanggal_berlaku, @id_admin)
	END
	ELSE IF @keyword = 'Update'
	BEGIN
		/* dynamic sql blm
		IF (@harga IS NULL) BEGIN
			SET @query = CONCAT (@query, 'NULL')
		END
		ELSE BEGIN
			SET @query = CONCAT (@query, '''', @harga, '''')
		END*/

		UPDATE Keanggotaan
		SET harga = @harga, durasi_hari = @durasi_hari, tanggal_berlaku = @tanggal_berlaku, id_admin = @id_admin
		WHERE nama_keanggotaan = @nama_keanggotaan
	END
GO

--EXEC update_keanggotaan 1, 1, 0
