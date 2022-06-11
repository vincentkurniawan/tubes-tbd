/* Admin validasi transaksi keanggotaan yang sudah terjadi */

GO
USE Perpustakaan

GO
CREATE PROCEDURE admin_validasi_transaksi_keanggotaan (
	@id_transaksi INT, 
	@id_admin INT, 
	@status_validasi INT
)
AS
	-- update tabel transaksi
	UPDATE Transaksi_Keanggotaan
	SET status_validasi = @status_validasi, id_admin = @id_admin
	WHERE id_transaksi = @id_transaksi
	
GO
EXEC admin_validasi_transaksi_keanggotaan 1, 1, 1