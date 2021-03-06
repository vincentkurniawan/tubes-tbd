/*
admin mengupdate keterangan pada tipe keanggotaan / membership
update data pada tabel Tipe Keanggotaan, atau insert entry baru jika menambah jenis keanggotaan baru
*/

GO
USE Perpustakaan

GO
CREATE PROCEDURE admin_update_daftar_tipe_keanggotaan (
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
			SET harga = @harga, tanggal_berlaku = @tanggal_berlaku, id_admin = @id_admin
			WHERE nama_keanggotaan = @nama_keanggotaan
		END

		IF (@durasi_hari IS NOT NULL) BEGIN
			UPDATE Keanggotaan
			SET durasi_hari = @durasi_hari, tanggal_berlaku = @tanggal_berlaku, id_admin = @id_admin
			WHERE nama_keanggotaan = @nama_keanggotaan
		END
	END

GO
EXEC admin_update_daftar_tipe_keanggotaan 'Tambah', 'Premium', 100000, 730, '2022-06-07', 3
EXEC admin_update_daftar_tipe_keanggotaan 'Update', 'Premium', 150000, 1000, '2022-06-07', 2