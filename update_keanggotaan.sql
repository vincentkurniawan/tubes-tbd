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
	IF @keyword = 'Tambah'
	BEGIN
		INSERT INTO Keanggotaan (nama_keanggotaan, harga, durasi_hari, tanggal_berlaku, id_admin)
		VALUES (@nama_keanggotaan, @harga, @durasi_hari, @tanggal_berlaku, @id_admin)
	END
	ELSE IF @keyword = 'Update'
	BEGIN
		IF (@harga IS NOT NULL) 
		BEGIN
			UPDATE Keanggotaan
			SET harga = @harga, tanggal_berlaku = @tanggal_berlaku
			WHERE nama_keanggotaan = @nama_keanggotaan
		END

		IF (@durasi_hari IS NOT NULL) BEGIN
			UPDATE Keanggotaan
			SET durasi_hari = @durasi_hari, tanggal_berlaku = @tanggal_berlaku
			WHERE nama_keanggotaan = @nama_keanggotaan
		END
	END
GO

--EXEC update_keanggotaan 1, 1, 0